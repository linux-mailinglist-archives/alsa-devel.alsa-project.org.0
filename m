Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51395F022
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2024 13:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DAD0836;
	Mon, 26 Aug 2024 13:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DAD0836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724672964;
	bh=hLsfUSzR0HEhVpFfdXscTD8zyuZTM22+rpebelyMh1E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KoDSNGef11rhXP8R4AyqxETocLv5TcR3+DgrXrtLc4mpWD6U39R2CkWdJAXrusuSS
	 LhLzUcGzrYCiFgSXt76kCIvhOhzbvTEBV5Lq3bkdSBNyyTwg9RmG0ZFWVrgP/N9Mq2
	 8q28u4RiRpVOsapWLxOnMfrpAmdKMP0hPHgqboDk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2125EF8059F; Mon, 26 Aug 2024 13:48:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2C1AF805AF;
	Mon, 26 Aug 2024 13:48:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFA0AF805A0; Mon, 26 Aug 2024 13:39:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AA7E4F80494
	for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2024 12:34:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA7E4F80494
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=XGTDfyCs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668580; x=1756204580;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hLsfUSzR0HEhVpFfdXscTD8zyuZTM22+rpebelyMh1E=;
  b=XGTDfyCsWd8XYKtMnM5KOfcOISYpJH+awvElgSONujRMvkhnTIfEBin3
   fFJuuPyITOYYant6eORSNN465oyU9wENdfKv7UT9BtobAcaC/YrbWZp4o
   R7t+T0z1Rw/aLkXcsy9cUpxs3/baZXCp2PEi5bnXC1mJqiV2YwbHuYiPS
   qAVncjJjWx2oPgGC6FlNSy2sng+2Da6H3ylhyaTyOV1qme8VQnYjnDgU/
   qlmX9NMbQR70NZYEc3YyZk+NRxRBFOIxV8HOEiDNpuHZKzr5N3OySgnbY
   vxDhPM0o/a6otJyry0V43j/9pIJJnG3Cxx1uKzxkzTyyXrxRnyD1TvQT6
   w==;
X-CSE-ConnectionGUID: rUReJ3cGRkuCIaLM5wo7ig==
X-CSE-MsgGUID: c11mRmD4RvyYR4v9i0Y7tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="25967081"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="25967081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:33:02 -0700
X-CSE-ConnectionGUID: GheEIs6PTFaDrqiKV0o3lA==
X-CSE-MsgGUID: ftyAxPLYSzyC0hc4jGqEmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600";
   d="scan'208";a="62134683"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.246.121])
 ([10.245.246.121])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 02:32:56 -0700
Message-ID: <4149884a-7c60-40d8-848b-8876f16d6d7f@linux.intel.com>
Date: Mon, 26 Aug 2024 11:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 31/33] ALSA: usb-audio: Add USB offload route kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
 mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
 dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, krzk+dt@kernel.org,
 Thinh.Nguyen@synopsys.com, bgoswami@quicinc.com, robh@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20240823200101.26755-1-quic_wcheng@quicinc.com>
 <20240823200101.26755-32-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240823200101.26755-32-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3BKWVGAXXX5MWUVCJ2JOS76IT7P4A5G7
X-Message-ID-Hash: 3BKWVGAXXX5MWUVCJ2JOS76IT7P4A5G7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3BKWVGAXXX5MWUVCJ2JOS76IT7P4A5G7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



> +config SND_USB_OFFLOAD_MIXER
> +	tristate "Qualcomm USB Audio Offload mixer control"
> +	help
> +	 Say Y to enable the Qualcomm USB audio offloading mixer controls.
> +	 This exposes an USB offload capable kcontrol to signal to
> +	 applications about which platform sound card can support USB
> +	 audio offload.  This can potentially be used to fetch further
> +	 information about the offloading status from the platform sound
> +	 card.

I would remove reference to Qualcomm for this Kconfig, all the code
seems generic to me? Probably a left-over from the previous version.

