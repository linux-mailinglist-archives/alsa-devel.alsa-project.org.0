Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC83B760E4F
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 11:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8F4CEB6;
	Tue, 25 Jul 2023 11:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8F4CEB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690276771;
	bh=+Q06PentsIanzmdfnoZS42vyVmRdVGNF/39w4Rf8BrE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hsofayEfLTWIs80s7Of5ra5cvIgG6jraGs5HCp0cGkAjq4d045uSKJDSfWSzxFRIx
	 ZKH1GaUppwuqGPiv98UHEqhyaON/l+K2t0nEkkJ8VAgzhyZ7mOxgjWHgfWJbVk3bMM
	 RwBOZ4VdzEGPZZTnYlIFW+q3Y62kxGOwDomByJsI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D0CAF80163; Tue, 25 Jul 2023 11:18:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4517F8019B;
	Tue, 25 Jul 2023 11:18:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AA9FF8019B; Tue, 25 Jul 2023 11:18:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73DC2F80149
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 11:18:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73DC2F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fbX0CH05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276709; x=1721812709;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Q06PentsIanzmdfnoZS42vyVmRdVGNF/39w4Rf8BrE=;
  b=fbX0CH05klFuifyrOqgl1Hcyh86aR4wEstCN7NQ2AW1V57asUNOGo1Ri
   snXpsDFrjqsLjXpruza72kYfAgjsqOcM95I+CEwJv2iEIS7ej2vwQAxOK
   O+HaseWnDtcdhJP7O67uTzVR6PL78+Hnb6eXEJk7Nz7oGGJq+Dv/ZqC2W
   1re26WVStPBloSzFprau14M05Z5ffN3htX67dsj690lm7M46J32GhMo2b
   MQYIvQoWguRdKXyfNjHaGqu634mG8vG5oBxtJsDdVwSrX7a/FeJz+DQXe
   R3AcnvWOWoxAvqXGG9ZY2nBE4eHafHLHxok0Wqndz1CxtpgT13oPGsF/O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="454048782"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="454048782"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719980272"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="719980272"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 02:18:17 -0700
Message-ID: <9e391c7d-f45b-42f4-fae4-72fba32482db@linux.intel.com>
Date: Tue, 25 Jul 2023 10:10:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v4 06/32] ASoC: Add SOC USB APIs for adding an USB backend
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
 <20230725023416.11205-7-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230725023416.11205-7-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TNUPZMLRXD5WZTSUEEWXHCMJG5TCT77E
X-Message-ID-Hash: TNUPZMLRXD5WZTSUEEWXHCMJG5TCT77E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TNUPZMLRXD5WZTSUEEWXHCMJG5TCT77E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> +/**
> + * struct snd_soc_usb
> + * @list - list head for SND SOC struct list
> + * @dev - USB backend device reference
> + * @component - reference to DAPM component

ASoC component, not DAPM.

> + * @connection_status_cb - callback to notify connection events
> + * @priv_data - driver data
> + **/
> +struct snd_soc_usb {
> +	struct list_head list;
> +	struct device *dev;
> +	struct snd_soc_component *component;
> +	int (*connection_status_cb)(struct snd_soc_usb *usb, int card_idx,
> +				int connected);

It's not clear what 'connected' really refers to, is this a boolean
really or is this a "connection_event?


> +	void *priv_data;
> +};
> +
> +int snd_soc_usb_connect(struct device *usbdev, int card_idx);
> +int snd_soc_usb_disconnect(struct device *usbdev);
> +void snd_soc_usb_set_priv_data(struct device *dev, void *priv);

this function is not part of this patch, is this intentional to have a
get but not a set?

> +void *snd_soc_usb_get_priv_data(struct device *usbdev);

you are using 'usbdev' and 'dev' for the same type of parameters, why
not align on one set of definition with a consistent naming.


