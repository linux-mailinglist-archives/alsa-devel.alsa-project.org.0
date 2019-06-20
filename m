Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D184D25E
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2019 17:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 647241654;
	Thu, 20 Jun 2019 17:42:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 647241654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561045424;
	bh=KmcDCSlShvNj1QPmY61S5qS9rl9b32ERdvjVpqWdsUg=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CkB7+Jrrlk7Ywu4qbbk3g4OgJZsPsgrRO2GcQ6m6GL7Jiofj8KT20rgUDYmxe78h3
	 204dECdcCaZxO90OdsmdVPrGri7molyuDhoDiyrgNCbyLodxjGiGHOEV2DlNgv6poe
	 yqU7ZX9+vekwlylh1TyjKSZEpfmrxydEyHE2qvP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 772DCF896F4;
	Thu, 20 Jun 2019 17:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5FBBF89717; Thu, 20 Jun 2019 17:41:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F36EF80C15
 for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2019 17:41:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F36EF80C15
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jov01KPU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6s6aZu8b9dqDAqPoq81Bk78Hj/YlZ9Zu2gddBiQR0jA=; b=jov01KPU7Ey0HCtDvL/bMfUvM
 q+kHss2+okCgunU54lbz7AUEXxS2cz7t6hVp3TCiDXLIBSddCYMcK66KsNAYrByHqXzLdYmj5E8ms
 s98+kDkEwIFNMnhf/WgI7uAcAm8nRSMA5EA0gm8aA9dNtYxJ/3JhRSD6SoNS961M86AwU=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45]
 (helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hdzCB-0000qH-N9; Thu, 20 Jun 2019 15:41:51 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id AF546440046; Thu, 20 Jun 2019 16:41:50 +0100 (BST)
Date: Thu, 20 Jun 2019 16:41:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <20190620154150.GE5316@sirena.org.uk>
References: <20190620134708.28311-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20190620134708.28311-1-enric.balletbo@collabora.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 Xing Zheng <zhengxing@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Collabora Kernel ML <kernel@collabora.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH] ASoC: rk3399_gru_sound: Support 32,
 44.1 and 88.2 kHz sample rates
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
Content-Type: multipart/mixed; boundary="===============6577941388436981295=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6577941388436981295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rOnZ5ITIX7GHaQD9"
Content-Disposition: inline


--rOnZ5ITIX7GHaQD9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2019 at 03:47:08PM +0200, Enric Balletbo i Serra wrote:
> According to the datasheet the max98357a also supports 32, 44.1 and
> 88.2 kHz sample rate. This support was also introduced recently by
> commit fdf34366d324 ("ASoC: max98357a: add missing supported rates").
> This patch adds support for these rates also for the machine driver so
> we get rid of the errors like the below and we are able to play files
> using these sample rates.

Does the machine actually need to validate this at all?  The component
drivers can all apply whatever constraints are needed and do their own
validation, the machine driver is just getting in the way here.

--rOnZ5ITIX7GHaQD9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0LqT0ACgkQJNaLcl1U
h9Aomwf+IWYRVucBBZvhsm/gdBVe/B8CpBjmp/2qlcOTbdBRiwV3TGlwjFiWqyNF
a/7criDs2zMUCDb4Ad2Xh7FoRj24dC+1QikkP64iwyN/Y5wJLwQhRRDuM60vjRGp
waQP/rQ86h14cWtTi/+IE8Rm3nFcs/0J0S+87SVuW8kIifVcEAzUGYH8fhTwgkki
SerVWbkR+weSZLJVq/cvR2CKQvt4qPaQ2AT2V7W9pCRzBJRza8CLIg+t7jaFUuLP
EefouE+9/aOgtVf4NT+BPfcy7pptkMZwAsbX0Obcm6+1dmIpjffWRdRzki4AVnJD
wUUi0N6O0HWIkSLhMnqzgBaOrZBMjg==
=cr78
-----END PGP SIGNATURE-----

--rOnZ5ITIX7GHaQD9--

--===============6577941388436981295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6577941388436981295==--
