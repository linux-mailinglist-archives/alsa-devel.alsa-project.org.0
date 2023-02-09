Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05651690D1F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:37:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2B37DF0;
	Thu,  9 Feb 2023 16:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2B37DF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675957022;
	bh=lBCEUSoK05IPzjUXn4+2V8MmciXUhTpk+OYzlHyef5M=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fp1NN1WikJsCzsMCSM6kd4DpqUYvUbPp2Gtoj0bYZAb1UrqvFbU9s2ck6IVDGcq81
	 iIUeZVXbD4mzBYAWB4Vuc/WT648vzOi4AM9B6KOnKRv+wayeqZjccfG5MxqJfjlGvw
	 rPK4HMX9IGylpju15rHmv8e2AD8B757rDwLj3neM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE6ACF804F2;
	Thu,  9 Feb 2023 16:35:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C7B0F8018A; Thu,  9 Feb 2023 16:35:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1BFD6F800E4
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:35:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BFD6F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ove7kRXe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675956910; x=1707492910;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lBCEUSoK05IPzjUXn4+2V8MmciXUhTpk+OYzlHyef5M=;
  b=Ove7kRXeYolLDiNcU8sA+xs3HgE+wx1Yn/s6zXR8HnM2/m335TGIDGDz
   vy37o8qsCEDgY/0VnNx+oIs69yd4BIV/aXCWRKbxMlazXKR1R3oW9WGFz
   A3J5t77iz55uu1V+1JqTbQaHh7sUpEo9J4hodhnNoM9sp/GCRN/UAzLiY
   j9tpJcSzakrAShJisIWYcX0Wf8CrG1Xba/zJGc615NfPcd+P4LngQLgTG
   YBBM1ZdAMl9EEmFO3PYlWky1hecVRU0vFnHxcH86ifDM2Is7oKfOEyvg5
   zhXTmBSUuOyfCxA7WrJkrMIFopHyzQdVAIV+vm2TUeCD552jU18aqQLKQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309782448"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="309782448"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="776528834"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000";
   d="scan'208";a="776528834"
Received: from fpastor-mobl4.amr.corp.intel.com (HELO [10.212.74.130])
 ([10.212.74.130])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2023 07:35:05 -0800
Message-ID: <2680bb04-0a58-1914-44a4-a51d5aebb8f1@linux.intel.com>
Date: Thu, 9 Feb 2023 09:33:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 5/5] soundwire: qcom: set clk stop need reset flag at
 runtime
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230209131336.18252-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KW6Q5BYRZPBDUUSPEGATKIHTB2AJCGTR
X-Message-ID-Hash: KW6Q5BYRZPBDUUSPEGATKIHTB2AJCGTR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KW6Q5BYRZPBDUUSPEGATKIHTB2AJCGTR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 2/9/23 07:13, Srinivas Kandagatla wrote:
> WSA Soundwire controller needs an full reset if clock stop support
> is not available in slave devices. WSA881x does not support clock stop
> however WSA883x supports clock stop.
> 
> Make setting this flag at runtime to address above issue.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 74e38c0d651b..0224a5a866de 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -536,10 +536,14 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>  
>  		sdw_extract_slave_id(bus, addr, &id);
>  		found = false;
> +		ctrl->clock_stop_not_supported = false;
>  		/* Now compare with entries */
>  		list_for_each_entry_safe(slave, _s, &bus->slaves, node) {
>  			if (sdw_compare_devid(slave, id) == 0) {
>  				qcom_swrm_set_slave_dev_num(bus, slave, i);
> +				if (!slave->prop.simple_clk_stop_capable)
> +					ctrl->clock_stop_not_supported = true;

IIRC the 'simple_clk_stop_capable' for a peripheral refers to the
Simplified_SCSP_SM

see Figure 35 "Slave Clock Stop Prepare State Machine (SCSP_SM)"

In addition, there's a requirement that all peripherals shall support
ClockStopMode0. Only ClockStopMode1 is optional, and that case is
handled with a different property:

 * @clk_stop_mode1: Clock-Stop Mode 1 is supported

I think you overloaded one concept with another, or used the wrong property?

> +
>  				found = true;
>  				break;
>  			}
> @@ -1500,15 +1504,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
>  		 ctrl->version & 0xffff);
>  
> -	/* Clk stop is not supported on WSA Soundwire masters */
> -	if (ctrl->version <= 0x01030000) {
> -		ctrl->clock_stop_not_supported = true;
> -	} else {
> -		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
> -		if (val == MASTER_ID_WSA)
> -			ctrl->clock_stop_not_supported = true;
> -	}
> -
>  #ifdef CONFIG_DEBUG_FS
>  	ctrl->debugfs = debugfs_create_dir("qualcomm-sdw", ctrl->bus.debugfs);
>  	debugfs_create_file("qualcomm-registers", 0400, ctrl->debugfs, ctrl,
