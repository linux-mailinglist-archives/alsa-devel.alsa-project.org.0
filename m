Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E44900192
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 13:04:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 481DF82B;
	Fri,  7 Jun 2024 13:04:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 481DF82B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717758285;
	bh=iqK4sXvyXYzwRawxLH7Qmttv0TpUxcESQppaLdEEsnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sbNQlQCNWKEVab7/yQ/s5YZottLia00ZZGrYoo7fMsVP0itKpfbUjbknpxe2zSM5X
	 Z4l2PHAlO1BA4M+5yIb3Q+ymzI59Ev3qc2Uddd3AAuWsC7JcwfFXCux4U+ova6eoRv
	 ipJ0eibjFMgFEFIcczVEW36AcMwhFbTZ5xOiKOJg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 950E8F80578; Fri,  7 Jun 2024 13:04:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4019F80578;
	Fri,  7 Jun 2024 13:04:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74734F804B2; Fri,  7 Jun 2024 13:04:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7492EF800AC
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 13:03:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7492EF800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WDeUcoSs
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2e72224c395so18934061fa.3
        for <alsa-devel@alsa-project.org>;
 Fri, 07 Jun 2024 04:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717758232; x=1718363032;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELTaPx5YTbXM+uNiIF/L+aaSl4VA6PsxXQKScV0FjyM=;
        b=WDeUcoSsAZsvT7ElE/7LXEVtEY8DfL+HXDIv30s0qzVr5K8WRqRdek2PQUxq7zzeAg
         VmHwJiaThS+ICmRxNcLReJMTv3VyR6HxxADnLCDnVfJMjRlPjsf2v7ooQYMQfHR8Hua6
         SrWyXMKSiib1bFkLtlSa4zeyH+cVy6ViYioSkxAdpxWQlsIyUHqO7+a7/1uj8JizMlQQ
         NJCvNZU9G0UgyUdcPaZBS9mN5mORYxtkU62xU2JNEtWbDfe7YiPocc/FOX3+RLrGe7Qt
         Go1UO0DddhZEglZjSOj4BXytENweOG3ys/nTsutW2DHl80z1K5E238d0rsmVpp13sJ12
         j/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717758232; x=1718363032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELTaPx5YTbXM+uNiIF/L+aaSl4VA6PsxXQKScV0FjyM=;
        b=it1hA1+zYw5bMLWk4tCcHnRsAElxy2upi5oEIKhW6DNixfTglIHc9QhpRPzjF2yLQo
         MCSq139UsvxdepUZZqTz4D6LGAx0pT5CMdtruD+xsq/bdoPC4PgR3OJQAWYelXdvtL4/
         0ScPk8k3xRhErJ16ORnT7COEfFfOKVJKrY9PaD443tSUGTHTT3uuX7LFGr8mzEaIfpO/
         0b1Qqf0GlbhYhtSO6P7SArAiWOJCSYc3KtC+JXnTikY5cihfc9clCywHbr+c4M56A00K
         niUl+pg5YnHblylqQuKFxsR/h3SIkLJfq7QTqIDjfIjnd3HrBH1jx4ZQ3BHvtodm9A7F
         mjiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNmhAEUkjtk7O86E1xxobdcm2Ve+FkvLZZNyA94Yu768dAXWi6j/VUJ4mlp/eTrrtQ24q+hftmTvRYXE2hOy+2G6gZh1RYd0RXukc=
X-Gm-Message-State: AOJu0YzNyH1/+w6NOS2tnPWQtsIf18p6NInvYjnU3nw4lchzUtq6Inv5
	DHZBs4rp9SsQK4rSKSTi524oNehD1SKtEIv9dfIjD3wJ2//e6xlwXDzChN2aIpQ=
X-Google-Smtp-Source: 
 AGHT+IEhWGOMR5X97P8Fo2mgAd+J/etXVja+ifCzLsW/ZWUAvf+VNwo9A9i6JB4oljzk7wS6Jg1shA==
