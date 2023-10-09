Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B672C7BDB18
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 14:14:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCA7DF6;
	Mon,  9 Oct 2023 14:13:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCA7DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696853678;
	bh=ke6sTlUKSmVQ0a5qedfoFbaCYIiQvcyteCIyXEEIudM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gZmfBjlbI6J9Srvno6cxt+GTrZ3qQF6P/e57a0RYSkUCaE4C4bzhYpw+vijVwszKh
	 euwQn889FfeuS3S0YGPIUue3WOkYB1RhlJwpgGM9o/4DldaVhcVX1t1R2nt7tLPEGz
	 QFl4Jcs9Owq/k7AwnfevP1QNCOYmVUhaP0mIqUd0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44DD4F80552; Mon,  9 Oct 2023 14:13:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BED94F8027B;
	Mon,  9 Oct 2023 14:13:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E1B7F802BE; Mon,  9 Oct 2023 14:13:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 851E8F80166
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 14:13:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 851E8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QL/8Qzyc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1C788B8112C;
	Mon,  9 Oct 2023 12:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E38C433C9;
	Mon,  9 Oct 2023 12:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853619;
	bh=ke6sTlUKSmVQ0a5qedfoFbaCYIiQvcyteCIyXEEIudM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QL/8Qzyc89GE4xV5JFy/S7VnuIJEioucHbEZclSHKfTSpRvphdMqVklZcrpLi/Rq6
	 h1GryvHE8hSNNm85kGO8ZNGAYW7phe3nczFMmsERFxzXP7TZLnoH845U9MBbr4uuQY
	 jqa4rrC+CdPLBEFoSlcTETBPpvDiWVf8PkooTaw6IpP2h71X/LZM8gUt1ZKcNFH/q8
	 4mNzAQiI7lHjZ1YeU9LYx6YL84kAUGH5n8BVQmHwZPf+tEsUzuvmNQWMno3oovxjlf
	 ipGSr+IPQ2uVvKnA8D42yPFe/QUZlSCrUi3L60UqRqOMf1/XTd2UCpwWxyYFqsORe4
	 7Z4dgRx8xUuAw==
Date: Mon, 9 Oct 2023 13:13:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: cirrus,cs42l43: Update values for
 bias sense
Message-ID: <fbf2fe38-eab9-4324-ad46-1bf0322841d8@sirena.org.uk>
References: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oNQzh54kikk3NsAM"
Content-Disposition: inline
In-Reply-To: <20231005135559.3117994-1-ckeepax@opensource.cirrus.com>
X-Cookie: Avec!
Message-ID-Hash: 7PYFONSMLLZYJ3Y2DFF2RODRHYRFJVOD
X-Message-ID-Hash: 7PYFONSMLLZYJ3Y2DFF2RODRHYRFJVOD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7PYFONSMLLZYJ3Y2DFF2RODRHYRFJVOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


--oNQzh54kikk3NsAM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 05, 2023 at 02:55:58PM +0100, Charles Keepax wrote:
> Due to an error in the datasheet the bias sense values currently don't
> match the hardware. Whilst this is a change to the binding no devices
> have yet shipped so updating the binding will not cause any issues.

This doesn't apply as a fix, please check and resend.

--oNQzh54kikk3NsAM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUj7m0ACgkQJNaLcl1U
h9CE7Qf8DPVPK+xTM+MBobASpj3R6gTPMl7qWGCu6ccjQzD7Q0q4MXJSoJqnBySU
bKG2S0WViByP733P3BAxRILV6d9J09POOQMQwiXXuaqfmSNR7zz72Ua9AubTzSky
ivoRaYlgnRzroFBo4zr/cQS4omsKY9Un8Zpph/3E7x2bsBZiH8rN2ssLGeVqo262
jppb0hnSZl3wbtZIyx61R5Cscl6o8s1kpBC+yfNf9DPBs7j0D4NtK9ML+wP74UwB
yGhzm19sHgX9F/9GMtCJm4uUat1CtNsNFUaOgjWXADRrmrSGyVwqSaI5/itjdMXe
pkSwlXWF39WvIWdIKJzA7KG4V1G0OA==
=ay8w
-----END PGP SIGNATURE-----

--oNQzh54kikk3NsAM--
