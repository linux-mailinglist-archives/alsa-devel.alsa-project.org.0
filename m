Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6943110E4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 03:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A8781710;
	Thu,  2 May 2019 03:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A8781710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556760742;
	bh=aPRmLhEUCl8iv16jvawoZHiecRV/Sp0TWgkNYuUiS4o=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ebY2CEdhSmH3MFJTl11xxGMh9eqot9a9bX5bD5V451tdQxpdc+BxsoMWo9J45Q38L
	 AiIrmGElyodOqIakB/X5+BBURO3W9G+bUCil2zLa4fqKlAKPn0bAVluGNKEPONvNmb
	 V0jWcRLDsEzCILBAN13DBmIR0MYsdL+H+bIrQdtc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 914C5F896B7;
	Thu,  2 May 2019 03:30:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E91AF896B7; Thu,  2 May 2019 03:30:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB1C1F8065C
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 03:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB1C1F8065C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="n7KTPS7H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BtxNJuTi7c3Tm7Seqwv07Ixzy3v5k8zXO4yysFcyrAY=; b=n7KTPS7Hip3Do1cImIfuzKRoF
 gp6miykBujjShJmfKLlbPRC6vUFMYma5H2cjMLsrAZ+X+Mei+o6wobozcDXhNwAXHSR3St4H9ozjU
 +riBDVgyCwoNO5BQewK98McYRpfI0xXa7favAXRhawPvaB2Oz2DHyrJwQRfackEy7K2ZI=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM0YN-0005QG-Gf; Thu, 02 May 2019 01:30:27 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 7C2EB441D3B; Thu,  2 May 2019 02:30:22 +0100 (BST)
Date: Thu, 2 May 2019 10:30:22 +0900
From: Mark Brown <broonie@kernel.org>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Message-ID: <20190502013022.GN14916@sirena.org.uk>
References: <20190426125925.04F3F3FB4A@swsrvapps-01.diasemi.com>
 <20190427171955.GH14916@sirena.org.uk>
 <AM5PR1001MB0994EA351AEF82224D9AA6BF80390@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <AM5PR1001MB0994EA351AEF82224D9AA6BF80390@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Support Opensource <Support.Opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Akshu Agrawal <Akshu.Agrawal@amd.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: da7219: Use clk_round_rate to handle
 enabled bclk/wclk case
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
Content-Type: multipart/mixed; boundary="===============6631036806643010506=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6631036806643010506==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TN8pJM9vJMHHFgJc"
Content-Disposition: inline


--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 29, 2019 at 09:16:08AM +0000, Adam Thomson wrote:
> On 27 April 2019 18:20, Mark Brown wrote:

> > Don't we need to validate that the rounded rate is actually viable for
> > the parameters we're trying to set here?  If there's missing constraints
> > causing something to try to do something unsupportable then we should
> > return an error rather than silently accept.

> Thanks for directing my gaze to this again. Actually I don't think the SR should
> be rounded at all. If it doesn't match exactly it should fail so I'll remove the
> rounding here. Not sure what my brain was doing there.

Yeah, rounding is dubious with sample rate.  Many applications will be
able to tolerate *some* variation as there's tolerances in the crystals
if nothing else but intentionally allowing it is a bit different.

--TN8pJM9vJMHHFgJc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKSCsACgkQJNaLcl1U
h9DXvAf+P9971wrO2YV773UVMXkelPV+MmTYvPVA/VL4bLD1Mg7EU4Q42Xm2TrC+
p6me4v618rDTK6qjyHbVW2naAgUgMEMYWmY53WO50rDBM6CcmLdpp0U0jqZTd2La
/fVKdYNXJf3ZUpoe6OqJ05GpD/Ah3yq4iEdCTHCkiEjsRuSO3PbZxZvlU6QqOXeJ
doBoeBlBU0XT/bjO/W9tzUUVQFtBQWHG19mzuSosxosl4AVMjBzajSITE9QsjGQE
0xRfb1ClDpLFyypsOBhM7cuTuPCcnJvWHbJeKy8lrr8TpZ+LE0AxRLUX/d5oLdqN
0Z+RhTSeFWZpThbExo/oc9/sqBSDaA==
=XOH+
-----END PGP SIGNATURE-----

--TN8pJM9vJMHHFgJc--

--===============6631036806643010506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6631036806643010506==--
