Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1F690D1D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:36:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6380BDF4;
	Thu,  9 Feb 2023 16:35:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6380BDF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675956972;
	bh=QsleGwQt2tIddWytBaD5JbNmXTkOYJR8IEaq6F4sxO8=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EDmdRcPasdfh9Pm4jPTHVW8jqw3+vYLVwd3aarSE07X4kicMocEM/2m2pL4zzUCzY
	 plcLUONGd6+GWPmhggpc+4tqxCD5bKGcwg+yJGaOEp+FaigR8hcYvqwXnHIaqIaCa1
	 Jgra+RbYDDFs3wz+gQda48EAtanv2rBjf6HxHvVI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2791CF800E4;
	Thu,  9 Feb 2023 16:35:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B0B07F8021D; Thu,  9 Feb 2023 16:35:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2B28F80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:35:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2B28F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IKx6SuIb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675956908; x=1707492908;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=QsleGwQt2tIddWytBaD5JbNmXTkOYJR8IEaq6F4sxO8=;
  b=IKx6SuIbiRzy0RpT8lZTvSFUvpKjoWFqV9IgfvfEqJvKNSdBMyK0wJba
   cieGn0bIG2Rfb8wkvLk5X6t7JU5wQZUB869VGghg1Zt3+YAD/88/i1XV9
   o+eFJUFE2xO00XvTInB1RvNYyMIqmp4yfXNTFlsK8WgxWAYj5Py1NZZwG
   7CQ8iY4bDvXMsAkdfJ5Tm31TKCnb/m8ffy3nsu1Yn+sP/7JHKw8BtMf4Q
   n/t03DO8xLd5qWU+fcr+mJLZ2z2p/u9ycHGix5eMASoKwfqWu8WPkUOzK
   tM+vQA71ElMWb4yMtiq9lgPq03MjwP/3hgm2IK9BnY4iFptHBaFl7KIpT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309782432"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="309782432"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:04 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776528830"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="776528830"
Received: from fpastor-mobl4.amr.corp.intel.com (HELO [10.212.74.130])
 ([10.212.74.130])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:03 -0800
Message-ID: <92a2560a-74cd-aa13-fea6-7619e355b26e@linux.intel.com>
Date: Thu, 9 Feb 2023 09:21:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 2/5] soundwire: qcom: enable runtime pm before controller
 is registered
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-3-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230209131336.18252-3-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VHHP7KNZR4TJZQWHQKBIGCP5TDMYRXZY
X-Message-ID-Hash: VHHP7KNZR4TJZQWHQKBIGCP5TDMYRXZY
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VHHP7KNZR4TJZQWHQKBIGCP5TDMYRXZY/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/23 07:13, Srinivas Kandagatla wrote:
> Registering controller even before pm runtime is enabled will result
> in pm runtime underflow warnings. Fix this by properly moving
> the runtime pm enable before registering controller.

That seems very odd. The Intel code configures the pm_runtime stuff
*after* the call to sdw_bus_master_add(), and we've not seen any
underflow warnings? We even configure pm_runtime after starting the bus.
Likewise for peripherals the pm_runtime part is enabled after the device
is initialized.

Not following the problem and suggested solution.

> Fixes: 74e79da9fd46 ("soundwire: qcom: add runtime pm support")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9d8ae77bad0a..b2363839624c 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1417,6 +1417,12 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>  	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
>  	if (ret) {
>  		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
> @@ -1435,12 +1441,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
>  		 ctrl->version & 0xffff);
>  
> -	pm_runtime_set_autosuspend_delay(dev, 3000);
> -	pm_runtime_use_autosuspend(dev);
> -	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> -
>  	/* Clk stop is not supported on WSA Soundwire masters */
>  	if (ctrl->version <= 0x01030000) {
>  		ctrl->clock_stop_not_supported = true;