> +static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
> +{
> +	struct device_node *node;
> +	struct snd_soc_usb *ctx = NULL;

this init doesn't seem required?

> +
> +	node = snd_soc_find_phandle(dev);
> +	if (IS_ERR(node))
> +		return NULL;
> +
> +	mutex_lock(&ctx_mutex);
> +	list_for_each_entry(ctx, &usb_ctx_list, list) {
> +		if (ctx->dev->of_node == node) {
> +			of_node_put(node);
> +			mutex_unlock(&ctx_mutex);
> +			return ctx;
> +		}
> +	}
> +	of_node_put(node);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return NULL;
> +}
> +
> +/**
> + * snd_soc_usb_get_priv_data() - Retrieve private data stored
> + * @dev: device reference
> + *
> + * Fetch the private data stored in the USB SND SOC structure.
> + *
> + */
> +void *snd_soc_usb_get_priv_data(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);

so in this function you walk through the usb_ctx_list with locking...

> +	if (!ctx) {
> +		/* Check if backend device */
> +		list_for_each_entry(ctx, &usb_ctx_list, list) {

... and here you walk again through the list without locking.

Something's weird here, if this was intentional you need to add comments.

> +			if (dev->of_node == ctx->dev->of_node)
> +				goto out;
> +		}
> +		ctx = NULL;
> +	}
> +out:
> +	return ctx ? ctx->priv_data : NULL;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_get_priv_data);
> +
> +/**
> + * snd_soc_usb_add_port() - Add a USB backend port
> + * @dev: USB backend device
> + * @priv: private data
> + * @connection_cb: connection status callback
> + *
> + * Register a USB backend device to the SND USB SOC framework.  Memory is
> + * allocated as part of the USB backend device.
> + *
> + */
> +struct snd_soc_usb *snd_soc_usb_add_port(struct device *dev, void *priv,
> +			int (*connection_cb)(struct snd_soc_usb *usb, int card_idx,
> +			int connected))
> +{
> +	struct snd_soc_usb *usb;
> +
> +	usb = devm_kzalloc(dev, sizeof(*usb), GFP_KERNEL);
> +	if (!usb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	usb->connection_status_cb = connection_cb;
> +	usb->dev = dev;
> +	usb->priv_data = priv;

back to my comment above, you don't seem to need the set_priv_data() ?

> +
> +	mutex_lock(&ctx_mutex);
> +	list_add_tail(&usb->list, &usb_ctx_list);
> +	mutex_unlock(&ctx_mutex);
> +
> +	return usb;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_add_port);

> +/**
> + * snd_soc_usb_connect() - Notification of USB device connection
> + * @usbdev: USB bus device
> + * @card_idx: USB SND card instance
> + *
> + * Notify of a new USB SND device connection.  The card_idx can be used to
> + * handle how the USB backend selects, which device to enable offloading on.

"USB backend" is confusing, not sure if this is the same concept as DPCM
"backend" or something else. Please try to avoid overloaded terms.

> + *
> + */
> +int snd_soc_usb_connect(struct device *usbdev, int card_idx)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	if (!usbdev)
> +		return -ENODEV;
> +
> +	ctx = snd_soc_find_usb_ctx(usbdev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	if (ctx->connection_status_cb)
> +		ctx->connection_status_cb(ctx, card_idx, 1);

so either the 'connected' value is 1...
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_connect);
> +
> +/**
> + * snd_soc_usb_disconnect() - Notification of USB device disconnection
> + * @usbdev: USB bus device
> + *
> + * Notify of a new USB SND device disconnection to the USB backend.
> + *
> + */
> +int snd_soc_usb_disconnect(struct device *usbdev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	if (!usbdev)
> +		return -ENODEV;
> +
> +	ctx = snd_soc_find_usb_ctx(usbdev);
> +	if (!ctx)
> +		return -ENODEV;
> +
> +	if (ctx->connection_status_cb)
> +		ctx->connection_status_cb(ctx, -1, 0);

...and here it's zero.

should this 'connected' parameter be a boolean then with true/false
value, or do you want to add enums/defines for more flexibility down the
road?

> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_disconnect);
