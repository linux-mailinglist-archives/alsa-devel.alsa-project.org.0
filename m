Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDBC5B20A8
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 16:36:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D741719;
	Thu,  8 Sep 2022 16:35:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D741719
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662647788;
	bh=PqNEivvRBkbJb/bbw9l3rUVufBVDSk0Ladwi3ZMei4c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q6xImDT2li3ykYEATVLvnuA50LREVDS0A33J1kTZbXe3YRy8XfHVRQ93Gu+ysdC0J
	 gkpYmc5sJ4Z46UiocnGcNXeXalJXaPy1GroZNHJNADd6Tw2baVeK43yPOY9BkuYDnE
	 H3noz3cIrnYLStOxopGCKJndRLqa0zAw+sDXcf1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EF95F800CB;
	Thu,  8 Sep 2022 16:35:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F191F80217; Thu,  8 Sep 2022 16:35:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0ACFAF8011C
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 16:35:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0ACFAF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DvPM9/MN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFB7661D25;
 Thu,  8 Sep 2022 14:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6C0C433D6;
 Thu,  8 Sep 2022 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662647720;
 bh=PqNEivvRBkbJb/bbw9l3rUVufBVDSk0Ladwi3ZMei4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DvPM9/MNiL2AWkrZCDCQVlyvRmAPn1sJ4jgnmoRTJlPISCsQEe9eeLoIZGUSbxYEW
 OQRLRbrrEFn6jS/IIvO4GE02egOz6aFNlk+QyYm+QkWAP7ETaVKx65Y9ahuutZ5yj6
 s+k+djMhH6IbfT6n3C0sfrpgah04rNWTh0pmxzoXeGwy55xu2cQ6ZCHsTfEU/ij5pN
 kzpaTmeUjvJ29PFAncIm0P4H9UMRabQZR6POxAK1hsQWOozBSg7c7QPUAjv0lEfiV0
 wj5a/oI/IIX1Qehx3JE+TbSPKXDhS20frkeySg1/YHZXUcM33TGeOw1sKZzkmf+igW
 iRmd+OyjXQhlA==
Date: Thu, 8 Sep 2022 15:35:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: sound: ts3a227e: add control of debounce
 times
Message-ID: <Yxn9o1MVMPnFO3PM@sirena.org.uk>
References: <20220907135827.16209-1-astrid.rost@axis.com>
 <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EM1t5E+8UNLJ5GtZ"
Content-Disposition: inline
In-Reply-To: <2b81d814-f47a-e548-83dc-b1e38857e8ce@linaro.org>
X-Cookie: Metermaids eat their young.
Cc: devicetree@vger.kernel.org,
 alsa-devel-mejlinglistan <alsa-devel@alsa-project.org>,
 Astrid Rost <astrid.rost@axis.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 kernel@axis.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
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


--EM1t5E+8UNLJ5GtZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 08, 2022 at 02:20:42PM +0200, Krzysztof Kozlowski wrote:

> Anyway new properties cannot be accepted. This has to be converted to DT
> schema (YAML).

Doing a whole binding conversion feels like a bit of a steep requirement
when people are just adding a simple property, it's a lot of stop energy
to figure out the tooling, do the conversion and deal with all the
bikeshedding that the tools don't catch.  It's definitely nice if people
want to look at that, for more complex binding changes it gets more
reasonable but for trivial properties it's disproportionate.

--EM1t5E+8UNLJ5GtZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMZ/aIACgkQJNaLcl1U
h9DbfAf/SjeLoEAMFhlUsKxoxGL1+jQv4Ma3wez0+Bs/BrWB8l3ltKTI8q2/mf79
OtmVsUbz7odAzUgR5Kim/NroXNhPrNSF54TPxCnnDNfYjpQ5lhpuZynnzC7t6MBB
kUWFp2bUcqTNkJdAm8LMQQ/V9E4Hhs4R3FnJj/rp5t4DhfKPRRQ655Euf2RuQLVo
c0zRwdfrEctvDWlXMDpSMmvnAOA6W+X7LHZNLq6mGpaplYC762+ZQ1oZanV+DpTc
FEWB53nfh0lrj+Khe2umbtQiADFitdIOQLZa60fkw9YQAM9zSYr9I4BekdeDVBBQ
czc028DwfmOyoAEm9lCr7Cr9NwZX1g==
=XuqR
-----END PGP SIGNATURE-----

--EM1t5E+8UNLJ5GtZ--
