Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AD43AD37A
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Jun 2021 22:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A7E51739;
	Fri, 18 Jun 2021 22:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A7E51739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624047504;
	bh=3AN8D6imNToRu3PxRy897UYHWXzCq842ouDVB6xy9EA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8FLdQGOpT0g15WoUy+U0nRSQzeKEulI54iVStAYINqG4yaGBxOVSTx76fKRe7FKS
	 MiUryAQ3l7wD8N7lQsY5s7VO8TYOp01zKNxxC/j3o0G6g6Su3DfChHnsQ/+3GT5d55
	 XYzEpuGVmQK//wMUubIVHbHmsPpYGQxYTJiDR3SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28DDFF804B0;
	Fri, 18 Jun 2021 22:17:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE813F80424; Fri, 18 Jun 2021 22:17:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,UPPERCASE_50_75,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6965FF80423
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 22:17:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6965FF80423
Received: by mail-oo1-f43.google.com with SMTP id
 r9-20020a4a37090000b029024b15d2fef9so2504531oor.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Jun 2021 13:17:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=at8Myk4DsreoksXWhWhn1VfubfRyMhmgM5RY9nidd0I=;
 b=AYw4GT4t0Jq5nEagzUBBwMyVSsFhEycumlUHzCEpZDLyfF1++6G/gHOaZ3w7Vv0tPN
 5Iv0HLCeWyCOxuh+lA/c5EN+I8LmC1g2T+ISTK6ZhObteUfZQS87tFBcjWMtYa5qOQhl
 2ol9I77/R+rskFoeBFrDtFCwr4FPXUQ0YZHYlM4FlnpsEEuCB6FdePn7p5ppVUEArvT+
 quUwXnXH53mTiCjBqB29yASUj2T2WREwe7EWYhVrE5OBtWtfM0e1+kdy2r0dyI+LK/v8
 il1watGpe9vbiSM8Ca9VrPTpK8aYFxkHDX8wl/WALL8onF2+X5bk50bOxCdkToj1vIfk
 RJWg==
X-Gm-Message-State: AOAM532ttsSee918d4q3R8q+VLqeWsnr+Z1BFiOI/nvaE7wduOekH7IB
 AstFHTh1y4F4aXTiHJOdiA==
X-Google-Smtp-Source: ABdhPJxqFEA9rXPOgW7E10gTRzwgMNK+lYYml+/GsKKYEMjiCcf2jlqnug3lBLGqDZKwbY45tBWPmw==
X-Received: by 2002:a4a:97ed:: with SMTP id x42mr10401939ooi.49.1624047440838; 
 Fri, 18 Jun 2021 13:17:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id r12sm1243890otc.38.2021.06.18.13.17.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:17:20 -0700 (PDT)
Received: (nullmailer pid 2808537 invoked by uid 1000);
 Fri, 18 Jun 2021 20:17:18 -0000
Date: Fri, 18 Jun 2021 14:17:18 -0600
From: Rob Herring <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH 05/13] ASoC: qcom: audioreach: add q6apm support
Message-ID: <20210618201718.GA2807622@robh.at.kernel.org>
References: <20210607152836.17154-1-srinivas.kandagatla@linaro.org>
 <20210607152836.17154-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607152836.17154-6-srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, linux-kernel@vger.kernel.org, broonie@kernel.org,
 bjorn.andersson@linaro.org
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

On Mon, Jun 07, 2021 at 04:28:28PM +0100, Srinivas Kandagatla wrote:
> Add support to q6apm (Audio Process Manager) component which is
> core Audioreach service running in the DSP.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  include/dt-bindings/sound/qcom,q6apm.h | 215 ++++++++

This goes in the binding patch.

>  sound/soc/qcom/audioreach/Makefile     |   2 +-
>  sound/soc/qcom/audioreach/audioreach.c | 252 +++++++++
>  sound/soc/qcom/audioreach/audioreach.h |   6 +
>  sound/soc/qcom/audioreach/q6apm.c      | 695 +++++++++++++++++++++++++
>  sound/soc/qcom/audioreach/q6apm.h      | 171 ++++++
>  6 files changed, 1340 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/sound/qcom,q6apm.h
>  create mode 100644 sound/soc/qcom/audioreach/q6apm.c
>  create mode 100644 sound/soc/qcom/audioreach/q6apm.h
> 
> diff --git a/include/dt-bindings/sound/qcom,q6apm.h b/include/dt-bindings/sound/qcom,q6apm.h
> new file mode 100644
> index 000000000000..38e3a426b15a
> --- /dev/null
> +++ b/include/dt-bindings/sound/qcom,q6apm.h
> @@ -0,0 +1,215 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Dual license.

