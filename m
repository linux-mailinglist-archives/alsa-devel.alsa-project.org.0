Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B9179465
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Mar 2020 17:05:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99F991667;
	Wed,  4 Mar 2020 17:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99F991667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583337921;
	bh=RpOE/VPduJtParf/W1H6pXTRtDfX2LGhFjwnv9CSClc=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FjmvGmQE5tGQbSbvF5TdTQUiXjCrfYUeIbnxD5a+zXXfWYr/X+lFconSWaIPue66P
	 ifwMtM1MKInrRo2PRlDWhFS3U6Bj2c5xYZgD9l3EsQOD9VjXkAVzx5kgDYLJ/hi9kr
	 u94qsfUTHv0dsiA1PBIYjtkMMafbNwSN3qMNS31c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 315BCF801F5;
	Wed,  4 Mar 2020 17:03:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82021F801ED; Wed,  4 Mar 2020 17:03:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DFBF8011C
 for <alsa-devel@alsa-project.org>; Wed,  4 Mar 2020 17:03:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DFBF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Nm5mtAnt"
Received: by mail-oi1-x22d.google.com with SMTP id a22so2542576oid.13
 for <alsa-devel@alsa-project.org>; Wed, 04 Mar 2020 08:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:autocrypt:face:message-id:date:user-agent
 :mime-version; bh=Rl287CeYTRb+RtKOPUHirW6gF/4k2fH2yvHIv4o71qY=;
 b=Nm5mtAntDFEGFvqB6NAN8lJ1Lys6pY9T+xL+IORIumiE2EAV8D0KLHEwNHC+KBb/CF
 ctVSx72CxdRj/WtIlICgkZepGL1fRNAMrjis9+5btmQHiXkpta/jBZflBPraAoMbsBMY
 hTsdEsEqXwU7fQo8KtdsdBnVn0BmTn5KE4vFzvss48+OwkSmMj+fF6Qp3svychaNC6i6
 Zwtyl2RpLPH2mxm5mK0BSNYOEUwcO0AkO6QkRP+0hitqeScBEP0Mte57VEcCwSeXpkEH
 ndEdwrITLdDBq945u6QU9rJ+mvNRyneYL0ETUnFIcL1xS644frSgZgVMvBwzAUdNKrgC
 e/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:autocrypt:face:message-id:date
 :user-agent:mime-version;
 bh=Rl287CeYTRb+RtKOPUHirW6gF/4k2fH2yvHIv4o71qY=;
 b=GIVs1R+Pg1lVtoAiqvvW9nyaCFr9zG4XhAEhQpeZKqIPjf5qKoj6tn5clcvVGhz4Ad
 1a0g+JshZEKB85++XJDdOI3WbUW2U9ItM/4UsjZTuaEvLBrYqqBCI5+lOgwdPRU+ry3+
 kkzahISWhumLByE1i6jqRpeI07AU9sE0kG8tsPv8GHZVRb9AiOP7h1nQbV1/YBdzT1UC
 hkUeCBq4ywukULxY/iu0X3Im79un1XuKHRrSj1moOjBgs831D3XWxszP1Fdz57jUcFRI
 TeBM129kDtLhB8ZsKYyDXhw+kS6StsXAk6eZz2qYqd/1Qu0fqpaHBpcHN3pa8vuRlBgc
 7nFQ==
X-Gm-Message-State: ANhLgQ12+fMVfTyN3m3p5y3NuRXPn+4lvyNBEyko2613TB2hCSgocnTK
 6bpLY6ULHjYv+MbcAstgB0xqDDd1
X-Google-Smtp-Source: ADFU+vvMWutaLWMxzFSZ7SVIG35Ve1CitUxBmPL6g0l1PwnW+lQAbXU0W8Ll4nzu0jpxBh2e0GUz/g==
X-Received: by 2002:aca:c78e:: with SMTP id x136mr2210641oif.116.1583337809503; 
 Wed, 04 Mar 2020 08:03:29 -0800 (PST)
