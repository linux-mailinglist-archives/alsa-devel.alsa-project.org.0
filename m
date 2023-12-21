Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B081AD85
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Dec 2023 04:30:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93F9F207;
	Thu, 21 Dec 2023 04:30:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93F9F207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703129451;
	bh=2cwy609ViDO/5NGng780dz2Zp63VE09X7quZEZMkNVo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M6JF1/EzJ2TWQP2nZXHxm6CXEsWy/f6tU2HJ+hfECw9dwftjiTmK3HrKYodYvr7sU
	 uGeRAKC2wzuGSQ4FJQgDhgmNWen+o4hMw9jKE/oxU3/V9bq6l36P2RYlpxW6M5k4a3
	 DAjPfXlKWyrdd9MD2ac3hTdpttORezx9pJow91kY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF3D9F80212; Thu, 21 Dec 2023 04:30:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D043F80571;
	Thu, 21 Dec 2023 04:30:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FD7BF80153; Thu, 21 Dec 2023 04:28:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B4ACF800D2
	for <alsa-devel@alsa-project.org>; Thu, 21 Dec 2023 04:28:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B4ACF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MjSsoVrh
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d741fb7c8eso364097b3a.2
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Dec 2023 19:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703129322; x=1703734122;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2cwy609ViDO/5NGng780dz2Zp63VE09X7quZEZMkNVo=;
        b=MjSsoVrh+THzd8Svg69gsx0QvT9rn8Ui0Ab11wGkDukoINvUMNn8f7I/pepRLSzNeL
         18o6d1swF3tvlpOuzUTaQjyatWbU7wk/CdIWet8jOa+xzmOEBXRcQS3Aip5N4Dd2W3tf
         wXja3ftocc3J9F13F3yy9IeNpkx5msSILgMCQEobFptBgmBMT7dFbeXNjZLlcDXGb0d9
         hx5EEZHlOAEk8Yw8oO7Rv8PgQA+TqJTGvzoH6Df05otWRkJzHk+ZE70apwBL/srpYbk+
         hXDx1A6zmDzN/Lir6NsmCTTFQRxo+p7/SfkAJxv7OoUP/C3l/QVN2XSF4Ye1wNOMQAGJ
         RVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703129322; x=1703734122;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2cwy609ViDO/5NGng780dz2Zp63VE09X7quZEZMkNVo=;
        b=JIVbDjbuRTNoIIOhPqJcnyneQesdqYX91ze9/osmCvLhlfmtkdk8k3SL8bUNNudGbh
         lFZWg/Nt7EN1V+7Wyi43Iol4WEXXRdXjhEAcD5Dv3lnI+6iAHthjPp5/5anhXVS1yuH2
         uEjBqjdaEwf6m511RPGUGrcra1PMUR11ntaUvMpZNZ3uoZwG8+buZkXtocTlnMgY/pnL
         aE6RxOWCizvRBNM56+mLdr72iG/xV9omHOrzK45dDA3w4zyMzQa8PHAaTsqMvUg5B35P
         81moCklH0IudA5vB4yn66cX4TB7AZ6uCbv//5+cuFJ1W4v7i/qBQYbdPBZDIMasCyDF3
         ap6Q==
X-Gm-Message-State: AOJu0YzZy7XqP0fmoc+L/CTmPf00D2qJtiSyiF84+xWw5Z11skSFywa4
	mKoFGQgNwEKREP2q+dhujD+VY72JtNzYRA==
X-Google-Smtp-Source: 
 AGHT+IH00C6bByvTzePNj6kiL3xYMrwqwS66Re6fu1otTnsCDa97TAOATj8PHde+3hqCHgKc+xTfCw==
X-Received: by 2002:a05:6a21:a59e:b0:195:7f2:d556 with SMTP id
 gd30-20020a056a21a59e00b0019507f2d556mr175918pzc.76.1703129321812;
        Wed, 20 Dec 2023 19:28:41 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 x29-20020a63171d000000b005c60cdb08f0sm537606pgl.0.2023.12.20.19.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 19:28:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 135E41028B29B; Thu, 21 Dec 2023 10:28:36 +0700 (WIB)
Date: Thu, 21 Dec 2023 10:28:36 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux ALSA Development <alsa-devel@alsa-project.org>,
	patches@opensource.cirrus.com,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Andy Chi <andy.chi@canonical.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Matthew Anderson <ruinairas1992@gmail.com>,
	Luka Guzenko <l.guzenko@web.de>, Yuchi Yang <yangyuchi66@gmail.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>,
	Lucas Tanure <tanure@linux.com>, Fae <faenkhauser@gmail.com>,
	Albert Tseng <tsengalb99@gmail.com>,
	Lukas Voreck <overloader@tutanota.com>
Subject: Fwd: No sound drivers on HP Envy x360 ey0xxx
Message-ID: <ZYOw5OVHGugrEP30@archie.me>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+dEZltS9BeS27wKC"
Content-Disposition: inline
Message-ID-Hash: E2O6FIG6ZC7JAWSEDVQRZ7VISK2KXLZR
X-Message-ID-Hash: E2O6FIG6ZC7JAWSEDVQRZ7VISK2KXLZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2O6FIG6ZC7JAWSEDVQRZ7VISK2KXLZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--+dEZltS9BeS27wKC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm forwarding a Bugzilla report [1], as many developers don't take a look
on Bugzilla. The reporter (Lukas Voreck <overloader@tutanota.com>, Cc'ed)
wrote:

> On an HP Envy x360 ey0xxx (and probably similar devices) there is no soun=
d from
> the internal Speakers whatsoever.
>=20
> Currently I'm using the patch found here
> https://lore.kernel.org/all/20220811053950.11810-1-faenkhauser@gmail.com/=
T/ But
> with newer kernel versions that patch wont work, It will fail to build (t=
ested
> with 6.6.6)
>=20
> This is my first issue here and my first encounter with hardware issues, =
if I
> can provide more Info, please let me know

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218280

--=20
An old man doll... just what I always wanted! - Clara

--+dEZltS9BeS27wKC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYOw4AAKCRD2uYlJVVFO
o+30AP9EIaHIVpT2Tk9XjLbrg50ewBz3Z3mvGhVSq6v27g3+HQEA6qlS4qEIndJ2
SDQa7Hq1fx5Hiw8C+z8pJ9doxVysyQo=
=qIw/
-----END PGP SIGNATURE-----

--+dEZltS9BeS27wKC--
