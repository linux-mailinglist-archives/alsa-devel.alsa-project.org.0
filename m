Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6D26A0D8
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Sep 2020 10:27:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14D141677;
	Tue, 15 Sep 2020 10:27:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14D141677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600158474;
	bh=B6fprywRzEl55P5JQpEiyNbBVOKHwglGFcP5rc7C11M=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IvWMmuA00qeQnvun6IZsSXTl/OUjejrUXWT3fHsOb/+5ZVQYOjdXpGNH4aHTqAggh
	 +CzmyF6SnSFE78Ui+PR87hZGxjpSNCCcL0L3xxVbgzs7gO4bQ4YDAEH4rasMZNacZJ
	 7EKA1t6IZLUdZGuV7QFf/BQHJv6DzYEIji0O8UVk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F5FAF8025E;
	Tue, 15 Sep 2020 10:26:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4653EF80212; Tue, 15 Sep 2020 10:26:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C570FF800F1
 for <alsa-devel@alsa-project.org>; Tue, 15 Sep 2020 10:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C570FF800F1
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr
 [90.65.88.165]) (Authenticated sender: alexandre.belloni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 57203240008;
 Tue, 15 Sep 2020 08:26:02 +0000 (UTC)
Date: Tue, 15 Sep 2020 10:26:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] ASoC: tlv320aic32x4: Enable fast charge
Message-ID: <20200915082602.GH4230@piout.net>
References: <20200911173140.29984-1-miquel.raynal@bootlin.com>
 <20200911173140.29984-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200911173140.29984-4-miquel.raynal@bootlin.com>
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Hi,

On 11/09/2020 19:31:40+0200, Miquel Raynal wrote:
> At power-up the analog circuits may take up to one full second before
> being charged with the default configuration. Using the analog blocks
> before they are ready generates a *very* crappy sound.
> 
> Enable the fast charge feature, which will require a bit more power
> than normal charge but will definitely speed up the starting operation
> by shrinking this delay to up to 40 ms.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  sound/soc/codecs/tlv320aic32x4.c | 8 ++++++++
>  sound/soc/codecs/tlv320aic32x4.h | 7 +++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
> index 7a1ffbaf48be..5fb8ba109bc9 100644
> --- a/sound/soc/codecs/tlv320aic32x4.c
> +++ b/sound/soc/codecs/tlv320aic32x4.c
> @@ -1009,6 +1009,14 @@ static int aic32x4_component_probe(struct snd_soc_component *component)
>  				AIC32X4_LADC_EN | AIC32X4_RADC_EN);
>  	snd_soc_component_write(component, AIC32X4_ADCSETUP, tmp_reg);
>  
> +	/*
> +	 * Enable the fast charging feature and ensure the needed 40ms ellapsed
> +	 * before using the analog circuits.
> +	 */
> +	snd_soc_component_write(component, AIC32X4_REFPOWERUP,
> +				AIC32X4_REFPOWERUP_40MS);
> +	msleep(40);
> +

Maybe the actual REFPOWERUP value could be exposed as a control so
userspace has a way to set the policy? 

I'm not sure it make sense to have the delay in probe because it is not
enable the analog part of the codec. The delay should probable be after
the clocks have been set up because the datasheet says that it is mdac
and madc that is starting the analog circuitry.

>  	return 0;
>  }
>  
> diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
> index 38f47704bb75..7550122e9f8a 100644
> --- a/sound/soc/codecs/tlv320aic32x4.h
> +++ b/sound/soc/codecs/tlv320aic32x4.h
> @@ -96,6 +96,7 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
>  #define AIC32X4_FLOATINGINPUT	AIC32X4_REG(1, 58)
>  #define AIC32X4_LMICPGAVOL	AIC32X4_REG(1, 59)
>  #define AIC32X4_RMICPGAVOL	AIC32X4_REG(1, 60)
> +#define AIC32X4_REFPOWERUP	AIC32X4_REG(1, 123)
>  
>  /* Bits, masks, and shifts */
>  
> @@ -205,6 +206,12 @@ int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
>  #define AIC32X4_RMICPGANIN_IN1L_10K	0x10
>  #define AIC32X4_RMICPGANIN_CM1R_10K	0x40
>  
> +/* AIC32X4_REFPOWERUP */
> +#define AIC32X4_REFPOWERUP_SLOW		0x04
> +#define AIC32X4_REFPOWERUP_40MS		0x05
> +#define AIC32X4_REFPOWERUP_80MS		0x06
> +#define AIC32X4_REFPOWERUP_120MS	0x07
> +
>  /* Common mask and enable for all of the dividers */
>  #define AIC32X4_DIVEN           BIT(7)
>  #define AIC32X4_DIV_MASK        GENMASK(6, 0)
> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
