Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F27511863
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 15:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE94C1779;
	Wed, 27 Apr 2022 15:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE94C1779
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651066396;
	bh=I5h11ZY5rAxUepEeab61DNcBIAuJoRQxr65xcsAdBrM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFe4VYbXNkw/o+sHgguAyblFAfLQYWaucwL9PSslNeH/oykd9IT2aI3ClEdcuCoNI
	 NVv+B9tpT0Cmh7/WgGQT0moGRyVubx2Se14iVxxanVWtEHqUBnaOOrzWQK+G+OLsG+
	 IbZdjWmj5saRBCO80WkyhShWwBgg7IfCM46sw10s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B3ABF80253;
	Wed, 27 Apr 2022 15:32:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4EA2EF8016E; Wed, 27 Apr 2022 15:32:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F588F80152
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 15:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F588F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mf3KW6RA"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B79861CBC;
 Wed, 27 Apr 2022 13:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFDBC385A9;
 Wed, 27 Apr 2022 13:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651066330;
 bh=I5h11ZY5rAxUepEeab61DNcBIAuJoRQxr65xcsAdBrM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mf3KW6RAaO2Bq5zf/L4DOinx+Ih1+vD2zwOFGQQXUap8i7OqmYMi4VqNskSea4GfF
 b6X4b2+FZaOGYgaour10XOx9H9U8PvfOz6/zeo+mr2tAQzpxBHVekw0RyfpGXSmoTO
 QvYzmkUhoIECiGAJF3Qyz7EiJI3kKxaI2ZtQU2eXPwSyxzf4+q0nXrUwtat0pWS5Ot
 xLvxD48fTpehEUE2IxQaY5HkPdf+QTEa6LQ5CS7QhDfHgVWEQfq6R0uWt4+uFzK7Y1
 3NAeyiVMj9Ay6AGWlEcaadntzs4SeRvHyx3tscGVMxVqmuMVY8DzemFS0mSfzuJXMu
 Bgei3/XZZmAAA==
Date: Wed, 27 Apr 2022 14:32:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 04/11] dt-bindings: sound: add Arm PL041 AACI DT schema
Message-ID: <YmlF1JlIvY0lTaAD@sirena.org.uk>
References: <20220427112528.4097815-1-andre.przywara@arm.com>
 <20220427112528.4097815-5-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="M3OLMHWl/HYgh+xd"
Content-Disposition: inline
In-Reply-To: <20220427112528.4097815-5-andre.przywara@arm.com>
X-Cookie: Buckle up!
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liviu Dudau <liviu.dudau@arm.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--M3OLMHWl/HYgh+xd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 27, 2022 at 12:25:21PM +0100, Andre Przywara wrote:

> The Arm PrimeCell Advanced Audio CODEC Interface (AACI aka PL041) is
> a peripheral that provides communication with an audio CODEC.

This is a standalone sound device, you should submit this to the main
ALSA maintainers.

--M3OLMHWl/HYgh+xd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJpRdMACgkQJNaLcl1U
h9CVLAgAgUqI/6vFBmo5SKhxqKgP+iNvOwwFVOm8UTkxHbaVgyFm3CdYSjWOnBfu
UYyK2K7eS97T0R2kGnH0dLxQpPXFQJYoiaOsv62H7QwMNYRJT2Fk+IqvW90Jornh
/d9hiES5/OwlKxibSDxinXpt3ZotGbENbs90icqW4onlqObtogZ+JRFccEmYwg9Z
E4QKF5N23Tp7l7i6pHoATGa0b/4O894zEccd0VZ3518/lrfqEQuopRFSMLdCayZ9
lhX0m1Zhyb84twaktau69BLDnsdUQLMeltYGOTZfZ2jbauauPi5Ypc74lS+ZAUix
Lpnc07QzXcMSk2dsnz3+2td4KlqGqw==
=+Sws
-----END PGP SIGNATURE-----

--M3OLMHWl/HYgh+xd--
