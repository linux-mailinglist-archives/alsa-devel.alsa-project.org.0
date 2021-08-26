Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5DB3F8DFB
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 20:41:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD18B16C9;
	Thu, 26 Aug 2021 20:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD18B16C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630003277;
	bh=DqBauNYZguy26YC5MxjDf0SISmgxD/sdSKlavWitRc4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iEOwHUdmokLj15emnoiT5V9ZIr4GjB2ZY8jJwnIKAWe2JGL3G3cOodO3qSPwR6GDj
	 3l6SEIa/TZbVhnPuFmBINpuYt/eDfkWsRqcerGzJJfOGlhTsCMZ1ThjiZTtOlve2gz
	 UKY/VFdkuB9wzJyQ9qwf9+qzdJgGlgGaXJ0ysDlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2752F804D9;
	Thu, 26 Aug 2021 20:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6317F804D6; Thu, 26 Aug 2021 20:39:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64575F80424
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 20:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64575F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="WtZVI4ez"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DqBauNYZguy26YC5MxjDf0SISmgxD/sdSKlavWitRc4=; b=WtZVI4ez8vSSahSqKdG+DaiPN3
 4ORAroBimZJZQ6sh2vFaN5c95MolkLoZ59ZjGFLi5Iqkl79WPrps7LZ8sV5J2tEkZJFG1Q1IGvoKp
 5vSTGvVlhkRhbFL8g6HG6GKEbvzn5Tk3jqfc+u7hp8vm6l1glbS06HjQFJN26VZS6ca0=;
Received: from 188.30.109.46.threembb.co.uk ([188.30.109.46]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJKHs-00FYPH-M2; Thu, 26 Aug 2021 18:39:40 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 44CD4D14302; Thu, 26 Aug 2021 19:39:38 +0100 (BST)
Date: Thu, 26 Aug 2021 19:39:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
Subject: Re: [PATCH] [v3] ASoC: Intel: sof_rt5682: Add support for max98390
 speaker amp
Message-ID: <YSff6gkGN/Rk9CzU@sirena.org.uk>
References: <20210826103032.22262-1-mark_hsieh@wistron.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="BMVgk7TXFPHhMYjb"
Content-Disposition: inline
In-Reply-To: <20210826103032.22262-1-mark_hsieh@wistron.corp-partner.google.com>
X-Cookie: Where does it go when you flush?
Cc: lance.hou@intel.com, alsa-devel@alsa-project.org, mark_hsieh@wistron.com,
 kai.vehmanen@linux.intel.com, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, brent.lu@intel.com, bard.liao@intel.com
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


--BMVgk7TXFPHhMYjb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 06:30:32PM +0800, Mark Hsieh wrote:
> Configure adl_max98390_rt5682 to support the rt5682 headset codec
> and max98390 speaker.

This doesn't apply against current code, please check and resend.

--BMVgk7TXFPHhMYjb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEn3+kACgkQJNaLcl1U
h9BLBgf+OvWq0XpMKC11U1vR44hq1uC4BXJlWk5/1fdNBmO522bnvEn+YLni/tZa
U+NoTKO7DUDxMEh4mAx99IGkkBQCiFyw1n1kfu/KdQMNxXtKJAM+UX7u/gFTH4fM
8GYJSoZgmq7rZ6kLxnGic0Wgu5fsaJ3jXZxGKnzzWD2caqa/WAw8rCQkr3oEWGs7
qrFfgxdth/mAGLa9KhNbw+Tz/qLtn3hBYLenkhyS65Pm0wpOpW1ypAioxFC+g/Vn
8kZHPIZUABOKDMTMQmnJfms3wDdDiixgCaS3iexaJmaLY0Xdjq2o1VXhphDL9MnN
T8IgldjErh2Rd/yxTL2ZQhF1YB7Acw==
=pRs0
-----END PGP SIGNATURE-----

--BMVgk7TXFPHhMYjb--
