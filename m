Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A89706EB0
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:51:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFBC206;
	Wed, 17 May 2023 18:50:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFBC206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684342306;
	bh=1FDXaOvMiv/7nzig5qwdhuEpYL+zWHcV8CYwzpgWZu4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=gq3ehAVGJ8zrUI1zwFk5VGPOxZg1wKmtaZf0W8J7lILNmBdU3niI+7m9j1lwouETd
	 QngZJJXCEQ8W+bL2SL/nBrf2HBMpQ8+kEtd8/cVV0PipGwpHDdUl5mSEoJfyfZBYL4
	 KjUChS6wS1XIv7vbQAncH5WQePJcJQYuOMkz1Ny8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EABBF80551; Wed, 17 May 2023 18:50:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B5B8F802E8;
	Wed, 17 May 2023 18:50:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C850F80272; Wed, 17 May 2023 18:50:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2DB8F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2DB8F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=X7iqKn2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684342200; x=1715878200;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=1FDXaOvMiv/7nzig5qwdhuEpYL+zWHcV8CYwzpgWZu4=;
  b=X7iqKn2Ai200dwzWHL6vzyC4vf1cVfgI16OLi2T8V2HNXZz9RxHPSpIf
   bJ66UUKEG1DEg2sOw3Ze5e2ziWadzM1gs7pwE9abYmxDG1SQzqzhGlhmQ
   SGTI2zbN7WlJYkXRSiW4Gm6laELspqhNnE/IhFOg7Hwt1sD00DOR3aDHN
   LI1b2VLx6llGZDDv0vvsSZ3DYqqgBcIAgJ+Fp+pHZwXNR/nQuoHxF8F0S
   W2wicf9Xak9UT1bI6IdB6NFf3Jfhm78a5TA/b+hPDQph9QtWDQB/l3er6
   vJywsfxnc8SQtK4ika59kOTQYASGpH/4Bo347RbvxeZb+eAbmAMauqdTc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="350649358"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="350649358"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:48:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="734764317"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200";
   d="scan'208";a="734764317"
Received: from pgopdahl-mobl1.amr.corp.intel.com (HELO [10.209.16.196])
 ([10.209.16.196])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2023 09:48:48 -0700
Message-ID: <7bcb1ee2-3950-5a43-14ee-5f16942b1eee@linux.intel.com>
Date: Wed, 17 May 2023 11:47:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] soundwire: qcom: fix unbalanced pm_runtime_put()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230517163750.997629-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: B774IZKZJL3T5B6EKNQ7WV5QXHIIBPFC
X-Message-ID-Hash: B774IZKZJL3T5B6EKNQ7WV5QXHIIBPFC
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 5/17/23 11:37, Krzysztof Kozlowski wrote:
> This reverts commit 57ed510b0547 ("soundwire: qcom: use
> pm_runtime_resume_and_get()") which introduced unbalanced
> pm_runtime_put(), when device did not have runtime PM enabled.
> 
> If pm_runtime_resume_and_get() failed with -EACCES, the driver continued
> execution and finally called pm_runtime_put_autosuspend().  Since
> pm_runtime_resume_and_get() drops the usage counter on every error, this
> lead to double decrement of that counter visible in certain debugfs
> actions on unattached devices (still in reset state):
> 
>   $ cat /sys/kernel/debug/soundwire/master-0-0/sdw:0:0217:f001:00:0/registers
>   qcom-soundwire 3210000.soundwire-controller: swrm_wait_for_wr_fifo_avail err write overflow
>   soundwire sdw-master-0: trf on Slave 1 failed:-5 read addr e36 count 1
>   soundwire sdw:0:0217:f001:00:0: Runtime PM usage count underflow!
> 
> Fixes: 57ed510b0547 ("soundwire: qcom: use pm_runtime_resume_and_get()")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Yes, this resume_and_get() added more problems indeed. One of those
well-intended changes that went sideways.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> ---
>  drivers/soundwire/qcom.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index aad5942e5980..f442280af9d3 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -614,11 +614,12 @@ static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
>  	struct qcom_swrm_ctrl *ctrl = dev_id;
>  	int ret;
>  
> -	ret = pm_runtime_resume_and_get(ctrl->dev);
> +	ret = pm_runtime_get_sync(ctrl->dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err_ratelimited(ctrl->dev,
> -				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>  				    __func__, ret);
> +		pm_runtime_put_noidle(ctrl->dev);
>  		return ret;
>  	}
>  
> @@ -1197,11 +1198,12 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> -	ret = pm_runtime_resume_and_get(ctrl->dev);
> +	ret = pm_runtime_get_sync(ctrl->dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err_ratelimited(ctrl->dev,
> -				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>  				    __func__, ret);
> +		pm_runtime_put_noidle(ctrl->dev);
>  		return ret;
>  	}
>  
> @@ -1402,11 +1404,12 @@ static int swrm_reg_show(struct seq_file *s_file, void *data)
>  	struct qcom_swrm_ctrl *ctrl = s_file->private;
>  	int reg, reg_val, ret;
>  
> -	ret = pm_runtime_resume_and_get(ctrl->dev);
> +	ret = pm_runtime_get_sync(ctrl->dev);
>  	if (ret < 0 && ret != -EACCES) {
>  		dev_err_ratelimited(ctrl->dev,
> -				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
>  				    __func__, ret);
> +		pm_runtime_put_noidle(ctrl->dev);
>  		return ret;
>  	}
>  