X-Received: by 2002:a2e:2c19:0:b0:2e9:84f9:3e17 with SMTP id
 38308e7fff4ca-2eadce9253dmr14699141fa.50.1717758232226;
        Fri, 07 Jun 2024 04:03:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eae2c7e33esm1351191fa.0.2024.06.07.04.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:03:51 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:03:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org, neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
Message-ID: <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
Message-ID-Hash: BT6FOIWLIHFPJ5C6NYBCUBBDH4PQMQ7O
X-Message-ID-Hash: BT6FOIWLIHFPJ5C6NYBCUBBDH4PQMQ7O
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BT6FOIWLIHFPJ5C6NYBCUBBDH4PQMQ7O/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> LPASS Codec v2.5 has significant changes in the rx register offsets.
> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> after SM8450 have only Left working.
> 
> This patch adjusts the registers to accomdate 2.5 changes. With this
> fixed now L and R are functional on Headset playback.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
>  1 file changed, 410 insertions(+), 155 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index f35187d69cac..bb8ede0e7076 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -158,7 +158,7 @@
>  #define CDC_RX_INTR_CTRL_LEVEL0		(0x03C0)
>  #define CDC_RX_INTR_CTRL_BYPASS0	(0x03C8)
>  #define CDC_RX_INTR_CTRL_SET0		(0x03D0)
> -#define CDC_RX_RXn_RX_PATH_CTL(n)	(0x0400 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_CTL(rx, n)	(0x0400  + rx->rxn_reg_offset * n)

It's probably a stride or pitch, not an offset.

