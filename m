Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7B257D5B
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:43:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAA1171B;
	Thu, 27 Jun 2019 09:42:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAA1171B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621429;
	bh=sIy5JcbB48YiDPUqLcueHKg5sMhG5HDoLCLp1Vc0kC0=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jefHPrk8r2imbwaXafd4gmEe5ZDfQ2/Ew2w1BN6ICUxzRi7LtVSoyV03AD8WePUKl
	 2dYFMnmMFZWMi0vRayUfQ6awqoY46E8j+UsJwOOlOkO5PptZnppgh0YRq5mbHwpVGm
	 FMQYScA8EuIKijwsCooQLUeTs4xfBc8hhwgQsflc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129DEF89743;
	Thu, 27 Jun 2019 09:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92AA7F89741; Thu, 27 Jun 2019 09:40:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 239B9F8973F
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 239B9F8973F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245727676"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 00:39:57 -0700
Date: Thu, 27 Jun 2019 09:43:56 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627094356.51ed48b4@xxx>
In-Reply-To: <87lfxniybh.wl-kuninori.morimoto.gx@renesas.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <87lfxniybh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 12/23] ASoC: ak4118: use
 devm_snd_soc_register_component()
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

On 27 Jun 2019 11:00:50 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_soc_register_component,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/ak4118.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
> index ce419e8..efbe2d6 100644
> --- a/sound/soc/codecs/ak4118.c
> +++ b/sound/soc/codecs/ak4118.c
> @@ -400,13 +400,12 @@ static int ak4118_i2c_probe(struct i2c_client
> *i2c, return ret;
>  	}
>  
> -	return snd_soc_register_component(&i2c->dev,
> &soc_component_drv_ak4118,
> -					  &ak4118_dai, 1);
> +	return devm_snd_soc_register_component(&i2c->dev,
> +				&soc_component_drv_ak4118,
> &ak4118_dai, 1); }
>  
>  static int ak4118_i2c_remove(struct i2c_client *i2c)
>  {
> -	snd_soc_unregister_component(&i2c->dev);
>  	return 0;
>  }
>  

Remove whole function.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
