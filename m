Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F8D6FEFD
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jul 2019 13:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51D241769;
	Mon, 22 Jul 2019 13:51:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51D241769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563796319;
	bh=EoUUzwA2ebHbziPF7JPkYgyH3UcjjPrQ8IzX+hDKEoQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MiIeGZ9JhJkTXQgFWSJicn94oWMWBLDvrQK8KiAmF2rDQQp91uAll/ut8K0qaB6Sd
	 AIgHVlpb3ZFHoXAbYvzuapvEmXjHdw6XzrhS5q4tztdiODLIw2yz4+mYc8+dCho5Pr
	 LN+ZcakebfUZJzQbSSImWXZ6sKA3G5MEF3NDFnuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FE54F803D5;
	Mon, 22 Jul 2019 13:51:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D564F803D6; Mon, 22 Jul 2019 13:50:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09206F8015B
 for <alsa-devel@alsa-project.org>; Mon, 22 Jul 2019 13:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09206F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="MHZOIZkt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ZdiZTCGr8fZ2jH8vzv0nb0f0yBedfXJ/vOo35NAB3U=; b=MHZOIZkt2HkAEM3nkthnzQkm4
 1jTA0dhuMPzgkV5TM4lCJX+i3FSuAcRFMmv8VbU8w32x1K/bLedixncvBCvmKknWCWefp1yzTfX9V
 EZ+eLQutAjyRg9xd8pb8spPj0xM+fjuSbIyxL16YVzJgq7AtSLRIIn3voSgJV7pLC8JiE=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hpWq6-0007W2-8W; Mon, 22 Jul 2019 11:50:46 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B32C22742E2E; Mon, 22 Jul 2019 12:50:45 +0100 (BST)
Date: Mon, 22 Jul 2019 12:50:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuming =?utf-8?B?W+iMg+abuOmKmF0=?= <shumingf@realtek.com>
Message-ID: <20190722115045.GB4756@sirena.org.uk>
References: <20190719063302.18858-1-shumingf@realtek.com>
 <20190719164623.GA14800@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBE03D@RTITMBSVM07.realtek.com.tw>
 <20190722105821.GA4756@sirena.org.uk>
 <10317AB43303BA4884D7AF9C2EBCFF4002BBEA77@RTITMBSVM07.realtek.com.tw>
MIME-Version: 1.0
In-Reply-To: <10317AB43303BA4884D7AF9C2EBCFF4002BBEA77@RTITMBSVM07.realtek.com.tw>
X-Cookie: No skis take rocks like rental skis!
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "lars@metafoo.de" <lars@metafoo.de>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 Derek =?utf-8?B?W+aWueW+t+e+qV0=?= <derek.fang@realtek.com>,
 "Flove\(HsinFu\)" <flove@realtek.com>
Subject: Re: [alsa-devel] [PATCH 3/3] ASoC: rt1308: Convert headers to SPDX
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
Content-Type: multipart/mixed; boundary="===============6523262534413179409=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6523262534413179409==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline


--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2019 at 11:48:52AM +0000, Shuming [=E8=8C=83=E6=9B=B8=E9=8A=
=98] wrote:


> May I confirm what your point?
> I convert the entire comment block to a C++ one like below.
> // SPDX-License-Identifier: GPL-2.0
> -/*
> - * rt1308.c  --  RT1308 ALSA SoC amplifier component driver
> - *
> - * Copyright 2019 Realtek Semiconductor Corp.
> - * Author: Derek Fang <derek.fang@realtek.com>
> - *
> - */
> +//
> +// rt1308.c  --  RT1308 ALSA SoC amplifier component driver
> +//
> +// Copyright 2019 Realtek Semiconductor Corp.
> +// Author: Derek Fang <derek.fang@realtek.com>
> +//

Yes.

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl01oxQACgkQJNaLcl1U
h9A51Qf/fCYAmZXAiZVve59JlERuzempdzlMSIUzje2qcdBxBN9MuGl5uxOe0V8q
YzERB05P1uJP8WDr3VF8NF4rJpUGEPcsqYP0hAxvd+ma0dnN9DwmAEAGecW+QQ8f
qIJU68aJF3b1yBHaM7o3tRaLI5vRKvidiRMFfSrAUN+MjK+U6lMSqRx98+uMvUu6
Ym+fzLtT92z8lmHvQVr+Toj7IVJr8r/JSlBEnpEQv6Y5iHwPICRL54CWNC1NEbxI
qQYi0G/Vi6ySHzhteUnd7WMeuIuGmbRRzv2tKZG+hvqFGg8iAnmbSToJIshMCuny
Z0mxdx8O9peQnNMFP+I1LSGGqY05Kg==
=V2Xx
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--

--===============6523262534413179409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6523262534413179409==--
