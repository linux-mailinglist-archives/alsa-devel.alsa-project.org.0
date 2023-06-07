Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 052B372654C
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Jun 2023 17:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F74C82A;
	Wed,  7 Jun 2023 17:58:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F74C82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686153532;
	bh=cZe/eY9WGZFDdbzJxKfNGQkftH/W4BRuRruN4kLXhu0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LjEmyUFTobfsSwhR/AQKcw8FLnOlt854vlzlLr/SS2xMAGquhNlUbPDgJsuFuN/mp
	 8tcOBPCEqZmWePJ5CRLSRnMV+YGbhHT4mzAr5hTjYWBw1T7tMP6AKSMa5EW9GfseRD
	 YuVAosux2w7BPMrEj7OufiEP1vnxYOdLPlsslBmY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 982D3F8055B; Wed,  7 Jun 2023 17:57:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ABF8F80549;
	Wed,  7 Jun 2023 17:57:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EDF2F80254; Wed,  7 Jun 2023 17:57:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26BFBF800C8
	for <alsa-devel@alsa-project.org>; Wed,  7 Jun 2023 17:56:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26BFBF800C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fuIDulRQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686153420; x=1717689420;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cZe/eY9WGZFDdbzJxKfNGQkftH/W4BRuRruN4kLXhu0=;
  b=fuIDulRQUJMc0lAxzgQAn7fbYehyvO1bT4IhWTGbK0ytxi+Cpl8MxmHK
   rn9qct+LL125+0ugl3wdxbHRJof8MFcG9LsyswG4Es7psxo+KaMZt6Hfl
   HBQfimViiBSo44mTzSxHhJRQ27JaXhLlOgRzHWCx/EgrmXIK8yV33fWjE
   m9Voxzx5PI8AkXVz9FekVEV5XZLS9aP/60J+QskfycGk7EtkI39dU4E0e
   eKtd5Ja3bb2Y2Gckavv0eoyH4WsPW40Smhi7xmhnucAfe0L9B2T0aZxZ6
   9Erqdr98z63/UI0WPto/dddIxSgJ1WFLigPx5cwur/MpellGyamV/4ViU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="360360061"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="360360061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="739335786"
X-IronPort-AV: E=Sophos;i="6.00,224,1681196400";
   d="scan'208";a="739335786"
Received: from sorrin-mobl3.amr.corp.intel.com (HELO [10.209.124.63])
 ([10.209.124.63])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 08:56:50 -0700
Message-ID: <5f647902-436a-ea1c-412e-30afbc4e71a8@linux.intel.com>
Date: Wed, 7 Jun 2023 09:51:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] soundwire: qcom: fix storing port config out-of-bounds
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
References: <20230601102525.609627-1-krzysztof.kozlowski@linaro.org>
 <ZICBvP33XyOswWFM@matsya> <c39dc157-bd3d-a627-4eb0-a34ff43ab664@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c39dc157-bd3d-a627-4eb0-a34ff43ab664@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NN6NHX2JU7PDE74XNCWJKEJKDMTQSSO7
X-Message-ID-Hash: NN6NHX2JU7PDE74XNCWJKEJKDMTQSSO7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NN6NHX2JU7PDE74XNCWJKEJKDMTQSSO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/7/23 08:51, Krzysztof Kozlowski wrote:
> On 07/06/2023 15:10, Vinod Koul wrote:
>> On 01-06-23, 12:25, Krzysztof Kozlowski wrote:
>>> The 'qcom_swrm_ctrl->pconfig' has size of QCOM_SDW_MAX_PORTS (14),
>>> however we index it starting from 1, not 0, to match real port numbers.
>>> This can lead to writing port config past 'pconfig' bounds and
>>> overwriting next member of 'qcom_swrm_ctrl' struct.  Reported also by
>>> smatch:
>>>
>>>   drivers/soundwire/qcom.c:1269 qcom_swrm_get_port_config() error: buffer overflow 'ctrl->pconfig' 14 <= 14
>>>
>>> Fixes: 9916c02ccd74 ("soundwire: qcom: cleanup internal port config indexing")
>>> Cc: <stable@vger.kernel.org>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Reported-by: Dan Carpenter <error27@gmail.com>
>>> Link: https://lore.kernel.org/r/202305201301.sCJ8UDKV-lkp@intel.com/
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>>  drivers/soundwire/qcom.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>>> index 7cb1b7eba814..88a772075907 100644
>>> --- a/drivers/soundwire/qcom.c
>>> +++ b/drivers/soundwire/qcom.c
>>> @@ -202,7 +202,8 @@ struct qcom_swrm_ctrl {
>>>  	u32 intr_mask;
>>>  	u8 rcmd_id;
>>>  	u8 wcmd_id;
>>> -	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS];
>>> +	/* Port numbers are 1 - 14 */
>>> +	struct qcom_swrm_port_config pconfig[QCOM_SDW_MAX_PORTS + 1];
>>
>> Better use SDW_MAX_PORTS ?
> 
> That's interesting idea, but except of value, is the meaning actually
> the same? Driver claims that port 0 is masked and max number of ports is
> 14. Therefore it uses in all places constant QCOM_SDW_MAX_PORTS. We need
> here +1, only because we index from 1, not 0, but we still index over
> QCOM_SDW_MAX_PORTS, not SDW_MAX_PORTS. Wouldn't it be also confusing to
> use here SDW_MAX_PORTS but then index over something else?

SDW_MAX_PORTS only applies for the peripheral. DP0 is reserved for
non-audio/Bulk request, DP15 is an alias for "all ports"

There's nothing in the spec that restricts the ports on the manager
side, be it to dedicate Port0 or Port15 to a specific purpose or even
the number of ports.

I would recommend using a vendor-specific definition rather than
overloading a peripheral specification requirement.
