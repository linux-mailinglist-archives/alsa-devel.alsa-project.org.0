Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87E760E5D
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:20:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A297EEA;
	Tue, 25 Jul 2023 11:19:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A297EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276825;
	bh=cEx0YFjbS+47DP8snw5II73lOU4UjH+3LeeDhBenEk8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fWNjMQLUmwgGszHR7K2a7dA2OXkvDJ9GnTCnp8oB5zLEHTEaXD3BcJ4vMcVK0fcJh
	 ikQRZAeVf2cMLQpiol7lYpNwijqgmVojzpouaUB8Arn9sWdJpQLJxxAuPoDnieLDNw
	 8GCp5HYtS3Tv9EXhBxizZmiAXOSUDP3oi2LfVvec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D582DF8057C; Tue, 25 Jul 2023 11:18:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D7FF80568;
	Tue, 25 Jul 2023 11:18:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5E61F8056F; Tue, 25 Jul 2023 11:18:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E8E4F80558
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:18:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E8E4F80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=D0S/g7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276728; x=1721812728;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cEx0YFjbS+47DP8snw5II73lOU4UjH+3LeeDhBenEk8=;
  b=D0S/g7F1MLNwco6xLcUUwvoMq5gEPloFgN3w7/50yVHw0TMM5UaRu04+
   w3S30llbJL0dmVMZ1WDGHaoL/ckbeJ1VVDpIHGBBEp0k98OhuJXGXSRhL
   IgGaq7q1w4aTCw+uxk+3COrvH/NENlsOE4pknW+66q4VS8vhcF9BbAEkk
   9ghKz9SqgJN544tcmFFmjCbizozH7AQUMud5qUutcFOmnumq/wTjLUk1v
   t459Atzo7SuQQ9JFKhpL37m4elMjARsLnF0xlvZmbJTkvpRC4e1IUTL6V
   KubfWVDqclCmSWfd/DlTD7W3X3jOxc1KUbBLcq3lWNnRRhfNKSAocvVE1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="454048898"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="454048898"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980363"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980363"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:37 -0700
Message-ID: <37018459-ee43-d853-1d73-3c6234a265b2@linux.intel.com>
Date: Tue, 25 Jul 2023 10:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 10/32] ASoC: qcom: Add USB backend ASoC driver for Q6
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 mathias.nyman@intel.com, gregkh@linuxfoundation.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org, alsa-devel@alsa-project.org,
 quic_jackp@quicinc.com, oneukum@suse.com, albertccwang@google.com,
 o-takashi@sakamocchi.jp
References: <20230725023416.11205-1-quic_wcheng@quicinc.com>
 <20230725023416.11205-11-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-11-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 253HPLJJCGJFGG666OKV6GQSMFEQSO2H
X-Message-ID-Hash: 253HPLJJCGJFGG666OKV6GQSMFEQSO2H
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/253HPLJJCGJFGG666OKV6GQSMFEQSO2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +struct q6usb_port_data {
> +	struct q6afe_usb_cfg usb_cfg;
> +	struct snd_soc_usb *usb;
> +	struct q6usb_offload priv;
> +	int active_idx;

what is an 'active_idx' ?


> +static int q6usb_alsa_connection_cb(struct snd_soc_usb *usb, int card_idx,
> +			int connected)
> +{
> +	struct snd_soc_dapm_context *dapm;
> +	struct q6usb_port_data *data;
> +
> +	dapm = snd_soc_component_get_dapm(usb->component);
> +	data = dev_get_drvdata(usb->component->dev);

shouldn't you test that 'dapm' and 'data' are not NULL ?

> +
> +	if (connected) {

this goes back to my earlier comment that you treat 'connected' as a
boolean.

> +		snd_soc_dapm_enable_pin(dapm, "USB_RX_BE");
> +		/* We only track the latest USB headset plugged in */
> +		data->active_idx = card_idx;
> +	} else {
> +		snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
> +	}
> +	snd_soc_dapm_sync(dapm);
> +
> +	return 0;
> +}
> +
> +static int q6usb_component_probe(struct snd_soc_component *component)
> +{
> +	struct q6usb_port_data *data = dev_get_drvdata(component->dev);
> +	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
> +
> +	snd_soc_dapm_disable_pin(dapm, "USB_RX_BE");
> +	snd_soc_dapm_sync(dapm);
> +
> +	data->usb = snd_soc_usb_add_port(component->dev, &data->priv, q6usb_alsa_connection_cb);
> +	if (IS_ERR(data->usb)) {
> +		dev_err(component->dev, "failed to add usb port\n");
> +		return -ENODEV;
> +	}
> +
> +	data->usb->component = component;
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_component_driver q6usb_dai_component = {
> +	.probe = q6usb_component_probe,

erm, if you have a .probe that adds a port, don't you need a remove that
removes the same port, and sets the pin state as well?

> +	.name = "q6usb-dai-component",
> +	.dapm_widgets = q6usb_dai_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(q6usb_dai_widgets),
> +	.dapm_routes = q6usb_dapm_routes,
> +	.num_dapm_routes = ARRAY_SIZE(q6usb_dapm_routes),
> +	.of_xlate_dai_name = q6usb_audio_ports_of_xlate_dai_name,
> +};
> +
> +static int q6usb_dai_dev_probe(struct platform_device *pdev)
> +{
> +	struct device_node *node = pdev->dev.of_node;
> +	struct q6usb_port_data *data;
> +	struct device *dev = &pdev->dev;
> +	struct of_phandle_args args;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_u32(node, "qcom,usb-audio-intr-num",
> +				&data->priv.intr_num);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to read intr num.\n");
> +		return ret;
> +	}
> +
> +	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> +	if (ret < 0)
> +		data->priv.sid = -1;
> +	else
> +		data->priv.sid = args.args[0] & SID_MASK;
> +
> +	data->priv.domain = iommu_get_domain_for_dev(&pdev->dev);
> +
> +	data->priv.dev = dev;
> +	dev_set_drvdata(dev, data);
> +
> +	ret = devm_snd_soc_register_component(dev, &q6usb_dai_component,
> +					q6usb_be_dais, ARRAY_SIZE(q6usb_be_dais));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;

return devm_snd_soc_register_component

> +}
> +
> +static int q6usb_dai_dev_remove(struct platform_device *pdev)
> +{
> +	snd_soc_usb_remove_port(&pdev->dev);

that seems wrong, the port is added in the component probe, not the
platform device probe.

> +
> +	return 0;
> +}> +

