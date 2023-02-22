Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A182E69F4E0
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Feb 2023 13:50:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00DD3EA6;
	Wed, 22 Feb 2023 13:49:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00DD3EA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677070200;
	bh=Hnp1Jwu9a8CBmgHckfMcvqLnlFg+60GtQkHlfuuu4UM=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jxfOf73j0NXscDqGC3hz3Ov3h96vMxsu7JOHKV1h/nYprWYy3XEJTHVlEbdwU/GMG
	 Phzx0tZTEmTt2Bb8eQBWezA18J+Gjfncee1HjB50ZRl8J0u0SaWz2NE7Bp9xKRYFHy
	 PWd9eKmQ3c1kASadI+Hhj1OGY2w3HWfXGQyLqoD8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B0DFF8025A;
	Wed, 22 Feb 2023 13:49:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCB1AF80266; Wed, 22 Feb 2023 13:49:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E218F80083
	for <alsa-devel@alsa-project.org>; Wed, 22 Feb 2023 13:49:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E218F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hTs3a7BU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2AD1B6142C;
	Wed, 22 Feb 2023 12:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5792BC433EF;
	Wed, 22 Feb 2023 12:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677070138;
	bh=Hnp1Jwu9a8CBmgHckfMcvqLnlFg+60GtQkHlfuuu4UM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hTs3a7BUk/Nbbt7ZCtxnH5AzJUD9CwXzx/fa2JCsiRupAbEazktCTpkK27LiGmmIi
	 JAfEzaS+YjFEbEmVUKyGmge7+f7h2DAP4cIs9WkJWQrR/TVycOTKkDe+hkpqaG9TR+
	 ah3RT1bT7VaC04VQrR+Ovh9lOMuObvXQleEQ2NWnVbZA9CcYdXB+y2PueBs8W1XhGM
	 +2VhFWnGS4/9Xm5uLM2YzmJk3+mFQENMrBGVS5tgGdHmNGefg214Fq6MPYv1WhstX1
	 c/IUw/8zCj+foWAnTCxZDL9Ybb8df5iHJScrsyQLLR9dNF0skmcKeiARPyP/kFfHra
	 QufM2s3fRcH+Q==
Date: Wed, 22 Feb 2023 12:48:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH 4/4] ASoC: wm8524: Delay some time to follow power up
 sequency
Message-ID: <Y/YPNMGMZcVZs3xy@sirena.org.uk>
References: <20230222113945.3390672-1-chancel.liu@nxp.com>
 <20230222113945.3390672-4-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GFX2+WHXFfiKPtak"
Content-Disposition: inline
In-Reply-To: <20230222113945.3390672-4-chancel.liu@nxp.com>
X-Cookie: My LESLIE GORE record is BROKEN ...
Message-ID-Hash: C6RM2PRKNJNYN7DCLOJKSJ7DWRAVSNDB
X-Message-ID-Hash: C6RM2PRKNJNYN7DCLOJKSJ7DWRAVSNDB
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tiwai@suse.com,
 ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C6RM2PRKNJNYN7DCLOJKSJ7DWRAVSNDB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--GFX2+WHXFfiKPtak
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2023 at 07:39:45PM +0800, Chancel Liu wrote:

> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		mdelay(wm8524->power_up_delay);
> +		break;

Doing a 100ms busy wait in atomic context does not seem like a great
idea, never mind a 1.5s one.  This shouldn't be done in trigger, it
needs to be done later - digital_mute() might be a better time to hook
in, though longer delays like this are really quite bad.

--GFX2+WHXFfiKPtak
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmP2DzQACgkQJNaLcl1U
h9B3UAf/THImSrqx7z6IC2WFRk7sBUql5uJGOLV4wYzC9y6CzkSA4y7OjKr5SeAh
hP0yz3ExyBKe0G/DeBDvNTgouGS2PpgJFJBF8pfJGdQF+W3jD+ofej8az6J4Taht
OzztOwq5nttxTqgvuup/jrWDiavqbPYVJ2JtEdAbRatyC0B7BzU+lhljOqBOfZw7
xIFHIc1x6y0r+HD35UAda4KTcSb+/5kVRPQessl8HnvZUYo2MaqGialfCMmDFR9g
4ncQI+QQcacYlDqvpH3OsnYqoeWq1mubJWFdmYA6WGNOPfBrIV2ZkBE9wc2xWa57
xITgsctHqcDMIwWAQaQb4i+PLkV7wg==
=SxJQ
-----END PGP SIGNATURE-----

--GFX2+WHXFfiKPtak--
