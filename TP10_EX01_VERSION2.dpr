program TP10_EX01_VERSION2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Type
  TTabDeEntiers = array [0..3 , 1..3] of Integer;

Var
  tableauEtat : TTabDeEntiers = ((1,2,-1), (-1,2,-1), (-1,2,3), (-1,3,-1));


Function codeEvenement(caractere : Char) : Integer;

Var
  evenement : Integer;

begin

  if (caractere = '+') OR (caractere = '-') then
  begin
    evenement := 1;
  end

  else if (caractere >= '0') AND (caractere <= '9') then
  begin
    evenement := 2;
  end

  else if (caractere = ',') OR (caractere = '.') then
  begin
    evenement := 3;
  end

  else
  begin
    evenement := 4;
  end;

  Result := evenement;

end;



Function estFloat(chaine : String) : Boolean;

Var
  fini : Boolean;
  cptCaractere : Integer;
  etatCourant : Integer;
  evenement : Integer;
  caractere : Char;

begin

  fini := False;
  cptCaractere := 1;
  etatCourant := 0;
  evenement := 0;

  while fini = False do
  begin

    if cptCaractere > length(chaine) then
    begin

      fini := True;

      if (etatCourant = 2) OR (etatCourant = 3) then
      begin
        estFloat := True;
      end

      else
      begin
        estFloat := False;
      end;

    end

    else
    begin

      caractere := chaine[cptCaractere];

      evenement := codeEvenement(caractere);

      if etatCourant = -1 then
      begin
        fini := True;
        estFloat := False;
      end

      else
      begin

        if evenement = 4 then
        begin
          fini := True;
          estFloat := False;
        end

        else
        begin

          etatCourant := tableauEtat[etatCourant, evenement];

        end;

        cptCaractere := cptCaractere + 1;

      end;

    end;

  end;

end;

Var
  chaine : String;

begin

  chaine := '+22,51';

  if estFloat(chaine) = True then
  begin
    writeln('C''est un décimal.');
  end

  else
  begin
    writeln('Ce n''est pas un décimal.');
  end;

  readln;

end.
