Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0418D53A
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Mar 2020 18:03:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC945844;
	Fri, 20 Mar 2020 18:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC945844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584723795;
	bh=03A1vQ9EpQlCZNMI4GzvLAos4NQd0MPyT1RKf86YUfY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p4/hs9aFwriTLuobXDMqNT6A3W4oppDwSWLl0CGsmBnAokr4cov0/JQnf5eIjKrgs
	 uHuoe5XKYb3YmwY84A0jDvLDzlL+WViauiNWQ/PiVX/eakpkCCsxLQmIpP9UjY/xTh
	 wJI+rv9G2Z5bpxfa2ms9pttb5QTxvvncklaWDfyQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE99BF80162;
	Fri, 20 Mar 2020 18:01:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C939F8015B; Fri, 20 Mar 2020 18:01:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCCCBF800C0
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 18:01:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCCCBF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PbPE1Wyv"
Received: by mail-wr1-x444.google.com with SMTP id h9so8373972wrc.8
 for <alsa-devel@alsa-project.org>; Fri, 20 Mar 2020 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WAc5lm/otiSMYlhAZkwpRkCEm3vOHc+J4qVldOzMYLg=;
 b=PbPE1WyvLko7zML64W4Fy/tWupg+WQH1wKpA3pUay8H3XFuNYdU3nzhD3CPGihnTx7
 ih+cLHp3N5pEAkHECPGmtZBMzrPaN+y9XHQMkiI7iqEujqP5t7x+2Lt7a1XeJ9QHHLNK
 nk+1jOvU7HCwNzazBbQWRyev4rktZQY6ByMAnqaVVSxXAQ0Zi9mOB3MGaNTow49biVkr
 QDmYbFifK5dkrj3HJ6IRqWKpagtMdGr+QqaZl4sZ7+GtG1hNKyCA9NFmiheF4FBlQb9E
 QJNRHCnlPaej/Y9dapBmKFx6r1AeoUEpVqzdyDEaA6bQBF5ja+41O6bsou1YZFv39a1s
 +Mgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WAc5lm/otiSMYlhAZkwpRkCEm3vOHc+J4qVldOzMYLg=;
 b=ii5nCzWJm4I38PUl2H5BRVa5XIoYN60Rlw1vJwtdRk1mScWqCMvCDop0Wqoqp1zQzV
 AMbjLMBfLMuILsjmnye52W3jw9HbyECrR4KdMpLitatQ85eT5MOh437C1seUFK+EtGUg
 lMZ3u5h3LfQcnGGr3FB9Paj1759TNBQqUvpy2p7gj/JRf8/abanPA9SuU8nwkIucNg5a
 cjxZRR+U9e+V6PM2CeLl3mXIgAWYcslCvvf/nFb9RKNuXawwDeLJVDSY5hOwyOXT8nti
 nl8ccrNWcisKCoDQ/DC05QHmd7r1uCoX7LoNBgt85WZMZyKUdyPOmKg3yqXKVQzrYLKB
 dfug==
X-Gm-Message-State: ANhLgQ0UkhLkQ0ob3RpQ7oslTylc/BUaGkYJDNgTGtjP/JRQvLmg01VY
 vZ048GqRSFzQCFzfj9mMGPcIEA==
X-Google-Smtp-Source: ADFU+vv37Lo2CSsXWa5Kztok67Rtq3einqxjkNtW+ODswAo0H7LtIjSk0BpXPmvoHxMYmOyW+uTN6A==
X-Received: by 2002:a5d:694e:: with SMTP id r14mr11999902wrw.312.1584723683784; 
 Fri, 20 Mar 2020 10:01:23 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id c124sm8695442wma.10.2020.03.20.10.01.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Mar 2020 10:01:23 -0700 (PDT)
Subject: Re: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
 <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <81e2101e-d7ce-d023-5c35-ac6b55ea7166@linaro.org>
Date: Fri, 20 Mar 2020 17:01:21 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 Andy Gross <agross@kernel.org>, jank@cadence.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 slawomir.blauciak@intel.com, Sanyog Kale <sanyog.r.kale@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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



On 20/03/2020 16:29, Pierre-Louis Bossart wrote:
> Add new device as a child of the platform device, following the
> following hierarchy:
> 
> platform_device
>      sdw_master_device
>          sdw_slave0

Why can't we just remove the platform device layer here and add 
sdw_master_device directly?

What is it stopping doing that?

--srini


> 	...
> 	sdw_slaveN
> 
> For the Qualcomm implementation no sdw_master_driver is registered so
> the dais have to be registered using the platform_device and likely
> all power management is handled at the platform device level.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>   drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 77783ae4b71d..86b46415e50b 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -89,6 +89,7 @@ struct qcom_swrm_port_config {
>   struct qcom_swrm_ctrl {
>   	struct sdw_bus bus;
>   	struct device *dev;
> +	struct sdw_master_device *md;
>   	struct regmap *regmap;
>   	struct completion *comp;
>   	struct work_struct slave_work;
> @@ -775,14 +776,31 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	mutex_init(&ctrl->port_lock);
>   	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
>   
> -	ctrl->bus.dev = dev;
> +	/*
> +	 * add sdw_master_device.
> +	 * For the Qualcomm implementation there is no driver.
> +	 */
> +	ctrl->md = sdw_master_device_add(NULL,	/* no driver name */
> +					 dev,	/* platform device is parent */
> +					 dev->fwnode,
> +					 0,	/* only one link supported */
> +					 NULL);	/* no context */
> +	if (IS_ERR(ctrl->md)) {
> +		dev_err(dev, "Could not create sdw_master_device\n");
> +		ret = PTR_ERR(ctrl->md);
> +		goto err_clk;
> +	}
> +
> +	/* the bus uses the sdw_master_device, not the platform device */
> +	ctrl->bus.dev = &ctrl->md->dev;
> +
>   	ctrl->bus.ops = &qcom_swrm_ops;
>   	ctrl->bus.port_ops = &qcom_swrm_port_ops;
>   	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>   
>   	ret = qcom_swrm_get_port_config(ctrl);
>   	if (ret)
> -		goto err_clk;
> +		goto err_md;
>   
>   	params = &ctrl->bus.params;
>   	params->max_dr_freq = DEFAULT_CLK_FREQ;
> @@ -809,14 +827,14 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   					"soundwire", ctrl);
>   	if (ret) {
>   		dev_err(dev, "Failed to request soundwire irq\n");
> -		goto err_clk;
> +		goto err_md;
>   	}
>   
>   	ret = sdw_add_bus_master(&ctrl->bus);
>   	if (ret) {
>   		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
>   			ret);
> -		goto err_clk;
> +		goto err_md;
>   	}
>   
>   	qcom_swrm_init(ctrl);
> @@ -832,6 +850,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   
>   err_master_add:
>   	sdw_delete_bus_master(&ctrl->bus);
> +err_md:
> +	device_unregister(&ctrl->md->dev);
>   err_clk:
>   	clk_disable_unprepare(ctrl->hclk);
>   err_init:
> @@ -843,6 +863,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>   	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
>   
>   	sdw_delete_bus_master(&ctrl->bus);
> +	device_unregister(&ctrl->md->dev);
>   	clk_disable_unprepare(ctrl->hclk);
>   
>   	return 0;
> 
