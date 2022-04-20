Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07D22508EBA
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Apr 2022 19:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A06151AD4;
	Wed, 20 Apr 2022 19:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A06151AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650476615;
	bh=rbZu7eWEid6dNs7PEy4WsbHQMUyRtvOvvbZT7aD6MhU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxEQ18EUG3f/1/8V3SRz7KA5Yx83G2VYDzfMkdBfxT3HATJyzHD7cuzF3CsHrlsNx
	 v5n4iS1DvqwUNP15P4V7pcrlg8RFjXXfam0ZNPiFxPs5KCCuQ5kZeDpD1mOaJ32rFe
	 Oz5oVMRwkdWrapYHNVEm47cqpfj3l4zp4z2KIx/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A447F8010B;
	Wed, 20 Apr 2022 19:42:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67AE4F80254; Wed, 20 Apr 2022 19:42:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0603AF800F8
 for <alsa-devel@alsa-project.org>; Wed, 20 Apr 2022 19:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0603AF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AePhtwM4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650476522; x=1682012522;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rbZu7eWEid6dNs7PEy4WsbHQMUyRtvOvvbZT7aD6MhU=;
 b=AePhtwM4/eSG3KDauBXk6rdC8lT5QcresEowFmNLwu8UlYRlTxgtjyxr
 L+WpnUTNh2PgzkmSVSy8LCnYEIF1AmKIxEHeK+S2dKA9QwfYueDlCJtYL
 Z8oE/+7rbjeU97CoNbE89wZYCzTS92LL1eB5d4H11br7qxjm3HJ5itdw/
 8i8Wo+AG3DybiUKC/iGWtTdizdodBQsUjvEBspYx8FbaliSAcXWcy3yL9
 mdBJT8kmv4yaGPOs0HbZbqc8yFrrGpwgC+B2R5lCgsinbN7ymsO1qxg0s
 stz7fcxem1+VgHK5tOMEkaVO01rlq5Dn8sPWa4sCj9IUS9mwLhVQTtyTl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="327006923"
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="327006923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:40:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,276,1643702400"; d="scan'208";a="576712395"
Received: from sbidasar-mobl.amr.corp.intel.com (HELO [10.209.100.171])
 ([10.209.100.171])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2022 10:40:56 -0700
Message-ID: <10eb3973-03c4-74cd-d28a-014fc280cdf8@linux.intel.com>
Date: Wed, 20 Apr 2022 12:39:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228172528.3489-2-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, quic_srivasam@quicinc.com
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



> @@ -1017,6 +1032,15 @@ static int qcom_swrm_startup(struct snd_pcm_substream *substream,
>  	struct snd_soc_dai *codec_dai;
>  	int ret, i;
>  
> +	ret = pm_runtime_get_sync(ctrl->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_err_ratelimited(ctrl->dev,
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
> +				    __func__, ret);
> +		pm_runtime_put_noidle(ctrl->dev);
> +		return ret;

here there's an error handling, but ...

> +	}
> +
>  	sruntime = sdw_alloc_stream(dai->name);
>  	if (!sruntime)
>  		return -ENOMEM;
> @@ -1044,6 +1068,9 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
>  
>  	sdw_release_stream(ctrl->sruntime[dai->id]);
>  	ctrl->sruntime[dai->id] = NULL;
> +	pm_runtime_mark_last_busy(ctrl->dev);
> +	pm_runtime_put_autosuspend(ctrl->dev);
> +
>  }
>  
>  static const struct snd_soc_dai_ops qcom_swrm_pdm_dai_ops = {
> @@ -1197,12 +1224,23 @@ static int qcom_swrm_get_port_config(struct qcom_swrm_ctrl *ctrl)
>  static int swrm_reg_show(struct seq_file *s_file, void *data)
>  {
>  	struct qcom_swrm_ctrl *swrm = s_file->private;
> -	int reg, reg_val;
> +	int reg, reg_val, ret;
> +
> +	ret = pm_runtime_get_sync(swrm->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_err_ratelimited(swrm->dev,
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
> +				    __func__, ret);
> +		pm_runtime_put_noidle(swrm->dev);

... here it's missing?

I have a fix ready but thought I would check first if this was intentional

https://github.com/thesofproject/linux/pull/3602/commits/6353eec8dc971c5f0fda0166ae1777f71784ea32

> +	}
>  
>  	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
>  		swrm->reg_read(swrm, reg, &reg_val);
>  		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
>  	}
> +	pm_runtime_mark_last_busy(swrm->dev);
> +	pm_runtime_put_autosuspend(swrm->dev);
> +
>  
>  	return 0;
