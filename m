Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F6357A137
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jul 2022 16:21:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C60A316E0;
	Tue, 19 Jul 2022 16:20:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C60A316E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658240468;
	bh=YVCLhkh4n7e0j5teqG/5k5LoJ79OBATiCQ/OzpxpXvw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MP/r/HUzOpicB29x5fQPSklfZokm1IzC1cKg1QMZPShdmoh8n2JzNasQbjN/2FOhz
	 1OBmZMEcJrJnOHqHVq9fiRkL1sSxOIC4MRI1ehoManz9gOETLT4refCOCc46Q9t/Ya
	 TgMuEZkLBBfwOn75hc2YDCuub31MTV9MqOu0HrSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30DC6F80224;
	Tue, 19 Jul 2022 16:20:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E32B6F801EC; Tue, 19 Jul 2022 16:20:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F27C1F80125;
 Tue, 19 Jul 2022 16:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F27C1F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="V6/ydLZm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658240403; x=1689776403;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YVCLhkh4n7e0j5teqG/5k5LoJ79OBATiCQ/OzpxpXvw=;
 b=V6/ydLZmg0WdaI9BnHjG3hmwDnta/+cp8THtI9R/tm+LQFMmfsxnylre
 Rb4EwOEYYx+UMRn0qeghkPYestIHi1/eaZMuXNwzp7VVecizbLfzBuJzW
 WN6WpLzXakbWGS1dW1de2UoyRCViLk0LQ2sxG3B6uwfEfrLLBlqLGipKK
 b3O9ilBGAZ7OSEsWmjdhz8JGXKDZjQ0JDCirUVPnhI4QpM3VYus7qlGAh
 YZRksCrTheC+VRgUgb+TrZ0c6dtMnkKZtGadq5d31d3/vE0bEYNNWc92R
 S5Hby9jX7QbLzgyefAhuLYtc/t+m1DhM2Uz+papWKZJ/X9ez96BxlwTxH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266280539"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="266280539"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:19:54 -0700
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; d="scan'208";a="594844167"
Received: from kckollur-mobl1.amr.corp.intel.com (HELO [10.212.118.182])
 ([10.212.118.182])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2022 07:19:52 -0700
Message-ID: <a2fd9907-d098-7a38-c423-aeb167ab6d37@linux.intel.com>
Date: Tue, 19 Jul 2022 09:19:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] ASoC: SOF: imx: Add i.MX8ULP HW support
Content-Language: en-US
To: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org
References: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1658208367-24376-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, shengjiu.wang@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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


> +static void imx8ulp_get_reply(struct snd_sof_dev *sdev)
> +{
> +	struct snd_sof_ipc_msg *msg = sdev->msg;
> +	struct sof_ipc_reply reply;
> +	int ret = 0;
> +
> +	if (!msg) {
> +		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
> +		return;
> +	}
> +
> +	/* get reply */
> +	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
> +
> +	if (reply.error < 0) {
> +		memcpy(msg->reply_data, &reply, sizeof(reply));
> +		ret = reply.error;
> +	} else {
> +		/* reply has correct size? */
> +		if (reply.hdr.size != msg->reply_size) {
> +			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
> +				msg->reply_size, reply.hdr.size);
> +			ret = -EINVAL;
> +		}
> +
> +		/* read the message */
> +		if (msg->reply_size > 0)
> +			sof_mailbox_read(sdev, sdev->host_box.offset,
> +					 msg->reply_data, msg->reply_size);
> +	}
> +
> +	msg->reply_error = ret;
> +}

Can you double-check if this helper is needed? It looks completely
generic and I vaguely remember that this get_reply() was moved to common
code, and it's no longer in the other existing iMX support files.

> +
> +static int imx8ulp_get_mailbox_offset(struct snd_sof_dev *sdev)
> +{
> +	return MBOX_OFFSET;
> +}
> +
> +static int imx8ulp_get_window_offset(struct snd_sof_dev *sdev, u32 id)
> +{
> +	return MBOX_OFFSET;
> +}
> +
> +static void imx8ulp_dsp_handle_reply(struct imx_dsp_ipc *ipc)
> +{
> +	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
> +
> +	imx8ulp_get_reply(priv->sdev);
> +	snd_sof_ipc_reply(priv->sdev, 0);
> +	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);

this is old stuff that wasn't updated, we now have an inline that
combines this:

static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev,
u32 msg_id)
{
	snd_sof_ipc_get_reply(sdev);
	snd_sof_ipc_reply(sdev, msg_id);
}

see the code in im8xm.c....

