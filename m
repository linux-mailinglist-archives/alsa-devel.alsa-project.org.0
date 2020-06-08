Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D71F2198
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Jun 2020 23:47:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13481655;
	Mon,  8 Jun 2020 23:46:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13481655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591652831;
	bh=EFaJw6glupNVHQMllCeubQWLL+6Q9OmSBwZH9BnFl1A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nISe7lHGM/ksyXVOOWHb1k2fLi5IuEw80Okzy3kGDd9ri9RHVhl43REaHew4I4/od
	 jgt/UkPLR3GThHfugi3ZKNX7IoFOshyISbWwwfGxX2VyTFuEAKDMOZy2oTMXIYWbw1
	 TOPtpgEMt5egMjk2EJwL5y2DMxOWsqGXwic9gfuY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16528F801EB;
	Mon,  8 Jun 2020 23:45:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 292ACF80252; Mon,  8 Jun 2020 23:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8FC1F80124
 for <alsa-devel@alsa-project.org>; Mon,  8 Jun 2020 23:45:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8FC1F80124
IronPort-SDR: J/yOuNQ64Ks9gLd46OqM9T5oDaaPyWknloPdUnvnFEMzYufPtyNHEq9vrgcZ+Xdkprm/qnQxMd
 EUlWJeOmU40w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 14:45:12 -0700
IronPort-SDR: HlPk+2iKB1EmEjHx1fiuTRW8JD8I1xoE8JKNt85J7uD2Km3/s3FTpcyY6tQh4WvkwiEAC+ojtp
 Gz27U2T3mh6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,489,1583222400"; d="scan'208";a="446893871"
Received: from skarmaka-mobl2.amr.corp.intel.com (HELO [10.254.104.56])
 ([10.254.104.56])
 by orsmga005.jf.intel.com with ESMTP; 08 Jun 2020 14:45:12 -0700
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <90b08ff9-ab00-051f-1a96-15ee6401fe52@linux.intel.com>
Date: Mon, 8 Jun 2020 16:31:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>
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



On 6/8/20 3:43 PM, Jonathan Marek wrote:
> Adds support for qcom soundwire devices with memory mapped IO registers.

'device' is an ambiguous term for SoundWire.

Seems to me this is a SoundWire Master device directly accessed with 
mmio registers instead of over a SLIMbus link?

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>   1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f38d1fd3679f..628747df1c75 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>   	struct sdw_bus bus;
>   	struct device *dev;
>   	struct regmap *regmap;
> +	void __iomem *mmio;
>   	struct completion *comp;
>   	struct work_struct slave_work;
>   	/* read/write lock */
> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>   	return SDW_CMD_OK;
>   }
>   
> +static int qcom_swrm_cpu_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
> +				  u32 *val)
> +{
> +	*val = readl(ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}
> +
> +static int qcom_swrm_cpu_reg_write(struct qcom_swrm_ctrl *ctrl, int reg,
> +				   int val)
> +{
> +	writel(val, ctrl->mmio + reg);
> +	return SDW_CMD_OK;
> +}
> +
>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *ctrl, u8 cmd_data,
>   				     u8 dev_addr, u16 reg_addr)
>   {
> @@ -746,6 +761,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	struct sdw_master_prop *prop;
>   	struct sdw_bus_params *params;
>   	struct qcom_swrm_ctrl *ctrl;
> +	struct resource *res;
>   	int ret;
>   	u32 val;
>   
> @@ -760,8 +776,13 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   		if (!ctrl->regmap)
>   			return -EINVAL;
>   	} else {
> -		/* Only WCD based SoundWire controller is supported */
> -		return -ENOTSUPP;

I would move patch4 before this one, and add the functionality *after* 
removing the SLIMbus dependency.

> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> +		ctrl->reg_write = qcom_swrm_cpu_reg_write;
> +		ctrl->mmio = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(ctrl->mmio))
> +			return PTR_ERR(ctrl->mmio);

maybe deal with the resource checks before setting callbacks?

There are quite a few drivers who do things this way:

clk/qcom/common.c-      res = platform_get_resource(pdev, 
IORESOURCE_MEM, 0);
clk/qcom/common.c:      base = devm_ioremap_resource(dev, res);
--


>   	}
>   
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
> 
