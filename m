Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9D986208
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Sep 2024 17:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2161A84A;
	Wed, 25 Sep 2024 17:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2161A84A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727276798;
	bh=LTFovhotCR3F0gjdRFbbOMrUPSlsAH2Mi6k1oPhssn0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AHvll9L4OsHZr90oh/Wk0O3BpyVtzEUPo3yzVpJastyZsWShpLZ+jPllajdOB2jUv
	 zaDyBu0Wc21GPy8vxVh+SRBJPswoEmuEsBtawhKIl0CJ8ptyS2rKhg5qsjjnDzgvED
	 cik7brjEhYp4PsSxaLER9TkdeqJV5ByWD2H94N+U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B9FF80617; Wed, 25 Sep 2024 17:05:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E835F8061E;
	Wed, 25 Sep 2024 17:05:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45AC3F80611; Wed, 25 Sep 2024 17:05:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8D48F805FE
	for <alsa-devel@alsa-project.org>; Wed, 25 Sep 2024 17:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8D48F805FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WylltOXA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727276727; x=1758812727;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LTFovhotCR3F0gjdRFbbOMrUPSlsAH2Mi6k1oPhssn0=;
  b=WylltOXAi3CyUc8vFcCPLMKyzeS98SsBLCx+D0ZzTCIA/lo9JCz5znTx
   VaSVnfW6nDLVFo2ux7NnoAZ5rcXYQUroKl1QN2+llG44hKuAGhnhs6q6g
   fdJ5NcB9eHp4sILPOTdFC4e7ld0atR4K7ooIJz6f7LkXrYiHqqG/bdgWB
   /2dUNLy2y2scpSjtJ8tW7Dne70jb0hXfKITahp3k6YKPzQ8gf9q4sQsfQ
   Nl3TeJBj/tegokYgtQc05gvNEAHzlTudH7Jk+6n2T9UV1Kh0ssGTOao7r
   eUYtyJijtgO/cCeZxvmT5aO31aIJiA9LaGigM5eJICliHgImg9V5BHiOy
   g==;
X-CSE-ConnectionGUID: YjvixYjMQYCWI0eU4FDVJg==
X-CSE-MsgGUID: 2VFHPhcSQYaoCzGkZVJTLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26482956"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="26482956"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:25 -0700
X-CSE-ConnectionGUID: uBmKSm89TSiRGkjsbpUpYg==
X-CSE-MsgGUID: ELGXt5SjQ5GvFpL3sot2/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600";
   d="scan'208";a="76317739"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.246.30])
 ([10.245.246.30])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:05:20 -0700
Message-ID: <8bb65adc-e995-443e-80c9-36e9b5d8eee3@linux.intel.com>
Date: Wed, 25 Sep 2024 16:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 30/32] ALSA: usb-audio: Add USB offload route kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-31-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240925010000.2231406-31-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5F7WVGGRDYFCJMU2DIBYATMYNQ5Y5KWM
X-Message-ID-Hash: 5F7WVGGRDYFCJMU2DIBYATMYNQ5Y5KWM
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5F7WVGGRDYFCJMU2DIBYATMYNQ5Y5KWM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> +static int
> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
> +			  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int ret;
> +
> +	ret = snd_soc_usb_update_offload_route(sysdev,
> +					       CARD_IDX(kcontrol->private_value),
> +					       PCM_IDX(kcontrol->private_value),
> +					       SNDRV_PCM_STREAM_PLAYBACK,
> +					       ucontrol->value.integer.value);
> +	if (ret < 0) {
> +		ucontrol->value.integer.value[0] = -1;
> +		ucontrol->value.integer.value[1] = -1;
> +	}

well this invalidates again what I understood from the last patch and
goes back to what I understood initially: the error code is never
returned to higher levels - when offload is not supported the kcontrol
values are encoded to the -1 magic value.

> +	return 0;

and this begs the question if this helper should return a void value.

> +}
> +
> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
> +				      struct snd_ctl_elem_info *uinfo)
> +{
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 2;
> +	uinfo->value.integer.min = -1;
> +	/* Arbitrary max value, as there is no 'limit' on number of PCM devices */
> +	uinfo->value.integer.max = 0xff;
> +
> +	return 0;
> +}
> +
> +static struct snd_kcontrol_new snd_usb_offload_mapped_ctl = {
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.access = SNDRV_CTL_ELEM_ACCESS_READ,
> +	.info = snd_usb_offload_route_info,
> +	.get = snd_usb_offload_route_get,
> +};
> +
> +/**
> + * snd_usb_offload_create_ctl() - Add USB offload bounded mixer
> + * @chip - USB SND chip device
> + *
> + * Creates a sound control for a USB audio device, so that applications can
> + * query for if there is an available USB audio offload path, and which
> + * card is managing it.
> + */
> +int snd_usb_offload_create_ctl(struct snd_usb_audio *chip)
> +{
> +	struct usb_device *udev = chip->dev;
> +	struct snd_kcontrol_new *chip_kctl;
> +	struct snd_usb_substream *subs;
> +	struct snd_usb_stream *as;
> +	char ctl_name[37];

that's quite a magic value.

> +	int ret;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
> +		subs = &as->substream[SNDRV_PCM_STREAM_PLAYBACK];
> +		if (!subs->ep_num)
> +			continue;
> +
> +		chip_kctl = &snd_usb_offload_mapped_ctl;
> +		chip_kctl->count = 1;
> +		/*
> +		 * Store the associated USB SND card number and PCM index for
> +		 * the kctl.
> +		 */
> +		chip_kctl->private_value = as->pcm_index |
> +					  chip->card->number << 16;
> +		sprintf(ctl_name, "USB Offload Playback Route PCM#%d",
> +			as->pcm_index);
> +		chip_kctl->name = ctl_name;
> +		ret = snd_ctl_add(chip->card, snd_ctl_new1(chip_kctl,
> +				  udev->bus->sysdev));
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	return ret;
> +}
