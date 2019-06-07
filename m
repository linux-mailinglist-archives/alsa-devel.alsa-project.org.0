Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90346388BD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 13:14:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03888950;
	Fri,  7 Jun 2019 13:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03888950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559906078;
	bh=0Kf2ry9knjkZ/hCHEGFuse+PUqAWP9ampuRqm4YkOew=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YXzqUWs9FWbqUBa52GDbwsxFwj/csUhhFdO6xAhW4UmkV0oCuCr6gxmmY857MIOMa
	 TNYpFwv2r7mO1z935ht52/CkHVWRIFswkxdp+2cmJ/zWfvxYPXqzzJXCSuRWyJyGj5
	 7G4q8BIACtjr0t/Wv/kSWUNyK8FpiSyPVtMquq5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72C29F80709;
	Fri,  7 Jun 2019 13:12:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 316FBF896DD; Fri,  7 Jun 2019 13:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A482EF80709
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 13:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A482EF80709
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="AWxRGyzY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AspmKVjY7mJ8HlX6+G0jU6RWDgqTyzyWO77BW5lTioo=; b=AWxRGyzYu+UByYRVNF7xUoTci
 K9YJ7T+ee4KHFo/QooSYiSQYK+GMd9yWh6ldoSQK+1uBDAtTov4FoBIII1Z6AwYjhDhX7/7bJV4uK
 +OI9NFxvCnZIOTyDT+ITbW5MQ2wOj5DEQV7XTUtGeasr5KyirCok5/hC6m8n9KyfKSJFM=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hZCnd-0001iM-BW; Fri, 07 Jun 2019 11:12:45 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
 id 4F0CA440046; Fri,  7 Jun 2019 12:12:44 +0100 (BST)
Date: Fri, 7 Jun 2019 12:12:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Message-ID: <20190607111244.GE2456@sirena.org.uk>
References: <20190606230105.4385-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190606230105.4385-1-nicoleotsuka@gmail.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com, tiwai@suse.com,
 lgirdwood@gmail.com, festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [RFC/RFT PATCH] Revert "ASoC: fsl_esai: ETDR and
 TX0~5 registers are non volatile"
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
Content-Type: multipart/mixed; boundary="===============5212468185962620602=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============5212468185962620602==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cnnC1+vf4lqgEF19"
Content-Disposition: inline


--cnnC1+vf4lqgEF19
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 06, 2019 at 04:01:05PM -0700, Nicolin Chen wrote:
> This reverts commit 8973112aa41b8ad956a5b47f2fe17bc2a5cf2645.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

> 1) Though ETDR and TX0~5 are not volatile but write-only registers,
>    they should not be cached either. According to the definition of
>    "volatile_reg", one should be put in the volatile list if it can
>    not be cached.

There's no problem with caching write only registers, having a cache
allows one to do read/modify/write cycles on them and can help with
debugging.  The original reason we had cache code in ASoC was for write
only devices.

--cnnC1+vf4lqgEF19
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz6RqkACgkQJNaLcl1U
h9Co7Qf7Bkg3ndyaPGB0nY7y53/txpehf1drjHOKGiWoZ0+zJMVKS1VxMRflVs5s
/jl1lph0ebC8gfz/UipI3j7ZrLPd1tRsasfmuIpa4aDTAd5h3ekJe2uMHyxDiATf
+riYjRV5ZiBQ5EFVZQN2j9VMvtJGfaLsDD6Wkc4laIvAevPThDKrs5YLyiH/ncrn
q1RktO/C3gfdAuUd0x0oGbHOlpXuMw8AaT0I6NNonOM5GlLqDq0jUw9Or/WdOepk
UMskpFmlTMYNm9AcJGvZ2JemvZ+fYCZUs+1nU2h6+MgEBIs1DqvdYagwnFXb4K1J
ZkaAUBJ2IdDf+r2aYfr+BVFEUIjuPA==
=AgxG
-----END PGP SIGNATURE-----

--cnnC1+vf4lqgEF19--

--===============5212468185962620602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============5212468185962620602==--
