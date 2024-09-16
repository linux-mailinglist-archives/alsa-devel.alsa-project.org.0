Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F2C979EDA
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2024 12:00:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2195CE97;
	Mon, 16 Sep 2024 12:00:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2195CE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726480832;
	bh=LDr+l0/sdiG7ICkrF18qyErx3fYlYj8AjwcSGwUpmHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tVLXgo8zOtOPgf0ddaV8c13ZVqxaoy0IuGmze8dYqRcPodchQkof32QG8MZMrMllH
	 dwwPPOcjWZluOMVEiVBpDfPgYIhHJf6Cdi///+9S5o5lzRBTC1QDawBBpvok0Y1DGI
	 ujw0OHDrFBIwVQtWUZVN7pKWshxEgUteyhmdlOVI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EB1EDF805B5; Mon, 16 Sep 2024 12:00:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0845F805AE;
	Mon, 16 Sep 2024 11:59:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1013FF8020D; Mon, 16 Sep 2024 11:59:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3ADAEF800D0
	for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2024 11:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ADAEF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=CLlx0Gqp
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAB121C0002;
	Mon, 16 Sep 2024 09:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726480788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S/GA9yRiwtcFQ7dDPsBs3vafpeHgegXdK3i5eFOjlrE=;
	b=CLlx0GqpFLOoKOsTbqczn9UjiUC6hFcUmGm3nmVJDV771RcVNJIocsC0521z8vtTrypv2w
	aAoq9AeAc7RZgcByh7Blu/jp/7pvG5FsYB9EIAC1ydODZReuSKuXu9ufsnfmL6BHDzZ/pk
	Am6ec45fockeSiloFkGig26k0HF912tDPlQNZ0QwwMQDxooB8c1lFnbijsx6S/OsOJoRKM
	Vd+RhsnQGGQGRgXUJxquG2+NQaOj85qSs6HLUmgibD2l9dcsRCundb6V5uuwXizD+nLvD9
	l3SCOXvYnLa2kvcwcz17u6CjmztORgoub61SVAvtQo8cRgswcx+73cn37m5AQA==
Date: Mon, 16 Sep 2024 11:59:47 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Subject: Re: [PATCH 2/2] ASoC: atmel: atmel_ssc_dai: Drop S24_LE support due
 to single channel limitation
Message-ID: <202409160959473da37eea@mail.local>
References: <20240916085214.11083-1-andrei.simion@microchip.com>
 <20240916085214.11083-3-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916085214.11083-3-andrei.simion@microchip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
Message-ID-Hash: PWF2OD6Q7Y6BVMFQ7OXSD64YUDQYLELE
X-Message-ID-Hash: PWF2OD6Q7Y6BVMFQ7OXSD64YUDQYLELE
X-MailFrom: alexandre.belloni@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PWF2OD6Q7Y6BVMFQ7OXSD64YUDQYLELE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/09/2024 11:52:15+0300, Andrei Simion wrote:
> From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> 
> Drop S24_LE format because it is not supported if more than 2 channels
> (of TDM slots) are used. This limitation makes it impractical for use cases
> requiring more than 2 TDM slots, leading to potential issues in
> multi-channel configurations.
> 
> [andrei.simion@microchip.com: Reword the commit title and the commit
> message.]
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  sound/soc/atmel/atmel_ssc_dai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/atmel/atmel_ssc_dai.c b/sound/soc/atmel/atmel_ssc_dai.c
> index 7047f17fe7a8..475e7579c64c 100644
> --- a/sound/soc/atmel/atmel_ssc_dai.c
> +++ b/sound/soc/atmel/atmel_ssc_dai.c
> @@ -822,7 +822,7 @@ static int atmel_ssc_resume(struct snd_soc_component *component)
>  }
>  
>  #define ATMEL_SSC_FORMATS (SNDRV_PCM_FMTBIT_S8     | SNDRV_PCM_FMTBIT_S16_LE |\
> -			  SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> +			   SNDRV_PCM_FMTBIT_S32_LE)

I believe this requires a comment. Else someone may add it back later
on.

>  
>  static const struct snd_soc_dai_ops atmel_ssc_dai_ops = {
>  	.startup	= atmel_ssc_startup,
> -- 
> 2.34.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
