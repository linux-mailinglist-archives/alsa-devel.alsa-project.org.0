Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF09447C2
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Aug 2024 11:15:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF3538EE;
	Thu,  1 Aug 2024 11:14:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF3538EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722503706;
	bh=hlG5dmxzgBQ8QYdl97vTifyi/3aA4LNWtHjoLyb36DE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ike27gFWebZhVd2jKjyn9PNd2E517I5cXBAKXFdKS8u8S3sMFmeMcED4jW5LIo+En
	 lzHm6W0vnJlSlJuW3PuFH5hDzMrtEc6w7G0zWuzEYBwPBWo2lGamY8SNpn8Jm7sOLD
	 rGZ0/Dg8ceIg7iojNqIcrTEJU2wDFyR2DyQgfolE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B96F80608; Thu,  1 Aug 2024 11:13:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F408F8069C;
	Thu,  1 Aug 2024 11:13:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5520F80605; Thu,  1 Aug 2024 11:12:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD867F805F0
	for <alsa-devel@alsa-project.org>; Thu,  1 Aug 2024 11:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD867F805F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DCezCAYu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722503540; x=1754039540;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hlG5dmxzgBQ8QYdl97vTifyi/3aA4LNWtHjoLyb36DE=;
  b=DCezCAYug2Bw9CWJnq2Fvu+RbjLE+XYLoPTYPNspdcha+dFac2V1Xz8/
   ZARpka6DkirxIlGbAyE0eA7WDwniYu42Sr1DQeE7wfgkI0gvY+9TYtu5E
   znr/pUeyX4ppbGMOe6MuOxkbyiIWuLSKfGqadCihJsQP/BsnP4nUcS+n+
   1f1MqgMEWuxL7hDcTo6nCLoCb+BnIjog3oTEWHpFBpCIBexue8+vjb9Ss
   yQvFpK6AXTbxTXRe4CJR2WtkoekNen68v+JT+q99PGnHdHTHPxQumLgXl
   tOZF6O/0Pl8K3Diu0Bg3yMguHzfjSlx+PVUn6tFVG5qT15UR+W1YRWuag
   w==;
X-CSE-ConnectionGUID: X1pnGtFWSlanykuA/BGrLg==
X-CSE-MsgGUID: TeKg5QszQ/qJW4xBVsUwJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20383700"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="20383700"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:16 -0700
X-CSE-ConnectionGUID: as0uoOqLRVyGfgF+j/kEug==
X-CSE-MsgGUID: YgCYS42HRumVFZ5NUqy/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800";
   d="scan'208";a="59090227"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.220])
 ([10.245.246.220])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 02:12:10 -0700
Message-ID: <4d5fe3f8-d7ba-4647-8dd7-22656ec2fde5@linux.intel.com>
Date: Thu, 1 Aug 2024 11:02:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 29/34] ALSA: usb-audio: qcom: Add USB offload route
 kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, tiwai@suse.com,
 gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240801011730.4797-1-quic_wcheng@quicinc.com>
 <20240801011730.4797-30-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240801011730.4797-30-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RRZW4RGWBYSEXMQ3L7UNB3HGJZ5QHCPD
X-Message-ID-Hash: RRZW4RGWBYSEXMQ3L7UNB3HGJZ5QHCPD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RRZW4RGWBYSEXMQ3L7UNB3HGJZ5QHCPD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> +ifneq ($(CONFIG_SND_USB_QC_OFFLOAD_MIXER),)
> +snd-usb-audio-qmi-objs += mixer_usb_offload.o
> +endif
> \ No newline at end of file

add one?

> diff --git a/sound/usb/qcom/mixer_usb_offload.c b/sound/usb/qcom/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..c00770400c67
> --- /dev/null
> +++ b/sound/usb/qcom/mixer_usb_offload.c
> @@ -0,0 +1,101 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/soc-usb.h>
> +
> +#include "../card.h"
> +#include "../mixer.h"
> +#include "../usbaudio.h"
> +
> +#include "mixer_usb_offload.h"
> +
> +#define PCM_IDX(n)  (n & 0xffff)
> +#define CARD_IDX(n) (n >> 16)
> +
> +static int
> +snd_usb_offload_route_get(struct snd_kcontrol *kcontrol,
> +		      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct device *sysdev = snd_kcontrol_chip(kcontrol);
> +	int card;
> +	int pcm;
> +
> +	card = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
> +					  PCM_IDX(kcontrol->private_value),
> +					  SND_SOC_USB_KCTL_CARD_ROUTE);
> +
> +	pcm = soc_usb_get_offload_device(sysdev, CARD_IDX(kcontrol->private_value),
> +					 PCM_IDX(kcontrol->private_value),
> +					 SND_SOC_USB_KCTL_PCM_ROUTE);
> +	if (card < 0 || pcm < 0) {
> +		card = -1;
> +		pcm = -1;
> +	}
> +
> +	ucontrol->value.integer.value[0] = card;
> +	ucontrol->value.integer.value[1] = pcm;
> +
> +	return 0;
> +}

see my earlier comment, should those two calls be collapsed to return
all the information in one shot?

> +
> +static int snd_usb_offload_route_info(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_info *uinfo)
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
> +	struct snd_usb_stream *as;
> +	char ctl_name[37];
> +	int ret;
> +
> +	list_for_each_entry(as, &chip->pcm_list, list) {
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

None of this looks Qualcomm-specific, shouldn't this be part of the
soc_usb framework instead of being added in the qcom/ stuff?
