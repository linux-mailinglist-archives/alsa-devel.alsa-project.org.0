Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7571B034F
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 09:44:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D42D61669;
	Mon, 20 Apr 2020 09:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D42D61669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587368661;
	bh=S2gZguDmIhkEXSqcs7tZfqJVPnHyQYtss9DAD35ezNw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HICueltk8IJAA55TeLcq6Zif3mp8h07pr5jaXVG/0Z0fcDk5gRhrt4OgL7eMio7it
	 ashGtjyRmjjGOpCmo5dMc6NA5u/SHspTdtAX1scFL5+sjCp6PpwwzNwlvqAMRoPfhN
	 H21LXrZoNPxW45OL42Wj1M/rYWAtt8cIC0NgStdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB08DF8020C;
	Mon, 20 Apr 2020 09:42:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F371F801D9; Mon, 20 Apr 2020 09:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3FECBF800E7
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 09:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FECBF800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xtWDgbT5"
Received: by mail-wr1-x443.google.com with SMTP id b11so10818920wrs.6
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 00:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ewZfJT+hF2YM+qJSsl0O1dzlck6lSvjtReN5vcsfFY0=;
 b=xtWDgbT5GWxuvhGTx8BXdhFEVtB6kLkQbuxwBIgpsVTZNJVTiItdv2FJ9BRiNFrSKe
 UPFy6IMwoD4koU4RHkaD8BZ72RBFBxB5c73ulmRDWdgUL13lep2Lv0CS7TqRDuwFdiGj
 Qo5GkMSwdAuvF39w3yBjlIMJQaDLUyDjpGHkliiaF0Pho+PHkjV5I2YOZ4CEVYvGBSRh
 J/XaAB92ylbxoxj3xY3K3DSqtzv503w9HdbxThphdUa5NOikiLXCCInuLRb3lk4Li4Th
 6SbKKg9VHOTkLoerNXOz9WpFkvXeJeSCfP3vQjENWjMppiZzI1xx2FuJ0RCNlPwQ6qPU
 KNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ewZfJT+hF2YM+qJSsl0O1dzlck6lSvjtReN5vcsfFY0=;
 b=hVv0ypdp6bWqQUNkbapB1y5a1sMlVa0A8jXr6TcaKDTbQht+XlCpQsg1+agno7AX2e
 x70OhiSovEJbb6Om8mH4NN9bXSvPLcyaXmyqbNeg0RJm2hXRWHUZDDTZE5xYYBtyRH4P
 Lrt2Z2FWZWxu7s5X7v7T9FeAWz+r4NIdOr1/pHZZ4b/xK+Tp10C4QL3ZP98sK406y2mH
 fZ/gZK0sXPj5pExuo5jC4k/OYm3CYgsCCdOmfGmlbv9Lqok+EgaK/qIeSB4IbM7+i/yf
 pYuY9jz3yYv6f9L4SyYw4le08Z77wgCRbpfO53Pc/arM3RQWD2r8OTTZYBTO8xwTPvIv
 69/A==
X-Gm-Message-State: AGi0PuYY/gz+N7JuxC0pBhEc6mJMGj7T0K5zFPwb5JYWRNyrW4zQLD63
 5+v5TXPS0obC+vO7Xq7Of7K7kA==
X-Google-Smtp-Source: APiQypLK9dr1rlKUtLsy8YI0+R+kaRLY7vo8ZLe3s7d0bIGnDCUnRm13tWGx8hctWsBYmLqlydc0KQ==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr16923695wrw.353.1587368549727; 
 Mon, 20 Apr 2020 00:42:29 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.googlemail.com with ESMTPSA id f63sm205720wma.47.2020.04.20.00.42.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 00:42:29 -0700 (PDT)
Subject: Re: [RFC 3/5] soundwire: qcom: fix error handling in probe
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org, 
 vkoul@kernel.org
References: <20200416205524.2043-1-yung-chuan.liao@linux.intel.com>
 <20200416205524.2043-4-yung-chuan.liao@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <6be6b739-2f5e-e2ba-2ca0-56108f667ffe@linaro.org>
Date: Mon, 20 Apr 2020 08:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200416205524.2043-4-yung-chuan.liao@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: pierre-louis.bossart@linux.intel.com, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 jank@cadence.com, mengdong.lin@intel.com, slawomir.blauciak@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com
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



On 16/04/2020 21:55, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Make sure all error cases are properly handled and all resources freed.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
Thanks for the patch,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

>   drivers/soundwire/qcom.c | 26 +++++++++++++++++---------
>   1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index d6c9ad231873..e08a17c13f92 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -765,12 +765,16 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   	}
>   
>   	ctrl->irq = of_irq_get(dev->of_node, 0);
> -	if (ctrl->irq < 0)
> -		return ctrl->irq;
> +	if (ctrl->irq < 0) {
> +		ret = ctrl->irq;
> +		goto err_init;
> +	}
>   
>   	ctrl->hclk = devm_clk_get(dev, "iface");
> -	if (IS_ERR(ctrl->hclk))
> -		return PTR_ERR(ctrl->hclk);
> +	if (IS_ERR(ctrl->hclk)) {
> +		ret = PTR_ERR(ctrl->hclk);
> +		goto err_init;
> +	}
>   
>   	clk_prepare_enable(ctrl->hclk);
>   
> @@ -787,7 +791,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   
>   	ret = qcom_swrm_get_port_config(ctrl);
>   	if (ret)
> -		return ret;
> +		goto err_clk;
>   
>   	params = &ctrl->bus.params;
>   	params->max_dr_freq = DEFAULT_CLK_FREQ;
> @@ -814,28 +818,32 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>   					"soundwire", ctrl);
>   	if (ret) {
>   		dev_err(dev, "Failed to request soundwire irq\n");
> -		goto err;
> +		goto err_clk;
>   	}
>   
>   	ret = sdw_add_bus_master(&ctrl->bus);
>   	if (ret) {
>   		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
>   			ret);
> -		goto err;
> +		goto err_clk;
>   	}
>   
>   	qcom_swrm_init(ctrl);
>   	ret = qcom_swrm_register_dais(ctrl);
>   	if (ret)
> -		goto err;
> +		goto err_master_add;
>   
>   	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
>   		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
>   		 ctrl->version & 0xffff);
>   
>   	return 0;
> -err:
> +
> +err_master_add:
> +	sdw_delete_bus_master(&ctrl->bus);
> +err_clk:
>   	clk_disable_unprepare(ctrl->hclk);
> +err_init:
>   	return ret;
>   }
>   
> 
