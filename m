Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D04E4C3039
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Feb 2022 16:46:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77E131AC6;
	Thu, 24 Feb 2022 16:46:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77E131AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645717618;
	bh=zg871vrIEgDmnoahtU2xZXU7HgaRjVw+9Mzig81rIO0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mJ7c1iIRsS5nK0LIRPyQwJHCKNHEgfK+nQK6toMOrb7Y9LQz6mafSoi43TW+FfTFe
	 /PQqsa9o4BQ8g/iL+j0nEo3bwwW1iEyRQ+ZvTQEztr8OVeZuq3haTH5H/RKuyzPiRB
	 njj55WkqZXcbLP13RSg2VHdASakg2xyL+rc31vN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0022F80511;
	Thu, 24 Feb 2022 16:45:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F0861F8030F; Thu, 24 Feb 2022 16:45:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B916F8030F
 for <alsa-devel@alsa-project.org>; Thu, 24 Feb 2022 16:45:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B916F8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U9ZT+nYV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645717514; x=1677253514;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=zg871vrIEgDmnoahtU2xZXU7HgaRjVw+9Mzig81rIO0=;
 b=U9ZT+nYV/xehni8ltYIiYZMundZvxBmwyUW7XjQ/mCIKqzf55RJzLJRj
 Q6V9kZmgdJlfGMAMhYADBL0UpwZfet5VCNq1QuGrp1apn7wedtgNEnErO
 /OGN7Uyq2HpUBEu+F58DhUm9lktyCI4ZeYP18VfzS2a4qnS/aOlbWMCvN
 9ySBNq4ep5kVepmVJNz7wEcFV1sp/ic1jy/O5iP1exHJVB4kKFEnoADuP
 5TBj3UGaEifUpR0igywR4NvTIqg02BxtScFm4w1zUkqLfSKwbI7AMIkdg
 Ei2v16XhOZR834FIgfFIMG0FA1yN9BysQSEUANsWLDvsHuo924KEm35oV w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="276890961"
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="276890961"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:07 -0800
X-IronPort-AV: E=Sophos;i="5.90,134,1643702400"; d="scan'208";a="533178494"
Received: from ronakmeh-mobl1.amr.corp.intel.com (HELO [10.212.97.131])
 ([10.212.97.131])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 07:45:05 -0800
Message-ID: <3dbed2f1-0c6d-9ba6-232f-db57ec9097ce@linux.intel.com>
Date: Thu, 24 Feb 2022 09:41:35 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220224133125.6674-1-srinivas.kandagatla@linaro.org>
 <20220224133125.6674-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220224133125.6674-2-srinivas.kandagatla@linaro.org>
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
> +	}
>  
>  	for (reg = 0; reg <= SWR_MSTR_MAX_REG_ADDR; reg += 4) {
>  		swrm->reg_read(swrm, reg, &reg_val);
>  		seq_printf(s_file, "0x%.3x: 0x%.2x\n", reg, reg_val);
>  	}
> +	pm_runtime_mark_last_busy(swrm->dev);
> +	pm_runtime_put_autosuspend(swrm->dev);
> +

question: is there a reason why this specific set of reg_read() is
surrounded pm_runtime stuff? Is this saying that in all other case where
the callback is used, the controller is already resumed and fully
operational? That's be worthy of a comment.

> struct qcom_swrm_ctrl *swrm
> struct qcom_swrm_ctrl *ctrl

nit-pick: it helps reviewers when the same variable name is used
consistently.

> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!ctrl->clock_stop_not_supported) {
> +		/* Mask bus clash interrupt */
> +		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
> +	}
> +	/* Prepare slaves for clock stop */
> +	ret = sdw_bus_prep_clk_stop(&ctrl->bus);
> +	if (ret < 0) {

if (ret < 0 && ret != -ENODATA) {

?

> +		dev_err(dev, "prepare clock stop failed %d", ret);
> +		return ret;
> +	}
> +
> +	ret = sdw_bus_clk_stop(&ctrl->bus);
> +	if (ret < 0 && ret != -ENODATA) {
> +		dev_err(dev, "bus clock stop failed %d", ret);
> +		return ret;
> +	}
> +
> +	clk_disable_unprepare(ctrl->hclk);
> +
> +	usleep_range(300, 305);
> +
> +	return 0;
> +}
