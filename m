Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BF8F1A0
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:10:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 443D41657;
	Thu, 15 Aug 2019 19:09:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 443D41657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889046;
	bh=YfixJNJTSggSflr6kMJYV5yc9JMRUMOUUuBq64Zc2xQ=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pygDsPING2V0L8s+USOCKX01AcWsltcp4l9Ch2fu54OIch/I605W174FWl3FIxMLs
	 Le7LB0X6C+NIsdW2zlOGR07AK9jGgbz/87aKwtpjB1sVpF5e+ZTtHFuGoDAHpftRTg
	 zaWhdrl0N/ZU4N081oF+pJUMTkAfM4c3bZ7B5U6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43862F8044C;
	Thu, 15 Aug 2019 19:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ADA8F80274; Thu, 15 Aug 2019 19:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-f100.google.com (mail-wr1-f100.google.com
 [209.85.221.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC316F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:08:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC316F8015B
Received: by mail-wr1-f100.google.com with SMTP id b16so2833641wrq.9
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DrcRioJUwN6LN13KrUQ3DLth8mOBrKuR9TZzIMksXfM=;
 b=hOc6JWT9TwB5Q/z62LW+V+at1N0l26bLx9hnqlU9a99iSCF7FpHdug4oQn+JOsaHZz
 VElNX2QXA8y8vfYFiTwnuvdK9K8/nx844egaBrXeWAkxIQbUAjE5Ynffva/yRF6OfzNe
 AOE4qjsKlVrLud+bevEOcbHf9KXGdRKWF7/sPvJJxxwdGSHqBGBplzKIekX28PeEbMfa
 dv3appnFaf2BFVb/67kZLrFtGzD/EZmTsSZm9yMgepy5M4MjjLQJl4gTWLtu5bfPpAOu
 vCIIX4aELXfhdj4XtUYJ58/YW6x1r4uiewqVrKOfQ8zzMQ1kM3jW3jUDj44in6GdZgm3
 ueKg==
X-Gm-Message-State: APjAAAV37NtwYV2Q8XTpLSsmdXtgxytb97ARhoDwFIHbahtixx1fHJyu
 oqh8uAAZaHSif5xVaqgDjloacykursE0KKzvL1vf8ve/eo5777sB4odeQIeJKSeWLw==
X-Google-Smtp-Source: APXvYqzf1KR/8qqi+k5EdqbbP9hg7FNL8egJNPEsglEEqwuwgvYvM0gJRWgIXVdvMU0AhcHNd61vFlLdzWaK
X-Received: by 2002:adf:fe85:: with SMTP id l5mr6205566wrr.5.1565888935777;
 Thu, 15 Aug 2019 10:08:55 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id h7sm56290wrv.45.2019.08.15.10.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:08:55 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJF9-0004zj-7t; Thu, 15 Aug 2019 17:08:55 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id CDF692742B9E; Thu, 15 Aug 2019 18:08:53 +0100 (BST)
Date: Thu, 15 Aug 2019 18:08:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190815170853.GC4841@sirena.co.uk>
References: <20190815155032.29181-1-pierre-louis.bossart@linux.intel.com>
 <20190815155032.29181-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20190815155032.29181-2-pierre-louis.bossart@linux.intel.com>
X-Cookie: MIT:
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org,
 Bard liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/4] ASoC: SOF: rename SOUNDWIRE to ALH
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
Content-Type: multipart/mixed; boundary="===============0355219525309326055=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============0355219525309326055==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8NvZYKFJsRX2Djef"
Content-Disposition: inline


--8NvZYKFJsRX2Djef
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 15, 2019 at 10:50:29AM -0500, Pierre-Louis Bossart wrote:
> From: Bard liao <yung-chuan.liao@linux.intel.com>
>
> Rename SOUNDWIRE to ALH.

What's this patch based on, it doesn't seem to be something upstream?

Description: [1/4] ASoC: SOF: rename SOUNDWIRE to ALH
Applying: ASoC: SOF: rename SOUNDWIRE to ALH
error: sha1 information is lacking or useless (include/sound/sof/dai.h).
error: could not build fake ancestor
Patch failed at 0001 ASoC: SOF: rename SOUNDWIRE to ALH

--8NvZYKFJsRX2Djef
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1VkaQACgkQJNaLcl1U
h9DCVgf+NRUcYcZywwXLS+/YMSupeE/kUfB0wbha/4pQl7AN2DWniGOyHrRJGSOf
Vu2ioEB0MP2L7p6emFqCryOjFBJHBafVGqhib01E7cO3NDz51al2kNSKQ7i3bN2A
EMhzN1Y7h47fqj6ulgVcVccozAM+IFqL7swkWqST1147KVFv6hBi/n1DI9IzyfXc
jZbkkXGKezSCQ9Ppx3CI7ZT3WgMQF2sThiO5WDztrtfogVvfZWCzDBb3yqS6qvsj
8QWPjXWs04Ocify9F5j/Ecbn4hu0LvSYxad8gnnrAEGgArXg94X/gd2V45X1mlrx
AAH4xUnTtWvnmetH2+1F9v++Wkcoww==
=Wh7r
-----END PGP SIGNATURE-----

--8NvZYKFJsRX2Djef--

--===============0355219525309326055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============0355219525309326055==--
