Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAC947B6CE
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 02:22:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A28B51729;
	Tue, 21 Dec 2021 02:21:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A28B51729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640049765;
	bh=uEcowjVyde4xsuxzXGFrKtzv9v6ZPzDE0E1cumVi3Tg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nb1ILQ8MJVpMmSY27cy0eiSWbzpfBayDlUKfswRtdJjHEh63QEIi3fid6q3ecl4n8
	 Fa3Yzeb2caexWJaDkCDtSB36mLh2o4pUVIdsf5NX9R5fHrG82Wuhrjgv3kI5Jw31lv
	 y+xr4hOPw3EF+Xw+B+zC36FuaLpD9tPn9CMXfplQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05CD0F801D5;
	Tue, 21 Dec 2021 02:21:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 236B9F80149; Tue, 21 Dec 2021 02:21:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DC81F80125
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 02:21:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DC81F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eF1G2y2T"
Received: by mail-lf1-x12e.google.com with SMTP id i31so10409577lfv.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Dec 2021 17:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nkRfs6Jq6Yr/a/t9OO2egmqloXCmD4IcdPxGpgHonb8=;
 b=eF1G2y2TjCAkFUrBHcdwf3AbiSiwCXaA2g7IKISK3lq1/wtP150oj9nLjun2CQ+h1R
 vot0D+gAcqRR647Zq81AI3CvVtcy3qDvnFMgCF4DHHFLLiEhLrLdpLz1gGyWi7JqjsMq
 Q5XPxpn2JAkCLZfvmuz8D1aMmD/Bp5QBWMX+MGVw72KvpunSLbk+ZeKop5LvmtvU2n97
 5CsfKyuXgPWnKXIlltWovD4O1uQy3ssLCHpROmBnMqq4e6sbAe5zm8UC2DTyXOTkglGX
 EUt8rMwVdQ90IX6gxggPtLDeknNwu3LogfS0J0irajS7bExPTNK/MTUro5ZETcIatvCq
 UFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nkRfs6Jq6Yr/a/t9OO2egmqloXCmD4IcdPxGpgHonb8=;
 b=2ChV6D+Eu0E6HIZWpM5d/fr7FnMQAxtAEI5Y1CqACHSZvnSO3qY3CEY+FrzdLqPf+G
 MRsMweIJRFYKZpGfvVektzLwoX9VEW+/BR/htDzWhdzK6Jx99AfTEqNmE0Zu+uP2VEvl
 iKO34ZWyHjy3yPwyPIRz8BR59wgCsKc1P3k8JFJHDre2ffGf1WDuZAzlfADrhnRIUiEh
 LEuRNQdTrSoXol57uco8dWRqoqSeQo8j9FjcNPteHHQQVCx8aY9RXmyp3CzwlU71YSLL
 velIjMqXYvPH6355w+LgexlnuvqmQY7VvBjp+hWzkI/2lcl3bJOG1GCA9RpG2IYb9WL2
 ZNTw==
X-Gm-Message-State: AOAM532EOUltzQ28ENnth2yuzGRRl0dKQsRlO7Q09xbzA2xARD50ubNg
 7LsreMUz3IGv6ngBf/uWqYE=
X-Google-Smtp-Source: ABdhPJziuxKcVGxUkjz2c00kkrTen8rOkYs71ofy6F7odPfZ42R/oI6ztDoz6894QXV2I32c3yKg8w==
X-Received: by 2002:ac2:51bc:: with SMTP id f28mr842680lfk.222.1640049685857; 
 Mon, 20 Dec 2021 17:21:25 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id h18sm2637460ljh.133.2021.12.20.17.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 17:21:25 -0800 (PST)
Subject: Re: [PATCH v2 1/3] ALSA: hda/tegra: Fix Tegra194 HDA reset failure
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1640021408-12824-1-git-send-email-spujar@nvidia.com>
 <1640021408-12824-2-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f859559c-abf1-ae37-6a0f-80329e6f747f@gmail.com>
Date: Tue, 21 Dec 2021 04:21:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1640021408-12824-2-git-send-email-spujar@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, mkumard@nvidia.com
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

