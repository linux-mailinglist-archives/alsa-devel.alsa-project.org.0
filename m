Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22E89AABC
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Apr 2024 14:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C65C2CA0;
	Sat,  6 Apr 2024 14:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C65C2CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712406565;
	bh=HMqxkQVw5ClLHO8uz/q7lloBVQ8OoW2lW1vT1IPuxmE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GiAP2HvJSyWJg9ZAskitmjw1APYdMJhvt8vxV01YlmdUvgGd84E74kuUIMmO3Ha5y
	 sVrp7GcSFPKBZbkdS+dsthyo2hxZKWkR2QNMZ1pOqa49Je1VD85TwcH22Jfj7uHB7N
	 CijmA/l75ej0AKEc/3OTDpH/lK/o0k3WdKAxRCE0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 953CEF8057D; Sat,  6 Apr 2024 14:28:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6260F8058C;
	Sat,  6 Apr 2024 14:28:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9617F8020D; Sat,  6 Apr 2024 14:18:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0C600F80007
	for <alsa-devel@alsa-project.org>; Sat,  6 Apr 2024 14:18:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C600F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YxYBLn53
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so2031766a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 06 Apr 2024 05:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712405888; x=1713010688;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMqxkQVw5ClLHO8uz/q7lloBVQ8OoW2lW1vT1IPuxmE=;
        b=YxYBLn53XPTv36JPxnpcaekaFhJ3k75upRybH9LP5zy/c4c955eLexTcD0cUpuy2qb
         k/Rb+z3fX3A3aLVwJ3GnyolVDRizedBASxPDDrmE04C3e66njpOa/+Lgz3tqvcd32eqg
         m91F2fJNfvVKX4T+39MupUjOar3r0uIRxshhnffiJQ0uSuAFu7YZOsApEcOgC5ANODBE
         8+jAQfLkMlybj+bjCrJxRYMJVyvZ5A5MFrfs/ZaKNIfQAIEZxQ6q2PvXQmnxCiOtuX4C
         b3YMBTdfb4hibsEQtxcHttjgsR8mmFnfrGrnbhEF+1nwESI7SBx1XfhcLIIgXwEKCYwX
         cWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712405888; x=1713010688;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMqxkQVw5ClLHO8uz/q7lloBVQ8OoW2lW1vT1IPuxmE=;
        b=SHTLGzVCLFrUP3RJYR1k+Jc/hcUbDytfy0VV/6+JipZ/ycEBpTINZ6360E3mC8SgBB
         fbEqdoeJXbHPvUwqzx+3/5W/PqYfXv89QEdXRB1J8CshYJx845mwT0i0Q/UpC8RjnrBQ
         VddfIK7p3/UcJjgd3gEPAxE2NzX/VhLUDqvqZSBX39vMJo5UlY6ikcevIMkd6ZB/7JB+
         JsnCNw2brU3K8Hlo3vX2CYeBevJNx9+9PJ3L4bEk9ywezoG3TLdov7BCJpa9xnFFqaXo
         P3NTsAHKFbkJ2OON+jhbkhpmZGsT3xTuJD3SdkpPTVwuVAT60DxlROe3BDOaeqXTwVj3
         w9QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKmwBB86ikLrbsFoHYGquF2bOqzjHkwxLDBzO9XwF8bvg0AoYd5IGOd0TWW/qntbf4Ro9i/Tjc1lSApRWoaRZ3rdCaSxQrAvwPH3k=
X-Gm-Message-State: AOJu0YwPvSpRdu0CWz+k9OPP3c+syBgS7+qQyUDb0XdbF9rY+VRWhg8v
	qYlo5GcD2oF/AjLSsWlbn/dVjZwr4C+qpzmXkq8en8+IXJCo5hAnODnPx8nvq4M=
X-Google-Smtp-Source: 
 AGHT+IGQPlaSFuYq9fPQYp0icxQCR+ZbK3UWXnqwUFy+ktbJf/r7OsELtMIgKwLkW6f+kXuEOMnVSw==
X-Received: by 2002:a05:6a20:9497:b0:1a6:fe4f:755f with SMTP id
 hs23-20020a056a20949700b001a6fe4f755fmr4181955pzb.32.1712405888182;
        Sat, 06 Apr 2024 05:18:08 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id
 x7-20020a056a00188700b006ecfe20d38csm3091883pfh.30.2024.04.06.05.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 05:18:07 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 17A1C186046F6; Sat,  6 Apr 2024 19:18:05 +0700 (WIB)
Date: Sat, 6 Apr 2024 19:18:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Linux ALSA Development <alsa-devel@alsa-project.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	=?utf-8?Q?franti=C5=A1ek?= <Oddy38@seznam.cz>
Subject: Fwd: No speaker output on lenovo legion s7 16arha7
Message-ID: <ZhE9fDBVvqC1SL4p@archie.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t65VTSFms3bdx3p0"
Content-Disposition: inline
Message-ID-Hash: YLL7FSRE4BVQWQ66A4ZXWTWVPYQIFED6
X-Message-ID-Hash: YLL7FSRE4BVQWQ66A4ZXWTWVPYQIFED6
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YLL7FSRE4BVQWQ66A4ZXWTWVPYQIFED6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--t65VTSFms3bdx3p0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Bugzilla, franti=C5=A1ek <Oddy38@seznam.cz> reported speaker problem on
his Lenovo laptop [1]:

> Hello after troubleshooting the issue on linux mint support we have come =
to the fact that it report a bug=20
> my laptop's repeaters don't work (headphones work)
> I updated to kernel 6.5.0-26-generic before I had the old version and it =
also did not work=20
> I updated this firmware https://git.kernel.org/pub/scm/linux/kernel/git/f=
irmware/linux-firmware.git/commit/t
> in the sound settings it detects sound for example from youtube but still=
 nothing comes out of the speakers=20
> here is a link to how we troubleshot it
> https://forums.linuxmint.com/viewtopic.php?p=3D2450183#p2450183

See Bugzilla for details.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218667

--=20
An old man doll... just what I always wanted! - Clara

--t65VTSFms3bdx3p0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZhE9fAAKCRD2uYlJVVFO
oylMAP9FWBpRiuurHGBjj8js1NmTUwQRASwlhl8u3ENJ5s0l8AD9FOsyZWu6kNjc
8jsgR0ZBqX5aTOWx1c8q1Ap3Hv3/egM=
=6VN6
-----END PGP SIGNATURE-----

--t65VTSFms3bdx3p0--