Received: from [192.168.0.194] (mail.ipfonix.com. [209.97.232.18])
 by smtp.googlemail.com with ESMTPSA id q23sm5180007otn.19.2020.03.04.08.03.28
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 08:03:28 -0800 (PST)
To: alsa-devel@alsa-project.org
From: "D. R. Evans" <doc.evans@gmail.com>
Subject: Problematic motherboard: Supermicro MBD-X11SAT-F-O
Autocrypt: addr=doc.evans@gmail.com; prefer-encrypt=mutual; keydata=
 mQGiBDmkIu0RBAD2P/8Jv/ewYEFJPt2cV9rbl8h1OD6blXdVLacdPg5KFXybbg+V7MnUz/5+
 zxxDXPbDgKCjiluPqZqehx/RdY0c3jsx39X7PZ3XVzJ7pV5ob0s+aNhavC5UxJWCLQPs5gvJ
 eNnkAAM1WGnLo6gbaUpFHI7LVh56PTNX/sbc8k6W+QCg/7gd8+c5Le6lluna4ZPWTDIRXe0D
 /3qYuSQwP5XcclaBZV+i/+31V38zE49TY3PN3yOlrXjD1U7Q4GCR0OvqJ9koqVTz0H34iKZL
 KMPhij12Lfsx9ntxaPjGNrdJeC3Uuz2asOlcMFKwMN/hzJItYpX3BQsBCQxpENxISrO7VPQU
 LTI2jnalRAayUwNSfkHOhHN7QiXPBAC8bcB6witXvEDYvRMs6dyT6ed4wOvmdfQMjlff3p4r
 rSdfpICBza48GgHRHCNt+NaDCFCDyANaaDnZcPS14njag1d+j6mwJiOzqo8d23l5QxS6gpzB
 dqwMuUZNhfZfEXOLY68svXzkdzaX+keijSCavn+fCmGQMWOsSEsJISRyMLQhRC4gUi4gRXZh
 bnMgPGRvYy5ldmFuc0BnbWFpbC5jb20+iGAEExECACAFAkddvt4CGyMGCwkIBwMCBBUCCAME
 FgIDAQIeAQIXgAAKCRBp16y8NikSuJo5AKDTgkXWSE4QwbGWomzYlUqDWc7EnACeNg+L4TYL
 EpzX/dA217fr6OqDq/W5Ag0EOaQi7RAIAPZCV7cIfwgXcqK61qlC8wXo+VMROU+28W65Szgg
 2gGnVqMU6Y9AVfPQB8bLQ6mUrfdMZIZJ+AyDvWXpF9Sh01D49Vlf3HZSTz09jdvOmeFXklnN
 /biudE/F/Ha8g8VHMGHOfMlm/xX5u/2RXscBqtNbno2gpXI61Brwv0YAWCvl9Ij9WE5J280g
 tJ3kkQc2azNsOA1FHQ98iLMcfFstjvbzySPAQ/ClWxiNjrtVjLhdONM0/XwXV0OjHRhs3jMh
 LLUq/zzhsSlAGBGNfISnCnLWhsQDGcgHKXrKlQzZlp+r0ApQmwJG0wg9ZqRdQZ+cfL2JSyIZ
 Jrqrol7DVekyCzsAAgIIAPFohyqSK4bCREM3v+7kOAUwNd41gCTJdYB9PD6ARlViF9Y2YtJG
 uQqMvtJWh1HxtTxzdcQ+1iB2tNfg/FZUPOMPqVLdWJ56txe9AmVSIznfDwg1Km1ugWJfgSZl
 N7uEE9IW0kDlPYbjFtMDmlCkgiBH/53ypee6lgx3nhfx4vvllEc0s2GLjdNL0dOSDcSs8w1r
 dVKXUZHpy1+bR+xT/hR+U8CLi+M3aQ72siejGhul6ln97gLMWAf60RjK451S7Y/5yX+H2BbO
 hteQhk7rRSdtgH6PiKUtBkjOtxZwCOBZ5fD3rxCKa+z+zd/YhYGrPBTtht6b6H0Qbwq3b6E8
 HwGIRgQYEQIABgUCOaQi7QAKCRBp16y8NikSuIGwAKCUfSmbMP7Jad1E2U9QHgZZpO4ZnwCf
 RhXA9iGeLcRXIoVw4nd1h2CCRFU=
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAMFBMVEU9SUDm19m4kXjWsayD
 albOq5mnenD5+/3q5+z+///fxL/EmY0vLy8vLy8vLy8vLy/YC6JiAAACWklEQVR4nKWTPW/bMBCG
 hYDw0qVEWkBwloCJNdRLEkFGQS+CIWgO7GqxFlcxOJRjh9ajhhb6B662MoqDgF4KqfJQ/rkeGUdS
 3Gy9gRDu4XtfOlrW/1gwmfov+ScRIc4L/ncRGHH+0RzNpPS8ASEH/l7k0QIkU3IgmUznlLoF3ZDz
 ZwQlkVtI0Zf0PDl9JiCR60ohhNyFSUdyRAbRzKXStrEHny0JyLAGIOwsxcdUXjcgZERFBnzN8Fx+
 aFIHAGrIge0sw5tp20sQEhJDdqztENTjJ3AbNaEQY0zpejV4G3UVjNT7UGIzGDQKKCupqaRGcUua
 eSEoK+EwXg36J8mk7ZAxzs6oydLvL5dtqACMKaUql2K5DJ8UgR889q+PT/JqftF0bq6ghT7C+Sa+
 bsBCE/Tb6MRGnTbAhOrdGyC3cQt83wrRqxMUIM7weLboKHzf58dLhLiS27N2JAwBrvAI+qnEdtzp
 D/oIb/AYhnkpxZsGJAl4Qk4Lpiop8esGhA4DxFXFFMxSXjQAJQ5hMHuueE1FYbUWKsLCkFU7AopF
 B0yIVnCl4Lfcd/ywcY4OpfiwKu66oEecJRTMElXRn12AVAn1shtVz+hpF1gJxNpx5cWR9Pd3zflx
 XJpGvHgu/Ob2H1jlUenAao09V9rrb3v/e9hXPFI7ELiwDg95/tmILsGfihEvdUmu1CD/8cuyHtI0
 hW0qE0WGKoJBiVW+zvPvVmanOMWi3A1jeAkA7C+5NiszAlyyYQ2vrZDUXq3WBkDmPhZXhNf6fUph
 r1frFYDHFHhbwmObmVC5AX8BHZP5RM9Y5N0AAAAASUVORK5CYII=
