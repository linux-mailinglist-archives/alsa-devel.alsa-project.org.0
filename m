Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C903A965E1F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Aug 2024 12:12:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17A333E;
	Fri, 30 Aug 2024 12:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17A333E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725012775;
	bh=l9psxk81nRdSzjW/aRnloNwiDJhvsUtP9o/wLWJZwKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D0r+DarV6265UXXwwT+X7btYy0qBIZ6rqbrasqjPbM7LryF2fQPpowFqD77SX6f5y
	 lZUtJjVVZtNKqokkoPTWdYGUsaA7aMNcLqHTkTvKoZcwstFN5djyzrWZa5T80uvbff
	 aN+AwvVSTwaTSSPe2kMPMTO2QgJHJ7+9GnzgRm+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28A38F8061B; Fri, 30 Aug 2024 12:11:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD523F8061A;
	Fri, 30 Aug 2024 12:11:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 418D2F805E8; Fri, 30 Aug 2024 12:11:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 5D5CEF805E7
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D5CEF805E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Ys/lsZUW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725012702; x=1756548702;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=l9psxk81nRdSzjW/aRnloNwiDJhvsUtP9o/wLWJZwKQ=;
  b=Ys/lsZUW0fbdqWJ8GAxufwcZBMlsHerPq6PxvJKbe/F7EGZ52W+ts69d
   T6c2hMgx/4pS23m+Vb6j+wNCxl/x5D/rOwBaKue5x/djgHabVf59GNEDe
   RMVU/OJFJRua/DJGJJx+lSrAiMKi3WAiQlvKd7VbMpYT8sfXjbox2t5Jb
   E6MhyRG3QDccHhbayXohHto+nyFLAhO2K+IZhw38/EZHeVqwYSf0lrYAS
   s1n1pDeKidvptwCjipx6ezNQiiiKKaDRxNuYMlwrJxwzWiHd1qdnTIRhL
   k2HhXKSr7R8qlWixWlKOqKSf0fc/zXJ1y4QZSoBMxCLCFc5dif5KeQJQf
   g==;
X-CSE-ConnectionGUID: 5vBw6TBETRerXyX+c/Dl7A==
X-CSE-MsgGUID: ynfKjUF2TGqsYjy6c8nEyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34218750"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="34218750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:40 -0700
X-CSE-ConnectionGUID: E7jW+uSASPyOaK0CNUGchw==
X-CSE-MsgGUID: Nx/fGtg6QJ2j9EB7fcvsVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600";
   d="scan'208";a="63481408"
Received: from ltuz-desk.ger.corp.intel.com (HELO [10.245.246.101])
 ([10.245.246.101])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 03:11:33 -0700
Message-ID: <1bcf8eee-7d7f-48b2-aa0f-2c578d4ca79c@linux.intel.com>
Date: Fri, 30 Aug 2024 10:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v26 12/33] ASoC: Add SOC USB APIs for adding an USB
 backend
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
 <20240829194105.1504814-13-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240829194105.1504814-13-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RTBAP63RMINUJUHP64GTBSGCQOIGHVKB
X-Message-ID-Hash: RTBAP63RMINUJUHP64GTBSGCQOIGHVKB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTBAP63RMINUJUHP64GTBSGCQOIGHVKB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/29/24 21:40, Wesley Cheng wrote:
> Some platforms may have support for offloading USB audio devices to a
> dedicated audio DSP.  Introduce a set of APIs that allow for management of
> USB sound card and PCM devices enumerated by the USB SND class driver.
> This allows for the ASoC components to be aware of what USB devices are
> available for offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

minor nit-picks below if you respin the series.

> +
> +/**
> + * struct snd_soc_usb_device
> + * @card_idx - sound card index associated with USB device
> + * @chip_idx - USB sound chip array index
> + * @cpcm_idx - capture PCM index array associated with USB device
> + * @ppcm_idx - playback PCM index array associated with USB device
> + * @num_playback - number of playback streams
> + * @num_capture - number of capture streams
> + * @list - list head for SoC USB devices
> + **/
> +struct snd_soc_usb_device {
> +	int card_idx;
> +	int chip_idx;
> +
> +	/* PCM index arrays */
> +	unsigned int *cpcm_idx; /* TODO: capture path is not tested yet */
> +	unsigned int *ppcm_idx;
> +	int num_playback;
> +	int num_capture; /* TODO: capture path is not tested yet */

nit-pick: I would keep the order between capture and playback consistent.

> +int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
> +void *snd_soc_usb_find_priv_data(struct device *dev);

nit-pick: I would keep the parameter naming consistent with
struct device *usbdev


> +static inline void *snd_soc_usb_find_priv_data(struct device *dev)

same here.

> +/**
> + * snd_soc_usb_allocate_port() - allocate a SOC USB port for offloading support
> + * @component: USB DPCM backend DAI component
> + * @num_streams: number of offloading sessions supported
> + * @data: private data
> + *
> + * Allocate and initialize a SOC USB port.  The SOC USB port is used to communicate
> + * different USB audio devices attached, in order to start audio offloading handled
> + * by an ASoC entity.  USB device plug in/out events are signalled with a

typo: signaled



