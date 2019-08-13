Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A68C169
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Aug 2019 21:20:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E05B1667;
	Tue, 13 Aug 2019 21:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E05B1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565724017;
	bh=iKsvC5Zv6weYwbpXL/EpfE/pp4SzZnAyOOwwXIsGkSI=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o1oAYp3h11lPuTTgzazjJT0FLZbmvqcT5/sil3F7pGKbHbmQw9INbPuyixzjl7LwJ
	 kvc+1jUh2cy55NIbMMp8QeF2Jmc+9kTkE8qtniIGTcclFEUiC97SLaxNJlmWyy0kzk
	 d3bdtiMkRNiW3TZIHYnCgLjIDkYZW7lPQxeiJ/EE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2E79F8026A;
	Tue, 13 Aug 2019 21:18:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13AEFF80273; Tue, 13 Aug 2019 21:18:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-ed1-f99.google.com (mail-ed1-f99.google.com
 [209.85.208.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6744F80120
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 21:18:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6744F80120
Received: by mail-ed1-f99.google.com with SMTP id m44so5013491edd.9
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 12:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3gNGjIIX5OSATJPrjiaqC4tEdgA2GhEQ3ri4YNXQssg=;
 b=V+4V6ZD+hSPK7porvFeTlSOCsXh2nJxuy+1ZBLeDXhuHeN15Q679GG1obw/6S5ZYpd
 UlBJH/yHAC0mg1IDHOqy5HzkcWH4f/DDVacrNkoazh0SIn7OOLD99JicWv1uyZJnXBsc
 1BvD00gLnFldOiLJJHwVcKCsiPyI40JZjPpSECEUCR+zyb6HttxY5Qc4zhcgNA5cGVai
 sXHgo7Dk9YWKB4CepFp29INGVHF5MEhOmRfhmAv2ooX90dVnnZskPIUpl2njqvRZZziN
 RkevCFT7G5FPfN1R3/bNHL6N3qwcS26Ju6t3TTGS9wU0Z4QX/xlvXikkA2FDH/ndxY6h
 vHNQ==
X-Gm-Message-State: APjAAAVNA79WQJPOuHytXU7SRQxgH/2cpDvZ4kdboWBBstIVregKNf3u
 bjmg/UMxTpyRI/vmV8BNPDo60VSV1Xxwln7GiAHWuJqff2ewNsOi1w8czq4UlHsrTg==
X-Google-Smtp-Source: APXvYqzPp/ymDwWktq8B8E6XaZXfCAkoCr3WIjSRc5pM5s28AxJsFOmyeNi4na33mOqrHTC1+Y0Rn13p5+DJ
X-Received: by 2002:a17:906:3c7:: with SMTP id
 c7mr27689622eja.187.1565723908955; 
 Tue, 13 Aug 2019 12:18:28 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id l50sm29867edc.15.2019.08.13.12.18.28
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 12:18:28 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hxcJQ-0000z1-E5; Tue, 13 Aug 2019 19:18:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 896132742B44; Tue, 13 Aug 2019 20:18:27 +0100 (BST)
Date: Tue, 13 Aug 2019 20:18:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20190813191827.GI5093@sirena.co.uk>
References: <20190813083550.5877-1-srinivas.kandagatla@linaro.org>
 <20190813083550.5877-4-srinivas.kandagatla@linaro.org>
 <ba88e0f9-ae7d-c26e-d2dc-83bf910c2c01@linux.intel.com>
 <c2eecd44-f06a-7287-2862-0382bf697f8d@linaro.org>
 <d2b7773b-d52a-7769-aa5b-ef8c8845d447@linux.intel.com>
 <d7c1fdb2-602f-ecb1-9b32-91b893e7f408@linaro.org>
 <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <f0228cb4-0a6f-17f3-fe03-9be7f5f2e59d@linux.intel.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, plai@codeaurora.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
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
Content-Type: multipart/mixed; boundary="===============3255178822547512129=="
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--===============3255178822547512129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9Iq5ULCa7nGtWwZS"
Content-Disposition: inline


--9Iq5ULCa7nGtWwZS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2019 at 02:15:18PM -0500, Pierre-Louis Bossart wrote:
> On 8/13/19 1:06 PM, Srinivas Kandagatla wrote:

> > sorry for the confusion. It was too quick reply. :-)
> > I was suppose to say sdw_stream_add_slave() instead of set_sdw_stream().

> ok, so get_sdw_stream() and set_sdw_stream() are not meant to be mirrors or
> both implemented. It's just a helper to respectively get a context or set a
> context but a get-modify-set type of operation is not expected.

> Do I get this right?

This seems like it's going to be confusing...

--9Iq5ULCa7nGtWwZS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1TDQIACgkQJNaLcl1U
h9CEJgf/WNOBdWoFpepTAzRC/SOiL/VJjBnXIPHLxH3lof4Yx/1pbBvUPjYOwCHy
bBVUntfQnRhu7zgAjp1M5uC97VkFZbrj9s+32Tvcb43ye0dto5d63K3c3edekkjQ
ngfPnOA+yWL1BcfMLOAGY3OmTBIuUknyiMWfiLUVIDozt5dTHB0f9W02Qclp7J5I
BtoyMIUdvCVbUMc0KnQkZ19K/IZqBvqNQ6ca9T8gn3K50X30ab0jBgsbm1IXckpH
zmV/b4T553l8j47i/CyXS6K4trYVQ06tUcqyIRWzJZrPHQ/Ji/N62kTq2SOQV56w
nL8ZqN1yL7MUwJM3Qu7yx1MpwPJYYA==
=Xi1X
-----END PGP SIGNATURE-----

--9Iq5ULCa7nGtWwZS--

--===============3255178822547512129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

--===============3255178822547512129==--
