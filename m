Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AAD47D70A
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Dec 2021 19:41:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F250E16D5;
	Wed, 22 Dec 2021 19:40:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F250E16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640198492;
	bh=oOVOjEEzgvxlrDHocASvHzUa4+R6bMBav0YcDvmDCs4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GUD3HipUf/tJvCTAIvBz9p5rC0IOIPumNSso80EfUWOiA3dRVujzFY5D/mPeBAVYf
	 nbXPmzDP6vUHosrfeX4cPTlOMJnFimnSewHv1HsBN9Bt0O/bDFoGLsSJlT6iI3NGEC
	 CQz3nQVeNPgQhwZ6VJZDEqXvsGEgjuCLiO5V1N6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 678DDF80111;
	Wed, 22 Dec 2021 19:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A5B8F80109; Wed, 22 Dec 2021 19:40:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, NICE_REPLY_A, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7E73F80105
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 19:40:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7E73F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="EiT4zUcN"
Received: by mail-lf1-x131.google.com with SMTP id u13so7235475lff.12
 for <alsa-devel@alsa-project.org>; Wed, 22 Dec 2021 10:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=W8sEphJb7GJVdi88wbZ9u/Spea2ot80mxoEbl6P7QDw=;
 b=EiT4zUcNW/DfVii4TuDzaHWnQ70nfKCAevP7CMfxJGqz+t7vsCUxhaQe8CeLbZM3y7
 qahj67oAXYGc6dW4yX7Dp080a2E6nGKwh15Pbmd0FyfOLoBq6Cd0DYX2kIcATs2iO5vq
 v5xkcoFRBdDgjcYR9pPknkw+yUUOuMBf9xHwXsBuKBL9ZqQkQ6S6EUaQgc2oNp0rmMDA
 2xYVjEN1k+17k8lF32OsikBJlnX968xw90ut2DZUie5+2EwiIOz5EFzBOaaBbVZkbXce
 hKLmnk7FN39IbxZKHYaa+obSah9M4VLpxMz8z0zTPbYzn7zZ22OMJU8aeICoQSZrYvtF
 gpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W8sEphJb7GJVdi88wbZ9u/Spea2ot80mxoEbl6P7QDw=;
 b=68NgJ7NpuiEJI0kYyr09yCIhZZLl913fP3KAcIKHlRB/mPqK9x59V/3ejpL6unjEd4
 fpSbLFot+40Lu1173kDQRuEf/rDB05/aYHhXsiRoLle0gA93OkPKP6QYQ5UeDIpFjtWK
 4oPI/fpnuef6YMulUgCydeUhmXwniid+IpbBFZmXmLNJgAaULl3jTeFcrpIziVXAEGDC
 VW69UDKhCyJRnYvsajn5Q7snUY3hNPvTQ38Csh5A6rVYlMxoiqQAEO+NvepboNOch0jk
 QPrZaAlza+fM26AVjG0oCfO2uw4x8Bg1M6IZYwl0WJFFel7eFaovPrAdRUdb+tDZKj2d
 X2qw==
X-Gm-Message-State: AOAM531TYsvKpwazt2FBRy2Yy+6gkHT6zPu+VL88SadPeu9TcHbzDFrz
 VMEb+YQ8t8jk4K2iPGzCirA=
X-Google-Smtp-Source: ABdhPJz+IkJomMq3ZP58p2tbSEKOhNwGWfkuI2UAIWm3HwgOqehGrbJTnn1olk+RFGGoFwMLBlTRwQ==
X-Received: by 2002:a05:6512:40d:: with SMTP id
 u13mr3138039lfk.327.1640198411472; 
 Wed, 22 Dec 2021 10:40:11 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id v27sm285104lfo.97.2021.12.22.10.40.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Dec 2021 10:40:11 -0800 (PST)
