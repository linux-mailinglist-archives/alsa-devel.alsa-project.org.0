Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 583804C902F
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Mar 2022 17:19:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 436211B0D;
	Tue,  1 Mar 2022 17:18:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 436211B0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646151584;
	bh=oW7rCjucB/FAM9m562SoKysdtSc96jMNqsGkSaAFJyc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TMegMy9k1MJrsdMhZnp28/9ihfWg7VKww//NgYoexaRcuhpPRYQznSRmkXMTnU+Ep
	 KYuyJUQm1fe28apQiKXcYwsMVa6+bl3XR4Q/s5T4uNhBK7xwKFyAIMZpvbZ+SgZNLo
	 0IRekh089MFmISeapXkIfvr+9vhXl/5etVUC/Auc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5AF37F80227;
	Tue,  1 Mar 2022 17:18:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3515DF80511; Tue,  1 Mar 2022 17:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB50F80227
 for <alsa-devel@alsa-project.org>; Tue,  1 Mar 2022 17:17:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB50F80227
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yb47CnXv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646151480; x=1677687480;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=oW7rCjucB/FAM9m562SoKysdtSc96jMNqsGkSaAFJyc=;
 b=Yb47CnXvDi1CiKwfa0eSoGAWLIE+zhbgwenaWh3EOwe5OXuxkwnBMROu
 xJiao2TuXwrsuNR2nvm67TaqHqmuG78XMG9Ee/KXbLQCu7RCos0+4Ru6B
 XCcnOVxLps4R+kxdLL7Id4b1n2eyd3wQT2Ec8I1lLc3LUH94x7SeNe8Wv
 N3BOS7jbgDHUxrgLJIqb7R850lOJRXA3THwi9m/uoQebEb1cJS4/jkDi4
 6ZC7TSpP9aH2pK94ba/kWSaakhEw2nELKys/68NcZ0W1M2cG5aE5caJ0E
 JaEfT499N8pjq49bmtwnlZRS83A3ZVuAK9Xzxnj0BNbvYP1mzFVBsLsKD A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="251998243"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="251998243"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 08:17:49 -0800
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; d="scan'208";a="545146496"
Received: from rbrosius-mobl.amr.corp.intel.com (HELO [10.209.131.146])
 ([10.209.131.146])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2022 08:17:48 -0800
Message-ID: <a3240a03-2e14-35e6-4915-41f994e365fc@linux.intel.com>
Date: Tue, 1 Mar 2022 07:52:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] soundwire: qcom: add in-band wake up interrupt
 support
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, robh+dt@kernel.org, 
 vkoul@kernel.org, yung-chuan.liao@linux.intel.com
References: <20220228172528.3489-1-srinivas.kandagatla@linaro.org>
 <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20220228172528.3489-4-srinivas.kandagatla@linaro.org>
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



On 2/28/22 11:25, Srinivas Kandagatla wrote:
> Some of the Qualcomm SoundWire Controller instances like the ones that are
> connected to RX path along with Headset connections support Waking up
> Controller from Low power clock stop state using SoundWire In-band interrupt.
> SoundWire Slave on the bus would initiate this by pulling the data line high,
> while the clock is stopped.
> 
> Add support to this wake up interrupt.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  drivers/soundwire/qcom.c | 50 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 810232686196..e893aee1b057 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -14,6 +14,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/slimbus.h>
>  #include <linux/soundwire/sdw.h>
>  #include <linux/soundwire/sdw_registers.h>
> @@ -154,6 +155,7 @@ struct qcom_swrm_ctrl {
>  	u8 rd_cmd_id;
>  	int irq;
>  	unsigned int version;
> +	int wake_irq;
>  	int num_din_ports;
>  	int num_dout_ports;
>  	int cols_index;
> @@ -503,6 +505,31 @@ static int qcom_swrm_enumerate(struct sdw_bus *bus)
>  	return 0;
>  }
>  
> +static irqreturn_t qcom_swrm_wake_irq_handler(int irq, void *dev_id)
> +{
> +	struct qcom_swrm_ctrl *swrm = dev_id;
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(swrm->dev);
> +	if (ret < 0 && ret != -EACCES) {
> +		dev_err_ratelimited(swrm->dev,
> +				    "pm_runtime_get_sync failed in %s, ret %d\n",
> +				    __func__, ret);
> +		pm_runtime_put_noidle(swrm->dev);
> +	}
> +
> +	if (swrm->wake_irq > 0) {
> +		if (!irqd_irq_disabled(irq_get_irq_data(swrm->wake_irq)))
> +			disable_irq_nosync(swrm->wake_irq);
> +	}
> +
> +	pm_runtime_mark_last_busy(swrm->dev);
> +	pm_runtime_put_autosuspend(swrm->dev);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +
>  static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  {
>  	struct qcom_swrm_ctrl *swrm = dev_id;
> @@ -1340,6 +1367,19 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> +	ctrl->wake_irq = of_irq_get(dev->of_node, 1);
> +	if (ctrl->wake_irq > 0) {
> +		ret = devm_request_threaded_irq(dev, ctrl->wake_irq, NULL,
> +						qcom_swrm_wake_irq_handler,
> +						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +						"swr_wake_irq", ctrl);
> +		if (ret) {
> +			dev_err(dev, "Failed to request soundwire wake irq\n");
> +			goto err_init;
> +		}
> +	}
> +
> +
>  	ret = sdw_bus_master_add(&ctrl->bus, dev, dev->fwnode);
>  	if (ret) {
>  		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
> @@ -1424,6 +1464,11 @@ static int swrm_runtime_resume(struct device *dev)
>  	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>  	int ret;
>  
> +	if (ctrl->wake_irq > 0) {
> +		if (!irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +			disable_irq_nosync(ctrl->wake_irq);
> +	}
> +
>  	clk_prepare_enable(ctrl->hclk);
>  
>  	if (ctrl->clock_stop_not_supported) {
> @@ -1491,6 +1536,11 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>  
>  	usleep_range(300, 305);
>  
> +	if (ctrl->wake_irq > 0) {
> +		if (irqd_irq_disabled(irq_get_irq_data(ctrl->wake_irq)))
> +			enable_irq(ctrl->wake_irq);
> +	}
> +
>  	return 0;
>  }
>  
