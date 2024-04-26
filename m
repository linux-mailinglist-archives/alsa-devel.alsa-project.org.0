Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C838B3864
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Apr 2024 15:26:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9C7B14DD;
	Fri, 26 Apr 2024 15:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9C7B14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714137961;
	bh=wrFvzBHWtoD17fbW2f/KSN/X1vBLYzoBPj1SNMLxdRo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lgaut9NqFr17d37IX3a59I//NAODmdfOwRwnpvZzO+bNIS51IlUxVtS/tMLppRcO8
	 5G0oZABbo0bQXWaqY71G85302hPVOEpar3I02LLRjGkn8TCtA0+Jp2R/tRF6DFR3YF
	 ID0zwkfAmn525b51xrJQgekQofjyctsBJyFsxNeg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 009EDF805B0; Fri, 26 Apr 2024 15:25:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61165F80578;
	Fri, 26 Apr 2024 15:25:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E262EF80568; Fri, 26 Apr 2024 15:25:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4401FF8045D
	for <alsa-devel@alsa-project.org>; Fri, 26 Apr 2024 15:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4401FF8045D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KP/vuvJE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714137934; x=1745673934;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wrFvzBHWtoD17fbW2f/KSN/X1vBLYzoBPj1SNMLxdRo=;
  b=KP/vuvJEHUOhRtK/6sqVG3TeuHiLP7MDJmtIdusiXe+AyA6vk30ORDL4
   WFm1cltjg/PB5G/u5sT/Q8KsFgKTgVL0lHc495QtHV+Ru/mXtqiEcyydo
   z+zewKFog/RSYTlF2gT1nvBs3nFAxY2U9lOlm3AGc7SsL9+eDedpxz49U
   QbKckKTmsHFqdyvovOqiJPYY+Yjg0q1t6g7wbwBannjT2eX2l8IpqwhSG
   Mb7pgJLdjSPyF/qGuw15WVaKRghaUmv5a+54FiVGU2WuUxskB/893sCs1
   Gimlk8uUxtbTrjOaEqEaAAxu02QqFjPzDvOShqOscKrPLbtB4frEB0DTN
   A==;
X-CSE-ConnectionGUID: 7vA9mh5CRBW02uVaN0XSpg==
X-CSE-MsgGUID: 7vyiDDyQQ/ORkRS4/sIgPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="27388462"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="27388462"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:25:24 -0700
X-CSE-ConnectionGUID: Gl8OHmJ8Qr+bku/V74LdJA==
X-CSE-MsgGUID: YJy8i+p+RI6WRk3uU1XurA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000";
   d="scan'208";a="25302209"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 06:25:18 -0700
Message-ID: <3d70c19f-bab8-4e50-9551-de406a0e0314@linux.intel.com>
Date: Fri, 26 Apr 2024 15:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 22/41] ASoC: usb: Add PCM format check API for USB
 backend
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 corbet@lwn.net, lgirdwood@gmail.com, andersson@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 Thinh.Nguyen@synopsys.com, broonie@kernel.org, bgoswami@quicinc.com,
 tiwai@suse.com, robh@kernel.org, konrad.dybcio@linaro.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20240425215125.29761-1-quic_wcheng@quicinc.com>
 <20240425215125.29761-23-quic_wcheng@quicinc.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240425215125.29761-23-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PT6CCFUT6SZKFTV2KIRB7Z2TP5C5F3YX
X-Message-ID-Hash: PT6CCFUT6SZKFTV2KIRB7Z2TP5C5F3YX
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PT6CCFUT6SZKFTV2KIRB7Z2TP5C5F3YX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 4/25/2024 11:51 PM, Wesley Cheng wrote:
> Introduce a helper to check if a particular PCM format is supported by the
> USB audio device connected.  If the USB audio device does not have an
> audio profile which can support the requested format, then notify the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

(...)

> +/**
> + * snd_soc_usb_find_format() - Check if audio format is supported
> + * @card_idx: USB sound chip array index
> + * @params: PCM parameters
> + * @direction: capture or playback
> + *
> + * Ensure that a requested audio profile from the ASoC side is able to be
> + * supported by the USB device.
> + *
> + * Return 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
> +			int direction)

Perhaps name function similar to its snd_usb equivalent, so 
snd_soc_usb_find_supported_format?

> +{
> +	struct snd_usb_stream *as;
> +
> +	as = snd_usb_find_suppported_substream(card_idx, params, direction);
> +	if (!as)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);
> +
>   /**
>    * snd_soc_usb_allocate_port() - allocate a SOC USB device
>    * @component: USB DPCM backend DAI component
> 

