Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCEA6CBC9E
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 12:36:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5FB91F0;
	Tue, 28 Mar 2023 12:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5FB91F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679999769;
	bh=9+VfIAZcVCip9jC3+d+kyhpcs5Fk+I9d7G8G4kmuTTw=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a6nGHr01eRcF/JljrYlIL/R1Zj1AXXkZzX1IHQzDt+P6UsFH3p46UfwJeaB7lJUT8
	 alDa7jIkLWRXCk1ZVRZ8k4Bxs+xfg8CsCfL8miDcGFecy8bmE5n2J/al0d990M6ifX
	 L3uzY+xwKzVyXAua5KEKq0pJLue0SU28+KVDCpls=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00347F8024E;
	Tue, 28 Mar 2023 12:35:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0545BF80272; Tue, 28 Mar 2023 12:35:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84CE8F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 12:35:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84CE8F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PdJDWqqG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679999708; x=1711535708;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9+VfIAZcVCip9jC3+d+kyhpcs5Fk+I9d7G8G4kmuTTw=;
  b=PdJDWqqGQGHQmET9uc7rp9xUp3GvcPDwMNSipoi2ZnyZD9yIbAN8h9Qr
   OI4hK6diXjBVKCZFk+1RhOYDSw64VJRL+K1cbwrZsLfj+p2bVEqmRvAYj
   gO+NaubCjiWT8EpCTFZQutJuirsO+Bu1zcDqd7bo5pAH2CARN2O3xHQfR
   7EyTgmwlfukSTK9TVcRU8aVnioHV71iVBTkNFKM+tPNJAdQ0YKNrWjLeL
   l5VyEfauMuNniMONxhjYaD2vIuOVqHudrFNf/lQtyRoz8TIMcpZjSiwkp
   alPYp8+i6qxBbWNWTVmg/ovW0wGuZ/8n0MH/oNVf5xJpQNBe+GCk9WUTk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="426794516"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="426794516"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="686379180"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400";
   d="scan'208";a="686379180"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2023 03:34:34 -0700
Message-ID: <cc5a4267-f050-c311-5d56-a2e7cfe7e747@linux.intel.com>
Date: Tue, 28 Mar 2023 12:34:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/18] ASoC: SOF: Intel: hda-mlink: introduce helpers for
 'extended links' PM
Content-Language: en-US
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org, tiwai@suse.de, perex@perex.cz
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
 <20230327112931.23411-9-peter.ujfalusi@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230327112931.23411-9-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CCZAQBRF6JT4NUQPAFZA6QEYIV3GMINW
X-Message-ID-Hash: CCZAQBRF6JT4NUQPAFZA6QEYIV3GMINW
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CCZAQBRF6JT4NUQPAFZA6QEYIV3GMINW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/27/2023 1:29 PM, Peter Ujfalusi wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Add helpers to program SPA/CPA bits, using a mutex to access the
> shared LCTL register if required.
> 
> All links are managed with the same LCTLx.SPA bits. However there are
> quite a few implementation details to be aware of:
> 
> Legacy HDaudio multi-links are powered-up when exiting reset, which
> requires the ref_count to be manually set to one when initializing the
> link.
> 
> Alternate links for SoundWire/DMIC/SSP need to be explicitly
> powered-up before accessing the SHIM/IP/Vendor-Specific SHIM space for
> each sublink. DMIC/SSP/SoundWire are all different cases with a
> different device/dai/hlink relationship.
> 
> SoundWire will handle power management with the auxiliary device
> resume/suspend routine. The ref_count is not necessary in this case.
> 
> The DMIC/SSP will by contrast handle the power management from DAI
> .startup and .shutdown callbacks.
> 
> The SSP has a 1:1 mapping between sublink and DAI, but it's
> bidirectional so the ref_count will help avoid turning off the sublink
> when one of the two directions is still in use.
> 
> The DMIC has a single link but two DAIs for data generated at
> different sampling frequencies, again the ref_count will make sure the
> two DAIs can be used concurrently.
> 
> And last the SoundWire Intel require power-up/down and bank switch to
> be handled with a lock already taken, so the 'eml_lock' is made
> optional with the _unlocked versions of the helpers.
> 
> Note that the _check_power_active() implementation is similar to
> previous helpers in sound/hda/ext, with sleep duration and timeout
> aligned with hardware recommendations. If desired, this helper could
> be modified in a second step with .e.g. readl_poll_timeout()
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Rander Wang <rander.wang@intel.com>
> Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> ---
>   include/sound/hda-mlink.h       |  32 +++++++
>   sound/soc/sof/intel/hda-mlink.c | 163 ++++++++++++++++++++++++++++++++
>   2 files changed, 195 insertions(+)
> 

...

> diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
> index 90b68ae2564c..4cfef4007d0c 100644
> --- a/sound/soc/sof/intel/hda-mlink.c
> +++ b/sound/soc/sof/intel/hda-mlink.c
> @@ -170,6 +170,68 @@ static int hdaml_lnk_enum(struct device *dev, struct hdac_ext2_link *h2link,
>   	return 0;
>   }
>   
> +/*
> + * Hardware recommendations are to wait ~10us before checking any hardware transition
> + * reported by bits changing status.
> + * This value does not need to be super-precise, a slack of 5us is perfectly acceptable.
> + * The worst-case is about 1ms before reporting an issue
> + */
> +#define HDAML_POLL_DELAY_MIN_US 10
> +#define HDAML_POLL_DELAY_SLACK_US 5
> +#define HDAML_POLL_DELAY_RETRY  100
> +
> +static int check_power_active(u32 __iomem *lctl, int sublink, bool enable)

Should last argument be named 'active' instead of 'enable'? It would 
make more sense to me.

> +{
> +	int mask = BIT(sublink) << AZX_ML_LCTL_CPA_SHIFT;
> +	int retry = HDAML_POLL_DELAY_RETRY;
> +	u32 val;
> +
> +	usleep_range(HDAML_POLL_DELAY_MIN_US,
> +		     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
> +	do {
> +		val = readl(lctl);
> +		if (enable) {
> +			if (val & mask)
> +				return 0;
> +		} else {
> +			if (!(val & mask))
> +				return 0;
> +		}
> +		usleep_range(HDAML_POLL_DELAY_MIN_US,
> +			     HDAML_POLL_DELAY_MIN_US + HDAML_POLL_DELAY_SLACK_US);
> +
> +	} while (--retry);
> +
> +	return -EIO;
> +}
> +

...
