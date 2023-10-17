Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE29C7CD0C2
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:29:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2481A91;
	Wed, 18 Oct 2023 01:28:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2481A91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585340;
	bh=CHJ5c/rgNCeYwsWKj461nWA5YOYqSXvbYEb3J1+5U7Q=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aAPI+V45Cu6psX/Mrm925YXH5//dFMHPeaFcZO+mG+5eg72FpIBWiuk+9EZNB6Lvu
	 fB/esGNjZMdn9M8dz5uf3LxSQBN5ZXJA2wtrKkOc3a7gx62CzAc3FvJWUeCGcqOn21
	 zNZrnqgH9cR9r7BLQq2ukilYe6CpzcVqO+3D7Ej0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38980F80637; Wed, 18 Oct 2023 01:24:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA75F8062F;
	Wed, 18 Oct 2023 01:24:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E75D5F8027B; Wed, 18 Oct 2023 01:24:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66255F8027B
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66255F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SZmtw/1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585002; x=1729121002;
  h=message-id:date:mime-version:from:subject:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=CHJ5c/rgNCeYwsWKj461nWA5YOYqSXvbYEb3J1+5U7Q=;
  b=SZmtw/1BBSifwKDAPMG+pwzRjt1q4QlRha+pud6Hx2wIaz+remU/dFLz
   4Y4Yusky85hE39VB7dG0P7zevW66BBsV2bnBmb9hEDHJ1ycJT23I03n5o
   IjhFBfaW4bR0S585OSFVTKwajRxaHoCsQXSWBmkjQQnUpwWSo+Ze7e9Mg
   uUXkb95gg9TTjIBhMhpY1fnbtFeOwZKgA6W+Gv3kIZ+MQFv4YNZAroaoD
   yv65t2RS/ekyrURKZYyATWJwWaq9BJVy2yAQ2/yeaVvC8oF8ekh3+6aG2
   X6iWZBuqh6Afcucb9xUaygW8q6Zd+OSM8RyGfIStZRtbNhj/OU1WdW+QJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778082"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778082"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637462"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637462"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:16 -0700
Message-ID: <8eb90a7a-8649-4a31-9997-d970915510bf@linux.intel.com>
Date: Tue, 17 Oct 2023 16:48:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v9 07/34] ASoC: Add SOC USB APIs for adding an USB backend
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-8-quic_wcheng@quicinc.com>
Content-Language: en-US
In-Reply-To: <20231017200109.11407-8-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: D4F3SADK4V4ADAYGBHLONPQ3RPTLCB6M
X-Message-ID-Hash: D4F3SADK4V4ADAYGBHLONPQ3RPTLCB6M
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4F3SADK4V4ADAYGBHLONPQ3RPTLCB6M/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:00, Wesley Cheng wrote:
> Some platforms may have support for offloading USB audio devices to a
> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> USB sound card and PCM devices enumerated by the USB SND class driver.
> This allows for the ASoC components to be aware of what USB devices are

USB devices or USB endpoints? or both?

> available for offloading.

> +/**
> + * struct snd_soc_usb_device
> + * @card_idx - sound card index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @num_playback - number of playback streams
> + * @num_capture - number of capture streams

presumably excluding explicit feedback streams?

> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int chip_idx;
> +	int num_playback;
> +	int num_capture;
> +};
> +
> +/**
> + * struct snd_soc_usb
> + * @list - list head for SND SOC struct list
> + * @dev - USB backend device reference
> + * @component - reference to ASoC component
> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - driver data
> + **/
> +struct snd_soc_usb {
> +	struct list_head list;
> +	struct device *dev;

usbdev for consistency with the API below?

> +	struct snd_soc_component *component;

could you use component only and infer the device from component->dev?

> +	int (*connection_status_cb)(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected);
> +	void *priv_data;
> +};
> +
> +int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +void *snd_soc_usb_get_priv_data(struct device *usbdev);
> +
> +struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,

struct device *usbdev for consistency ?

> +			int (*connection_cb)(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected));
> +int snd_soc_usb_remove_port(struct device *dev);

struct device *usbdev for consistency ?


> +struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
> +			int (*connection_cb)(struct snd_soc_usb *usb,
> +			struct snd_soc_usb_device *sdev, bool connected))> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = devm_kzalloc(dev, sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->connection_status_cb = connection_cb;
> +	usb->dev = dev;
> +	usb->priv_data = priv;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);
> +
> +/**
> + * snd_soc_usb_remove_port() - Remove a USB backend port
> + * @dev: USB backend device
> + *
> + * Remove a USB backend device from USB SND SOC.  Memory is freed when USB
> + * backend is removed.

when the USB backend driver is unbound?

> + *
> + */
> +int snd_soc_usb_remove_port(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx, *tmp;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry_safe(ctx, tmp, &usb_ctx_list, list) {
> +		if (ctx->dev == dev) {
> +			list_del(&ctx->list);
> +			break;
> +		}
> +	}
> +	mutex_unlock(&ctx_mutex);
> +
> +	return 0;

can this return void to align with the current trend?

> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_remove_port);
> +
> +/**
> + * snd_soc_usb_connect() - Notification of USB device connection
> + * @usbdev: USB bus device
> + * @card_idx: USB SND card instance
> + *
> + * Notify of a new USB SND device connection.  The card_idx can be used to
> + * handle how the DPCM backend selects, which device to enable USB offloading
> + * on.

card_idx is not used below, and I don't see how this relates to a
notification?

> + *
> + */
> +int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev)
> +{
> +	struct snd_soc_usb *ctx;
> +	struct device_node *node;
> +
> +	if (!usbdev)
> +		return -ENODEV;
> +
> +	node = snd_soc_find_phandle(usbdev);
> +	if (IS_ERR(node))
> +		return -ENODEV;
> +
> +	ctx = snd_soc_find_usb_ctx(node);
> +	of_node_put(node);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	if (ctx->connection_status_cb)
> +		ctx->connection_status_cb(ctx, sdev, true);
> +
> +	return 0;
> +}

