Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD679A0D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jul 2019 22:34:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2939817EE;
	Mon, 29 Jul 2019 22:33:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2939817EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564432447;
	bh=K7UUpaGMiUMA0yzSPET/EWEy8ZPdm6A6rlgmHYEa7vE=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cB8adR8skuB45rtAU508EURxw5KovFFNT5CC69j2CI9mRXq2Kv3mUHlMhw2BH5Fdm
	 yDPJqcyOd6+1OrykwXQ/TkPhORF8eDsslkxJz0Pd1Y//Wu/puH0d+Njy8IGAbV4rVg
	 QXtzz3vAuZUg/UmiLjfqYJ6Id/yjqPAAu0rDMt6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEEF7F803D5;
	Mon, 29 Jul 2019 22:21:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6D26F804AB; Mon, 29 Jul 2019 22:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16A58F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 22:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16A58F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="V2bEtTKv"
Received: by mail-pf1-x442.google.com with SMTP id g2so28590315pfq.0
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 13:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6re2IOy9UuGPutWHpeGmXvl/6Yqi6FxHUujTvDV/BjQ=;
 b=V2bEtTKvIsIZP7A1vJKuVqPpf7homhWyKeJgc0gsY5Z3kXNvZlP58HtatQ2APTHTQL
 w/yt1hQJSg5pQ8g7O8I+F5FjAHS+wqDRDwU9COzkhvC72JlHa8fTfT+GuFGPm4JCenk+
 YIA6hQJykR5s4FxUuMqNlbBI6QxKAhY93l2iHCHqYlXQwUn6IrYjlmFNWIF1bw/g6Pwc
 15OsgbiVs+8hC61RgeXG5KfunptQicwUnYVKZKQ1iSdD8P6X7MMT+r5xyGhnkvZjE60I
 gFFkwH4Lmojxh4FbeDcEL3/ZaumoV+Ue1iQmfQObzj4OGWcwlNY5c8w3ZNdOABpWWPwf
 4L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6re2IOy9UuGPutWHpeGmXvl/6Yqi6FxHUujTvDV/BjQ=;
 b=dL2DKaz93R9q0GnAsWtreYvqEqk/HMpF7lhrBip1vqCcs0Pf+FhPsVMoQt+eZ/Nu8w
 doSn76nhwSSur4u2Icc7XTPtk7LFre9uDuPWsz6ffCGEK3YFe5ZHQKX4gjBRFQwyh/CY
 iVPckGL+NP1CKN2Ns0fHVrG55uuaZ5aRK5hoBOv8pGagqsMG3SQ/sD1scDuIkO7CgJws
 jW02H1AGDDDYcidy7+sSfngRW3x8QY83rtKIpB3c98ia2EEhjGykh/pY6XKi099IoStx
 mROVMA1gVBfElMQhGadYcDrsKMgx2V2KKQqWwkxD7dWYjIlSlK4lC85VkdMYotN3JYva
 jkow==
X-Gm-Message-State: APjAAAWr4BqB6lGEOLmwQb8QLaGNh6RuHZCjw1V1xWc+Dc46uAbXrtd8
 e7Sa82QtpPO0j0x/wGha6dc=
X-Google-Smtp-Source: APXvYqyWLQm4Cgt5unABdbXidAVUUD4LbAvUUcL7RPKc8STUBXVR75FNm4vHlTcuIbVnqszh/IXkPg==
X-Received: by 2002:a65:6846:: with SMTP id q6mr67264436pgt.150.1564431666039; 
 Mon, 29 Jul 2019 13:21:06 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d129sm67610834pfc.168.2019.07.29.13.21.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Jul 2019 13:21:05 -0700 (PDT)
Date: Mon, 29 Jul 2019 13:21:54 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <20190729202154.GC20594@Asurada-Nvidia.nvidia.com>
References: <20190728192429.1514-1-daniel.baluta@nxp.com>
 <20190728192429.1514-4-daniel.baluta@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190728192429.1514-4-daniel.baluta@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kernel@pengutronix.de, timur@kernel.org, robh@kernel.org,
 shengjiu.wang@nxp.com, angus@akkea.ca, tiwai@suse.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com, mihai.serban@gmail.com,
 l.stach@pengutronix.de
Subject: Re: [alsa-devel] [PATCH v2 3/7] ASoC: fsl_sai: Add support to
 enable multiple data lines
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

On Sun, Jul 28, 2019 at 10:24:25PM +0300, Daniel Baluta wrote:
> SAI supports up to 8 Rx/Tx data lines which can be enabled
> using TCE/RCE bits of TCR3/RCR3 registers.
> 
> Data lines to be enabled are read from DT fsl,dl-mask property.
> By default (if no DT entry is provided) only data line 0 is enabled.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 11 ++++++++++-
>  sound/soc/fsl/fsl_sai.h |  4 +++-
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 637b1d12a575..5e7cb7fd29f5 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -601,7 +601,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
>  
>  	regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
>  			   FSL_SAI_CR3_TRCE_MASK,
> -			   FSL_SAI_CR3_TRCE);
> +			   FSL_SAI_CR3_TRCE(sai->soc_data->dl_mask[tx]);
>  
>  	ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
>  			SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
> @@ -888,6 +888,15 @@ static int fsl_sai_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/*
> +	 * active data lines mask for TX/RX, defaults to 1 (only the first
> +	 * data line is enabled
> +	 */
> +	sai->dl_mask[RX] = 1;
> +	sai->dl_mask[TX] = 1;
> +	of_property_read_u32_index(np, "fsl,dl-mask", RX, &sai->dl_mask[RX]);
> +	of_property_read_u32_index(np, "fsl,dl-mask", TX, &sai->dl_mask[TX]);

Just curious what if we enable 8 data lines through DT bindings
while an audio file only has 1 or 2 channels. Will TRCE bits be
okay to stay with 8 data channels configurations? Btw, how does
DMA work for the data registers? ESAI has one entry at a fixed
address for all data channels while SAI seems to have different
data registers.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
