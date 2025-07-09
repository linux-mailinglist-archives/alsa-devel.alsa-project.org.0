Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17E3AFEB09
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jul 2025 15:58:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B616460176;
	Wed,  9 Jul 2025 15:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B616460176
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752069506;
	bh=CYSBppkuMWh0PsivJ/24T0R73/ywLooQ6TznTg77ymo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sbWmJoIShEm/DZeYhhPHNCOBoCDvfUpke5+tLTq8XK13xTxLkV6GVWdrGwAfrIb2S
	 hVhx0xzFLogf9T4M5h8JF1U2I8JW5MK7Hkn1Q/y7C4YoWnGt0FD6mqiYWSdnAwVTQA
	 9uukxewRLzQNkKkMpHi+xGKRaf4JK3j4zTbxiq4o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4DE1F805C6; Wed,  9 Jul 2025 15:57:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B18ADF805C0;
	Wed,  9 Jul 2025 15:57:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66BCDF804F2; Wed,  9 Jul 2025 15:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A1EAF800E4
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 15:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A1EAF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=atFHJrW6
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CED8465BF;
	Wed,  9 Jul 2025 13:57:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A5CC4CEEF;
	Wed,  9 Jul 2025 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069462;
	bh=CYSBppkuMWh0PsivJ/24T0R73/ywLooQ6TznTg77ymo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=atFHJrW6hs3KC8pKbqwAQScD2CC58aURrBOWQiiOtkNPrNiOComwajUCe1VsYVKMV
	 hzZA14rLnely4R9sOVPE1DeQJvYvyUYK7H0MzLNRtq0F3YVQeJSe54KPTxwHjsyRv0
	 JiC8CF2EHI7tZQMUV0C/1LXu7BtvU7wGNVMvlsLn1sXF+JvoKQX7TW7b6p9Sd+N8j9
	 vKPy1g0fmSataqsFKbFHSWM6P3lt0NsyoE+PtntgEcvPc4Eym3aRMvF/InjhgStPek
	 GGAbJzZalVgCGvVpV2SKOJQ4ZE+XWy9gENisRZZJJlDUUE8Kb3tTYAebLGOoOUTJ/w
	 JVJxg7WhVH06A==
Message-ID: <7d2401d6-d897-49d7-a3be-50de0727b037@kernel.org>
Date: Wed, 9 Jul 2025 15:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: samsung: Implement abox generic structure
To: ew.kim@samsung.com, s.nawrocki@samsung.com, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: 
 <CGME20250709002150epcas2p467416bdbc16754726599a0cacb1feecc@epcas2p4.samsung.com>
 <20250709001002.378246-1-ew.kim@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250709001002.378246-1-ew.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2REQ5NV42IZOHV36U3UCDZKDQILBTOXM
X-Message-ID-Hash: 2REQ5NV42IZOHV36U3UCDZKDQILBTOXM
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2REQ5NV42IZOHV36U3UCDZKDQILBTOXM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/07/2025 02:10, ew.kim@samsung.com wrote:
> +/**
> + * @cnotice
> + * @prdcode
> + * @Sub_SW_Component{abox generic}
> + * @ALM_Link {work item url}
> + * @purpose "Disbaling the abox generic"
> + * @logic "Disbale the abox generic"
> + * \image html
> + * @params
> + * @param{in, pdev->dev, struct::device, !NULL}
> + * @endparam
> + * @noret
> + */
> +static void samsung_abox_generic_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct abox_generic_data *data = dev_get_drvdata(dev);
> +
> +	dev_info(dev, "%s\n", __func__);

This is just poor code. Clean it up from all such oddities popular in
downstream. Look at upstream code. Do you see such code there? No.

> +
> +	if (!data) {
> +		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
> +		return;
> +	}
> +	return;
> +}
> +
> +/**
> + * @cnotice
> + * @prdcode
> + * @Sub_SW_Component{abox generic}
> + * @ALM_Link {work item url}
> + * @purpose "shutdown of the abox generic"
> + * @logic "Disbale the abox hardware by calling the following function
> + * pm_runtime_disable(dev)"
> + * \image html
> + * @params
> + * @param{in, pdev->dev, struct:: device, !NULL}
> + * @endparam
> + * @noret
> + */
> +static void samsung_abox_generic_shutdown(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct abox_generic_data *data = dev_get_drvdata(dev);
> +
> +	if (!data) {
> +		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
> +		return;
> +	}
> +	return;
> +}
> +
> +static const struct of_device_id samsung_abox_generic_match[] = {
> +	{
> +		.compatible = "samsung,abox_generic",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, samsung_abox_generic_match);
> +
> +static const struct dev_pm_ops samsung_abox_generic_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(abox_generic_suspend, abox_generic_resume)
> +};
> +
> +struct platform_driver samsung_abox_generic_driver = {
> +	.probe  = samsung_abox_generic_probe,
> +	.remove = samsung_abox_generic_remove,
> +	.shutdown = samsung_abox_generic_shutdown,
> +	.driver = {
> +		.name = "samsung-abox-generic",
> +		.owner = THIS_MODULE,

So that's indeed 2013 code you upstream. We really want you to clean it
up before you post some ancient stuff like that.


> +		.of_match_table = of_match_ptr(samsung_abox_generic_match),
> +		.pm = &samsung_abox_generic_pm,
> +	},
> +};
> +
> +module_platform_driver(samsung_abox_generic_driver);
> +/* Module information */

