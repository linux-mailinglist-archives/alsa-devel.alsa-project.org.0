Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6571A4B82
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Sep 2019 21:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F2FB1676;
	Sun,  1 Sep 2019 21:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F2FB1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567367497;
	bh=90tauMiGTm9fP/biwjHp/e2BkU7HnN8Ob1GrTnSYTVU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hRd17pvbcfiRw+2SjSyxa1ZLTZw0QeT9fvfoF0/eRTjwbg3f1SscHd4H4ARPol4rV
	 YCs/RHuA1ELEM2oBoUunstIrYCCL6XizMNOwnaoFGoncFyhinXqHD2TV78RBsccywk
	 GYgCC1m5ZlvKenCrwL/9pz+bdkGIRVd8IcrX7nF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8119AF803D7;
	Sun,  1 Sep 2019 21:49:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1B1F803D7; Sun,  1 Sep 2019 21:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05A64F80306
 for <alsa-devel@alsa-project.org>; Sun,  1 Sep 2019 21:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05A64F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Fc4aT5+u"
Received: by mail-wm1-x344.google.com with SMTP id t17so12378649wmi.2
 for <alsa-devel@alsa-project.org>; Sun, 01 Sep 2019 12:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=1t8RKux0b3auTyo3EU4Fjza8Z8XyMBYSPlq98c5flic=;
 b=Fc4aT5+uP8DK3G5DqiX1PVV2U0OR5puONXiG36iLvcBgC5k9t3q5XjF75IRYjbbgxy
 aIQkqrvX4ndW8RUayuyDYvIjx2aJFf4TbnI5pGadB7iNwZVsE9UD2tEN1XOCo0rbrhcv
 ZgpnWW44RXkXooQLApzTxaK7xFfdgGHLw/sVzVJU09l6RwHZNWQUEI+ATBYN5Wb9TyNf
 6GqU/CikpFvNy+g7jzE+5M0EjQxcTmWk7OxrDi3nsCaQSjwHkqB6LQwt4aT7oiBYLIxf
 6qDyXfNfW77+yBUX8CoAfE7CQ6o8jwkqMD4aM/C2jBoTtRzavn8XletlmQJbR7vske2S
 bvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=1t8RKux0b3auTyo3EU4Fjza8Z8XyMBYSPlq98c5flic=;
 b=rgZqSId4DvHM5hlciKQMdbvVI/7OEpDS1LcjUuui42hkfmvH2q60KEQ6xw4IrAPJpi
 sKqaKTOaOk+RLq42n6JZrMAomlAgs6jcB8NhdVa23kBNyFJ0kq6VlG/MBvjxI69NtHUA
 3IbHRVbcug8Cp3jibfCIjQFb2p31vzgQdj1W50xR530NgrzDkcE8VkKh1w/GPHPeovcd
 h2tgWPKIKSPtZp7McBLNj1hytSWB1Tk8npNQWFA9Wd2+mCfIZuPAj+oxEwIv+17wZw5U
 m9+DaejI/SO/owbhmx0A7lqvoWKW1f1FQEhW/ni4N50OQmnfKBA1kRULig5i7tBnLxzG
 QwIg==
X-Gm-Message-State: APjAAAWLtXuDKEJvnSB6WKqaL2pDTAtr0dY6BvjoPxAjEnGt/RS1BMPf
 wIm9U4VP3A9E7OfxRG3ertU=
X-Google-Smtp-Source: APXvYqxlFS6lvb5mBA/RJA/yrpoHPmKtHhrVFCS4pgKnF8Uke2A+7VWsTMCrKWkhLoaeJouFKBHi7w==
X-Received: by 2002:a7b:c857:: with SMTP id c23mr33536520wml.51.1567367386985; 
 Sun, 01 Sep 2019 12:49:46 -0700 (PDT)
Received: from noxium ([86.124.23.129])
 by smtp.gmail.com with ESMTPSA id f75sm17153683wmf.2.2019.09.01.12.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Sep 2019 12:49:46 -0700 (PDT)
