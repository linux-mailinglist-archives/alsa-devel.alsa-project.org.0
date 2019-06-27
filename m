Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91BE57D56
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:42:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5102C1700;
	Thu, 27 Jun 2019 09:41:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5102C1700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621361;
	bh=N6oCNAwJb8KhB4dzC3ltTIJ8idMpCVeBYyyxVe+ijqQ=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uKobaDEd09/OampgkozMxPU4sy5YKKDuMiiAhHKwbCCD3Zt8SYQc3JWhasc9Jks3f
	 kQP/GFLlm5kgacC7IafAh3jnVjT58WFTqRf69UzBcoWgNjcHUMTWJzJOa2lfi1Ewcu
	 AOVdiVC+xzmRghBp2aR0so7z409cxSW5NUP/2eYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A2B7F89733;
	Thu, 27 Jun 2019 09:39:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C81EF89731; Thu, 27 Jun 2019 09:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 594CCF8972F
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 594CCF8972F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245727591"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 00:39:36 -0700
Date: Thu, 27 Jun 2019 09:43:35 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627094335.6c564e46@xxx>
In-Reply-To: <87woh7iych.wl-kuninori.morimoto.gx@renesas.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <87woh7iych.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 04/23] ASoC: ux500: ux500_pcm.c: use
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

On 27 Jun 2019 11:00:14 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_dmaengine_pcm_register,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/ux500/ux500_pcm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ux500/ux500_pcm.c b/sound/soc/ux500/ux500_pcm.c
> index 9445dbe..05ae02c 100644
> --- a/sound/soc/ux500/ux500_pcm.c
> +++ b/sound/soc/ux500/ux500_pcm.c
> @@ -143,7 +143,7 @@ int ux500_pcm_register_platform(struct
> platform_device *pdev) else
>  		pcm_config = &ux500_dmaengine_pcm_config;
>  
> -	ret = snd_dmaengine_pcm_register(&pdev->dev, pcm_config,
> +	ret = devm_snd_dmaengine_pcm_register(&pdev->dev, pcm_config,
>  					 SND_DMAENGINE_PCM_FLAG_COMPAT);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev,
> @@ -158,7 +158,6 @@ EXPORT_SYMBOL_GPL(ux500_pcm_register_platform);
>  
>  int ux500_pcm_unregister_platform(struct platform_device *pdev)
>  {
> -	snd_dmaengine_pcm_unregister(&pdev->dev);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(ux500_pcm_unregister_platform);

Can also be removed?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
