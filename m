Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E2A1F36FF
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 11:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 477F11698;
	Tue,  9 Jun 2020 11:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 477F11698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591694472;
	bh=DW4yhNLBkH1tCjnVsjaasAGNcetFanTPdxXiK5wYHEQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H1kY59lbj9iG/xk6yRIUavUI8YskqLn4Cp7bVToPzYDl8D8F30J9pN5JMs/i/es0N
	 G0d3bt5b4hprcCZ1pcguxrjAD5R4C26xtP4bsTcZodpvoahOmq1I5XXDuVKNdurSVh
	 P5Wu8yAiPHfI7lMduoHb1qnJCvNarYMVjVmFA1ic=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1DE1F802BC;
	Tue,  9 Jun 2020 11:19:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 908A2F802C2; Tue,  9 Jun 2020 11:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1065F802BC
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 11:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1065F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cwmwR8pF"
Received: by mail-wm1-x342.google.com with SMTP id j198so1837366wmj.0
 for <alsa-devel@alsa-project.org>; Tue, 09 Jun 2020 02:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ko4rWFPKDMe9rc0tjCCVIFJ0/oRc6Xoz+JGznJVz9As=;
 b=cwmwR8pFJNPO/s+xuUdBe3R/cGlqjbjbVX2WTV/qQlgEReaIgTg74bGHiy4T3GDO0O
 g6AKozrOCJ897X9T0hgvE3ePWOzC1oYtXUYKp5lKYAOK9tGBSl4OQUtsDBNzSwgRE/K1
 1v0KpqayuRzIeCoRWUn2jfJi1FvqYuDoKaTMzxwZIsJZUKyr1mXLsPpAOi0oj/HOXBTK
 AFm5B6nDhWfj+b/tg/JgXHse3ELfMRlcICQQekcyPmdwsYF4hj8UOCjceJqdoZy1rczy
 GiKwAqd4q1wcGuC59KWqkjqwFW95/+XLSi7uH8KkyJ69F2otS77ZRz4p9isDOFNo+887
 p8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ko4rWFPKDMe9rc0tjCCVIFJ0/oRc6Xoz+JGznJVz9As=;
 b=cn4axKB/gy8HM+XcN1LxSwMLyjr5czBEbagPPvbV21GJ9OmKLIFW+7uT9pu/M9Da9y
 F3zNOCya9XU5A6rbup3EL0y7cJeeL70PMxfqXRiaeuabo1cWeAwNTW5Rgw7rTWccTC9Z
 L/FM9cyiiZvktgHdK/J6rmWbobtfXMs9XLQYaRrJm2gFlOQ9SPvk/p5WWj3vyJWQAA7Q
 2fdLGXed8yaUf+3bdQ6Y6ObntA7Zzd8oZpVO3UF1VAnHwzv8DUOIUc2s6nY4FHv1O5RO
 4UhAuo/ttiFYpjZue8rb0BuhpsfmIl4dYGPZc3uGCRp5MHX1Cb2RSdjzmOOJmS+CPBcv
 OI8Q==
X-Gm-Message-State: AOAM533fwwNnOz2h4+V4+PlxqlmME2brxNGxBM/wXDTu/eIiN4gy1KVL
 8eYVPzQoJ3T+FIYMsX7HikGdBw==
X-Google-Smtp-Source: ABdhPJz3Xhm/8ebZUCwc0O/JZNLdi/Hf9aVcvXm4x0C3TkYb3KVcUyQvrnW9jyXT9rNVuhTdML0k9w==
X-Received: by 2002:a1c:60d6:: with SMTP id u205mr3180926wmb.163.1591694349961; 
 Tue, 09 Jun 2020 02:19:09 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id r5sm2786439wrq.0.2020.06.09.02.19.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Jun 2020 02:19:09 -0700 (PDT)
Subject: Re: [PATCH 2/5] soundwire: qcom: add support for mmio soundwire
 devices
To: Jonathan Marek <jonathan@marek.ca>, alsa-devel@alsa-project.org
References: <20200608204347.19685-1-jonathan@marek.ca>
 <20200608204347.19685-3-jonathan@marek.ca>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <1b29db61-2394-8f88-9ebb-219568fb9306@linaro.org>
Date: Tue, 9 Jun 2020 10:19:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200608204347.19685-3-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Andy Gross <agross@kernel.org>, Sanyog Kale <sanyog.r.kale@intel.com>,
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



On 08/06/2020 21:43, Jonathan Marek wrote:
> Adds support for qcom soundwire devices with memory mapped IO registers.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---

In general patch itself looks pretty trivial, but I would like to see 
what 1.5.1 controller provides in terms of error reporting of SoundWire 
slave register reads/writes. On WCD based controller we did not have a 
mechanism to report things like if the read is ignored or not. I was 
hoping that this version of controller would be able to report that.

I will be nice to those patches if that is something which is supported 
in this version.

--srini

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
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +		ctrl->reg_read = qcom_swrm_cpu_reg_read;
> +		ctrl->reg_write = qcom_swrm_cpu_reg_write;
> +		ctrl->mmio = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(ctrl->mmio))
> +			return PTR_ERR(ctrl->mmio);
>   	}
>   
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
> 
