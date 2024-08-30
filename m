Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E63965E22
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:13:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43B4B852;
	Fri, 30 Aug 2024 12:13:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43B4B852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012809;
	bh=nvwdli/vuJlXs99b/bTWyLUX2OouSS5qT/PZKpNYfC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qVPTaxU44WuVBK6utOGoso4TicYGfCyRbxcdZleGlP664BCwYd9b/0towcOh2VQSg
	 6EpFoUcCh6XteAtJvGuEeZeUe5smpOUyZGko3hXqFOb6gX9YFmWcOuJ3fg3W8QTUJS
	 ue29kbVHLzOrHUks0n7HG3+2vysQKGIhTEdnqjJE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4ED5F80654; Fri, 30 Aug 2024 12:12:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB0E3F80672;
	Fri, 30 Aug 2024 12:12:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01ADBF80587; Fri, 30 Aug 2024 12:12:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6377AF80631
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6377AF80631
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FOxN2Q0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012719; x=1756548719;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nvwdli/vuJlXs99b/bTWyLUX2OouSS5qT/PZKpNYfC4=;
  b=FOxN2Q0FGRlGagTMa2md/F4kx5FlUi8e7yOvXgADeCpZ/xf3D3zhzZ19
   kXwyInvmekALLf/Ai3z+xeytKXZ+quoJM+LyVCYGsCT61KFpv2c5sDqwv
   iz+7bHrbOQowWsF06V8QV2nC54ZS2fBrWj6oH4yyxk+Uz3RtHKlQGXg0m
   ltryjIrDL9rB0uv17o7cKwIN6zIYoDFQEHnf/AL6NG2iBZhrkZnZeIId1
   ZMtYSsV2EUHmhrh04s6wTUGqagznYVIYviLYYftednFM1Hpkopjn5toGA
   1iwO0Ftv8qN2jJAEPSlHygni2pkIlMpz+Z9xXPIEo2YLQK1UhtH8TcleC
   w==;
X-CSE-ConnectionGUID: hWDUPERxT6CrSftCDEQ8Sw==
X-CSE-MsgGUID: kQkSkW1WQoSqi8rnJIbTMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218778"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:56 -0700
X-CSE-ConnectionGUID: smPuBLJIRsuikEzaAcvyMQ==
X-CSE-MsgGUID: zk7MvKEdSk6jyRtiUFbE1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481495"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:49 -0700
Message-ID: <fe01d7f6-fd85-41ca-9b53-f13cc82096ed@linux.intel.com>
Date: Fri, 30 Aug 2024 10:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 14/33] ASoC: usb: Create SOC USB SND jack kcontrol
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
References: <20240829194105.1504814-1-quic_wcheng@quicinc.com>
 <20240829194105.1504814-15-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 734SYQFLMRDILBWOZLOAZHDSQ764YXHW
X-Message-ID-Hash: 734SYQFLMRDILBWOZLOAZHDSQ764YXHW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/734SYQFLMRDILBWOZLOAZHDSQ764YXHW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Expose API for creation of a jack control for notifying of available
> devices that are plugged in/discovered, and that support offloading.  This
> allows for control names to be standardized across implementations of USB
> audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Some nit-picks below.

> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index b550ee87b748..5c788cbfa82e 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -6,6 +6,8 @@
>  #ifndef __LINUX_SND_SOC_USB_H
>  #define __LINUX_SND_SOC_USB_H
>  
> +#include <sound/soc.h>
> +

nit-pick: move this to patch 12/33


> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index 8ade2060d8fe..3d5354298206 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -4,8 +4,10 @@
>   */
>  #include <linux/of.h>
>  #include <linux/usb.h>
> -#include <sound/soc.h>
> +

nit-pick: move this to patch 12/33

> +#include <sound/jack.h>
>  #include <sound/soc-usb.h>
> +
>  #include "../usb/card.h"
>  
>  static DEFINE_MUTEX(ctx_mutex);
> @@ -57,6 +59,64 @@ static struct snd_soc_usb *snd_soc_find_usb_ctx(struct device *dev)
>  	return ctx ? ctx : NULL;
>  }
>  
> +/* SOC USB sound kcontrols */
> +/**
> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
> + * @component: USB DPCM backend DAI component
> + * @jack: jack structure to create
> + *
> + * Creates a jack device for notifying userspace of the availability
> + * of an offload capable device.
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +				   struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
> +				    SND_JACK_USB, jack);
> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack\n");

nit-pick: be consistent and return the code in the error log as done below.

> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