>  #define CDC_RX_RX0_RX_PATH_CTL		(0x0400)
>  #define CDC_RX_PATH_RESET_EN_MASK	BIT(6)
>  #define CDC_RX_PATH_CLK_EN_MASK		BIT(5)
> @@ -166,45 +166,47 @@
>  #define CDC_RX_PATH_PGA_MUTE_MASK	BIT(4)
>  #define CDC_RX_PATH_PGA_MUTE_ENABLE	BIT(4)
>  #define CDC_RX_PATH_PCM_RATE_MASK	GENMASK(3, 0)
> -#define CDC_RX_RXn_RX_PATH_CFG0(n)	(0x0404 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_CFG0(rx, n)	(0x0404  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RXn_COMP_EN_MASK		BIT(1)
>  #define CDC_RX_RX0_RX_PATH_CFG0		(0x0404)
>  #define CDC_RX_RXn_CLSH_EN_MASK		BIT(6)
>  #define CDC_RX_DLY_ZN_EN_MASK		BIT(3)
>  #define CDC_RX_DLY_ZN_ENABLE		BIT(3)
>  #define CDC_RX_RXn_HD2_EN_MASK		BIT(2)
> -#define CDC_RX_RXn_RX_PATH_CFG1(n)	(0x0408 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_CFG1(rx, n)	(0x0408  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RXn_SIDETONE_EN_MASK	BIT(4)
>  #define CDC_RX_RX0_RX_PATH_CFG1		(0x0408)
>  #define CDC_RX_RX0_HPH_L_EAR_SEL_MASK	BIT(1)
> -#define CDC_RX_RXn_RX_PATH_CFG2(n)	(0x040C + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_CFG2(rx, n)	(0x040C  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RXn_HPF_CUT_FREQ_MASK	GENMASK(1, 0)
>  #define CDC_RX_RX0_RX_PATH_CFG2		(0x040C)
> -#define CDC_RX_RXn_RX_PATH_CFG3(n)	(0x0410 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_CFG3(rx, n)	(0x0410  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RX0_RX_PATH_CFG3		(0x0410)
>  #define CDC_RX_DC_COEFF_SEL_MASK	GENMASK(1, 0)
>  #define CDC_RX_DC_COEFF_SEL_TWO		0x2
> -#define CDC_RX_RXn_RX_VOL_CTL(n)	(0x0414 + 0x80 * n)
> +#define CDC_RX_RXn_RX_VOL_CTL(rx, n)	(0x0414  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RX0_RX_VOL_CTL		(0x0414)
> -#define CDC_RX_RXn_RX_PATH_MIX_CTL(n)	(0x0418 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_MIX_CTL(rx, n)	(0x0418  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RXn_MIX_PCM_RATE_MASK	GENMASK(3, 0)
>  #define CDC_RX_RXn_MIX_RESET_MASK	BIT(6)
>  #define CDC_RX_RXn_MIX_RESET		BIT(6)
>  #define CDC_RX_RXn_MIX_CLK_EN_MASK	BIT(5)
>  #define CDC_RX_RX0_RX_PATH_MIX_CTL	(0x0418)
>  #define CDC_RX_RX0_RX_PATH_MIX_CFG	(0x041C)
> -#define CDC_RX_RXn_RX_VOL_MIX_CTL(n)	(0x0420 + 0x80 * n)
> +#define CDC_RX_RXn_RX_VOL_MIX_CTL(rx, n)	(0x0420  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RX0_RX_VOL_MIX_CTL	(0x0420)
>  #define CDC_RX_RX0_RX_PATH_SEC1		(0x0424)
>  #define CDC_RX_RX0_RX_PATH_SEC2		(0x0428)
>  #define CDC_RX_RX0_RX_PATH_SEC3		(0x042C)
> +#define CDC_RX_RXn_RX_PATH_SEC3(rx, n)	(0x042c  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RX0_RX_PATH_SEC4		(0x0430)
>  #define CDC_RX_RX0_RX_PATH_SEC7		(0x0434)
> +#define CDC_RX_RXn_RX_PATH_SEC7(rx, n)	(0x0434  + rx->rxn_reg_offset * n)
>  #define CDC_RX_DSM_OUT_DELAY_SEL_MASK	GENMASK(2, 0)
>  #define CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE	0x2
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC0	(0x0438)
>  #define CDC_RX_RX0_RX_PATH_MIX_SEC1	(0x043C)
> -#define CDC_RX_RXn_RX_PATH_DSM_CTL(n)	(0x0440 + 0x80 * n)
> +#define CDC_RX_RXn_RX_PATH_DSM_CTL(rx, n)	(0x0440  + rx->rxn_reg_offset * n)
>  #define CDC_RX_RXn_DSM_CLK_EN_MASK	BIT(0)
>  #define CDC_RX_RX0_RX_PATH_DSM_CTL	(0x0440)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA1	(0x0444)
> @@ -213,6 +215,7 @@
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA4	(0x0450)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA5	(0x0454)
>  #define CDC_RX_RX0_RX_PATH_DSM_DATA6	(0x0458)
> +/* RX offsets prior to 2.5 codec version */
>  #define CDC_RX_RX1_RX_PATH_CTL		(0x0480)
>  #define CDC_RX_RX1_RX_PATH_CFG0		(0x0484)
>  #define CDC_RX_RX1_RX_PATH_CFG1		(0x0488)
> @@ -259,10 +262,58 @@
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC0	(0x0544)
>  #define CDC_RX_RX2_RX_PATH_MIX_SEC1	(0x0548)
>  #define CDC_RX_RX2_RX_PATH_DSM_CTL	(0x054C)
> +
> +/* LPASS CODEC version 2.5 rx reg offsets */

Please separate 2.5 support into a separate patch.

