Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C01F3325
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 06:36:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C9D91674;
	Tue,  9 Jun 2020 06:35:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C9D91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591677378;
	bh=I6qdniaTIXZUfVcuKwGH7IbkkD0WGORJPBa+sQm3yRs=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFEhscjvjVa2ayLOQgA3ZoZxJSyRylcB8iTXSBwtvwwHg5E8z4cQv0VmNzwp0eikc
	 Qy0UnadPgx4yhWXjZJRIBFCQ7enJOlqG+Oops8o3m2CRYbxvcjseIf9ikeG7XhI/vu
	 kIKgFtYp81na01K1LGtBPt74zR2ELpSG6E/ZHBMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F6EF8028D;
	Tue,  9 Jun 2020 06:34:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 679B1F8028C; Tue,  9 Jun 2020 06:34:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30F36F80124
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 06:34:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30F36F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ooUKtRhE"
Received: from localhost (unknown [122.171.156.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9883B2086A;
 Tue,  9 Jun 2020 04:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591677265;
 bh=I6qdniaTIXZUfVcuKwGH7IbkkD0WGORJPBa+sQm3yRs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ooUKtRhEDl8AqOXVXsq282jUBF1yIR/gaOAD7X31cgAYORgvcm+T+bnzYwesYxCJO
 dqVvDmb+47Svl5hxA0dSF9Dn4IGf05uhwmgGLeH6/AJnQDiDrKpVrHCh9SKWaRxj/9
 scgBMmjImxWhQgEENEoubn5YObdSM/6dZrjYgoBw=
Date: Tue, 9 Jun 2020 10:04:20 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
Message-ID: <20200609043420.GA1084979@vkoul-mobl>
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608204347.19685-3-jonathan@marek.ca>
Cc: alsa-devel@alsa-project.org,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 open list <linux-kernel@vger.kernel.org>
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

Hi Jonathan,

On 08-06-20, 16:43, Jonathan Marek wrote:
> Adds support for qcom soundwire devices with memory mapped IO registers.

Please use 'SoundWire Master devices' instead :)

> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/soundwire/qcom.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index f38d1fd3679f..628747df1c75 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -90,6 +90,7 @@ struct qcom_swrm_ctrl {
>  	struct sdw_bus bus;
>  	struct device *dev;
>  	struct regmap *regmap;
> +	void __iomem *mmio;
>  	struct completion *comp;
>  	struct work_struct slave_work;
>  	/* read/write lock */
> @@ -154,6 +155,20 @@ static int qcom_swrm_ahb_reg_write(struct qcom_swrm_ctrl *ctrl,
>  	return SDW_CMD_OK;
>  }
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

this looks fine but regmap supports mmio also, so I am thinking we
should remove these and set regmap (mmio/slim)... Srini..?

-- 
~Vinod
