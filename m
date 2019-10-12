Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A68BED4EFE
	for <lists+alsa-devel@lfdr.de>; Sat, 12 Oct 2019 12:27:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20A781661;
	Sat, 12 Oct 2019 12:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20A781661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570876037;
	bh=k2lEWYAZYaO6U+kXfdE3LFnz1NrVbImmi3gZuGPucPs=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DVnYJqOx2BCEkYckuKpONOUPkPN+t2X4lIhqGOmFzF9FZzAdD7DuReRKKBRdfRHIV
	 0/YQsKTUVkbnCC9WMVQal98tuTwCcAfO9Xujn0R5qpo8h59lXru5LfEnP7dj93otiY
	 zJcX+J65BLPlC+QMyMs9jGnypJxwDKcqyPOzHxbU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CB0EF8045E;
	Sat, 12 Oct 2019 12:25:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFBB5F8038F; Sat, 12 Oct 2019 12:24:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F430F800DA
 for <alsa-devel@alsa-project.org>; Sat, 12 Oct 2019 12:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F430F800DA
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr
 [86.202.229.42])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4955D20007;
 Sat, 12 Oct 2019 10:24:30 +0000 (UTC)
Date: Sat, 12 Oct 2019 12:24:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mao Wenan <maowenan@huawei.com>
Message-ID: <20191012102429.GH3125@piout.net>
References: <20191012024230.159371-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012024230.159371-1-maowenan@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, mirq-linux@rere.qmqm.pl,
 kernel-janitors@vger.kernel.org, nicolas.ferre@microchip.com, tiwai@suse.com,
 ludovic.desroches@microchip.com, broonie@kernel.org,
 codrin.ciubotariu@microchip.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH -next] ASoC: atmel: select
 SND_ATMEL_SOC_DMA for SND_ATMEL_SOC_SSC
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

On 12/10/2019 10:42:30+0800, Mao Wenan wrote:
> If SND_ATMEL_SOC_SSC_PDC=y and SND_ATMEL_SOC_SSC_DMA=m,
> below errors can be found:
> sound/soc/atmel/atmel_ssc_dai.o: In function
> `atmel_ssc_set_audio':
> atmel_ssc_dai.c:(.text+0x6fe): undefined reference to
> `atmel_pcm_dma_platform_register'
> make: *** [vmlinux] Error 1
> 
> After commit 18291410557f ("ASoC: atmel: enable
> SOC_SSC_PDC and SOC_SSC_DMA in Kconfig"), SND_ATMEL_SOC_DMA
> and SND_ATMEL_SOC_SSC are selected by SND_ATMEL_SOC_SSC_DMA,
> SND_ATMEL_SOC_SSC is also selected by SND_ATMEL_SOC_SSC_PDC,
> the results are SND_ATMEL_SOC_DMA=m but SND_ATMEL_SOC_SSC=y,
> so the errors happen.
> 
> This patch make SND_ATMEL_SOC_SSC select SND_ATMEL_SOC_DMA.
> 
> Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>
> ---
>  sound/soc/atmel/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
> index f118c22..2938f6b 100644
> --- a/sound/soc/atmel/Kconfig
> +++ b/sound/soc/atmel/Kconfig
> @@ -19,6 +19,7 @@ config SND_ATMEL_SOC_DMA
>  
>  config SND_ATMEL_SOC_SSC
>  	tristate
> +	select SND_ATMEL_SOC_DMA
>  

This is not the solution because this doesn't allow to compile out DMA
and use only PDC. I think Arnd already submitted a proper patch.

>  config SND_ATMEL_SOC_SSC_PDC
>  	tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