> +#define CDC_2_5_RX_RX1_RX_PATH_CTL		(0x04c0)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG0		(0x04c4)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG1		(0x04c8)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG2		(0x04cC)
> +#define CDC_2_5_RX_RX1_RX_PATH_CFG3		(0x04d0)
> +#define CDC_2_5_RX_RX1_RX_VOL_CTL		(0x04d4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CTL		(0x04d8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_CFG		(0x04dC)
> +#define CDC_2_5_RX_RX1_RX_VOL_MIX_CTL		(0x04e0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC1		(0x04e4)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC2		(0x04e8)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC3		(0x04eC)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC4		(0x04f0)
> +#define CDC_2_5_RX_RX1_RX_PATH_SEC7		(0x04f4)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC0		(0x04f8)
> +#define CDC_2_5_RX_RX1_RX_PATH_MIX_SEC1		(0x04fC)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_CTL		(0x0500)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA1	(0x0504)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA2	(0x0508)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA3	(0x050C)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA4	(0x0510)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA5	(0x0514)
> +#define CDC_2_5_RX_RX1_RX_PATH_DSM_DATA6	(0x0518)
> +
> +#define CDC_2_5_RX_RX2_RX_PATH_CTL		(0x0580)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG0		(0x0584)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG1		(0x0588)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG2		(0x058C)
> +#define CDC_2_5_RX_RX2_RX_PATH_CFG3		(0x0590)
> +#define CDC_2_5_RX_RX2_RX_VOL_CTL		(0x0594)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CTL		(0x0598)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_CFG		(0x059C)
> +#define CDC_2_5_RX_RX2_RX_VOL_MIX_CTL		(0x05a0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC0		(0x05a4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC1		(0x05a8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC2		(0x05aC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC3		(0x05b0)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC4		(0x05b4)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC5		(0x05b8)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC6		(0x05bC)
> +#define CDC_2_5_RX_RX2_RX_PATH_SEC7		(0x05c0)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC0		(0x05c4)
> +#define CDC_2_5_RX_RX2_RX_PATH_MIX_SEC1		(0x05c8)
> +#define CDC_2_5_RX_RX2_RX_PATH_DSM_CTL		(0x05cC)
> +
>  #define CDC_RX_IDLE_DETECT_PATH_CTL	(0x0780)
>  #define CDC_RX_IDLE_DETECT_CFG0		(0x0784)
>  #define CDC_RX_IDLE_DETECT_CFG1		(0x0788)
>  #define CDC_RX_IDLE_DETECT_CFG2		(0x078C)
> +
>  #define CDC_RX_IDLE_DETECT_CFG3		(0x0790)
>  #define CDC_RX_COMPANDERn_CTL0(n)	(0x0800 + 0x40 * n)
>  #define CDC_RX_COMPANDERn_CLK_EN_MASK	BIT(0)
> @@ -598,6 +649,8 @@ struct rx_macro {
>  	int rx_mclk_users;
>  	int clsh_users;
>  	int rx_mclk_cnt;
> +	int codec_version;
> +	int rxn_reg_offset;
>  	bool is_ear_mode_on;
>  	bool hph_pwr_mode;
>  	bool hph_hd2_mode;
> @@ -755,11 +808,15 @@ static SOC_ENUM_SINGLE_DECL(rx_int1_2_interp_enum, SND_SOC_NOPM, 0,
>  			    rx_int1_2_interp_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_int2_2_interp_enum, SND_SOC_NOPM, 0,
>  			    rx_int2_2_interp_mux_text);
> +

unrelated?

>  static SOC_ENUM_SINGLE_DECL(rx_int0_dem_inp_enum, CDC_RX_RX0_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_int1_dem_inp_enum, CDC_RX_RX1_RX_PATH_CFG1, 0,
>  			    rx_int_dem_inp_mux_text);
>  
> +static SOC_ENUM_SINGLE_DECL(rx_2_5_int1_dem_inp_enum, CDC_2_5_RX_RX1_RX_PATH_CFG1, 0,
> +			    rx_int_dem_inp_mux_text);
> +
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx0_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx1_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);
>  static SOC_ENUM_SINGLE_DECL(rx_macro_rx2_enum, SND_SOC_NOPM, 0, rx_macro_mux_text);

[skipped all split default + add 2.5] chunks

