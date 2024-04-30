Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D18B7A78
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:47:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86CDAE7D;
	Tue, 30 Apr 2024 16:46:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86CDAE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714488419;
	bh=sBXF+gjdjkRUhUS5Q4VYAIn7ZZ0+/7CQzrsCxXjL5dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mGTeclYaG99iFQaRm7JHYWFUlEsoV5wLJZgSZJtiK7+0T37DEZUB1mXYQhAvSuFtf
	 yLKplBWkf+Fpcj+KnCHXlYn3m/3foBuXXq2pSIIXnmJLbTMKxrrqqBXjv0Tg11Njkl
	 ibOf9Ah4P1OibvNvbGDpxUBoRGCACcg5yQNFB2CQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 636D7F80587; Tue, 30 Apr 2024 16:46:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A24BAF8025D;
	Tue, 30 Apr 2024 16:46:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BF0AF80266; Tue, 30 Apr 2024 16:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C14BF8003C
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:46:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C14BF8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HRoXQHpF
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97997CE1046;
	Tue, 30 Apr 2024 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85AA7C2BBFC;
	Tue, 30 Apr 2024 14:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714488365;
	bh=sBXF+gjdjkRUhUS5Q4VYAIn7ZZ0+/7CQzrsCxXjL5dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HRoXQHpFRApacG9ybBX6B95wKslmuE4UrGaFexMEbtIm4t0uAJWO5tcrZym/VeE6c
	 /S830uVslcO9IbwPhqveybIosTrozBqM7h3wLkepcAlo/OU8tSPtYbhSNFrRkBmJoY
	 coUyqlE3pvWN7L+ZADP0BArwUBwm0ZuPyscvkM+nbLTP2FFxQjOkqSGzrLP0nmF59c
	 HpkI+8ke0LG7xCL9EukPGz03r7pzDIngxJliSGTTyZzTiGidd9jyzpgZOskOd14X1g
	 RsWX+jRkJXkQXTcPdZpK1YXzqklzIBXOuEYb0AbCkvsNf+KksxsobnCLpsLMJhDf6m
	 zrcNcrPKbwG0Q==
Date: Tue, 30 Apr 2024 23:46:03 +0900
From: Mark Brown <broonie@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, hverkuil@xs4all.nl,
	sakari.ailus@iki.fi, tfiga@chromium.org, m.szyprowski@samsung.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v15 00/16] Add audio support in v4l2 framework
Message-ID: <ZjEEKyvb02CWz3l4@finisterre.sirena.org.uk>
References: <1710834674-3285-1-git-send-email-shengjiu.wang@nxp.com>
 <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8QM/NXLseGhLxhjD"
Content-Disposition: inline
In-Reply-To: <20240430082112.jrovosb6lgblgpfg@basti-XPS-13-9310>
X-Cookie: lisp, v.:
Message-ID-Hash: OCSEGBWGBSBWPXJ4KSM4775RPX5AYDEL
X-Message-ID-Hash: OCSEGBWGBSBWPXJ4KSM4775RPX5AYDEL
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCSEGBWGBSBWPXJ4KSM4775RPX5AYDEL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--8QM/NXLseGhLxhjD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 30, 2024 at 10:21:12AM +0200, Sebastian Fricke wrote:

> first of all thanks for all of this work and I am very sorry for only
> emerging this late into the series, I sadly didn't notice it earlier.

It might be worth checking out the discussion on earlier versions...

> 1. The biggest objection is, that the Linux Kernel has a subsystem
> specifically targeted for audio devices, adding support for these
> devices in another subsystem are counterproductive as they work around
> the shortcomings of the audio subsystem while forcing support for a
> device into a subsystem that was never designed for such devices.
> Instead, the audio subsystem has to be adjusted to be able to support
> all of the required workflows, otherwise, the next audio driver with
> similar requirements will have to move to the media subsystem as well,
> the audio subsystem would then never experience the required change and
> soon we would have two audio subsystems.

The discussion around this originally was that all the audio APIs are
very much centered around real time operations rather than completely
async memory to memory operations and that it's not clear that it's
worth reinventing the wheel simply for the sake of having things in
ALSA when that's already pretty idiomatic for the media subsystem.  It
wasn't the memory to memory bit per se, it was the disconnection from
any timing.

> So instead of hammering a driver into the wrong destination, I would
> suggest bundling our forces and implementing a general memory-to-memory
> framework that both the media and the audio subsystem can use, that
> addresses the current shortcomings of the implementation and allows you
> to upload the driver where it is supposed to be.

That doesn't sound like an immediate solution to maintainer overload
issues...  if something like this is going to happen the DRM solution
does seem more general but I'm not sure the amount of stop energy is
proportionate.

--8QM/NXLseGhLxhjD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYxBCsACgkQJNaLcl1U
h9Cv4gf/cXnSe2CcRqekxdvf3QpCLrReELvBj5Ryx0es6jh5p0iXtGjTAa+m1l2U
Qn6JhhdVxr6YDApk3yXTkGvTElhB2RPjdxhHGklWqfXFTwKhZtFYKmx2GqfKxLXZ
6N4OhJv/OYSeLGuGQDh3WLEJW44PKKQUfDg6zdCCu2xeTqt42IeZOPA4NLU9lBvm
6vzvRoB9ddXzdqIJ5tPx89c3PXrCKBHhFIz9FQ1QLpE9p/26fkpsjYkB9cTQhAGq
kMvWcqfITh7e8JEEPsVzlYMNOcsCCegJqJwniSw2OV3fQDBUDoHaO/I1hYidAzVS
IndFbuEtQpfHjpRlfXAsGrrxDysAfw==
=/WXD
-----END PGP SIGNATURE-----

--8QM/NXLseGhLxhjD--
