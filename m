Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B6667D1C7
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Jan 2023 17:37:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE0FE7E;
	Thu, 26 Jan 2023 17:36:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE0FE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674751020;
	bh=V/yKMg/Zih7KzTuXcz/KJSetw/FOegDR/tnmbXTxaYY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Co3f7o/VxM7L/0Kjyk3XUiDfxvjSAqeg5pwsgZmvOctI3PA7MyWTdmyWX+ssw2Vq2
	 Q2QlgjprCOmBmPtetj9COBtBsStbHpgMdBuL4p2VRwOKw+R5SJcu6AZgVmCcaBKTxt
	 GjLQul+fD0Qe/YVsfxNt6oaFP4K18xR2imugJDes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE480F800AE;
	Thu, 26 Jan 2023 17:36:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91CF5F8027D; Thu, 26 Jan 2023 17:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D540AF80224
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 17:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D540AF80224
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cvhnX0fW
Received: by mail-ed1-x530.google.com with SMTP id g11so2349068eda.12
 for <alsa-devel@alsa-project.org>; Thu, 26 Jan 2023 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=afez1nsKlZmE+ENEERE7Oo/V5VhLLIWK6OgZUW8xIho=;
 b=cvhnX0fWR5gLtPdV8uzCMk0K87aF0P1NkjL7UbHZZwQwDjKaLGLKdJuiGcE9pO3Ne6
 jYpCr4xptwHNwgB4Yw3ba8yohEdlfpwPyGGZy4LX4u5vay/33iWUpx4O3LrATSGkQw/b
 jhXV/KJ8SKTr0pM8z4X1BiZb2FM0fMKE2r3fe8WbyjmdBHvpRwE6BS39v0n8izjR0vfW
 1LmFvibAgrN2OD1nE7VoUj6oImoD7PgLaDYWIfo8AwPcR2lgcIdeSHFBgwk8JcU7crQh
 cObk+cmzFvq+LxN1f7JfrRfdvhktdkNgH8dYTnxNRo97I5IT17Y1cbjQjHpb0MGWmG41
 dcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=afez1nsKlZmE+ENEERE7Oo/V5VhLLIWK6OgZUW8xIho=;
 b=VaEOEwPl6pqQVKmX5qvXW3SvQ+yCM5gqSofJjO/L8Mr6Mc5NOrY8lOezmhywZ4/JKc
 O+nHgF3gQNyonRjjPIYwmUfCHlDjYDLLA+gkwRCKO8Kd6EA9Muj779VH6PuD33UTWH40
 87c9oqpr6AbSSlrzcqqvNXsSRosT8JVTxZ0ynZBSRHWE+18NLE52KLEMj3e/Nz6XAmDH
 nLZ2oST9nqf0qpCuNb2xIuonY+I6LRyryPA9QqYPf/KE87l92pS/OcSdQMJaOjEUy0J0
 E5hlUAuQcuamTevqCeNQBcWB8Zs9v9V4T7STV6NC5mHujq7Ps34k+NMNLKXZa0AZ1J9o
 cgjA==
X-Gm-Message-State: AFqh2koFozvniTzNejiiKEdQ85Iu4m0mebrnrJ+PtCNXSJ2nQUziwcZp
 PU1kYnZtBoRkN068+nOkpIwC7g==
X-Google-Smtp-Source: AMrXdXu/trqwU0wO6hcbTWNdvL7JmToL9lOSDZ0+tnzXlz5ZWkKoQjyYDauMEG0SU0okMmsikNA/Jw==
X-Received: by 2002:aa7:de95:0:b0:49d:be2b:b9b1 with SMTP id
 j21-20020aa7de95000000b0049dbe2bb9b1mr37564501edv.36.1674750952116; 
 Thu, 26 Jan 2023 08:35:52 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 w25-20020aa7d299000000b0048789661fa2sm952239edq.66.2023.01.26.08.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 08:35:51 -0800 (PST)
Message-ID: <e1291152-2c74-514c-00a5-526564d7d827@linaro.org>
Date: Thu, 26 Jan 2023 16:35:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v2 11/22] ASoC: qcom: Add USB backend ASoC driver for
 Q6
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 perex@perex.cz, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh+dt@kernel.org, agross@kernel.org
References: <20230126031424.14582-1-quic_wcheng@quicinc.com>
 <20230126031424.14582-12-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20230126031424.14582-12-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jackp@quicinc.com, quic_plai@quicinc.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 26/01/2023 03:14, Wesley Cheng wrote:
> +}
> +
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
...
> +	data->priv.domain = iommu_domain_alloc(pdev->dev.bus);
> +	if (!data->priv.domain) {
> +		dev_err(&pdev->dev, "failed to allocate iommu domain\n");
> +		return -ENODEV;
> +	}
> +
> +	/* attach to external processor iommu */
> +	ret = iommu_attach_device(data->priv.domain, &pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to attach device ret = %d\n", ret);
> +		goto free_domain;
> +	}
> +
Why are we doing this manually here? device core should take care of 
attaching iommu to the device instance.

...


> +detach_device:
> +	iommu_detach_device(data->priv.domain, &pdev->dev);
> +free_domain:
> +	iommu_domain_free(data->priv.domain);
> +
> +	return ret;
> +}
> +
> +static int q6usb_dai_dev_remove(struct platform_device *pdev)
> +{
> +	struct q6usb_port_data *data = platform_get_drvdata(pdev);
> +
> +	iommu_detach_device(data->priv.domain, &pdev->dev);
> +	iommu_domain_free(data->priv.domain);
> +
