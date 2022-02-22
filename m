Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C544C028A
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 20:57:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDF5181F;
	Tue, 22 Feb 2022 20:56:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDF5181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645559840;
	bh=eE5Y6NJ98wT5byN8TvBoZ9imyKf4VK62w4kqwTGFROw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CDIMEAhP6lZ20SOdNrahguHgXUV3tYv/AzRATqFpGD4WP48fV3zlHJyj1LMvO9OUL
	 fpuxYvB3PgrxYO1AyKiiuoRVAhNPp3VzIcizZkktSNuUHFJfoYBJTOuZH9r6rRX0YD
	 Akz2F3861DYV21i+hbORZsXYWpPIlb3TDvvGcOYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77065F80311;
	Tue, 22 Feb 2022 20:55:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7437F801EC; Tue, 22 Feb 2022 20:55:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78B74F80118
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 20:55:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78B74F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="csEntwW4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645559739; x=1677095739;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eE5Y6NJ98wT5byN8TvBoZ9imyKf4VK62w4kqwTGFROw=;
 b=csEntwW41Hmob3q91BGjhssSq4EGVYRfOcXUPnQnlzKfFi8L1+ayCW8c
 Q5v1GJ04D4keaMxhQnjPqSaMZvvNV76UDHzNLzSRUBr+Mazm+Q4WrXod6
 tYNKpDwzYwO2AWKh4asVy88Nc5Wb/QNXU0fwkLZ/k2BZcIfPiPZHkYMd5
 plJtd2kDWDyv9Q9db8tBUAbYU4P/89goPqPsMa9E3B8nwrDJUGUheIYt0
 IoNF5An8xAoZHsgbEf820DxYP5o5DwISBiXULv8D291FQQAI/LGhaqyKb
 O63U5WeGv+8N4FnAOcM+anQLwINfn5DL/8Ul2VWSbHlgpV6W1D9WA0WKa A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232421593"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232421593"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 11:55:17 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="639032047"
Received: from mjpatel-mobl.amr.corp.intel.com (HELO [10.212.37.223])
 ([10.212.37.223])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 11:55:16 -0800
Message-ID: <70db9c01-104e-e081-198e-0b6d8a1c17da@linux.intel.com>
Date: Tue, 22 Feb 2022 13:15:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] soundwire: qcom: add runtime pm support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220221104127.15670-1-srinivas.kandagatla@linaro.org>
 <20220221104127.15670-2-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220221104127.15670-2-srinivas.kandagatla@linaro.org>
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



On 2/21/22 04:41, Srinivas Kandagatla wrote:
> Add support to runtime PM using SoundWire clock stop on supported instances
> and bus reset on instances that require full reset.

This commit message and code are a bit confusing, e.g. you have a
boolean state

ctrl->clk_stop_bus_reset = true;

Does this mean bus reset on exiting clock stop? or just that clock stop
is not supported and bus reset is required with complete re-enumeration.

It would be good to try and explain using SoundWire 1.x terminology what
actions are taken on resume.


> @@ -1267,6 +1305,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.ops = &qcom_swrm_ops;
>  	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
> +	ctrl->bus.clk_stop_timeout = 300;
>  
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
> @@ -1319,6 +1358,21 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
>  		 ctrl->version & 0xffff);
>  
> +	pm_runtime_set_autosuspend_delay(dev, 3000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
> +	/* Clk stop is not supported on WSA Soundwire masters */
> +	if (ctrl->version <= 0x01030000) {
> +		ctrl->clk_stop_bus_reset = true;
> +	} else {
> +		ctrl->reg_read(ctrl, SWRM_COMP_MASTER_ID, &val);
> +		if (val == MASTER_ID_WSA)
> +			ctrl->clk_stop_bus_reset = true;
> +	}

I think this means clock_stop_not_supported?

> +static int swrm_runtime_resume(struct device *dev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
> +	int ret;
> +
> +	clk_prepare_enable(ctrl->hclk);
> +
> +	if (ctrl->clk_stop_bus_reset) {
> +		reinit_completion(&ctrl->enumeration);
> +		ctrl->reg_write(ctrl, SWRM_COMP_SW_RESET, 0x01);
> +		qcom_swrm_get_device_status(ctrl);

don't you need some sort of delay before checking the controller and
device status? The bus reset sequence takes 4096 bits, that's a non-zero
time.

> +		sdw_handle_slave_status(&ctrl->bus, ctrl->status);
> +		qcom_swrm_init(ctrl);
> +		wait_for_completion_timeout(&ctrl->enumeration,
> +					    msecs_to_jiffies(TIMEOUT_MS));
> +	} else {
> +		ctrl->reg_write(ctrl, SWRM_MCP_BUS_CTRL, SWRM_MCP_BUS_CLK_START);
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CLEAR,
> +			SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET);
> +
> +		ctrl->intr_mask |= SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
> +
> +		usleep_range(100, 105);
> +	}
> +
> +	if (!swrm_wait_for_frame_gen_enabled(ctrl))
> +		dev_err(ctrl->dev, "link failed to connect\n");
> +
> +	usleep_range(300, 305);
> +	ret = sdw_bus_exit_clk_stop(&ctrl->bus);
> +	if (ret < 0)
> +		dev_err(ctrl->dev, "bus failed to exit clock stop %d\n", ret);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused swrm_runtime_suspend(struct device *dev)
> +{
> +	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!ctrl->clk_stop_bus_reset) {
> +		/* Mask bus clash interrupt */
> +		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_MASK_ADDR, ctrl->intr_mask);
> +		ctrl->reg_write(ctrl, SWRM_INTERRUPT_CPU_EN, ctrl->intr_mask);
> +	}
> +	/* Prepare slaves for clock stop */
> +	ret = sdw_bus_prep_clk_stop(&ctrl->bus);
> +	if (ret < 0) {

if a device has lost sync and reports -ENODATA, you want still want to
go ahead and not prevent the suspend operation from happening.

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
> +
> +static const struct dev_pm_ops swrm_dev_pm_ops = {
> +	SET_RUNTIME_PM_OPS(swrm_runtime_suspend, swrm_runtime_resume, NULL)
> +};
> +
>  static const struct of_device_id qcom_swrm_of_match[] = {
>  	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>  	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> @@ -1359,6 +1506,7 @@ static struct platform_driver qcom_swrm_driver = {
>  	.driver = {
>  		.name	= "qcom-soundwire",
>  		.of_match_table = qcom_swrm_of_match,
> +		.pm = &swrm_dev_pm_ops,
>  	}
>  };
>  module_platform_driver(qcom_swrm_driver);
