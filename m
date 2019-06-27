Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F295C57D52
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5662E1710;
	Thu, 27 Jun 2019 09:40:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5662E1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621273;
	bh=u7RCEOBx2+uyi9S8aRnykF8EZ5QIeqxeIXaSP/IOWyw=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fxOjt5VrCqhd3D5FFdP0KM8SvO1u0H3duwCQkI2t9DzCoXTTcZyscyCX7F/c6ug7T
	 WNcW40C+f+K3SzJVVvHnH0Z0efose82dx1acDKd7f4li/52GblerzCNy8vzE96OkIt
	 wiwAIKZFgrS1RagH2vycl2NCJe2ub+kLwRX5Qydo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EED6AF896F9;
	Thu, 27 Jun 2019 09:39:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73D69F896F6; Thu, 27 Jun 2019 09:39:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D76CAF89678
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:39:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D76CAF89678
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:39:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="313703785"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga004.jf.intel.com with ESMTP; 27 Jun 2019 00:39:16 -0700
Date: Thu, 27 Jun 2019 09:43:16 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627094316.35057063@xxx>
In-Reply-To: <871rzfkcxb.wl-kuninori.morimoto.gx@renesas.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <871rzfkcxb.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 01/23] ASoC: atmel: atmel-pcm:dma.c: use
 devm_snd_dmaengine_pcm_register()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27 Jun 2019 11:00:01 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_dmaengine_pcm_register,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/atmel/atmel-pcm-dma.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/atmel/atmel-pcm-dma.c
> b/sound/soc/atmel/atmel-pcm-dma.c index 042e593..9abf072 100644
> --- a/sound/soc/atmel/atmel-pcm-dma.c
> +++ b/sound/soc/atmel/atmel-pcm-dma.c
> @@ -111,13 +111,13 @@ static const struct snd_dmaengine_pcm_config
> atmel_dmaengine_pcm_config = { 
>  int atmel_pcm_dma_platform_register(struct device *dev)
>  {
> -	return snd_dmaengine_pcm_register(dev,
> &atmel_dmaengine_pcm_config, 0);
> +	return devm_snd_dmaengine_pcm_register(dev,
> +					&atmel_dmaengine_pcm_config,
> 0); }
>  EXPORT_SYMBOL(atmel_pcm_dma_platform_register);
>  
>  void atmel_pcm_dma_platform_unregister(struct device *dev)
>  {
> -	snd_dmaengine_pcm_unregister(dev);
>  }
>  EXPORT_SYMBOL(atmel_pcm_dma_platform_unregister);
>  

Do we need to keep empty function?

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
