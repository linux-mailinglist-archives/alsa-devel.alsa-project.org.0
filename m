Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD221F03D9
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1782B166D;
	Sat,  6 Jun 2020 02:22:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1782B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591403003;
	bh=qoPM6SUNULQImG7Mqw1DRBigV8qxkt6t7WTlwwGVYWY=;
	h=To:From:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eAqIr1o7eAeEVZmjKzYRhkLdPZAm6rXJ4eEoIt+pXDGFjg2JWGOVg83gYzfI8SWhB
	 9BEEr3oKsgj+r+bi+TqM/vP+2fKXYG6EBlZHE5hVzb2F1v+Z6tyEA9Uhok6dDwWKbZ
	 miSals3AWUsRZtwL1xooLmZqFIS1CbJXr85O2SGo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E25AF801F5;
	Sat,  6 Jun 2020 02:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51C9FF801ED; Sat,  6 Jun 2020 02:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34C3EF80132
 for <alsa-devel@alsa-project.org>; Sat,  6 Jun 2020 02:21:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34C3EF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sndgimAj"
Received: by mail-oi1-x235.google.com with SMTP id s21so9727425oic.9
 for <alsa-devel@alsa-project.org>; Fri, 05 Jun 2020 17:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:autocrypt:face:message-id:date:user-agent
 :mime-version; bh=V3saDA2gaZgUSh1K+WLcj6R/RgNW2x9NnFnXB+qqqCQ=;
 b=sndgimAjNhkGspCGVPAtp8X4zPSFm6+qBWMD0odEHgb5Ez3QOowfYoH773OvOesnZf
 j/mGrhuzPhILuPFykp6B0rAuQvDgzqB6IueLXweJFw7fXXMMn5hopqtAkeafi7nZJTrI
 tLG/ttDhs+riC8W8EfFbprkt9aGcUsPW8YZiff59ecI0rGAtiL01u3ZfRbRJjtNncS7y
 oc9g48fXdJ01qQBX3/U7UnPN9e27u6soQUiqcHTHl1OKs/CHldlxjk6RXagOr/ksuLbk
 p/ZpSd7xZx20R0jbY+P2ro4r5D7nrHL8vdfqaTWhfxNoSH55v8aAmCZg7+LXu54a8oh4
 ozSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:autocrypt:face:message-id:date
 :user-agent:mime-version;
 bh=V3saDA2gaZgUSh1K+WLcj6R/RgNW2x9NnFnXB+qqqCQ=;
 b=aV2NPviSviq80jCk8DOgQT9qxh5gKjfgmFu48EHCs1kN5xfrijq0VLRymPOXp6jqhC
 JlcMcas8VqRIzcoYuSi+gIIhJdmIQy9E5Igj2LLxndG+17bRywfSxVNWILCYFLQ43wCG
 CqfKAUObeZaKzTHSaTLIlzhOqkQ0WY1daQQTBXjEqVLVrXVUZRQI9LkRxwHu509pDDS9
 SxOA5jShDvmAJPtPYxDRV53rDxj1jUxuYneNE8uReeTZ1yQhu+MCIe1tWJGFRVksVU9w
 fo8e+ruH01uqiDDDmzv5arYf0Jfc6rcz0s6m87fcoFDbllL4mnM4xR7OPgJdlFvr9gNB
 U4OQ==
X-Gm-Message-State: AOAM531QGF1NkeJbzkTqVH87ST+JilWSNpvqnnDlt+K4XkQi9nblmXuJ
 n5+496J6qDZOo19pl5cjtuxOR4Y1
X-Google-Smtp-Source: ABdhPJwQFmgutXmfm2GBA78scqd5l+woCbIcFxk6KThrErin3RJa8SfrchzJh5cOEblyEKZ9I972Ig==
X-Received: by 2002:a05:6808:7c8:: with SMTP id f8mr316749oij.51.1591402888746; 
 Fri, 05 Jun 2020 17:21:28 -0700 (PDT)
Received: from [192.168.0.194] (mail.ipfonix.com. [209.97.232.18])
 by smtp.googlemail.com with ESMTPSA id k15sm385809oom.22.2020.06.05.17.21.27
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Jun 2020 17:21:28 -0700 (PDT)
To: alsa-devel@alsa-project.org
From: "D. R. Evans" <doc.evans@gmail.com>
Subject: detailed documentation for plug plugin?
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
Message-ID: <3300cdbc-424e-711e-12fe-7b76da3c648c@gmail.com>
Date: Fri, 5 Jun 2020 18:21:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="3OdGyBE3r5Q7KhygCAoUwVDZiGQQqF0Xh"
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
--3OdGyBE3r5Q7KhygCAoUwVDZiGQQqF0Xh
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is a follow-on to the topic started in e-mail
  <62e4a031-f175-70bc-099f-441fa0623a9f@gmail.com>
on the alsa-users reflector; I also posted this e-mail on that reflector,=
 but
I suspect that there are more people here who would immediately understan=
d the
behaviour described below, and can point me to the right documentation.

--------

I have a machine on which the following works for reading audio:
  device: default [which is actually hw:0,0,0]
  rate: 44100     [which is all that the raw device supports]

And the following does not work:
  device: plug:default
  rate: 8000

Everything else is identical in the two scenarios.

So I am trying to find detailed documentation about the "plug" plugin, to=
 see
why it doesn't seem to do what the minimal description I've been able to =
find
suggests. That is, from what little I've been able to find, it seemed lik=
e the
second scenario should work if the first one does: behind the scenes it w=
ould
take the 44100 output from the default device and downsample to 8000, and=
 make
that available to the snd_pcm_readX() functions. But that is not what's
happening, since the second scenario fails: snd_pcm_readX() blocks (even =
in
non-blocking mode).

Somewhere there has to be a detailed, technical description of precisely =
what
the plug plugin does; can someone please provide a suggestion where to lo=
ok?

  Doc

--=20
Web:  http://enginehousebooks.com/drevans


--3OdGyBE3r5Q7KhygCAoUwVDZiGQQqF0Xh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRWBjQtTqmzCoJnxKFp16y8NikSuAUCXtrhhQAKCRBp16y8NikS
uLYIAKDBvZj6YknfDyiCJs/qtZkb8z19qgCdGtzuRSL2RckmMzImy8HpHlKJxNY=
=ovQK
-----END PGP SIGNATURE-----

--3OdGyBE3r5Q7KhygCAoUwVDZiGQQqF0Xh--
