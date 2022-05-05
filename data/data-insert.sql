INSERT INTO public.administrators (
email, password) VALUES (
'admin@mail.com'::character varying, '97c94ebe5d767a353b77f3c0ce2d429741f2e8c99473c3c150e2faa3d14c9da6'::character varying)
 returning id;