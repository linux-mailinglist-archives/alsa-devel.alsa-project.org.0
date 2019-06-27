Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0A457D54
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:41:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E12F1711;
	Thu, 27 Jun 2019 09:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E12F1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621315;
	bh=sgBUBW/uRkbBPi70dFY15gFNgnt4pyEkm0yHUL7bTNs=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P3FHbrS3b1NxNzzr1C+MbQwBRS3b9FZNremsrjsvLgeBdr3K4/lzgLi5l8GouEt5Y
	 vhyftp232/3TNWfqBkRRHl8D5WiIIFp1KPzuFDkJu97p115S+a+QxJcLJyCvXozUid
	 k++c7FIb3CTqk22A3pfLbFgHhLaM1M355mtOPIic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37ABFF89727;
	Thu, 27 Jun 2019 09:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28BD2F89705; Thu, 27 Jun 2019 09:39:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA5A4F896FC
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA5A4F896FC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245727562"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 00:39:26 -0700
Date: Thu, 27 Jun 2019 09:43:26 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627094326.7f8c0c60@xxx>
In-Reply-To: <87y31niycl.wl-kuninori.morimoto.gx@renesas.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <87y31niycl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 03/23] ASoC: tegra: tegra_pcm.c: use
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

On 27 Jun 2019 11:00:10 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_dmaengine_pcm_register,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/tegra/tegra_pcm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
> index f246df8..1814791 100644
> --- a/sound/soc/tegra/tegra_pcm.c
> +++ b/sound/soc/tegra/tegra_pcm.c
> @@ -44,7 +44,8 @@ static const struct snd_dmaengine_pcm_config
> tegra_dmaengine_pcm_config = { 
>  int tegra_pcm_platform_register(struct device *dev)
>  {
> -	return snd_dmaengine_pcm_register(dev,
> &tegra_dmaengine_pcm_config, 0);
> +	return devm_snd_dmaengine_pcm_register(dev,
> +					&tegra_dmaengine_pcm_config,
> 0); }
>  EXPORT_SYMBOL_GPL(tegra_pcm_platform_register);
>  
> @@ -57,13 +58,12 @@ int
> tegra_pcm_platform_register_with_chan_names(struct device *dev,
> config->chan_names[0] = txdmachan; config->chan_names[1] = rxdmachan;
>  
> -	return snd_dmaengine_pcm_register(dev, config, 0);
> +	return devm_snd_dmaengine_pcm_register(dev, config, 0);
>  }
>  EXPORT_SYMBOL_GPL(tegra_pcm_platform_register_with_chan_names);
>  
>  void tegra_pcm_platform_unregister(struct device *dev)
>  {
> -	return snd_dmaengine_pcm_unregister(dev);
>  }
>  EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
>  

Again, do we need to keep empty function?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
