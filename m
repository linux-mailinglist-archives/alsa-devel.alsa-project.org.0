Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCCE6D8056
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 17:03:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 957DE1E7;
	Wed,  5 Apr 2023 17:02:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 957DE1E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680707020;
	bh=dFlO+IoyPt/cvrM8e5U9Z6n3Lak/MZq3BRfErTyVWhM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OJ1y6msyTJImDhMkSq846lsGqQWbBrqXVU+bM1w6M5CMm6eAfvHRA+qVS6fikL/WA
	 MRVc4BMaM7mn41YXYUCa/ZWnWPemYF1ir5KyWFzWCd7pRXJSUfJtX4wlov65DB7wWE
	 1a/Qv1BHfzg3mFpijaEII9K2/6XgH4jf4Xwu1JsA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 09EBCF801C0;
	Wed,  5 Apr 2023 17:02:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC5ABF8024C; Wed,  5 Apr 2023 17:02:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F83EF8015B
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 17:02:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F83EF8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KZCcmhIP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680706956; x=1712242956;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=dFlO+IoyPt/cvrM8e5U9Z6n3Lak/MZq3BRfErTyVWhM=;
  b=KZCcmhIPBQuATTdMgkcTwvxe/hDkC+hO3Ehbi85z0BcTKYOyzMUkfV4c
   yz03bQmIlm86AfMo7+RxGDxznukt0Es7HsujOf9osiYMMevtkPvY1KW96
   ZwebQhYVKSYl/xDGayTVyDQ2y5Xw4oDKuj9CMfqbHpqld0RpcoqOohyGS
   hIIjkqb29jYsxsn1h6RtVkNJakFFo+/gpjClk9E6UCvnvOc2dCfyAPvMg
   M/dmn1n66KZVJHG+H2pwTaYQOUxp1V1456aOlihF2d3DZDQsCddpTJXor
   8KVqwW90r9tW6wLpMptfKEJBQoM58afvs6AyQm5pJKpQL+j6m8VJCZo9A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="407559720"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400";
   d="scan'208";a="407559720"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686779878"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400";
   d="scan'208";a="686779878"
Received: from mlokuyad-mobl.amr.corp.intel.com (HELO [10.212.149.36])
 ([10.212.149.36])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 08:01:56 -0700
Message-ID: <ecc13046-1a4f-77e7-c4dc-a5a4c1248572@linux.intel.com>
Date: Wed, 5 Apr 2023 10:01:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] soundwire: qcom: Fix enumeration of second device on the
 bus
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20230405142926.842173-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230405142926.842173-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DQBQMQVEOMQ3LIAALSB2TIYLSKOGIBL7
X-Message-ID-Hash: DQBQMQVEOMQ3LIAALSB2TIYLSKOGIBL7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: stable@vger.kernel.org, Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQBQMQVEOMQ3LIAALSB2TIYLSKOGIBL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/5/23 09:29, Krzysztof Kozlowski wrote:
> Some Soundwire buses (like &swr0 on Qualcomm HDK8450) have two devices,
> which can be brought from powerdown state one after another.  We need to
> keep enumerating them on each slave attached interrupt, otherwise only
> first will appear.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: a6e6581942ca ("soundwire: qcom: add auto enumeration support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Cc: Patrick Lai <quic_plai@quicinc.com>
> ---
>  drivers/soundwire/qcom.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index c296e0bf897b..1e5077d91f59 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -587,14 +587,9 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
>  				dev_dbg_ratelimited(swrm->dev, "SWR new slave attached\n");
>  				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
> -				if (swrm->slave_status == slave_status) {
> -					dev_dbg(swrm->dev, "Slave status not changed %x\n",
> -						slave_status);

it's not clear to me how removing this test helps with the two-device
configuration?

Or is this a case where the status for both devices changes at the same
time but the interrupt status remains set, so the next iteration of the
loop is ignored?

> -				} else {
> -					qcom_swrm_get_device_status(swrm);
> -					qcom_swrm_enumerate(&swrm->bus);
> -					sdw_handle_slave_status(&swrm->bus, swrm->status);
> -				}
> +				qcom_swrm_get_device_status(swrm);
> +				qcom_swrm_enumerate(&swrm->bus);
> +				sdw_handle_slave_status(&swrm->bus, swrm->status);
>  				break;
>  			case SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET:
>  				dev_err_ratelimited(swrm->dev,
