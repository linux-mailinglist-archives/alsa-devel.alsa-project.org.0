Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 913AF8CF13
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 11:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B2B1165F;
	Wed, 14 Aug 2019 11:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B2B1165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565773848;
	bh=z0Ho+5+e0ggSt4DjmhnZ3un3lohVpawdtUCH7k/L6HI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gN9m93fexhQ+K/Z/K/V2vmlE1MPOC+nUZkS164yC/YvWX4sSAdgHBRsy+zkLZl7o9
	 4VVfjdna7ORTmbZEZLXa/9Tp3P3T5dHQ8AfunCu8bJ/Y988soiCIbbRMb0EPDaaEkk
	 qLb0xcxqi+VqkJr1takCJP/bMwDnmdDlVmyc0lzE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1186F80214;
	Wed, 14 Aug 2019 11:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40CD3F80214; Wed, 14 Aug 2019 11:09:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-wr1-f99.google.com (mail-wr1-f99.google.com
 [209.85.221.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D07C2F801DF
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 11:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D07C2F801DF
Received: by mail-wr1-f99.google.com with SMTP id c3so2094592wrd.7
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 02:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=nm3AZYQqg9bViUcvgRl1pV30pLA1C+5Glu61dF/KaxE=;
 b=bUFY7cHhyh/j7s9TMqC3atMr3zr3BtTflsSPJfhi2tU5SvPQCuLm/Vyknfy8SJNlS/
 AC6bpD9b+tq4MwTrk++ympSZNctNok0wGrRknDLD6u+q8booiLVhuzAcmFYqPKo7pS3P
 HCM0L8Gd8pHW8XQu/pjVQjmMDzL6nVunZe4Rn+P9rCCUCF7FpawciY9xfJPQK6TGzirR
 nbqNj6jlzLlVH72yFjepWPYUojDBS92e1FyQ/Ius+uuFiPwiPoYzd1gWU4a21Exb0DXL
 EczkGop9GeGcfV4ou5KvBY9qJpm3aCrdIHDEpQI3jPcpWQGeGUjdIymDy+pGibtZSZwW
 bihg==
X-Gm-Message-State: APjAAAV6MHhCJ5Q8OwOCWy3OxHUUuMKlRcfEOYP4fJWWsePR4j4nuDxD
 r4X0nNQVPGSCyjUKe9TZH4fTnXIS1fSgj9veKY4EyW3r6vKayLq1QtTWn7DupXhO9w==
X-Google-Smtp-Source: APXvYqx09Vp6TVCKEOGeRGp2vPm76Veya96vzaDAvRDLPlwS7Ifbhnu0U5u4Sf7upuzG27awVEJE32T0GmlR
X-Received: by 2002:adf:e2c1:: with SMTP id d1mr53838825wrj.283.1565773738885; 
 Wed, 14 Aug 2019 02:08:58 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id y196sm36316wmd.41.2019.08.14.02.08.58
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 02:08:58 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxpH8-0004cl-7R; Wed, 14 Aug 2019 09:08:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id D9C112742B4F; Wed, 14 Aug 2019 10:08:56 +0100 (BST)
Date: Wed, 14 Aug 2019 10:08:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Message-ID: <20190814090856.GA4640@sirena.co.uk>
References: <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
 <20190813191827.GI5093@sirena.co.uk>
 <cc360858-571a-6a46-1789-1020bcbe4bca@linux.intel.com>
 <20190813195804.GL5093@sirena.co.uk>
 <20190814041142.GU12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
In-Reply-To: <20190814041142.GU12733@vkoul-mobl.Dlink>
X-Cookie: Bridge ahead.  Pay troll.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, linux-kernel@vger.kernel.org, plai@codeaurora.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, spapothi@codeaurora.org
Subject: Re: [alsa-devel] [PATCH v2 3/5] ASoC: core: add support to
 snd_soc_dai_get_sdw_stream()
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
Content-Type: multipart/mixed; boundary="===============8779564801511886938=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============8779564801511886938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 14, 2019 at 09:41:42AM +0530, Vinod Koul wrote:
> On 13-08-19, 20:58, Mark Brown wrote:

> > There is something to be said for not abusing the TDM slot API if it can
> > make things clearer by using bus-idiomatic mechanisms, but it does mean
> > everything needs to know about each individual bus :/ .

> Here ASoC doesn't need to know about sdw bus. As Srini explained, this
> helps in the case for him to get the stream context and set the stream
> context from the machine driver.

Other drivers interoperating with the Soundwire DAI might want to do
something, it looks like that's the case for SOF.

> Nothing else is expected to be done from this API. We already do a set
> using snd_soc_dai_set_sdw_stream(). Here we add the snd_soc_dai_get_sdw_stream() to query

Well, if the API is not expected to do anything we can optimize it and
just remove it!

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Tz6UACgkQJNaLcl1U
h9B7fgf+PvYlFGtuBj37wZOpu/dVlS5vmQbNkNVdhUbDbjO5oYTemRTIB5PukA4R
tO6idhVUsIlMWCvN6MZKJXPGgZfB7Heu84YAn3GvBmIFmY3J4c3QwsD1pIf1gmGH
X+xV//bbiewRLrA7LvbQalQanUpCVVlCrjsJ8FeDg+PFs4wPO9gE2N7pevVhzknu
tIaB6HO88+eAx0FfUUvXjWKo5qov/1LjhsI8Z2DJuKfpi9zfBatUz+/Q75d2WEJS
0G8ATi/5aZueU+YB1T6xdQtkS/lPIFRYN7dyMZrLyidtwkttiii8UzStBh64F6QO
MSoasP9IToaTUPdzqxcH3bIYBg2R3Q==
=pxWA
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--

--===============8779564801511886938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============8779564801511886938==--
