Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE974405D4
	for <lists+alsa-devel@lfdr.de>; Sat, 30 Oct 2021 01:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81E391709;
	Sat, 30 Oct 2021 01:35:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81E391709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635550582;
	bh=32exTaJtYDGm8XzSQm+IX/ZIvXvPwXcV5pftWwyVffk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVoqCiifkYvf6KUJC81bp6vJPJd2qkwltZe6ynX/cTNJD0ovSeVkZD91QepRTEAIJ
	 Efx+RSJZ7H2K8IXH4CNjynTUo+vlUT8G8c3USO0m2XlDzFM862S/WYeUEPw3hF/R+k
	 Pca6vShjZ9JWCpiibocvURP2e7f9ByJKjjn8oBSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D71ACF8025E;
	Sat, 30 Oct 2021 01:35:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5FA7F8025A; Sat, 30 Oct 2021 01:35:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8E78F800F4
 for <alsa-devel@alsa-project.org>; Sat, 30 Oct 2021 01:34:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E78F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="YK4TYPb3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
 Subject:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=j7tHi0E9ih/9DxtgnPEaBt+ylaL3mB87At5hWcxuYws=; b=YK4TYPb3aLg1TwJlPFgKath8XD
 2Nh8o4rROJjgQ6rxBPbrktgRo1BsIZ4IHrYuB0zeQ7UvC4Z/fAkH90msTRchu7lytqOC4RHBKfbjX
 22+3tU+gAV+fZTuDEUlRkCCnbm/RSiUSdDZGpefHfL7MgbopbTieGnsRmrU4X7FDPw5xAWij9d/6V
 iWMXQMTsQ1I28JzjaqOiWaI2sLo3Y2zlrjDboRslvmWI5TVLKFCbZ69tRECJ4Z5s5DlXcoo/vtbhv
 IDqyT+h4ma31IiU+PDlgxZJbkGUYUsTVaGHL4ZM6jsYH84aTRhIfB7UgQoL8kl5ufxHBGaFPwOlTn
 LBJ1VOnw==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgbOY-00CWMP-Uz; Fri, 29 Oct 2021 23:34:47 +0000
Subject: Re: [PATCH v4 2/2] ASoC: qcom: SC7280: Add machine driver
To: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org
References: <1635519876-7112-1-git-send-email-srivasam@codeaurora.org>
 <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4d1ca1b5-6656-1b3b-65a0-c05c92824d18@infradead.org>
Date: Fri, 29 Oct 2021 16:34:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635519876-7112-3-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 10/29/21 8:04 AM, Srinivasa Rao Mandadapu wrote:
> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index cc7c1de..d9ffcb7 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -152,4 +152,16 @@ config SND_SOC_SC7180
>   	  SC7180 SoC-based systems.
>   	  Say Y if you want to use audio device on this SoCs.
>   
> +config SND_SOC_SC7280
> +	tristate "SoC Machine driver for SC7280 boards"
> +	depends on I2C && SOUNDWIRE
> +	select SND_SOC_QCOM_COMMON
> +	select SND_SOC_MAX98357A
> +	select SND_SOC_LPASS_RX_MACRO
> +	select SND_SOC_LPASS_TX_MACRO
> +	help
> +	  To add support for audio on Qualcomm Technologies Inc.
> +	  SC7280 SoC-based systems.
> +	  Say Y if you want to use audio device on this SoCs.

	  Say Y or M if you want to use audio devices on this SoC.

-- 
~Randy
