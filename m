Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 992BE9B7AE
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Aug 2019 22:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C89A84A;
	Fri, 23 Aug 2019 22:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C89A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566592296;
	bh=/dJgLmpQAFN4WmFHseNBvaWXgoNweR2ok386+xngBVE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTAgBFU/0Yap0gDi45/BkHJBsxMc8BI+B9VC3P+Osk+EPKnmP69E6Sr4AShF7Zoj/
	 qLi4zIcAFLrsqBA2+QyCMecuJXbPzVFlADJ/xJS2K8fPu/ySt6X5ZjxJWAQQo6wZYO
	 bDSUM1XzmVmnb4mZB2dlYVcNwf3/Qsaljt53S16U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE8BEF8036B;
	Fri, 23 Aug 2019 22:28:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED133F805FC; Fri, 23 Aug 2019 22:28:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 799BEF80306
 for <alsa-devel@alsa-project.org>; Fri, 23 Aug 2019 22:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 799BEF80306
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Aug 2019 13:28:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,422,1559545200"; d="scan'208";a="354718158"
Received: from tlchoatx-mobl1.amr.corp.intel.com (HELO [10.254.187.90])
 ([10.254.187.90])
 by orsmga005.jf.intel.com with ESMTP; 23 Aug 2019 13:27:59 -0700
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
 <20190822190425.23001-5-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <90bbda82-3988-d02d-0d5d-e63890db81dc@linux.intel.com>
Date: Fri, 23 Aug 2019 13:40:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190822190425.23001-5-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: broonie@kernel.org, tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 04/35] ASoC: Intel: Skylake: Unify firmware
 loading mechanism
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> -int skl_sst_init_fw(struct device *dev, struct skl_dev *skl)
> +int skl_sst_init_fw(struct skl_dev *skl)
>   {
> -	int ret;
>   	struct sst_dsp *sst = skl->dsp;
> +	struct device *dev = skl->dev;
> +	int (*lp_check)(struct sst_dsp *dsp, bool state);
> +	int ret;
> +
> +	lp_check = skl->ipc.ops.check_dsp_lp_on;
> +	skl->enable_miscbdcge(dev, false);
> +	skl->clock_power_gating(dev, false);
>   
>   	ret = sst->fw_ops.load_fw(sst);
>   	if (ret < 0) {
>   		dev_err(dev, "Load base fw failed : %d\n", ret);
> -		return ret;
> +		goto exit;
> +	}
> +
> +	if (!skl->is_first_boot)
> +		goto library_load;
> +	/* Disable power check during cfg setup */
> +	skl->ipc.ops.check_dsp_lp_on = NULL;

It's very odd to play with .ops callback dynamically. Usually ops are 
constant, and if you want to disable them you add a flag.

> +
> +	ret = skl_ipc_fw_cfg_get(&skl->ipc, &skl->fw_cfg);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get fw cfg: %d\n", ret);
> +		goto exit;
> +	}
> +
> +	ret = skl_ipc_hw_cfg_get(&skl->ipc, &skl->hw_cfg);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get hw cfg: %d\n", ret);
> +		goto exit;
>   	}
>   
>   	skl_dsp_init_core_state(sst);
>   
> +library_load:
>   	if (skl->lib_count > 1) {
>   		ret = sst->fw_ops.load_library(sst, skl->lib_info,
>   						skl->lib_count);
>   		if (ret < 0) {
> -			dev_err(dev, "Load Library failed : %x\n", ret);
> -			return ret;
> +			dev_err(dev, "Load library failed : %x\n", ret);
> +			goto exit;
>   		}
>   	}
> +
>   	skl->is_first_boot = false;
> +exit:
> +	skl->ipc.ops.check_dsp_lp_on = lp_check;
> +	skl->enable_miscbdcge(dev, true);
> +	skl->clock_power_gating(dev, true);
>   
> -	return 0;
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(skl_sst_init_fw);
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
