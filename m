Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FF212C59
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 20:29:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FA316DB;
	Thu,  2 Jul 2020 20:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FA316DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593714582;
	bh=O5iWADRsxNfS9xDM4muJSq47LPjmptZwYSxdr+ootMo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iRvUfo/00yRhWRbu14knZU8lqIQ6nD75snQvPjCp4BEr9khq//mLiqxJbEs7u+s/K
	 hiUBxaFcVhXa49T7frLhcVrUoeQiTuY1fRVLjRDgLWelC2ohH+xLtoMyaXpnntBO5c
	 NEFnmh39bWgqoctOYz8IgvApZ3u82gTCuIXZX/ZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3681EF8022B;
	Thu,  2 Jul 2020 20:28:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93D42F8022D; Thu,  2 Jul 2020 20:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B96BF800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 20:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B96BF800ED
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr
 [90.65.108.121])
 (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 48019C0003;
 Thu,  2 Jul 2020 18:27:48 +0000 (UTC)
Date: Thu, 2 Jul 2020 20:27:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/8] ASoC: atmel: fix kernel-doc
Message-ID: <20200702182747.GB6538@piout.net>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
 <20200702165901.164100-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702165901.164100-2-pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 "moderated list:ARM/Microchip \(AT91\) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
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

On 02/07/2020 11:58:54-0500, Pierre-Louis Bossart wrote:
> Fix W=1 warning
> 
> Kernel-doc is not used in one file and missing argument in the second.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  sound/soc/atmel/atmel-pcm-dma.c | 2 +-
>  sound/soc/atmel/atmel_ssc_dai.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
> index cb03c4f7324c..0a2e956232af 100644
> --- a/sound/soc/atmel/atmel-pcm-dma.c
> +++ b/sound/soc/atmel/atmel-pcm-dma.c
> @@ -44,7 +44,7 @@ static const struct snd_pcm_hardware atmel_pcm_dma_hardware = {
>  	.buffer_bytes_max	= 512 * 1024,
>  };
>  
> -/**
> +/*
>   * atmel_pcm_dma_irq: SSC interrupt handler for DMAENGINE enabled SSC
>   *
>   * We use DMAENGINE to send/receive data to/from SSC so this ISR is only to
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index 0f18dfb85bfe..6a63e8797a0b 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -887,6 +887,7 @@ static int asoc_ssc_init(struct device *dev)
>  
>  /**
>   * atmel_ssc_set_audio - Allocate the specified SSC for audio use.
> + * @ssc_id: SSD ID in [0, NUM_SSC_DEVICES[
>   */
>  int atmel_ssc_set_audio(int ssc_id)
>  {
> -- 
> 2.25.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