> +#ifndef __DT_BINDINGS_Q6_APM_H__
> +#define __DT_BINDINGS_Q6_APM_H__
> +
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA1	1
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA2	2
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA3	3
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA4	4
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA5	5
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA6	6
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA7	7
> +#define	MSM_FRONTEND_DAI_MULTIMEDIA8	8
> +
> +/* Audio Process Manager (APM) virtual ports IDs */
> +#define HDMI_RX		1
> +#define SLIMBUS_0_RX    2
> +#define SLIMBUS_0_TX    3
> +#define SLIMBUS_1_RX    4
> +#define SLIMBUS_1_TX    5
> +#define SLIMBUS_2_RX    6
> +#define SLIMBUS_2_TX    7
> +#define SLIMBUS_3_RX    8
> +#define SLIMBUS_3_TX    9
> +#define SLIMBUS_4_RX    10
> +#define SLIMBUS_4_TX    11
> +#define SLIMBUS_5_RX    12
> +#define SLIMBUS_5_TX    13
> +#define SLIMBUS_6_RX    14
> +#define SLIMBUS_6_TX    15
> +#define PRIMARY_MI2S_RX		16
> +#define PRIMARY_MI2S_TX		17
> +#define SECONDARY_MI2S_RX	18
> +#define SECONDARY_MI2S_TX	19
> +#define TERTIARY_MI2S_RX	20
> +#define TERTIARY_MI2S_TX	21
> +#define QUATERNARY_MI2S_RX	22
> +#define QUATERNARY_MI2S_TX	23
> +#define PRIMARY_TDM_RX_0	24
> +#define PRIMARY_TDM_TX_0	25
> +#define PRIMARY_TDM_RX_1	26
> +#define PRIMARY_TDM_TX_1	27
> +#define PRIMARY_TDM_RX_2	28
> +#define PRIMARY_TDM_TX_2	29
> +#define PRIMARY_TDM_RX_3	30
> +#define PRIMARY_TDM_TX_3	31
> +#define PRIMARY_TDM_RX_4	32
> +#define PRIMARY_TDM_TX_4	33
> +#define PRIMARY_TDM_RX_5	34
> +#define PRIMARY_TDM_TX_5	35
> +#define PRIMARY_TDM_RX_6	36
> +#define PRIMARY_TDM_TX_6	37
> +#define PRIMARY_TDM_RX_7	38
> +#define PRIMARY_TDM_TX_7	39
> +#define SECONDARY_TDM_RX_0	40
> +#define SECONDARY_TDM_TX_0	41
> +#define SECONDARY_TDM_RX_1	42
> +#define SECONDARY_TDM_TX_1	43
> +#define SECONDARY_TDM_RX_2	44
> +#define SECONDARY_TDM_TX_2	45
> +#define SECONDARY_TDM_RX_3	46
> +#define SECONDARY_TDM_TX_3	47
> +#define SECONDARY_TDM_RX_4	48
> +#define SECONDARY_TDM_TX_4	49
> +#define SECONDARY_TDM_RX_5	50
> +#define SECONDARY_TDM_TX_5	51
> +#define SECONDARY_TDM_RX_6	52
> +#define SECONDARY_TDM_TX_6	53
> +#define SECONDARY_TDM_RX_7	54
> +#define SECONDARY_TDM_TX_7	55
> +#define TERTIARY_TDM_RX_0	56
> +#define TERTIARY_TDM_TX_0	57
> +#define TERTIARY_TDM_RX_1	58
> +#define TERTIARY_TDM_TX_1	59
> +#define TERTIARY_TDM_RX_2	60
> +#define TERTIARY_TDM_TX_2	61
> +#define TERTIARY_TDM_RX_3	62
> +#define TERTIARY_TDM_TX_3	63
> +#define TERTIARY_TDM_RX_4	64
> +#define TERTIARY_TDM_TX_4	65
> +#define TERTIARY_TDM_RX_5	66
> +#define TERTIARY_TDM_TX_5	67
> +#define TERTIARY_TDM_RX_6	68
> +#define TERTIARY_TDM_TX_6	69
> +#define TERTIARY_TDM_RX_7	70
> +#define TERTIARY_TDM_TX_7	71
> +#define QUATERNARY_TDM_RX_0	72
> +#define QUATERNARY_TDM_TX_0	73
> +#define QUATERNARY_TDM_RX_1	74
> +#define QUATERNARY_TDM_TX_1	75
> +#define QUATERNARY_TDM_RX_2	76
> +#define QUATERNARY_TDM_TX_2	77
> +#define QUATERNARY_TDM_RX_3	78
> +#define QUATERNARY_TDM_TX_3	79
> +#define QUATERNARY_TDM_RX_4	80
> +#define QUATERNARY_TDM_TX_4	81
> +#define QUATERNARY_TDM_RX_5	82
> +#define QUATERNARY_TDM_TX_5	83
> +#define QUATERNARY_TDM_RX_6	84
> +#define QUATERNARY_TDM_TX_6	85
> +#define QUATERNARY_TDM_RX_7	86
> +#define QUATERNARY_TDM_TX_7	87
> +#define QUINARY_TDM_RX_0	88
> +#define QUINARY_TDM_TX_0	89
> +#define QUINARY_TDM_RX_1	90
> +#define QUINARY_TDM_TX_1	91
> +#define QUINARY_TDM_RX_2	92
> +#define QUINARY_TDM_TX_2	93
> +#define QUINARY_TDM_RX_3	94
> +#define QUINARY_TDM_TX_3	95
> +#define QUINARY_TDM_RX_4	96
> +#define QUINARY_TDM_TX_4	97
> +#define QUINARY_TDM_RX_5	98
> +#define QUINARY_TDM_TX_5	99
> +#define QUINARY_TDM_RX_6	100
> +#define QUINARY_TDM_TX_6	101
> +#define QUINARY_TDM_RX_7	102
> +#define QUINARY_TDM_TX_7	103
> +#define DISPLAY_PORT_RX		104
> +#define WSA_CODEC_DMA_RX_0	105
> +#define WSA_CODEC_DMA_TX_0	106
> +#define WSA_CODEC_DMA_RX_1	107
> +#define WSA_CODEC_DMA_TX_1	108
> +#define WSA_CODEC_DMA_TX_2	109
> +#define VA_CODEC_DMA_TX_0	110
> +#define VA_CODEC_DMA_TX_1	111
> +#define VA_CODEC_DMA_TX_2	112
> +#define RX_CODEC_DMA_RX_0	113
> +#define TX_CODEC_DMA_TX_0	114
> +#define RX_CODEC_DMA_RX_1	115
> +#define TX_CODEC_DMA_TX_1	116
> +#define RX_CODEC_DMA_RX_2	117
> +#define TX_CODEC_DMA_TX_2	118
> +#define RX_CODEC_DMA_RX_3	119
> +#define TX_CODEC_DMA_TX_3	120
> +#define RX_CODEC_DMA_RX_4	121
> +#define TX_CODEC_DMA_TX_4	122
> +#define RX_CODEC_DMA_RX_5	123
> +#define TX_CODEC_DMA_TX_5	124
> +#define RX_CODEC_DMA_RX_6	125
> +#define RX_CODEC_DMA_RX_7	126
> +
> +#define LPASS_CLK_ID_PRI_MI2S_IBIT	1
> +#define LPASS_CLK_ID_PRI_MI2S_EBIT	2
> +#define LPASS_CLK_ID_SEC_MI2S_IBIT	3
> +#define LPASS_CLK_ID_SEC_MI2S_EBIT	4
> +#define LPASS_CLK_ID_TER_MI2S_IBIT	5
> +#define LPASS_CLK_ID_TER_MI2S_EBIT	6
> +#define LPASS_CLK_ID_QUAD_MI2S_IBIT	7
> +#define LPASS_CLK_ID_QUAD_MI2S_EBIT	8
> +#define LPASS_CLK_ID_SPEAKER_I2S_IBIT	9
> +#define LPASS_CLK_ID_SPEAKER_I2S_EBIT	10
> +#define LPASS_CLK_ID_SPEAKER_I2S_OSR	11
> +#define LPASS_CLK_ID_QUI_MI2S_IBIT	12
> +#define LPASS_CLK_ID_QUI_MI2S_EBIT	13
> +#define LPASS_CLK_ID_SEN_MI2S_IBIT	14
> +#define LPASS_CLK_ID_SEN_MI2S_EBIT	15
> +#define LPASS_CLK_ID_INT0_MI2S_IBIT	16
> +#define LPASS_CLK_ID_INT1_MI2S_IBIT	17
> +#define LPASS_CLK_ID_INT2_MI2S_IBIT	18
> +#define LPASS_CLK_ID_INT3_MI2S_IBIT	19
> +#define LPASS_CLK_ID_INT4_MI2S_IBIT	20
> +#define LPASS_CLK_ID_INT5_MI2S_IBIT	21
> +#define LPASS_CLK_ID_INT6_MI2S_IBIT	22
> +#define LPASS_CLK_ID_QUI_MI2S_OSR	23
> +#define LPASS_CLK_ID_PRI_PCM_IBIT	24
> +#define LPASS_CLK_ID_PRI_PCM_EBIT	25
> +#define LPASS_CLK_ID_SEC_PCM_IBIT	26
> +#define LPASS_CLK_ID_SEC_PCM_EBIT	27
> +#define LPASS_CLK_ID_TER_PCM_IBIT	28
> +#define LPASS_CLK_ID_TER_PCM_EBIT	29
> +#define LPASS_CLK_ID_QUAD_PCM_IBIT	30
> +#define LPASS_CLK_ID_QUAD_PCM_EBIT	31
> +#define LPASS_CLK_ID_QUIN_PCM_IBIT	32
> +#define LPASS_CLK_ID_QUIN_PCM_EBIT	33
> +#define LPASS_CLK_ID_QUI_PCM_OSR	34
> +#define LPASS_CLK_ID_PRI_TDM_IBIT	35
> +#define LPASS_CLK_ID_PRI_TDM_EBIT	36
> +#define LPASS_CLK_ID_SEC_TDM_IBIT	37
> +#define LPASS_CLK_ID_SEC_TDM_EBIT	38
> +#define LPASS_CLK_ID_TER_TDM_IBIT	39
> +#define LPASS_CLK_ID_TER_TDM_EBIT	40
> +#define LPASS_CLK_ID_QUAD_TDM_IBIT	41
> +#define LPASS_CLK_ID_QUAD_TDM_EBIT	42
> +#define LPASS_CLK_ID_QUIN_TDM_IBIT	43
> +#define LPASS_CLK_ID_QUIN_TDM_EBIT	44
> +#define LPASS_CLK_ID_QUIN_TDM_OSR	45
> +#define LPASS_CLK_ID_MCLK_1		46
> +#define LPASS_CLK_ID_MCLK_2		47
> +#define LPASS_CLK_ID_MCLK_3		48
> +#define LPASS_CLK_ID_MCLK_4		49
> +#define LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE	50
> +#define LPASS_CLK_ID_INT_MCLK_0		51
> +#define LPASS_CLK_ID_INT_MCLK_1		52
> +#define LPASS_CLK_ID_MCLK_5		53
> +#define LPASS_CLK_ID_WSA_CORE_MCLK	54
> +#define LPASS_CLK_ID_WSA_CORE_NPL_MCLK	55
> +#define LPASS_CLK_ID_VA_CORE_MCLK	56
> +#define LPASS_CLK_ID_TX_CORE_MCLK	57
> +#define LPASS_CLK_ID_TX_CORE_NPL_MCLK	58
> +#define LPASS_CLK_ID_RX_CORE_MCLK	59
> +#define LPASS_CLK_ID_RX_CORE_NPL_MCLK	60
> +#define LPASS_CLK_ID_VA_CORE_2X_MCLK	61
> +
> +#define LPASS_HW_AVTIMER_VOTE		101
> +#define LPASS_HW_MACRO_VOTE		102
> +#define LPASS_HW_DCODEC_VOTE		103
> +
> +#define Q6APM_MAX_CLK_ID			104
> +
> +#define LPASS_CLK_ATTRIBUTE_INVALID		0x0
> +#define LPASS_CLK_ATTRIBUTE_COUPLE_NO		0x1
> +#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVIDEND	0x2
> +#define LPASS_CLK_ATTRIBUTE_COUPLE_DIVISOR	0x3
> +
> +#endif /* __DT_BINDINGS_Q6_APM_H__ */
