Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAD7B83DB
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Oct 2023 17:41:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF48B857;
	Wed,  4 Oct 2023 17:40:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF48B857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696434095;
	bh=df8KZVSxg7fpWft4bfdcKowE+/YFVMdWA60GDzXP/SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UNTAdKeGeXZIQ8ROxVBMqY7ruZESeXT3qPtzUWlOiMmV37S/j7CLvxDXEzk/nfBcU
	 MVEdLgqI5Kr68wkYqQ9lNb0mMHL4jzFltHFndfnHMNtBbtJwAiJocRJ5n+Mfqcgurk
	 SJCibYvf4aHAAuzLIP6A8sCmgn3x/Y1m5yti88uE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1175DF80558; Wed,  4 Oct 2023 17:40:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 93DF8F80310;
	Wed,  4 Oct 2023 17:40:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAAB7F8047D; Wed,  4 Oct 2023 17:40:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BD2A8F80166
	for <alsa-devel@alsa-project.org>; Wed,  4 Oct 2023 17:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD2A8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qyB2BHOg
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47C5761598;
	Wed,  4 Oct 2023 15:40:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F8BC433C8;
	Wed,  4 Oct 2023 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696434023;
	bh=df8KZVSxg7fpWft4bfdcKowE+/YFVMdWA60GDzXP/SA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyB2BHOgxF8GQS+OT5aMzixIcMGOMkIlJUdzNz/zkYVW/2KT5hD86elSvXvBR1aOF
	 HfuB84Exme7eqzvCmMfGVZX/2zLHvshcJ3nrn1AX1ps9db0ZvOorxznPT4zjrpP4dg
	 iVpclSSmQ7mAGXzlLhf3loHYTM74I5o80TwUBnDH6jGuGU8HpdB4uM1Fee2b/+J6SC
	 MXXLWRCYRQCRQOXCdti2Od2bORajK0Zaq8Ry1lCkjZTrY8p3xi3lDLM3OgmYsRKs+Y
	 jt4qYeZ6qP4QJGnktKPIyWSzR3ALNypsNV9PDwoI+YPlHEJcGT6f59/3SjDIqDR+pl
	 sfJYoEVjcffTA==
Date: Wed, 4 Oct 2023 16:40:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Philippe Ombredanne <pombredanne@nexb.com>,
	Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] soundwire: fix initializing sysfs for same devices on
 different buses
Message-ID: <d648c3d1-53ac-4021-ac7f-6a81f1a72dd3@sirena.org.uk>
References: <20231004130243.493617-1-krzysztof.kozlowski@linaro.org>
 <6628a5f6-ed22-4039-b5c2-2301c05c7e3e@linux.intel.com>
 <2023100453-perfected-palm-3503@gregkh>
 <624b044a-1f0f-4961-8b57-cb5346e7b0d3@linux.intel.com>
 <2023100452-craziness-unpopular-7d97@gregkh>
 <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dDaSu7Aom8sfapyH"
Content-Disposition: inline
In-Reply-To: <04c5911a-a894-44b3-9f0e-fe9e6de203f2@linux.intel.com>
X-Cookie: This space intentionally left blank.
Message-ID-Hash: ZAEKAZMPPTJLCZR7UFAX4FB36QEKMI6A
X-Message-ID-Hash: ZAEKAZMPPTJLCZR7UFAX4FB36QEKMI6A
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZAEKAZMPPTJLCZR7UFAX4FB36QEKMI6A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--dDaSu7Aom8sfapyH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 04, 2023 at 11:16:09AM -0400, Pierre-Louis Bossart wrote:

> > matching the name is fine (if you are matching it against an existing
> > name) but expecting the name to be anything specific is not going to
> > work as the name is dynamic and can/will change each boot.

> Not following, sorry.

> In the SoundWire context, the device name directly follows the ACPI or
> Device Tree information, I don't really see how its name could change on
> each boot (assuming no DSDT override or overlays of course). The
> platform descriptors are pretty much fixed, aren't they?

> Intel and AMD make such assumptions on names for pretty much all machine
> drivers, it's not really something new - probably 15+ years? Adding Mark
> Brown in CC: to make sure he's aware of this thread.

FWIW DT is much less affected here since all the inter-device references
are explicit in the DT (modulo needing to work around breakage) so we're
not hard coding in the way ACPI so unfortunately requires.

--dDaSu7Aom8sfapyH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUdh2AACgkQJNaLcl1U
h9Dg2Qf/TTjAvH7rrj88JqMZ5e52pLzKRkYsKDlpQCGarm9GRbl3b1sbc4orAwYD
nhn2kx1bqWrZANB5fm83hWKNBRtiWvVbau+lR+CbxXAAi/D26zd7btSx7k2yfXNW
g5jolY8IR1AR1CNOwIFWPvO9uvZGlfFU96iiPTyaOHMyytLu91ygLkbFY7ImfOWe
bnlr48wrjy4idRhEH1L8ST+CHS/ENx+lj3uXXYy0zfeiyZNgWFAQ5C0m95lfecF+
ZZmVnKbRikSlIL+ZHAtukR1ywmRkWdOTy8Y2y4yfYzquIQ2QoMa3GDr3wAq8L8/q
VSutkzU+PAYOrHHfngft5JSKCGv5QQ==
=AlEx
-----END PGP SIGNATURE-----

--dDaSu7Aom8sfapyH--