Message-ID: <5124dd295d2b5fb934ad567fbe19b2f6b37a8372.camel@gmail.com>
From: Cosmin-Gabriel Samoila <gabrielcsmo@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, broonie@kernel.org
Date: Sun, 01 Sep 2019 22:49:44 +0300
In-Reply-To: <20190830225514.5283-1-daniel.baluta@nxp.com>
References: <20190830225514.5283-1-daniel.baluta@nxp.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 shengjiu.wang@nxp.com, linux-kernel@vger.kernel.org, nicoleotsuka@gmail.com,
 NXP Linux Team <linux-imx@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to
	Output Mode
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

Looks good to me!

Best regards,
Cosmin

On Sat, 2019-08-31 at 01:55 +0300, Daniel Baluta wrote:
> From SAI datasheet:
> 
> CHMOD, configures if transmit data pins are configured for TDM mode
> or Output mode.
> 	* (0) TDM mode, transmit data pins are tri-stated when slots
> are
> 	masked or channels are disabled.
> 	* (1) Output mode, transmit data pins are never tri-stated and
> 	will output zero when slots are masked or channels are
> disabled.
> 
> When data pins are tri-stated, there is noise on some channels
> when FS clock value is high and data is read while fsclk is
> transitioning from high to low.
> 
> Fix this by setting CHMOD to Output Mode so that pins will output
> zero
> when slots are masked or channels are disabled.
> 
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/fsl/fsl_sai.c | 15 ++++++++++++---
>  sound/soc/fsl/fsl_sai.h |  2 ++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index e896b577b1f7..b9daab0eb6eb 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -467,6 +467,12 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>  
>  	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
>  
> +	/*
> +	 * set CHMOD to Output Mode so that transmit data pins will
> +	 * output zero when slots are masked or channels are disabled
> +	 */
> +	val_cr4 |= FSL_SAI_CR4_CHMOD;
> +
>  	/*
>  	 * For SAI master mode, when Tx(Rx) sync with Rx(Tx) clock,
> Rx(Tx) will
>  	 * generate bclk and frame clock for Tx(Rx), we should set
> RCR4(TCR4),
> @@ -477,7 +483,8 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>  	if (!sai->is_slave_mode) {
>  		if (!sai->synchronous[TX] && sai->synchronous[RX] &&
> !tx) {
>  			regmap_update_bits(sai->regmap,
> FSL_SAI_TCR4(ofs),
> -				FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK,
> +				FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK |
> +				FSL_SAI_CR4_CHMOD_MASK,
>  				val_cr4);
>  			regmap_update_bits(sai->regmap,
> FSL_SAI_TCR5(ofs),
>  				FSL_SAI_CR5_WNW_MASK |
> FSL_SAI_CR5_W0W_MASK |
> @@ -486,7 +493,8 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>  				~0UL - ((1 << channels) - 1));
>  		} else if (!sai->synchronous[RX] && sai-
> >synchronous[TX] && tx) {
>  			regmap_update_bits(sai->regmap,
> FSL_SAI_RCR4(ofs),
> -				FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK,
> +				FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK |
> +				FSL_SAI_CR4_CHMOD_MASK,
>  				val_cr4);
>  			regmap_update_bits(sai->regmap,
> FSL_SAI_RCR5(ofs),
>  				FSL_SAI_CR5_WNW_MASK |
> FSL_SAI_CR5_W0W_MASK |
> @@ -497,7 +505,8 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>  	}
>  
>  	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
> -			   FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK,
> +			   FSL_SAI_CR4_SYWD_MASK |
> FSL_SAI_CR4_FRSZ_MASK |
> +			   FSL_SAI_CR4_CHMOD_MASK,
>  			   val_cr4);
>  	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
>  			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK
> |
> diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
> index f96f8d97489d..1e3b4a6889a8 100644
> --- a/sound/soc/fsl/fsl_sai.h
> +++ b/sound/soc/fsl/fsl_sai.h
> @@ -119,6 +119,8 @@
>  #define FSL_SAI_CR4_FRSZ_MASK	(0x1f << 16)
>  #define FSL_SAI_CR4_SYWD(x)	(((x) - 1) << 8)
>  #define FSL_SAI_CR4_SYWD_MASK	(0x1f << 8)
> +#define FSL_SAI_CR4_CHMOD	BIT(5)
> +#define FSL_SAI_CR4_CHMOD_MASK	GENMASK(5, 5)
>  #define FSL_SAI_CR4_MF		BIT(4)
>  #define FSL_SAI_CR4_FSE		BIT(3)
>  #define FSL_SAI_CR4_FSP		BIT(1)

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
