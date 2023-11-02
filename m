Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA9C7DFD3C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 00:12:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A494822;
	Fri,  3 Nov 2023 00:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A494822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698966778;
	bh=YR7cWpbPv3YkHu6Lgq/Qssety+VQHUk9DYioZqwXCUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jX2o0cnZvCENQJjgmKJ0LjAPQfC7s6i1yRSJnXeLyhnKaSdaMpdq+IjiK+QP0mOw7
	 lKqnpX8JjCZjv1lcencuGBttyqHM0sgj0iQl4wo1yTIC2UafsokYL+Yafm1VkzgM1v
	 DQYbh4ZjLXOWJybLopIYBtCXqx5MCXr8UJ6sIOh4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB547F80425; Fri,  3 Nov 2023 00:12:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 562EBF8020D;
	Fri,  3 Nov 2023 00:12:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EDEF3F80290; Fri,  3 Nov 2023 00:12:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF85F8014B
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 00:11:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF85F8014B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Lx1mt5Qk
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1cc5fa0e4d5so13371295ad.0
        for <alsa-devel@alsa-project.org>;
 Thu, 02 Nov 2023 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698966712; x=1699571512;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YR7cWpbPv3YkHu6Lgq/Qssety+VQHUk9DYioZqwXCUs=;
        b=Lx1mt5QkXozN+zUeYTjm13fQwGpm2LdYuDcjW5REk5UzJQUN8MELscO6q6n9GP2cq3
         coos/bwiBDyTCGbDSmtxxffhzrLHK3K9WmmsDSE22fACgALDsGpU2HRzJRLdJPd2JHH8
         ZWd3LICThJk+w+u8aplX2Hbl2gPr4jSWBH6EpqOTQIkDDE/MzTfqnC5H2XwmP0m0vfFc
         v+yFoUGyA/nWoHg34kaAlRFuOfrQYkJ9qt5k6k6iTwSg5m5J+Rkd+nVEoi6M3LQu1l9O
         lzmcNU3Kc+9VRp8D1V+FqQiBUMwlQLe8PbmbvRdZYN0Zr13X3MB5agHIRhB4ksys6/U6
         aZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698966712; x=1699571512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR7cWpbPv3YkHu6Lgq/Qssety+VQHUk9DYioZqwXCUs=;
        b=bleJaWw4nDhP0Szb/p2NyDqur1Fz8eF6T1+pY+4hGOjWGR02EoP/FS4TB4MCqEFSDY
         /bxtfvEWJDBn7F5mV1l+5RBTr7WJalve+iJdOk9UaZn0HwfhIvTyc567aaeXNFd9ZKib
         MMdZnv5u/muYtxFhzA51aR4h/5X8fPqbBmWvWjnsBYJTbcxGXtJSjk4TEm0BaXvd72en
         fPi26Y9hDeI2zEjI9l8wPT/JRscGyPy7ax16oqmaCCYBHfm3qc0tmZah/8Xz7Ae3YnI5
         l6FsPXXgGkmbMVslknXoQWRISILAyzrcHyQm7I6OwHZxd5WuXemHaJO6q1pE3xhqnfo+
         0aKg==
X-Gm-Message-State: AOJu0YyKYz6C5OMQEWIXJMcuOHGFUwdKrinyOXjT5lifNHT1cJfd8xvS
	pNWz6iG3c8lkJdYwH3h+r2fpiFmiv7s=
X-Google-Smtp-Source: 
 AGHT+IFNKID/IaFJ3qpqhJHmYpuAZBU6Wmv4Nxw/q6gbtqVIxJN0VLzqTsIy+patzPT8aTnyy+Dwfg==
X-Received: by 2002:a17:902:f1d2:b0:1cc:2575:db14 with SMTP id
 e18-20020a170902f1d200b001cc2575db14mr16012795plc.60.1698966711585;
        Thu, 02 Nov 2023 16:11:51 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id
 4-20020a170902ee4400b001c407fac227sm222666plo.41.2023.11.02.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 16:11:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1AC599157AFC; Fri,  3 Nov 2023 06:11:46 +0700 (WIB)
Date: Fri, 3 Nov 2023 06:11:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Marian Postevca <posteuca@mutex.one>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Message-ID: <ZUQssoD2rUHSYQ2v@debian.me>
References: <87a5v8szhc.fsf@mutex.one>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="co0Oi2OYqTcTDchu"
Content-Disposition: inline
In-Reply-To: <87a5v8szhc.fsf@mutex.one>
Message-ID-Hash: ZXWZQZ2L3CLSASMF2WXY4RLVRJGALRNE
X-Message-ID-Hash: ZXWZQZ2L3CLSASMF2WXY4RLVRJGALRNE
X-MailFrom: bagasdotme@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXWZQZ2L3CLSASMF2WXY4RLVRJGALRNE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--co0Oi2OYqTcTDchu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
> I'm trying to develop a sound machine driver based on the acp legacy driv=
er.
> The first version of the driver was sent for review on the alsa mailing l=
ist this
> spring: https://lore.kernel.org/all/20230320203519.20137-1-posteuca@mutex=
=2Eone
>=20
> I'm trying to fix some of the issues that were brought up during the revi=
ew back then,
> but when I ported the patches to the latest commit on the for-next
> branch, I noticed a regression where I couldn't hear any sound at all.
>=20
> So I started a bisect session and found that the first bad commit is:
> ASoC: amd: acp: add pm ops support for acp pci driver
> commit 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
> https://lore.kernel.org/lkml/20230622152406.3709231-11-Syed.SabaKareem@am=
d.com
>=20
> If I revert this commit sound works as expected. So I started tinkering a=
 little bit
> with it and I believe that what happens is that the acp pci driver
> enters the autosuspend state and never leaves this state at all.
> I noticed this because if I increase the autosuspend delay to a much
> larger value, then the sound works until that delay passes.
> I added traces and I can see that when the delay expires the suspend call=
back snd_acp_suspend()
> gets called, but the resume callback snd_acp_resume() never gets called.
>=20
> I'm no expert in runtime power management (though I did read a bit on it)=
, so I don't understand
> all the things that happen underneath, but one thing that is not clear to=
 me is who's supposed
> to mark activity on this device and keep it from entering autosuspend if =
the user wants to play
> some sound? Shouldn't there be some counterpart that calls pm_runtime_mar=
k_last_busy() ?
> I looked through the code and can't find who's calling pm_runtime_mark_la=
st_busy().
>=20
> Some help here would be welcome. Is there something missing in my machine=
 driver code, or
> is the runtime pm handling in acp pci driver wrong?

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 088a40980efbc2

--=20
An old man doll... just what I always wanted! - Clara

--co0Oi2OYqTcTDchu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUQsrgAKCRD2uYlJVVFO
o679AQCRW7cp+WmNFpWYM+EUDNsuXCHFeqjx5LAQzKMRfXv97gD+MuJIGeWYvJ0F
aDSiN4Lbm1Fo2OmQtJcQmT3DZSQ5CAM=
=uyFI
-----END PGP SIGNATURE-----

--co0Oi2OYqTcTDchu--