Useless comment.

> +MODULE_AUTHOR("Eunwoo Kim, <ew.kim@samsung.com>");
> +MODULE_DESCRIPTION("Samsung ASoC A-Box Generic Driver");
> +MODULE_ALIAS("platform:samsung-abox-generic");

No, drop. This was raised so many times already...

> +MODULE_LICENSE("GPL v2");
> +
> diff --git a/sound/soc/samsung/auto_abox/generic/include/abox_generic.h b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
> new file mode 100644
> index 000000000000..1c954272e2b5
> --- /dev/null
> +++ b/sound/soc/samsung/auto_abox/generic/include/abox_generic.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ALSA SoC - Samsung ABOX Share Function and Data structure
> + * for Exynos specific extensions
> + *
> + * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
> + *
> + * EXYNOS - sound/soc/samsung/abox/include/abox_generic.h

Same with paths. Do you see them anywhere in the kernel?

> + */
> +
> +#ifndef __SND_SOC_ABOX_GENERIC_BASE_H
> +#define __SND_SOC_ABOX_GENERIC_BASE_H
> +
> +#define ABOX_GENERIC_DATA		abox_generic_get_abox_generic_data();
> +
> +struct snd_soc_pcm_runtime;
> +
> +enum abox_soc_ioctl_cmd {
> +	ABOX_SOC_IOCTL_GET_NUM_OF_RDMA,
> +	ABOX_SOC_IOCTL_GET_NUM_OF_WDMA,
> +	ABOX_SOC_IOCTL_GET_NUM_OF_UAIF,
> +	ABOX_SOC_IOCTL_GET_SOC_TIMER,
> +	ABOX_SOC_IOCTL_SET_DMA_BUFFER,
> +	ABOX_SOC_IOCTL_SET_PP_POINTER,
> +	ABOX_SOC_IOCTL_SET_PERF_PERIOD,
> +	ABOX_SOC_IOCTL_CHECK_TIME_MUTEX,
> +	ABOX_SOC_IOCTL_CHECK_TIME_NO_MUTEX,
> +	ABOX_SOC_IOCTL_PCM_DUMP_INTR,
> +	ABOX_SOC_IOCTL_PCM_DUMP_CLOSE,
> +	ABOX_SOC_IOCTL_PCM_DUMP_ADD_CONTROL,
> +	ABOX_SOC_IOCTL_MAX
> +};
> +
> +typedef int (*SOC_IOCTL)(struct device *soc_dev, enum abox_soc_ioctl_cmd cmd, void *data);

Follow coding style.

> +
> +struct abox_generic_data {
> +	struct platform_device *pdev;
> +	struct platform_device **pdev_pcm_playback;
> +	struct platform_device **pdev_pcm_capture;
> +	unsigned int num_of_pcm_playback;
> +	unsigned int num_of_pcm_capture;
> +	unsigned int num_of_i2s_dummy;
> +	unsigned int num_of_rdma;
> +	unsigned int num_of_wdma;
> +	unsigned int num_of_uaif;
> +	struct device *soc_dev;
> +	SOC_IOCTL soc_ioctl;
> +};
> +
> +
> +/************ Internal API ************/

Then why do you expose it via header?

> +
> +struct abox_generic_data *abox_generic_get_abox_generic_data(void);
> +
> +int abox_generic_set_dma_buffer(struct device *pcm_dev);
> +
> +int abox_generic_request_soc_ioctl(struct device *generic_dev, enum abox_soc_ioctl_cmd cmd,
> +	void *data);
> +
> +int abox_generic_set_pp_pointer(struct device *pcm_dev);
> +
> +
> +
> +
> +/************ External API ************/
> +
> +extern struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be);

You cannot have external API. All API is internal first.

> +
> +extern struct platform_device *abox_generic_get_pcm_platform_dev(int pcm_id,
> +	int stream_type);
> +
Best regards,
Krzysztof
