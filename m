Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CA956FD6
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Aug 2024 18:10:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AEE914E8;
	Mon, 19 Aug 2024 18:10:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AEE914E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724083812;
	bh=5Om3gjqk4hxEfZBnBv+uVakUDnbUBmo7IWUSURM1tUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RsNPnRXdwEzDzJWKmMt1oC/GJZSC+5+eXp8C9tTiLSj4cCFSk8ZQstIVzR3zVfiOZ
	 BuR5kSXC941dk/enkn/TQj+K2T8aaW0njcdIH6Upy3UXGnt4GGFGbhJACt5Xyz/RsA
	 r43VK8YttyDq58gq6Gui08lBssRgc6/PXmtDAyPg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDD48F805B4; Mon, 19 Aug 2024 18:09:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D39BF80589;
	Mon, 19 Aug 2024 18:09:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48DE2F80494; Mon, 19 Aug 2024 18:07:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53D43F8016E
	for <alsa-devel@alsa-project.org>; Mon, 19 Aug 2024 18:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D43F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=p6CXqNn0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5C7DC60C6D;
	Mon, 19 Aug 2024 16:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF5DC32782;
	Mon, 19 Aug 2024 16:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724083643;
	bh=5Om3gjqk4hxEfZBnBv+uVakUDnbUBmo7IWUSURM1tUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6CXqNn0XIp2Oq/2aepEjbTmjZMDcIsRi9P3pycUsrx/+6+ackP9c2YljRW+wDb//
	 qc8A0tljB/ty4kwMc7BDvuBDFGenWU3hxwUQmzipGkR/65w6mzYwFimNGo90nVdB6g
	 8sbgtg5mh/Ub+0fySBl5rxgZBX5ssnN3Gwb8eFbVIeuy06Y/CrBtcNvBizztzYdvxU
	 farUsHRwn3pZwUA1gIHLWWNDc2WwypXqslF2YbiheqWDi0P1hL8LQwnwELRO4mTkZC
	 WGbVqoDlcCeVedyqP8gMgKIHX2jvnHfi7ZYqLIKjCRmNKNGiEcvmnKw1GJ/RMW5Z6D
	 vTnVkM6TOFW0w==
Date: Mon, 19 Aug 2024 17:07:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com, perex@perex.cz,
	pierre-louis.bossart@linux.intel.com, 13916275206@139.com,
	zhourui@huaqin.com, alsa-devel@alsa-project.org, i-salazar@ti.com,
	liam.r.girdwood@intel.com, jaden-yue@ti.com,
	yung-chuan.liao@linux.intel.com, dipa@ti.com, yuhsuan@google.com,
	henry.lo@ti.com, tiwai@suse.de, baojun.xu@ti.com, Baojun.Xu@fpt.com,
	j-chadha@ti.com, judyhsiao@google.com, navada@ti.com,
	cujomalainey@google.com, aanya@ti.com, nayeem.mahmud@ti.com,
	savyasanchi.shukla@netradyne.com, flaviopr@microsoft.com,
	jesse-ji@ti.com, darren.ye@mediatek.com, antheas.dk@gmail.com,
	Jerry2.Huang@lcfuturecenter.com, jim.shil@goertek.com
Subject: Re: [PATCH v1] ASoc: tas2781: fixed the issue that the chip do not
 shutdown immediatly after aplay stopped
Message-ID: <06667a01-32ee-403b-8c59-1ee37d2ef192@sirena.org.uk>
References: <20240819141017.502-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OMtkBlhr516N0cDG"
Content-Disposition: inline
In-Reply-To: <20240819141017.502-1-shenghao-ding@ti.com>
X-Cookie: Interchangeable parts won't.
Message-ID-Hash: ZWECRMMRT27PHNOJQ5QXEWNMKWNNTNK4
X-Message-ID-Hash: ZWECRMMRT27PHNOJQ5QXEWNMKWNNTNK4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZWECRMMRT27PHNOJQ5QXEWNMKWNNTNK4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--OMtkBlhr516N0cDG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 19, 2024 at 10:10:12PM +0800, Shenghao Ding wrote:
> Issue reported from customer that the chip do not shutdown after aplay
> stopped until 6 mins later. Drop tasdevice_dapm_event and implement
> .stream_mute in the tasdevice_dai_ops.

Six minutes sounds like a usersrpace issue with userspace sitting
playing silence for a long time rather than a driver issue.  By default
DAPM does defer powerdown, but only by seconds not minutes.

> -	/* Codec Lock Release*/
> -	mutex_unlock(&tas_priv->codec_lock);
> +	/* Codec Lock/UnLock */
> +	guard(mutex)(&tas_priv->codec_lock);
> +	tasdevice_tuning_switch(tas_priv, mute);

This is a much heavier weight operation than we're expecting for a mute,
it should usually just be literally muting - one or two register writes,
not a power up/down sequence

--OMtkBlhr516N0cDG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbDbbEACgkQJNaLcl1U
h9C2Ywf9GOLN3tl9f60QFHfZxFzbDbI7u4NHZKInpUph0BTXbQ4mu0rnp44z1TsX
w/gs5eZcaxMDLaP5h5w8aWiqwOhPwMItVZN2psMOk+R0/7L6kW2PHrthurJ4Hc9c
tbSgoJzTLFt78psFbn8+phW5OhOqyZFURKhxGM2Cmg9h1sRYPAYSI4leNfinHxoG
98W6EaukIPMhR2llc/iHDPITw/jEDjaTPges1O6QQBfWt/DsoCOmBqV2pox8XGlw
nsmTQCi02YCZHzCjWT3nOUxo+jGyCxFslGmKZXk4ThEZrWsFylrKguVwND4137AL
xL29jks6WandKgEIXUdOIikunIOrAQ==
=RC26
-----END PGP SIGNATURE-----

--OMtkBlhr516N0cDG--
