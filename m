Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734E3A3DCAC
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2025 15:27:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9E4C6056F;
	Thu, 20 Feb 2025 15:27:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9E4C6056F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740061645;
	bh=FcqdilpNhODSA00GdcWySmpigEU8BJsiN+AnfYbdzN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z9SbXuzuGjC0pSDPmKKirehH9J+Q3iFQtq4EIT6y/grlej1d5RKSAs0aHmdL2sIjN
	 IefGAcM0aVa1eRg+59TSoi+XoLQRD87uqaN+EDUbLszeEbq5/JOH8wkTuwLYYBNGTA
	 l9ludOqEB4wM4ntiTsm25BgBYxcARwmoNzgvg/XY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 693A2F805BD; Thu, 20 Feb 2025 15:26:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DD62F805BA;
	Thu, 20 Feb 2025 15:26:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 990A0F8032D; Thu, 20 Feb 2025 15:26:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D228FF8001D
	for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2025 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D228FF8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Bk0z6obN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6CFDB5C4926;
	Thu, 20 Feb 2025 14:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4806C4CED1;
	Thu, 20 Feb 2025 14:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061585;
	bh=FcqdilpNhODSA00GdcWySmpigEU8BJsiN+AnfYbdzN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bk0z6obNnzzhW55kz+X64F/FtdhlZ9ulWS4OKELItY/ISD3kBHLf6gdm8Xx2YZ85Z
	 7WNRixLa9DNvRhX69/stBIDSZ9jPnQE7RwdtzwWGZ2kmnpFgmDPfAieuhRr4tHR9dz
	 ja2uXFvYcQHtdOHGO0MjLRi8TBAapXEYbg55wmCztlAAm2R9sXmSTxARYkSYmp8NMG
	 e0dXylo9ELJ6fWy+d1ShNMPam2+vR5r89yXALF3k+sZaxKKH4tYe0qoz8jPL9J76Xo
	 IpMnRU3waYjg5k4NKloWWOFpHIeRbIFj2zDr0ITV7TKI5imX+kFqAlbEY6W9VGpZVW
	 yKM60niBX/1nQ==
Date: Thu, 20 Feb 2025 14:26:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
Cc: tiwai@suse.de, andriy.shevchenko@linux.intel.com, 13916275206@139.com,
	13564923607@139.com, alsa-devel@alsa-project.org, baojun.xu@ti.com
Subject: Re: [PATCH v2 1/4] ASoC: tas2781: Support dsp firmware Alpha and
 Beta seaies
Message-ID: <Z7c7jpRCdMETRHBw@finisterre.sirena.org.uk>
References: <20250219061057.714-1-shenghao-ding@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HSuuO7awSkUwTLzk"
Content-Disposition: inline
In-Reply-To: <20250219061057.714-1-shenghao-ding@ti.com>
X-Cookie: Editing is a rewording activity.
Message-ID-Hash: YXJSTXMDVOASTRWRSRW7662KYOIMQTLF
X-Message-ID-Hash: YXJSTXMDVOASTRWRSRW7662KYOIMQTLF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YXJSTXMDVOASTRWRSRW7662KYOIMQTLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--HSuuO7awSkUwTLzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2025 at 02:10:54PM +0800, Shenghao Ding wrote:

> -#define PPC3_VERSION				0x4100
> -#define PPC3_VERSION_TAS2781			0x14600
> +#define PPC3_VERSION_BASE			0x4100
> +#define PPC3_VERSION_TAS2781_BASIC_MIN		0x14600
> +#define PPC3_VERSION_TAS2781_ALPHA_MIN		0x4a00
> +#define PPC3_VERSION_TAS2781_BETA_MIN		0x19400

This is still going to break the build.  Each patch you send needs to
build and run when applied by itself in order to allow people to bisect
things.

--HSuuO7awSkUwTLzk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3O4sACgkQJNaLcl1U
h9CcmAf7BPM7oLmBr65sfOjuWFZPNrrxmPcnHpr6piArYfHbzW56k8WySG3zigpk
5fPPBVB2Ak70PHSvGF+HM9HIDhml+EXYikniyJvERwfbPlJfoKk+ZbsPgDo6X+DA
NJz2pLRgj0c930THOAU3JX8YNZoZGYifFjUhAEKa4izYYTYlypNjkQmUtD0wZ+za
oYLvaVm1lxY2n3jjay7HzwIOKVKY2r2CC+LgO1WOLvYeNQHgjqaA5s6R+22gMaAe
l1tSqIRcjdLcL9GK4ValHfwiYmi3znFb9Vm5qc8/YFRI/Dey/xXjQuRZ8DZaFpEd
Rly7FJNi1+mOyY09Lv7WXD31JpiqFg==
=Ghh2
-----END PGP SIGNATURE-----

--HSuuO7awSkUwTLzk--
