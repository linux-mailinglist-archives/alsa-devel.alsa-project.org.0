Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A74C496F
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 16:45:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E2C1E7E;
	Fri, 25 Feb 2022 16:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E2C1E7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645803907;
	bh=f47cn1Kplw8bEVPU/7scXhOv3urE9BWf0pa3OAk5r0s=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qomqZeqBJwanEkFhjHLDioq7m6GeYx+2jYquWBVP5Qx2aLYgqS+ZmsXIja3q1tVV6
	 gj3G9NCZ0K8CPF925Xt6aTDgIjhxl+Q0o+RcWHIfUF6Juc4b2DjzKCA7mBTD5Cb/+s
	 gKYXwCfWcO4BOiATvIVsaKJH49VemeZ0wohsEsjQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50647F80159;
	Fri, 25 Feb 2022 16:44:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0877F80132; Fri, 25 Feb 2022 16:43:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B54AF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 16:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B54AF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VlfOtRC3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645803833; x=1677339833;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=f47cn1Kplw8bEVPU/7scXhOv3urE9BWf0pa3OAk5r0s=;
 b=VlfOtRC372iJjjBPvy2WBZRklDrgAYojICtqRnifElMMW1J26yKp8X8h
 atY2jxvVZk1hX/MSuFWKd4K7w5CzK950yd4ibZf+LkFRnR1SFTNOcOENI
 e9blbRTWdGOuK4NlILB63CUxvffj7XELvR1ZWqyJ4ftutGvYShjS40Y8o
 lZYiwyoZMtczx2rDszoibhgIJ7Yrx8PK+rnB7ti41Yt4E7F0exAvvCHCw
 3iMVKgjbrVezrjq7hfDTppNRLnuDx42kJso931/UupGvJyfFqE8yTT0Mz
 ogfU7flN68b0dvT50/xA6EbqknRppoqrr7EExC4j9k9LOIMY0a2D3WdkG A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252439719"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="252439719"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:43:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; d="scan'208";a="777438751"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 07:43:47 -0800
Message-ID: <06650d56-eed3-73ad-d6b4-6b56a5a70669@linux.intel.com>
Date: Fri, 25 Feb 2022 09:43:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: remove redundant wait for completion
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@codeaurora.org,
 perex@perex.cz, tiwai@suse.com, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
References: <1645800257-27025-1-git-send-email-quic_srivasam@quicinc.com>
 <a99a59eb-cd59-f566-b98d-486c94f32eec@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <a99a59eb-cd59-f566-b98d-486c94f32eec@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>
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



On 2/25/22 08:45, Srinivas Kandagatla wrote:
> 
> 
> On 25/02/2022 14:44, Srinivasa Rao Mandadapu wrote:
>> Remove wait_for_completion_timeout from soundwire probe as it seems
>> unnecessary and device enumeration is anyway not happening here,
>> hence this api is blocking till it completes max wait time.
>> Also, as device enumeration event is dependent on wcd938x probe to be
>> completed, its of no use waiting here.
>> Waiting here increasing the boot time almost 4 seconds and impacting
>> other modules like touch screen.
>>
>> Fixes: 06dd96738d618 ("soundwire: qcom: wait for enumeration to be
>> complete in probe")
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
>> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> 
> LGTM,
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

I don't get the idea, sorry.

If you look at the code, these are the cases where this 'struct
completion' is used

	struct completion enumeration;
	complete(&ctrl->enumeration);
	/* Enable Auto enumeration */
	init_completion(&ctrl->enumeration);
	wait_for_completion_timeout(&ctrl->enumeration,


so if you remove the wait_for_completeion, then you might just as well
remove the whole thing and revert 06dd96738d618

what am I missing?


>> ---
>>   drivers/soundwire/qcom.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index 5481341..9a32a24 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -1309,8 +1309,6 @@ static int qcom_swrm_probe(struct
>> platform_device *pdev)
>>       }
>>         qcom_swrm_init(ctrl);
>> -    wait_for_completion_timeout(&ctrl->enumeration,
>> -                    msecs_to_jiffies(TIMEOUT_MS));
>>       ret = qcom_swrm_register_dais(ctrl);
>>       if (ret)
>>           goto err_master_add;
