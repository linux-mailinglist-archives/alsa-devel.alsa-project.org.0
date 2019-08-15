Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC40F8F1AB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:12:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 691511615;
	Thu, 15 Aug 2019 19:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 691511615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889163;
	bh=iIHff4nVQ41z15TR6mTlTUm/5y8OkS2bB+rDBL9r59Y=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f45vSY1tZvHgAVBmH4xeXcrPR0KG8EKfqmaGSRbJojg4YqzzqIj2zT7jR4/uqBOwc
	 lqJctyer7Yn5Nf8y/mU1cmxEMVktGr7QWiVf512+X/gYtmNs/p3G28lLWlg4sjc7qF
	 Y5WxqTqCpmz+u6pabHSfjpvF2dqt0dpgChl29Dug=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 155ABF8015B;
	Thu, 15 Aug 2019 19:11:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11959F8015B; Thu, 15 Aug 2019 19:10:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wm1-f99.google.com (mail-wm1-f99.google.com
 [209.85.128.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F248F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F248F8015B
Received: by mail-wm1-f99.google.com with SMTP id z23so1859379wmf.2
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:10:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CIKSg9Ab0xAN5DLhJkFCJbIxc2aViiSr6qQE0ZC3ak4=;
 b=QyA83QnWUGwLake31kLfZ2w9MfJOpBN8l4PGjih3PryLz+44e8NAym88wYJrct2B3V
 yi0HnMRVMcFHYwuChr8pffHd9EZp49dPrwM1MF5q69YsbkarpXEgLb14R47o987ctAz3
 crLgnzRgVkwx3OMFIWRjkPjJfex5gwPVB46fVfTYEI51xGPrDy3fMTZg01701rT+prOX
 GQsUAi3Zo5Y4Sqy6OGOVOhVeZ8poDBDXDb5EMvq/kvOQsa1ZAX/C02qOzkzFmOOlddCo
 +WpCCePzu3g57e5GV48Grb+rgbCY4NOHwjqkvDn4bMho16ugKQOUq7B9CaiZAXJZwCcv
 k3ug==
X-Gm-Message-State: APjAAAWd7TOlkCwz47Sbxfh86xtN6R5XiHIDShOHyUegTDzWyx37ya3g
 tuaWb1H6ZYX+1hq7+Jc7IsvvrDwmbq0l5z46JDXgtupXvafhm1KRms2Zyv7oQxS82w==
X-Google-Smtp-Source: APXvYqw0hsmEPSoerB6H2JoK5A06P73ABY8/NG3c0uayLCj+lpcfR2jiG0iV2q3AKgrBdbbBgl4Qxqr516nR
X-Received: by 2002:a05:600c:145:: with SMTP id
 w5mr3655246wmm.75.1565889054574; 
 Thu, 15 Aug 2019 10:10:54 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id 7sm8448wmd.13.2019.08.15.10.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:10:54 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJH4-000504-8K; Thu, 15 Aug 2019 17:10:54 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 9F20D2742B9E; Thu, 15 Aug 2019 18:10:53 +0100 (BST)
Date: Thu, 15 Aug 2019 18:10:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190815171053.GD4841@sirena.co.uk>
References: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
 <20190815155749.29304-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190815155749.29304-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Pan Xiuli <xiuli.pan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: Intel: common: add ACPI matching
 tables for Tiger Lake
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
Content-Type: multipart/mixed; boundary="===============6939487625575443314=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============6939487625575443314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cQXOx3fnlpmgJsTP"
Content-Disposition: inline


--cQXOx3fnlpmgJsTP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2019 at 10:57:46AM -0500, Pierre-Louis Bossart wrote:

> index 000000000000..57a6298d6dca
> --- /dev/null
> +++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
> @@ -0,0 +1,24 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.

Please make the whole header C++ style so things look more intentional.

--cQXOx3fnlpmgJsTP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1VkhwACgkQJNaLcl1U
h9D+lgf/bmvFEadeRHofdgz9IIPVyh7dxAWUifXB34T0APOjfF9a8s7BzSttSq+6
VSV3rucaL7vSDKmliAd9OqV38nUWGLX33HJWuNt2aYa6EQT07qwHIGoqVzJeNbTl
wdeUrl+FtkXcMZTE0Mm6MOsYLgNx2lmcBPFR/wGkqmOGqRXmqqiJMmsKv+XZ4aXO
Lf4a2o7BcZlbZCvjsNce5jdDihXD55muU+SAbcEdvO0C8LSwPbZfnaXwOs9GYTmK
kj/pOamrEITAIsRzxNX0b/9zZFcCGKfEGXF2BxplXMEV1CrEO5fb6Hn9LwYmxdA9
PRybyiv/43gmgv3+2IpWpDAN/PfRNA==
=y2oE
-----END PGP SIGNATURE-----

--cQXOx3fnlpmgJsTP--

--===============6939487625575443314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============6939487625575443314==--