Subject: Re: [PATCH v3 1/3] ALSA: hda/tegra: Fix Tegra194 HDA reset failure
To: Sameer Pujar <spujar@nvidia.com>, tiwai@suse.com, broonie@kernel.org,
 lgirdwood@gmail.com, robh+dt@kernel.org, thierry.reding@gmail.com,
 perex@perex.cz
References: <1640147751-4777-1-git-send-email-spujar@nvidia.com>
 <1640147751-4777-2-git-send-email-spujar@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <fb8cf33f-41fb-79c0-3134-524c290e4fc1@gmail.com>
Date: Wed, 22 Dec 2021 21:40:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1640147751-4777-2-git-send-email-spujar@nvidia.com>
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

22.12.2021 07:35, Sameer Pujar пишет:
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

Is "Depends-on" a valid tag? I can't find it in Documentation/.

> ---
>  sound/pci/hda/hda_tegra.c | 45 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 36 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
> index ea700395..7c3df54 100644
> --- a/sound/pci/hda/hda_tegra.c
> +++ b/sound/pci/hda/hda_tegra.c
> @@ -68,14 +68,20 @@
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
> +	struct reset_control_bulk_data resets[3];
>  	struct clk_bulk_data clocks[3];
> +	unsigned int nresets;
>  	unsigned int nclocks;
>  	void __iomem *regs;
>  	struct work_struct probe_work;
> +	const struct hda_tegra_soc *data;
>  };
>  
>  #ifdef CONFIG_PM
> @@ -170,7 +176,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>  	int rc;
>  
>  	if (!chip->running) {
> -		rc = reset_control_assert(hda->reset);
> +		rc = reset_control_bulk_assert(hda->nresets, hda->resets);
>  		if (rc)
>  			return rc;
>  	}
> @@ -187,7 +193,7 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
>  	} else {
>  		usleep_range(10, 100);
>  
> -		rc = reset_control_deassert(hda->reset);
> +		rc = reset_control_bulk_deassert(hda->nresets, hda->resets);
>  		if (rc)
>  			return rc;
>  	}
> @@ -427,9 +433,17 @@ static int hda_tegra_create(struct snd_card *card,
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
> @@ -449,6 +463,10 @@ static int hda_tegra_probe(struct platform_device *pdev)
>  	hda->dev = &pdev->dev;
>  	chip = &hda->chip;
>  
> +	hda->data = of_device_get_match_data(&pdev->dev);
> +	if (!hda->data)
> +		return -EINVAL;

hda->data can't ever be NULL because all hda_tegra_match[] compatibles
above have .data assigned. Technically this check is redundant.

Thierry suggested previously to name it "hda->soc", like we usually do
it in other drivers.

>  	err = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1, SNDRV_DEFAULT_STR1,
>  			   THIS_MODULE, 0, &card);
>  	if (err < 0) {
> @@ -456,11 +474,20 @@ static int hda_tegra_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> -	hda->reset = devm_reset_control_array_get_exclusive(&pdev->dev);
> -	if (IS_ERR(hda->reset)) {
> -		err = PTR_ERR(hda->reset);
> +	hda->resets[hda->nresets++].id = "hda";
> +	hda->resets[hda->nresets++].id = "hda2hdmi";
> +	/*
> +	 * "hda2codec_2x" reset is not present on Tegra194. Though DT would
> +	 * be updated to reflect this, but to have backward compatibility
> +	 * below is necessary.
> +	 */
> +	if (hda->data->has_hda2codec_2x_reset)
> +		hda->resets[hda->nresets++].id = "hda2codec_2x";
> +
> +	err = devm_reset_control_bulk_get_exclusive(&pdev->dev, hda->nresets,
> +						    hda->resets);
> +	if (err)
>  		goto out_free;
> -	}
>  
>  	hda->clocks[hda->nclocks++].id = "hda";
>  	hda->clocks[hda->nclocks++].id = "hda2hdmi";
> 

Not sure whether the above nits worth making v4. I'll leave it up to you
and other reviewers to decide.

Overall this patch looks good to me, thank you.

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
