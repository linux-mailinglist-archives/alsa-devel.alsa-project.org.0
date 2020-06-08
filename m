Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F581F219C
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 23:48:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06151675;
	Mon,  8 Jun 2020 23:47:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06151675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591652893;
	bh=tNy21gfkfdVl1PmE1WlRMoD/y+F7VOV1BHYyfO8u8Ok=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXW7JsF3whATOjLwLcLxLWPuQa9T8Hv2HDMNhXF3XM+24oVEpXEVGzyuripPiOhjp
	 DLDqGs1TrgiSI3jUdB3UQXODNz+I4rIVpt5cBFSWVaTDJQ6AzCNHT4AGEIxiv96CFi
	 bp0ysl1tlubj6ELHfLVr8g3yAUf23/JQYuk2d+9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7E11F802A8;
	Mon,  8 Jun 2020 23:45:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1593F8021C; Mon,  8 Jun 2020 23:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63C6DF8021C
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 23:45:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C6DF8021C
IronPort-SDR: cEMEyZ/lIYJ7DVF97UVDCtCiZxot94ERpo7UM6TwnCeKRxwZ+rd1oDtmDpkLlplxIkkZ0kOlYY
 wMzASJ2LLG6w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 14:45:11 -0700
IronPort-SDR: DU8R5tImE9vZHiPtIilv5iHBhl5CA8wcR6ayCC7WH33b+u2Avrt89QbWBRmW4gjEd5SLowwSa9
 wtm8NtaPcy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; d="scan'208";a="446893866"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO [10.254.104.56])
 ([10.254.104.56])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 14:45:10 -0700
Subject: Re: [PATCH 4/5] soundwire: qcom: avoid dependency on CONFIG_SLIMBUS
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-5-jonathan@marek.ca>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <33017798-9546-12dc-b857-493f56c3d557@linux.intel.com>
Date: Mon, 8 Jun 2020 16:20:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-5-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
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



On 6/8/20 3:43 PM, Jonathan Marek wrote:
> The driver may be used without slimbus, so don't depend on slimbus.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/Kconfig | 1 -
>   drivers/soundwire/qcom.c  | 5 +++++
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soundwire/Kconfig b/drivers/soundwire/Kconfig
> index fa2b4ab92ed9..d121cf739090 100644
> --- a/drivers/soundwire/Kconfig
> +++ b/drivers/soundwire/Kconfig
> @@ -33,7 +33,6 @@ config SOUNDWIRE_INTEL
>   
>   config SOUNDWIRE_QCOM
>   	tristate "Qualcomm SoundWire Master driver"
> -	depends on SLIMBUS
>   	depends on SND_SOC
>   	help
>   	  SoundWire Qualcomm Master driver.
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 14334442615f..ac81c64768ea 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -769,13 +769,18 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	if (!ctrl)
>   		return -ENOMEM;
>   
> +#ifdef CONFIG_SLIMBUS
>   	if (dev->parent->bus == &slimbus_bus) {
> +#else
> +	if (false) {
> +#endif


maybe:

if (IS_ENABLED(CONFIG_SLIMBUS) &&
     dev->parent->bus == &slimbus_bus)


>   		ctrl->reg_read = qcom_swrm_ahb_reg_read;
>   		ctrl->reg_write = qcom_swrm_ahb_reg_write;
>   		ctrl->regmap = dev_get_regmap(dev->parent, NULL);
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> +
>   		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   
>   		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> 
