Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EE0467C8A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 18:29:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184911F83;
	Fri,  3 Dec 2021 18:28:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184911F83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638552563;
	bh=8Y+iTkVHyi32eqm4oXU8j9X1/e9/2blhp6mQO86NhsQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GyWtg5LpsRL8xQhK4kmKp16QgBSZOo9RF62z5y4Ywk+5W6uSlfct4cAORof2Xyp4I
	 Cdwf7fnX5NIVZJd2v547AVGshzglujTpF8NhKl/Mj15nSvUz/Aw2PFctKulbbFsDgf
	 ID1GkJGYZHvt46NuidHrzuGt1oQE66RFhKpgXdho=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82BBCF8015B;
	Fri,  3 Dec 2021 18:28:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EF07F80085; Fri,  3 Dec 2021 18:28:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3165AF80085
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 18:27:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3165AF80085
Authentication-Results: alsa1.perex.cz;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=collabora.com header.i=@collabora.com header.b="dczRrUIF"
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id 4A5D91F4720D
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638552473; bh=8Y+iTkVHyi32eqm4oXU8j9X1/e9/2blhp6mQO86NhsQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dczRrUIFV0X3JMENblom3SEwA21rK1PBf2KayH+Hq+xJ0bystYFOWnWeyvPVndsAi
 6/dIDUlBcWDMIMI+5jzpXX1XaOWs5SPkiWJluTwRDnJi9jlOph/3VMlk4LiRDJ2mQN
 yl+1hrqB/qghiBMX6JFLa63AQaXQU0nYO1hV4+flQnqp7Ervku9uCjwh6HUxiEhUzd
 xbiHd8hhbiG/a3Em1ORyyBMzSRtS6fUcGg32tKRPGjeWLWUzh10We0W5vFJrrON3wi
 ryjtbH/tIPX0BLk+93P5ZpZKaoVjYtr5hwXr2OVhlv2eEgAQXRRAfHdKKfQ2TfHV0v
 a/1iVjkqvOj9Q==
Subject: Re: [RFC patch 5/5] ASoC: fsl-asoc-card: Support
 fsl,imx-audio-tlv320aic31xx codec
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20211119153248.419802-1-ariel.dalessandro@collabora.com>
 <20211119153248.419802-6-ariel.dalessandro@collabora.com>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Message-ID: <4a3672e1-7c62-7a2a-cd9f-045cf476c1b0@collabora.com>
Date: Fri, 3 Dec 2021 14:27:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211119153248.419802-6-ariel.dalessandro@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: bkylerussell@gmail.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 michael@amarulasolutions.com, festevam@gmail.com
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


On 11/19/21 12:32 PM, Ariel D'Alessandro wrote:
> Add entry for fsl,imx-audio-tlv320aic31xx audio codec. This codec is
> configured to use BCLK as clock input.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> index 6e6494f9f399..90cbed496f98 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -26,6 +26,7 @@
>  #include "../codecs/wm8962.h"
>  #include "../codecs/wm8960.h"
>  #include "../codecs/wm8994.h"
> +#include "../codecs/tlv320aic31xx.h"
>  
>  #define CS427x_SYSCLK_MCLK 0
>  
> @@ -629,6 +630,16 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic32x4")) {
>  		codec_dai_name = "tlv320aic32x4-hifi";
>  		priv->dai_fmt |= SND_SOC_DAIFMT_CBP_CFP;
> +	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
> +		codec_dai_name = "tlv320dac31xx-hifi";
> +		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
> +		priv->dai_link[1].dpcm_capture = 0;
> +		priv->dai_link[2].dpcm_capture = 0;
> +		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
> +		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
> +		priv->codec_priv.mclk_id = AIC31XX_PLL_CLKIN_BCLK;
> +		priv->card.dapm_routes = audio_map_tx;
> +		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
>  	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8962")) {
>  		codec_dai_name = "wm8962";
>  		priv->codec_priv.mclk_id = WM8962_SYSCLK_MCLK;
> @@ -888,6 +899,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
>  	{ .compatible = "fsl,imx-audio-cs42888", },
>  	{ .compatible = "fsl,imx-audio-cs427x", },
>  	{ .compatible = "fsl,imx-audio-tlv320aic32x4", },
> +	{ .compatible = "fsl,imx-audio-tlv320aic31xx", },
>  	{ .compatible = "fsl,imx-audio-sgtl5000", },
>  	{ .compatible = "fsl,imx-audio-wm8962", },
>  	{ .compatible = "fsl,imx-audio-wm8960", },

The following config is missing and must be added.

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 8e05d092790e..14a06d9418a7 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -312,6 +312,7 @@ config SND_SOC_FSL_ASOC_CARD
        select SND_SOC_FSL_SAI
        select SND_SOC_FSL_SSI
+       select SND_SOC_TLV320AIC31XX
        select SND_SOC_WM8994
        select MFD_WM8994
        help

Regards,
Ariel
