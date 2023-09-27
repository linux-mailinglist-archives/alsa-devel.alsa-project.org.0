Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3C67B01EB
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 12:29:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385E13E;
	Wed, 27 Sep 2023 12:29:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385E13E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695810594;
	bh=cvS5PqEhY5R7uI/RDPX5ydbaAUx6zExD2wS5YF2OBVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QwGe6MRoake53BjGAOXbbLXOh2thLYk4Qkjk/RFEw5Z+eNa4GtsF5540cnU6b0zTw
	 crF7TuK4rLCVjRDrRSozrS54ujX+K2KS9VLPOuqvlHYzh8V4LTi/eZnFFxGdIHDrEE
	 lWHeoKp12WEDeA4D/aXFQTT2SqdeRFmAi0VZ3RF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01554F80130; Wed, 27 Sep 2023 12:28:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 95737F80166;
	Wed, 27 Sep 2023 12:28:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37A65F8016A; Wed, 27 Sep 2023 12:28:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9630AF8007C
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 12:28:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9630AF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DIOerlI2
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 6DAECB8169F;
	Wed, 27 Sep 2023 10:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B1DC433C7;
	Wed, 27 Sep 2023 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695810511;
	bh=cvS5PqEhY5R7uI/RDPX5ydbaAUx6zExD2wS5YF2OBVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIOerlI2Ki0TXaQaY40WQF54NjPAildbPQqWliLxv3AbvAKIfh3Jv8i8piCifxJSj
	 LZC30VS8b8gXhnlQ9AT47xas28d1TgOefmkBQ1L2xqCCqT9mPxaFOkXOcmux0w4hsY
	 mCMV2/RkYVvBsoue8dtnD4kz6C3J2OUq8brTMzuVPalQ+MtNhZUzy4ZFHxECWadf8M
	 iHL0OSJEUtfXbbjtcAartn+coxjR1NSi5YlBmUh7/unC0Q9bbcCi5bki7wQaumb1kC
	 H8qxLQX2+zemAQNTgKfSUA5/dA+D3m0fJO6yT+FI4788owsqTDLbRaSrkHDf00KUXd
	 PPFAP+18o+yXg==
Date: Wed, 27 Sep 2023 12:28:29 +0200
From: Mark Brown <broonie@kernel.org>
To: ChiYuan Huang <cy_huang@richtek.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Allen Lin <allen_lin@richtek.com>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: codecs: rtq9128: Add TDM data source selection
Message-ID: <ZRQDzZG7PPovUIsf@finisterre.sirena.org.uk>
References: <1695780376-32301-1-git-send-email-cy_huang@richtek.com>
 <ZRPyMolOIjLBWXPC@finisterre.sirena.org.uk>
 <20230927094637.GA25905@linuxcarl2.richtek.com>
 <ZRP9Aw904ynL5Se/@finisterre.sirena.org.uk>
 <20230927101948.GA27975@linuxcarl2.richtek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D0qJCejxf+Euu+mv"
Content-Disposition: inline
In-Reply-To: <20230927101948.GA27975@linuxcarl2.richtek.com>
X-Cookie: Save energy:  Drive a smaller shell.
Message-ID-Hash: CUH6HEQE7KSL7GBGBDF6PPBKVHUI326X
X-Message-ID-Hash: CUH6HEQE7KSL7GBGBDF6PPBKVHUI326X
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CUH6HEQE7KSL7GBGBDF6PPBKVHUI326X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--D0qJCejxf+Euu+mv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 27, 2023 at 06:19:48PM +0800, ChiYuan Huang wrote:
> On Wed, Sep 27, 2023 at 11:59:31AM +0200, Mark Brown wrote:

> > Sure, but is that actually a practical design - or if someone is doing
> > this shouldn't it be joined up with the TDM configuration since with
> > just the control it'd only be possible to switch the pins but not change
> > the TDM layout?  I'm not sure that this control works as a standalone
> > thing.

> I think if two data source input for different scenarios, then the data source
> switch will become practical. For the standalone usage, keep a device property
> to decide this may be enough. But consider the future application, to keep this
> in general mixer control is still usable to meet the complex design.

My concern is that the control might not actually be usable without also
changing the TDM mode so we might need the machine driver to add a
control which flips the input and also changes the TDM mode - it feels
likley that if there are two inputs they won't have identical formats.

--D0qJCejxf+Euu+mv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUA8wACgkQJNaLcl1U
h9AkUQf/bHqfsJCtxIZwe9pBVupRqgu3iwyqLmWXWCS8b3tyO4RvM/XBxkSH8NDY
6Plwt9R4CuvRGgVUyMLyuCNnZWj8925kgcmhPtXA2l3wdGq4pyvvxR3k4/tNJtpS
W5d1csRIOqWJQSpR/L/THHCj1JcTqDnGLdU724MHA5QvVFjBgOLGFAnRgUmiZr5z
ftO8+UoQsMrjzG7pAlMo7ACQ5EP7GLk865NzBloiiVOizs6tWBZHnIDup8vJJA2I
n8i8bnblQBghWL4SZ6oBlr2AeRNTVDbKQXQnvSi8eLhU2qDwwAH61906roRs4ZQH
N5khCHwX0zTrKaDUmzlPpAb7Gr8srw==
=Fp4G
-----END PGP SIGNATURE-----

--D0qJCejxf+Euu+mv--