>  static int rx_macro_component_probe(struct snd_soc_component *component)
>  {
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
>  	struct rx_macro *rx = snd_soc_component_get_drvdata(component);
> +	const struct snd_soc_dapm_widget *widgets;
> +	const struct snd_kcontrol_new *controls;
> +	unsigned int num_controls;
> +	int ret, num_widgets;
>  
>  	snd_soc_component_init_regmap(component, rx->regmap);
>  
> -	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_SEC7,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 0),
>  				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
>  				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
> -	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_SEC7,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 1),
>  				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
>  				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
> -	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_SEC7,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_SEC7(rx, 2),
>  				      CDC_RX_DSM_OUT_DELAY_SEL_MASK,
>  				      CDC_RX_DSM_OUT_DELAY_TWO_SAMPLE);
> -	snd_soc_component_update_bits(component, CDC_RX_RX0_RX_PATH_CFG3,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 0),
>  				      CDC_RX_DC_COEFF_SEL_MASK,
>  				      CDC_RX_DC_COEFF_SEL_TWO);
> -	snd_soc_component_update_bits(component, CDC_RX_RX1_RX_PATH_CFG3,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 1),
>  				      CDC_RX_DC_COEFF_SEL_MASK,
>  				      CDC_RX_DC_COEFF_SEL_TWO);
> -	snd_soc_component_update_bits(component, CDC_RX_RX2_RX_PATH_CFG3,
> +	snd_soc_component_update_bits(component, CDC_RX_RXn_RX_PATH_CFG3(rx, 2),
>  				      CDC_RX_DC_COEFF_SEL_MASK,
>  				      CDC_RX_DC_COEFF_SEL_TWO);
>  
> +	if (rx->codec_version >= LPASS_CODEC_VERSION_2_5) {
> +		controls = rx_macro_2_5_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
> +		widgets = rx_macro_2_5_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_2_5_dapm_widgets);
> +	} else {
> +		controls = rx_macro_def_snd_controls;
> +		num_controls = ARRAY_SIZE(rx_macro_def_snd_controls);
> +		widgets = rx_macro_def_dapm_widgets;
> +		num_widgets = ARRAY_SIZE(rx_macro_def_dapm_widgets);
> +	}
> +
>  	rx->component = component;
>  
> -	return 0;
> +	ret = snd_soc_add_component_controls(component, controls, num_controls);
> +	if (ret)
> +		return ret;
> +
> +	return snd_soc_dapm_new_controls(dapm, widgets, num_widgets);
>  }
>  
>  static int swclk_gate_enable(struct clk_hw *hw)
> @@ -3523,11 +3748,12 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
>  
>  static int rx_macro_probe(struct platform_device *pdev)
>  {
> +	struct reg_default *reg_defaults;
>  	struct device *dev = &pdev->dev;
>  	kernel_ulong_t flags;
>  	struct rx_macro *rx;
>  	void __iomem *base;
> -	int ret;
> +	int ret, def_count;
>  
>  	flags = (kernel_ulong_t)device_get_match_data(dev);
>  
> @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
>  		goto err;
>  	}
>  
> +	rx->codec_version = lpass_macro_get_codec_version();

What guarantees that VA macro has been probed already? If I'm not
mistaken, we might easily get a default '0' here instead of a correct
version.

> +	switch (rx->codec_version) {
> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> +		rx->rxn_reg_offset = 0xc0;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
> +		break;
> +	default:
> +		rx->rxn_reg_offset = 0x80;
> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> +		if (!reg_defaults)
> +			return -ENOMEM;
> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> +		break;
> +	}
> +
> +	rx_regmap_config.reg_defaults = reg_defaults,
> +	rx_regmap_config.num_reg_defaults = def_count;
> +
>  	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>  	if (IS_ERR(rx->regmap)) {
>  		ret = PTR_ERR(rx->regmap);
> @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_clkout;
>  
> +	kfree(reg_defaults);
>  	return 0;
>  
>  err_clkout:
> @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>  err_dcodec:
>  	clk_disable_unprepare(rx->macro);
>  err:
> +	kfree(reg_defaults);
>  	lpass_macro_pds_exit(rx->pds);
>  
>  	return ret;
> -- 
> 2.21.0
> 

-- 
With best wishes
Dmitry
