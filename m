Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF2540039A
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:41:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C3EB18EB;
	Fri,  3 Sep 2021 18:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C3EB18EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687306;
	bh=2F87+Au3oAQyXWZoehMntFKd2a8X4qj0C1TMSMEvkAo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IY0TUgHtGGQzcPwUwhd27dYjLBL/TezBxThrwjw+DXslQ1h+gHqvgfMxHjoRo2uG8
	 7Niea5kl+KZhGh7GyfYsaOOePKEpbUUtrUWtm2zdy0p7YFPj4ZoKe52lwxVOYOPYjX
	 tjKi7Ym+DUaKr99sFPfkI0CFe/tf9g8qe+mnsMak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAAE7F80527;
	Fri,  3 Sep 2021 18:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 736ADF804E3; Fri,  3 Sep 2021 18:38:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAD1DF804E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD1DF804E3
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="206687224"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206687224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:38:02 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462453533"
Received: from seangorm-mobl.amr.corp.intel.com (HELO [10.251.136.111])
 ([10.251.136.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:38:01 -0700
Subject: Re: [PATCH v2 1/2] ASoC: SOF: imx: Add code to manage DSP related
 clocks
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
References: <20210903145340.225511-1-daniel.baluta@oss.nxp.com>
 <20210903145340.225511-2-daniel.baluta@oss.nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <bffb60bf-2497-2025-c16c-5519c96f9769@linux.intel.com>
Date: Fri, 3 Sep 2021 11:06:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903145340.225511-2-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, shawnguo@kernel.org,
 peter.ujfalusi@linux.intel.com, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, kernel@pengutronix.de, s-anna@ti.com, festevam@gmail.com
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



On 9/3/21 9:53 AM, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> There are two types of clocks:
> 	* DSP IP clocks
> 	* DAI clocks
> 
> This clocks are necessary in order to power up DSP and DAIs.
> 
> We choose to enable DAI clocks here because of the way i.MX8/i.MX8X
> design handles resources (including clocks).
> 
> All clocks are managed by a separate core (named SCU) which communicates
> with Linux managed ARM core via a well known API.
> 
> We parse and enable the clocks in probe function and disable them in
> remove function.
> 
> Future patches will introduce Power Management support so that we
> disable clocks while DSP is not used or system enters power save.
> 
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/sof/imx/imx-common.c | 44 ++++++++++++++++++++++++++++++++++
>  sound/soc/sof/imx/imx-common.h | 13 ++++++++++
>  sound/soc/sof/imx/imx8.c       | 37 ++++++++++++++++++++++++++++
>  sound/soc/sof/imx/imx8m.c      | 34 ++++++++++++++++++++++++++
>  4 files changed, 128 insertions(+)
> 
> diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
> index 8826ef94f04a..f9d650ad3846 100644
> --- a/sound/soc/sof/imx/imx-common.c
> +++ b/sound/soc/sof/imx/imx-common.c
> @@ -74,4 +74,48 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
>  }
>  EXPORT_SYMBOL(imx8_dump);
>  
> +int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
> +{
> +	int ret;
> +
> +	ret = devm_clk_bulk_get(sdev->dev, clks->num_dsp_clks, clks->dsp_clks);
> +	if (ret) {
> +		dev_err(sdev->dev, "Failed to request DSP clocks\n");
> +		return ret;
> +	}
> +
> +	ret = devm_clk_bulk_get_optional(sdev->dev, clks->num_dai_clks, clks->dai_clks);
> +	if (ret) {
> +		dev_err(sdev->dev, "Failed to request DAI clks\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(imx8_parse_clocks);
> +
> +int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
> +{
> +	int ret;
> +
> +	ret = clk_bulk_prepare_enable(clks->num_dsp_clks, clks->dsp_clks);
> +	if (ret)
> +		return ret;
> +	ret = clk_bulk_prepare_enable(clks->num_dai_clks, clks->dai_clks);
> +	if (ret) {
> +		clk_bulk_disable_unprepare(clks->num_dsp_clks, clks->dsp_clks);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(imx8_enable_clocks);
> +
> +void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
> +{
> +	clk_bulk_disable_unprepare(clks->num_dsp_clks, clks->dsp_clks);
> +	clk_bulk_disable_unprepare(clks->num_dai_clks, clks->dai_clks);
> +}
> +EXPORT_SYMBOL(imx8_disable_clocks);
> +
>  MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
> index 1cc7d6704182..54fba9fcd861 100644
> --- a/sound/soc/sof/imx/imx-common.h
> +++ b/sound/soc/sof/imx/imx-common.h
> @@ -3,6 +3,8 @@
>  #ifndef __IMX_COMMON_H__
>  #define __IMX_COMMON_H__
>  
> +#include <linux/clk.h>
> +
>  #define EXCEPT_MAX_HDR_SIZE	0x400
>  #define IMX8_STACK_DUMP_SIZE 32
>  
> @@ -13,4 +15,15 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
>  
>  void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
>  
> +struct imx_clocks {
> +	struct clk_bulk_data *dsp_clks;
> +	int num_dsp_clks;
> +	struct clk_bulk_data *dai_clks;
> +	int num_dai_clks;
> +};
> +
> +int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
> +int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
> +void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
> +
>  #endif
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index fc1720c211a3..5370d34edd61 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -41,6 +41,25 @@
>  #define MBOX_OFFSET	0x800000
>  #define MBOX_SIZE	0x1000
>  
> +/* DSP clocks */
> +struct clk_bulk_data imx8_dsp_clks[] = {
> +	{ .id = "ipg" },
> +	{ .id = "ocram" },
> +	{ .id = "core" },
> +};
> +
> +/* DAI clocks */
> +struct clk_bulk_data imx8_dai_clks[] = {
> +	{ .id = "esai0_core" },
> +	{ .id = "esai0_extal" },
> +	{ .id = "esai0_spba" },
> +	{ .id = "sai1_bus" },
> +	{ .id = "sai1_mclk0" },
> +	{ .id = "sai1_mclk1" },
> +	{ .id = "sai1_mclk2" },
> +	{ .id = "sai1_mclk3" },
> +};
> +
>  struct imx8_priv {
>  	struct device *dev;
>  	struct snd_sof_dev *sdev;
> @@ -57,6 +76,7 @@ struct imx8_priv {
>  	struct device **pd_dev;
>  	struct device_link **link;
>  
> +	struct imx_clocks *clks;
>  };
>  
>  static void imx8_get_reply(struct snd_sof_dev *sdev)
> @@ -223,6 +243,10 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
>  	sdev->num_cores = 1;
>  	sdev->pdata->hw_pdata = priv;
>  	priv->dev = sdev->dev;
> @@ -336,6 +360,18 @@ static int imx8_probe(struct snd_sof_dev *sdev)
>  	/* set default mailbox offset for FW ready message */
>  	sdev->dsp_box.offset = MBOX_OFFSET;
>  
> +	/* init clocks info */
> +	priv->clks->dsp_clks = imx8_dsp_clks;
> +	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8_dsp_clks);
> +	priv->clks->dai_clks = imx8_dai_clks;
> +	priv->clks->num_dai_clks = ARRAY_SIZE(imx8_dai_clks);
> +
> +	ret = imx8_parse_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;
> +
> +	imx8_enable_clocks(sdev, priv->clks);
> +
>  	return 0;
>  
>  exit_pdev_unregister:
> @@ -354,6 +390,7 @@ static int imx8_remove(struct snd_sof_dev *sdev)
>  	struct imx8_priv *priv = sdev->pdata->hw_pdata;
>  	int i;
>  
> +	imx8_disable_clocks(sdev, priv->clks);
>  	platform_device_unregister(priv->ipc_dev);
>  
>  	for (i = 0; i < priv->num_domains; i++) {
> diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> index 30624fafc632..fea1b72bebaa 100644
> --- a/sound/soc/sof/imx/imx8m.c
> +++ b/sound/soc/sof/imx/imx8m.c
> @@ -23,6 +23,21 @@
>  #define MBOX_OFFSET	0x800000
>  #define MBOX_SIZE	0x1000
>  
> +struct clk_bulk_data imx8m_dsp_clks[] = {
> +	{ .id = "ipg" },
> +	{ .id = "ocram" },
> +	{ .id = "core" },
> +};
> +
> +struct clk_bulk_data imx8m_dai_clks[] = {
> +	{ .id = "sai3_bus" },
> +	{ .id = "sai3_mclk0" },
> +	{ .id = "sai3_mclk1" },
> +	{ .id = "sai3_mclk2" },
> +	{ .id = "sai3_mclk3" },
> +	{ .id = "sdma3_root" },
> +};
> +
>  struct imx8m_priv {
>  	struct device *dev;
>  	struct snd_sof_dev *sdev;
> @@ -30,6 +45,8 @@ struct imx8m_priv {
>  	/* DSP IPC handler */
>  	struct imx_dsp_ipc *dsp_ipc;
>  	struct platform_device *ipc_dev;
> +
> +	struct imx_clocks *clks;
>  };
>  
>  static void imx8m_get_reply(struct snd_sof_dev *sdev)
> @@ -143,6 +160,10 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
> +	if (!priv->clks)
> +		return -ENOMEM;
> +
>  	sdev->num_cores = 1;
>  	sdev->pdata->hw_pdata = priv;
>  	priv->dev = sdev->dev;
> @@ -211,6 +232,18 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
>  	/* set default mailbox offset for FW ready message */
>  	sdev->dsp_box.offset = MBOX_OFFSET;
>  
> +	/* init clocks info */
> +	priv->clks->dsp_clks = imx8m_dsp_clks;
> +	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8m_dsp_clks);
> +	priv->clks->dai_clks = imx8m_dai_clks;
> +	priv->clks->num_dai_clks = ARRAY_SIZE(imx8m_dai_clks);
> +
> +	ret = imx8_parse_clocks(sdev, priv->clks);
> +	if (ret < 0)
> +		goto exit_pdev_unregister;
> +
> +	imx8_enable_clocks(sdev, priv->clks);
> +
>  	return 0;
>  
>  exit_pdev_unregister:
> @@ -222,6 +255,7 @@ static int imx8m_remove(struct snd_sof_dev *sdev)
>  {
>  	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
>  
> +	imx8_disable_clocks(sdev, priv->clks);
>  	platform_device_unregister(priv->ipc_dev);
>  
>  	return 0;
> 
