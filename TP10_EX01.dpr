program TP10_EX01;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

Function numeroEvenement(caractere : Char) : Integer;

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
    evenement := 0;
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

      evenement := numeroEvenement(caractere);

      if etatCourant = -1 then
      begin
        fini := True;
        estFloat := False;
      end

      else
      begin

        if etatCourant = 0 then
        begin

          if evenement = 1 then
          begin
            etatCourant := 1;
          end
          else if evenement = 2 then
          begin
             etatCourant := 2;
          end
          else if evenement = 3 then
          begin
            etatCourant := -1;
          end
          else
          begin
            etatCourant := -1;
          end;

        end

        else if etatCourant = 1 then
        begin

          if evenement = 1 then
          begin
            etatCourant := -1;
          end
          else if evenement = 2 then
          begin
             etatCourant := 2;
          end
          else if evenement = 3 then
          begin
            etatCourant := -1;
          end
          else
          begin
            etatCourant := -1;
          end;

        end

        else if etatCourant = 2 then
        begin

          if evenement = 1 then
          begin
            etatCourant := -1;
          end
          else if evenement = 2 then
          begin
             etatCourant := 2;
          end
          else if evenement = 3 then
          begin
            etatCourant := 3;
          end
          else
          begin
            etatCourant := -1;
          end;

        end

        else if etatCourant = 3 then
        begin

          if evenement = 1 then
          begin
            etatCourant := -1;
          end
          else if evenement = 2 then
          begin
             etatCourant := 3;
          end
          else if evenement = 3 then
          begin
            etatCourant := -1;
          end
          else
          begin
            etatCourant := -1;
          end;

        end;

        cptCaractere := cptCaractere + 1;

      end;

    end;

  end;

end;

Var
  chaine : String;

begin

  chaine := '2,01';

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