> +}
> +
> +static void imx8ulp_dsp_handle_request(struct imx_dsp_ipc *ipc)
> +{
> +	struct imx8ulp_priv *priv = imx_dsp_get_data(ipc);
> +	u32 p; /* panic code */
> +
> +	/* Read the message from the debug box. */
> +	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
> +
> +	/* Check to see if the message is a panic code (0x0dead***) */
> +	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
> +		snd_sof_dsp_panic(priv->sdev, p, true);
> +	else
> +		snd_sof_ipc_msgs_rx(priv->sdev);
> +}
> +
> +static struct imx_dsp_ops dsp_ops = {
> +	.handle_reply		= imx8ulp_dsp_handle_reply,
> +	.handle_request		= imx8ulp_dsp_handle_request,
> +};
> +
> +static int imx8ulp_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
> +{
> +	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> +
> +	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
> +			  msg->msg_size);
> +	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_run(struct snd_sof_dev *sdev)
> +{
> +	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> +
> +	imx8ulp_sim_lpav_start(priv);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_reset(struct snd_sof_dev *sdev)
> +{
> +	struct imx8ulp_priv *priv = sdev->pdata->hw_pdata;
> +
> +	/* HiFi4 Platform Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(priv->regmap, SYSCTRL0, PLAT_CLK_BIT, PLAT_CLK_BIT);
> +	/* HiFi4 PBCLK clock enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(priv->regmap, SYSCTRL0, PB_CLK_BIT, PB_CLK_BIT);
> +	/* HiFi4 Clock Enable: 1 enabled, 0 disabled */
> +	regmap_update_bits(priv->regmap, SYSCTRL0, HIFI4_CLK_BIT, HIFI4_CLK_BIT);
> +
> +	regmap_update_bits(priv->regmap, SYSCTRL0, RESET_BIT, RESET_BIT);
> +	usleep_range(1, 2);
> +	/* Stall HIFI4 DSP Execution: 1 stall, 0 not stall */
> +	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +	usleep_range(1, 2);


adding newlines would help make the comments more readable, this is a
bit of an eyesore.

> +	arm_smccc_smc(FSL_SIP_HIFI_XRDC, 0, 0, 0, 0, 0, 0, 0, &smc_resource);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_probe(struct snd_sof_dev *sdev)
> +{
> +	struct platform_device *pdev =
> +		container_of(sdev->dev, struct platform_device, dev);
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *res_node;
> +	struct resource *mmio;
> +	struct imx8ulp_priv *priv;
> +	struct resource res;
> +	u32 base, size;
> +	int ret = 0;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
> +	sdev->num_cores = 1;
> +	sdev->pdata->hw_pdata = priv;
> +	priv->dev = sdev->dev;
> +	priv->sdev = sdev;
> +
> +	/* System integration module(SIM) control dsp configurtion */

typo: configuration

> +	priv->regmap = syscon_regmap_lookup_by_phandle(np, "fsl,dsp-ctrl");
> +	if (IS_ERR(priv->regmap))
> +		return PTR_ERR(priv->regmap);
> +
> +	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
> +						      PLATFORM_DEVID_NONE,
> +						      pdev, sizeof(*pdev));
> +	if (IS_ERR(priv->ipc_dev))
> +		return PTR_ERR(priv->ipc_dev);
> +
> +	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
> +	if (!priv->dsp_ipc) {
> +		/* DSP IPC driver not probed yet, try later */
> +		ret = -EPROBE_DEFER;
> +		dev_err(sdev->dev, "Failed to get drvdata\n");
> +		goto exit_pdev_unregister;
> +	}
> +
> +	imx_dsp_set_data(priv->dsp_ipc, priv);
> +	priv->dsp_ipc->ops = &dsp_ops;
> +
> +	/* DSP base */
> +	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (mmio) {
> +		base = mmio->start;
> +		size = resource_size(mmio);
> +	} else {
> +		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
> +		ret = -EINVAL;
> +		goto exit_pdev_unregister;
> +	}
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
> +	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
> +		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
> +			base, size);
> +		ret = -ENODEV;
> +		goto exit_pdev_unregister;
> +	}
> +	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
> +
> +	res_node = of_parse_phandle(np, "memory-reserved", 0);
> +	if (!res_node) {
> +		dev_err(&pdev->dev, "failed to get memory region node\n");
> +		ret = -ENODEV;
> +		goto exit_pdev_unregister;
> +	}
> +
> +	ret = of_address_to_resource(res_node, 0, &res);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to get reserved region address\n");
> +		goto exit_pdev_unregister;
> +	}
> +
> +	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
> +							  resource_size(&res));
> +	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
> +		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
> +			base, size);
> +		ret = -ENOMEM;
> +		goto exit_pdev_unregister;
> +	}
> +	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
> +
> +	/* set default mailbox offset for FW ready message */
> +	sdev->dsp_box.offset = MBOX_OFFSET;
> +
> +	ret = of_reserved_mem_device_init(sdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to init reserved memory region %d\n", ret);
> +		goto exit_pdev_unregister;
> +	}
> +
> +	priv->clks->dsp_clks = imx8ulp_dsp_clks;
> +	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8ulp_dsp_clks);
> +
> +	ret = imx8_parse_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;
> +
> +	ret = imx8_enable_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;
> +
> +	return 0;
> +
> +exit_pdev_unregister:
> +	platform_device_unregister(priv->ipc_dev);
> +
> +	return ret;
> +}
> +

> +static int imx8ulp_suspend(struct snd_sof_dev *sdev)
> +{
> +	int i;
> +	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> +
> +	regmap_update_bits(priv->regmap, SYSCTRL0, EXECUTE_BIT, EXECUTE_BIT);
> +
> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> +		imx_dsp_free_channel(priv->dsp_ipc, i);
> +
> +	imx8_disable_clocks(sdev, priv->clks);
> +
> +	return 0;
> +}
> +
> +static int imx8ulp_resume(struct snd_sof_dev *sdev)
> +{
> +	struct imx8ulp_priv *priv = (struct imx8ulp_priv *)sdev->pdata->hw_pdata;
> +	int i;
> +
> +	imx8_enable_clocks(sdev, priv->clks);
> +
> +	for (i = 0; i < DSP_MU_CHAN_NUM; i++)
> +		imx_dsp_request_channel(priv->dsp_ipc, i);
> +
> +	return 0;

is the assymetry between suspend and resume intentional? You are missing
the update_bit for EXECUTE_BIT?

> +}
> +