Message-ID: <8a43ff74-d41a-50d2-f3a6-5e2a2e4d69ee@gmail.com>
Date: Wed, 4 Mar 2020 09:03:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="yEOL2Sje91iuNX9HvXwaU6LpcWAr0K6PD"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yEOL2Sje91iuNX9HvXwaU6LpcWAr0K6PD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Where is the correct place to post detailed information about a motherboa=
rd
that provides only unacceptably low volume with ALSA? I realise that the
correct place probably isn't here, but I didn't know where else to ask fo=
r a
pointer to where I should send the detailed information.

I initially raised the problem on alsa-users:

https://sourceforge.net/p/alsa/mailman/alsa-user/thread/db705c61-87ba-8d6=
6-202a-dc2dd595e60e%40gmail.com/#msg36926835
but the suggestions made there led to no progress being made, and I am no=
w as
sure as I can be that the issue is not user error.

The motherboard is a Supermicro MBD-X11SAT-F-O, and the basic high-level
device information is:

---------

card 0: PCH [HDA Intel PCH], device 0: ALC888-VD Analog [ALC888-VD Analog=
]
  Subdevices: 0/1
  Subdevice #0: subdevice #0

---------

  Doc Evans

--=20
Web:  http://enginehousebooks.com/drevans


--yEOL2Sje91iuNX9HvXwaU6LpcWAr0K6PD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRWBjQtTqmzCoJnxKFp16y8NikSuAUCXl/RTwAKCRBp16y8NikS
uFOWAKDu9VU7Pljv7DGFEyo7Fj6wsEFcvACgr+8UrMRoksT1b6db8U49f/KJCxI=
=ZgcK
-----END PGP SIGNATURE-----

--yEOL2Sje91iuNX9HvXwaU6LpcWAr0K6PD--
