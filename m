Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7AA98BE59
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 15:49:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD389B70;
	Tue,  1 Oct 2024 15:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD389B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727790577;
	bh=hYg0Fu0D6IoftEUgUjWbcBn5SdluW6xHgOAg9+UBNzA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sHEIMyOnkxrSa6r4rhHtKXktRzFY9PYEg/JN45TfwytCmD2HfVHvNPTiyeQG+OYzJ
	 fquC+hhjpPpjOOHSWLzahlJnbgGeHorn3joVYoiWsHh1BKxaOD19Jtv5SbavOvaV/y
	 K+kINxQNOL5sYk1ZvVD2XeTMViOZ6TakcZW8tCG0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE635F805AD; Tue,  1 Oct 2024 15:49:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 67A68F805AD;
	Tue,  1 Oct 2024 15:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31B41F80517; Tue,  1 Oct 2024 15:48:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4511F80007
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 15:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4511F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MYpW6CQe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727790536; x=1759326536;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hYg0Fu0D6IoftEUgUjWbcBn5SdluW6xHgOAg9+UBNzA=;
  b=MYpW6CQe7Em414Je+5aseFl5jx7oZ9YHjiYcLCCMYzOzyUM2Jqy0pmg8
   BQ6RcRwsUK4dFWJ2CBdvAtzO3C5v+bD+Ulbi7zHI3Yi0za41oQjyYIxqy
   ztC9pd5ePJcjl5D8asLc8lDhSDsDOupL5u1WfAnqeINjCuClIvuQZnx8h
   XBu6inMILjWYz1FAedZ+/NGhsIML8UXrFncab/0H6Yr0JvjGUJsmR7iSJ
   +l+vpB1IBICoz9LNbsP2hzKIwswtV3H0QMogAY+S/gt9tMYa+B7P9O+nX
   Na8oBWLOidESSupMNAVrso1Lj91peFfmIyUHbovEwfEcjAW6nNIsMfe9I
   g==;
X-CSE-ConnectionGUID: SQdItQDhSbKmBEkv86aSnA==
X-CSE-MsgGUID: K6Jaxq9YTROAJF8WOA+yPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27018701"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800";
   d="scan'208";a="27018701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:48:31 -0700
X-CSE-ConnectionGUID: vvOEWfuOQp6aUElZPlvVAw==
X-CSE-MsgGUID: jKRp70E6QsmfnSnjQ90fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800";
   d="scan'208";a="78534228"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 06:48:25 -0700
Message-ID: <04f17b40-cb63-4758-80fb-91996f71a07c@linux.intel.com>
Date: Tue, 1 Oct 2024 15:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 18/32] ASoC: doc: Add documentation for SOC USB
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
 bgoswami@quicinc.com, robh@kernel.org, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240925010000.2231406-1-quic_wcheng@quicinc.com>
 <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20240925010000.2231406-19-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6SMXC7ERPSANCKCEUZLQIXHLAACS2EJH
X-Message-ID-Hash: 6SMXC7ERPSANCKCEUZLQIXHLAACS2EJH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6SMXC7ERPSANCKCEUZLQIXHLAACS2EJH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 9/25/2024 2:59 AM, Wesley Cheng wrote:
> With the introduction of the soc-usb driver, add documentation highlighting
> details on how to utilize the new driver and how it interacts with
> different components in USB SND and ASoC.  It provides examples on how to
> implement the drivers that will need to be introduced in order to enable
> USB audio offloading.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---

...

> +USB Offload Related Kcontrols
> +=============================
> +Details
> +-------
> +A set of kcontrols can be utilized by applications to help select the proper sound
> +devices to enable USB audio offloading.  SOC USB exposes the get_offload_dev()
> +callback that designs can use to ensure that the proper indices are returned to the
> +application.
> +
> +Implementation
> +--------------
> +
> +**Example:**
> +
> +  **Sound Cards**:
> +
> +	::
> +
> +	  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
> +						SM8250-MTP-WCD9380-WSA8810-VA-DMIC
> +	  1 [Seri           ]: USB-Audio - Plantronics Blackwire 3225 Seri
> +						Plantronics Plantronics Blackwire
> +						3225 Seri at usb-xhci-hcd.1.auto-1.1,
> +						full sp
> +	  2 [C320M          ]: USB-Audio - Plantronics C320-M
> +                      Plantronics Plantronics C320-M at usb-xhci-hcd.1.auto-1.2, full speed
> +
> +  **USB Sound Card** - card#1:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        -1, -1 (range -1->255)
> +
> +  **USB Sound Card** - card#2:
> +
> +	::
> +
> +	  USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> +
> +The above example shows a scenario where the system has one ASoC platform card
> +(card#0) and two USB sound devices connected (card#1 and card#2).  When reading
> +the available kcontrols for each USB audio device, the following kcontrol lists
> +the mapped offload path for the specific device:
> +
> +	``USB Offload Playback Route#*``
> +

Those examples would probably be easier to follow if you also provided 
something similar to "aplay -l" output in addition to above sound card list.

> +The kcontrol is indexed, because a USB audio device could potentially have
> +several PCM devices.  The above kcontrols are defined as:
> +
> +  - ``USB Offload Playback Route PCM`` **(R)**: Returns the ASoC platform sound
> +    card and PCM device index.  The output **"0, 1"** (card index, PCM device index)
> +    signifies that there is an available offload path for the USB SND device
> +    through card#0 - PCM device#1.  If **"-1, -1"** is seen, then no offload path is
> +    available for the USB SND device.
> +


