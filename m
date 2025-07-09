Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5160AFF099
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Jul 2025 20:11:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5477B60191;
	Wed,  9 Jul 2025 20:10:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5477B60191
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752084667;
	bh=BGjHIa2ChMChbzj4QBwulO/MtKXy4Zw2X1Xuz23stj8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TID/9uxOdGzlZejBoUhU4U7Rf3uGOVyR0PxXHg3cqC9jZm7alXftC2mf3KYtx6xUd
	 +3SjUoUzO6OMYaKrjwSMuKztPl2v6pZsA7OHNwjVcftJFMl8XT7dzFk12h/so1F7Kp
	 2uWEwz9VJ+FB72rVwtFZCtcgdhR06wcr+PUR/N5U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8CB64F805C4; Wed,  9 Jul 2025 20:10:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13719F805C4;
	Wed,  9 Jul 2025 20:10:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7CB3F804F2; Wed,  9 Jul 2025 20:10:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp.smtpout.orange.fr (smtp-23.smtpout.orange.fr
 [80.12.242.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33A5DF800E4
	for <alsa-devel@alsa-project.org>; Wed,  9 Jul 2025 20:10:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33A5DF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256
 header.s=t20230301 header.b=WqHb8ozc
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id ZZFEumZSm7x9nZZFEuleTL; Wed, 09 Jul 2025 20:10:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1752084614;
	bh=BMrFI3vtTYIVAW/q/GRmDBqgFHfQaqULTwY51iUC5OQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=WqHb8ozcHaNFju3mgCx8kuEnaFzhMrtBAr6pc7+qg+v6701j0SCtUzFm4qv36HKSe
	 /Mqsoxx3486Bfgi2xAh/pBYTNfTxnLslXHPdeZzoQzfc/erTfOtO/SRmwzsmoqk1OG
	 GpQN49WdGODqKSdTI8MmWXlexYlCXrliG4ktv2i137sKig6zD6bM3uXX/DhpGEiaLa
	 aGMxP2Me3rtgxYsAdXuFcrxxs4pcYN2XuXGIZPwVTAVyLEDDtpoKIhXs1GIaP0E4zZ
	 kpyfuUaTyxhflbNOo2x9WGJeyXSvLR/h6gO0Qv3/ioWRrpfdlCEkQx1fxmkdFrh2CS
	 bAFdDYSbUyakQ==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 09 Jul 2025 20:10:14 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <05c107fa-ba4c-45e8-9007-bdf562b57053@wanadoo.fr>
Date: Wed, 9 Jul 2025 20:10:12 +0200
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
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250709001002.378246-1-ew.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3PFVTK4DDHAGVYJI5GYTRN3VCXXCC4NZ
X-Message-ID-Hash: 3PFVTK4DDHAGVYJI5GYTRN3VCXXCC4NZ
X-MailFrom: christophe.jaillet@wanadoo.fr
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3PFVTK4DDHAGVYJI5GYTRN3VCXXCC4NZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Le 09/07/2025 à 02:10, ew.kim@samsung.com a écrit :
> From: ew kim <ew.kim@samsung.com>
> 
> Implemet basic abox generic drivers.

Implement.

> This driver is a management driver for the generic drivers used in
> Automotive Abox, connecting them to SOC drivers.
> It supports various Exynos Automotive SOCs.
> 

...

> +int abox_generic_attach_soc_callback(struct device *soc_dev,
> +	SOC_IOCTL soc_ioctl)
> +{
> +	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
> +
> +	dev_info(soc_dev, "%s(%d) Attach SoC IOCTL\n", __func__, __LINE__);

__LINE__ is only used in this function. Maybe it is a bit too much?

> +	if (!generic_data) {
> +		dev_err(soc_dev, "%s Generic Drv is not ready\n", __func__);
> +		return -ENODATA;
> +	}
> +	generic_data->soc_dev = soc_dev;
> +	generic_data->soc_ioctl = soc_ioctl;
> +
> +	generic_data->num_of_rdma = generic_data->soc_ioctl(generic_data->soc_dev,
> +		ABOX_SOC_IOCTL_GET_NUM_OF_RDMA, NULL);
> +	generic_data->num_of_wdma = generic_data->soc_ioctl(generic_data->soc_dev,
> +		ABOX_SOC_IOCTL_GET_NUM_OF_WDMA, NULL);
> +	generic_data->num_of_uaif = generic_data->soc_ioctl(generic_data->soc_dev,
> +		ABOX_SOC_IOCTL_GET_NUM_OF_UAIF, NULL);
> +	dev_info(soc_dev, "%s(%d) num_of_rdma:%d\n", __func__, __LINE__, generic_data->num_of_rdma);
> +	dev_info(soc_dev, "%s(%d) num_of_wdma:%d\n", __func__, __LINE__, generic_data->num_of_wdma);
> +	dev_info(soc_dev, "%s(%d) num_of_uaif:%d\n", __func__, __LINE__, generic_data->num_of_uaif);
> +
> +	return 0;
> +}

...

> +struct device *abox_generic_find_fe_dev_from_rtd(struct snd_soc_pcm_runtime *be)
> +{
> +	struct abox_generic_data *generic_data = ABOX_GENERIC_DATA;
> +	struct snd_soc_dpcm *dpcm = NULL;
> +	struct snd_soc_pcm_runtime *fe = NULL;
> +	int stream_type = 0;

Unneeded and unusual init

> +
> +	if (!generic_data)
> +		return NULL;
> +
> +	for (stream_type = 0; stream_type <= SNDRV_PCM_STREAM_LAST; stream_type++) {
> +		int cmpnt_index = 0;
> +		struct snd_soc_component *component = NULL;
> +
> +		for_each_dpcm_fe(be, stream_type, dpcm) {
> +			fe = dpcm->fe;
> +			if (fe)
> +				break;
> +		}
> +		if (!fe)
> +			continue;
> +
> +		for_each_rtd_components(fe, cmpnt_index, component) {
> +			struct platform_device **pdev = NULL;
> +			int num_of_pcm_dev = 0;
> +			int i = 0;

Unneeded and unusual init

> +
> +			if (stream_type == SNDRV_PCM_STREAM_PLAYBACK) {
> +				num_of_pcm_dev = generic_data->num_of_pcm_playback;
> +				pdev = generic_data->pdev_pcm_playback;
> +			} else {
> +				num_of_pcm_dev = generic_data->num_of_pcm_capture;
> +				pdev = generic_data->pdev_pcm_capture;
> +			}
> +			for (i = 0; i < num_of_pcm_dev; i++)
> +				if (pdev[i] && component->dev == &pdev[i]->dev)
> +					return component->dev;
> +		}
> +	}
> +
> +	return NULL;
> +}

...

> +static int abox_generic_resume(struct device *dev)
> +{
> +	struct abox_generic_data *data = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	dev_info(dev, "%s start\n", __func__);
> +	if (!data) {

I don't think this can happen. (same for the suspend function)

> +		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
> +		return -ENODATA;
> +	}
> +
> +	dev_info(dev, "%s end\n", __func__);
> +	return ret;

return 0; to be more explicit?

> +}

...

> +static int abox_generic_read_property_from_dt(struct device *dev, struct abox_generic_data *data)
> +{
> +	struct device_node *np = dev->of_node;
> +	int ret = 0;
> +
> +	ret = of_property_read_u32(np, "samsung,num-of-pcm_playback", &data->num_of_pcm_playback);
> +	if (ret < 0) {
> +		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_playback");
> +		return ret;
> +	}
> +	ret = of_property_read_u32(np, "samsung,num-of-pcm_capture", &data->num_of_pcm_capture);
> +	if (ret < 0) {
> +		dev_err(dev, "%s property reading fail\n", "samsung,num-of-pcm_capture");
> +		return ret;
> +	}
> +	ret = of_property_read_u32(np, "samsung,num-of-i2s-dummy-backend", &data->num_of_i2s_dummy);
> +	if (ret < 0) {
> +		dev_err(dev, "%s property reading fail\n", "samsung,num-of-i2s-dummy-backend");
> +		return ret;
> +	}
> +
> +	return ret;

return 0; to be more explicit?

> +}
> +
> +/**
> + * @cnotice
> + * @prdcode
> + * @Sub_SW_Component{abox generic}
> + * @ALM_Link {work item url}
> + * @purpose "Allocate memory for abox generic"
> + * @logic
> + * \image html
> + * @params
> + * @param{in, dev, struct:: device *, !NULL}
> + * @param{in, data, struct:: abox_gneric_data, !NULL}
> + * @param{out, data->pdev_pcm_playback, struct:: platform_device, !NULL}
> + * @param{out, data->pdev_pcm_capture, struct:: platform_device, !NULL}
> + * @endparam
> + * @retval{ret, int, 0, 0, > 0}
> + */
> +static int abox_generic_allocate_memory(struct device *dev, struct abox_generic_data *data)
> +{
> +	int ret = 0;

Unneeded (see below)

> +
> +	data->pdev_pcm_playback = devm_kzalloc(dev,

devm_kcalloc()?

> +		sizeof(struct platform_device *) * data->num_of_pcm_playback, GFP_KERNEL);
> +	if (!data->pdev_pcm_playback) {
> +		dev_err(dev, "%s Can't allocate memory for pdev_pcm_playback\n", __func__);
> +		ret = -ENOMEM;
> +		return ret;

Not need for ret. return -ENOMEM; is less verbose.

> +	}
> +	data->pdev_pcm_capture = devm_kzalloc(dev,

devm_kcalloc()?

> +		sizeof(struct platform_device *) * data->num_of_pcm_capture, GFP_KERNEL);
> +	if (!data->pdev_pcm_capture) {
> +		dev_err(dev, "%s Can't allocate memory for pdev_pcm_capture\n", __func__);
> +		ret = -ENOMEM;
> +		return ret;

Not need for ret. return -ENOMEM; is less verbose.

> +	}
> +
> +	return ret;

return 0; to be more explicit?

> +}
> +
> +/**
> + * @cnotice
> + * @prdcode
> + * @Sub_SW_Component{abox generic}
> + * @ALM_Link {work item url}
> + * @purpose "Probing the abox generic"
> + * @logic
> + * \image html
> + * @params
> + * @param{in, pdev, struct platform_device *, !NULL}
> + * @param{in, pdev->dev, struct:: device, !NULL}
> + * @endparam
> + * @retval{ret, int, 0, 0, > 0}
> + */
> +static int samsung_abox_generic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct abox_generic_data *data;
> +	int ret = 0;
> +
> +	dev_info(dev, "%s\n", __func__);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data) {
> +		return -ENOMEM;
> +	}

Extra { } not needed.
checkpatch.pl or maybe checkpatch.pl --strict should catech it.

> +
> +	data->pdev = pdev;
> +	ret = abox_generic_read_property_from_dt(dev, data);
> +	if (ret < 0) {
> +		dev_err(dev, "%s Failed to read property. ret:%d\n", __func__, ret);

Using dev_err_probe() here and below would be less verbose.

> +		return ret;
> +	}
> +	ret = abox_generic_allocate_memory(dev, data);
> +	if (ret < 0) {
> +		dev_err(dev, "%s Failed to allocate memory. ret:%d\n", __func__, ret);

dev_err() is already called in abox_generic_allocate_memory().

> +		return ret;
> +	}
> +	g_abox_generic_data = data;
> +	platform_set_drvdata(pdev, data);
> +
> +	platform_register_drivers(abox_generic_sub_drivers, ARRAY_SIZE(abox_generic_sub_drivers));
> +	ret = of_platform_populate(np, NULL, NULL, dev);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to populate sub-platform_devices. ret:%d\n", ret);
> +		return ret;
> +	}
> +
> +	return ret;

return 0; to be more explicit?

> +}
> +
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
> +
> +	if (!data) {

This can not happen. data is set if the probe succeeds.

> +		dev_err(dev, "%s: Invalid abox generic data\n", __func__);
> +		return;
> +	}
> +	return;

Not needed.

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

Not needed.

> +}
> +
> +static const struct of_device_id samsung_abox_generic_match[] = {
> +	{
> +		.compatible = "samsung,abox_generic",
> +	},
> +	{},

Trailing comma can be removed after a terminator.

> +};
> +MODULE_DEVICE_TABLE(of, samsung_abox_generic_match);
> +
> +static const struct dev_pm_ops samsung_abox_generic_pm = {
> +	SET_SYSTEM_SLEEP_PM_OPS(abox_generic_suspend, abox_generic_resume)
> +};

...

CJ