20.12.2021 20:30, Sameer Pujar пишет:
> HDA regression is recently reported on Tegra194 based platforms.
> This happens because "hda2codec_2x" reset does not really exist
> in Tegra194 and it causes probe failure. All the HDA based audio
> tests fail at the moment. This underlying issue is exposed by
> commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
> response") which now checks return code of BPMP command response.
> Fix this issue by skipping unavailable reset on Tegra194.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: stable@vger.kernel.org
> Depends-on: 87f0e46e7559 ("ALSA: hda/tegra: Reset hardware")
> ---
>  sound/pci/hda/hda_tegra.c | 96 ++++++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 86 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index ea700395..be010cd 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -68,14 +68,21 @@
>   */
>  #define TEGRA194_NUM_SDO_LINES	  4
>  
> +struct hda_tegra_soc {
> +	bool has_hda2codec_2x_reset;
> +};
> +
>  struct hda_tegra {
>  	struct azx chip;
>  	struct device *dev;
> -	struct reset_control *reset;
> +	struct reset_control *reset_hda;
> +	struct reset_control *reset_hda2hdmi;
> +	struct reset_control *reset_hda2codec_2x;
>  	struct clk_bulk_data clocks[3];
>  	unsigned int nclocks;
>  	void __iomem *regs;
>  	struct work_struct probe_work;
> +	const struct hda_tegra_soc *data;
>  };
>  
>  #ifdef CONFIG_PM
> @@ -170,9 +177,26 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>  	int rc;
>  
>  	if (!chip->running) {
> -		rc = reset_control_assert(hda->reset);
> -		if (rc)
> +		rc = reset_control_assert(hda->reset_hda);
> +		if (rc) {
> +			dev_err(dev, "hda reset assert failed, err: %d\n", rc);
> +			return rc;
> +		}
> +
> +		rc = reset_control_assert(hda->reset_hda2hdmi);
> +		if (rc) {
> +			dev_err(dev, "hda2hdmi reset assert failed, err: %d\n",
> +				rc);
> +			return rc;
> +		}
> +
> +		rc = reset_control_assert(hda->reset_hda2codec_2x);
> +		if (rc) {
> +			dev_err(dev,
> +				"hda2codec_2x reset assert failed, err: %d\n",
> +				rc);
>  			return rc;
> +		}
>  	}
>  
>  	rc = clk_bulk_prepare_enable(hda->nclocks, hda->clocks);
> @@ -187,9 +211,27 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>  	} else {
>  		usleep_range(10, 100);
>  
> -		rc = reset_control_deassert(hda->reset);
> -		if (rc)
> +		rc = reset_control_deassert(hda->reset_hda);
> +		if (rc) {
> +			dev_err(dev, "hda reset deassert failed, err: %d\n",
> +				rc);
>  			return rc;
> +		}
> +
> +		rc = reset_control_deassert(hda->reset_hda2hdmi);
> +		if (rc) {
> +			dev_err(dev, "hda2hdmi reset deassert failed, err: %d\n",
> +				rc);
> +			return rc;
> +		}
> +
> +		rc = reset_control_deassert(hda->reset_hda2codec_2x);
> +		if (rc) {
> +			dev_err(dev,
> +				"hda2codec_2x reset deassert failed, err: %d\n",
> +				rc);
> +			return rc;
> +		}
>  	}
>  
>  	return 0;
> @@ -427,9 +469,17 @@ static int hda_tegra_create(struct snd_card *card,
>  	return 0;
>  }
>  
> +static const struct hda_tegra_soc tegra30_data = {
> +	.has_hda2codec_2x_reset = true,
> +};
> +
> +static const struct hda_tegra_soc tegra194_data = {
> +	.has_hda2codec_2x_reset = false,
> +};
> +
>  static const struct of_device_id hda_tegra_match[] = {
> -	{ .compatible = "nvidia,tegra30-hda" },
> -	{ .compatible = "nvidia,tegra194-hda" },
> +	{ .compatible = "nvidia,tegra30-hda", .data = &tegra30_data },
> +	{ .compatible = "nvidia,tegra194-hda", .data = &tegra194_data },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, hda_tegra_match);
> @@ -449,6 +499,10 @@ static int hda_tegra_probe(struct platform_device *pdev)
>  	hda->dev = &pdev->dev;
>  	chip = &hda->chip;
>  
> +	hda->data = of_device_get_match_data(&pdev->dev);
> +	if (!hda->data)
> +		return -EINVAL;
> +
>  	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
>  			   THIS_MODULE, 0, &card);
>  	if (err < 0) {
> @@ -456,12 +510,34 @@ static int hda_tegra_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	hda->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
> -	if (IS_ERR(hda->reset)) {
> -		err = PTR_ERR(hda->reset);
> +	hda->reset_hda = devm_reset_control_get_exclusive(&pdev->dev, "hda");
> +	if (IS_ERR(hda->reset_hda)) {
> +		err = PTR_ERR(hda->reset_hda);
>  		goto out_free;
>  	}
>  
> +	hda->reset_hda2hdmi = devm_reset_control_get_exclusive(&pdev->dev,
> +							       "hda2hdmi");
> +	if (IS_ERR(hda->reset_hda2hdmi)) {
> +		err = PTR_ERR(hda->reset_hda2hdmi);
> +		goto out_free;
> +	}
> +
> +	/*
> +	 * "hda2codec_2x" reset is not present on Tegra194. Though DT would
> +	 * be updated to reflect this, but to have backward compatibility
> +	 * below is necessary.
> +	 */
> +	if (hda->data->has_hda2codec_2x_reset) {
> +		hda->reset_hda2codec_2x =
> +			devm_reset_control_get_exclusive(&pdev->dev,
> +							 "hda2codec_2x");
> +		if (IS_ERR(hda->reset_hda2codec_2x)) {
> +			err = PTR_ERR(hda->reset_hda2codec_2x);
> +			goto out_free;
> +		}
> +	}
> +
>  	hda->clocks[hda->nclocks++].id = "hda";
>  	hda->clocks[hda->nclocks++].id = "hda2hdmi";
>  	hda->clocks[hda->nclocks++].id = "hda2codec_2x";
> 

All stable kernels affected by this problem that don't support the bulk
reset API are EOL now. Please use bulk reset API like I suggested in the
comment to v1, it will allow us to have a cleaner and nicer code.

The bulk reset code will look similar to the bulk clk API already used
by the HDA driver, you'll only need to skip adding the hda2codec_2x to
resets[3] and switch to use reset_control_bulk_reset_*() variants of the
functions.
