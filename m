Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2F772873
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D85F832;
	Mon,  7 Aug 2023 16:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D85F832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420382;
	bh=JqeztFeqeIb8u0ximbuaFAtMKDPtvXdzUyTKSrRS9Kk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BESc8yIjrIk7q7caWp6JEezSHEx4o9S9spSPyojKM67EdQF+iw/8RgzFDI2c5nGZl
	 Iaw9vIZXVj4h8WgEwNyiQy1iJuL7eeW6WwxFVmUDGiLoObxR9/aKr7VpDcu6VCwxsR
	 TjO/DdjtqrOAlbRP0s1JhAQO7CQya0a9q6/TLOYA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 18FC5F805BB; Mon,  7 Aug 2023 16:57:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAD2F805B4;
	Mon,  7 Aug 2023 16:57:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 02F81F8057B; Mon,  7 Aug 2023 16:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B340F8016A;
	Mon,  7 Aug 2023 16:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B340F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=S6yh2aNW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420209; x=1722956209;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JqeztFeqeIb8u0ximbuaFAtMKDPtvXdzUyTKSrRS9Kk=;
  b=S6yh2aNWwnqd+h9t9Ri3qt6KDKFyRvbPvSg8JPCvVmcZ6svvtn49oxpf
   xwMKQDY6XcrQwsbqavDo3V5glBkgnBNLRiDRVhFp66uovA4lN0vEktFnA
   /WkXJbplntO5orKCvYKJZGn5lgekB3JyfdFA1tB2c7+HiOFJMT3DZjrab
   4oxrZCIAz4FaZyGwlo7lAyeD00uebZjtLppFL7Qf3YKyrl4OgSCqbyZnr
   +YUbJyh5G2n3gFINH4bDZgZQ+ynXIvqfPm+rsLUnk02SP8AyYOLTQCioL
   RYp9nU/98zRouvjlO2mncs/dKH9ux38NEhWRxa0qI4Ti6EXL+7nAQK7Yy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410610"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410610"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623880"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623880"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:39 -0700
Message-ID: <e710e29b-73a3-735e-6c78-9fd4829a25cc@linux.intel.com>
Date: Mon, 7 Aug 2023 09:13:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/9] ASoC: Intel: avs: Move snd_hdac_i915_init to
 before probe_work.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Maarten Lankhorst <dev@lankhorst.se>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230807090045.198993-1-maarten.lankhorst@linux.intel.com>
 <20230807090045.198993-6-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-6-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: G7FTCM6Y3R6ZGLHWWPIQRWAMDPM4CH7I
X-Message-ID-Hash: G7FTCM6Y3R6ZGLHWWPIQRWAMDPM4CH7I
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/7/23 04:00, Maarten Lankhorst wrote:
> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
> can be destroyed, but I don't have the means to test this.
> 
> Removing the workqueue would simplify init even further, but is left
> as exercise for the reviewer.
> 
> Changes since v1:
> - Rename error label.

same issue with changes, they need to be ...
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>> ---

...here

>  sound/soc/intel/avs/core.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
> index 3311a6f14200..64e7a4e650a8 100644
> --- a/sound/soc/intel/avs/core.c
> +++ b/sound/soc/intel/avs/core.c
> @@ -191,10 +191,6 @@ static void avs_hda_probe_work(struct work_struct *work)
>  
>  	pm_runtime_set_active(bus->dev); /* clear runtime_error flag */
>  
> -	ret = snd_hdac_i915_init(bus, true);
> -	if (ret < 0)
> -		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
> -
>  	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
>  	avs_hdac_bus_init_chip(bus, true);
>  	avs_hdac_bus_probe_codecs(bus);
> @@ -465,10 +461,19 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
>  	pci_set_drvdata(pci, bus);
>  	device_disable_async_suspend(dev);
>  
> +	ret = snd_hdac_i915_init(bus, false);
> +	if (ret == -EPROBE_DEFER)
> +		goto err_i915_init;
> +	else if (ret < 0)
> +		dev_info(bus->dev, "i915 init unsuccessful: %d\n", ret);
> +
>  	schedule_work(&adev->probe_work);
>  
>  	return 0;
>  
> +err_i915_init:
> +	pci_clear_master(pci);
> +	pci_set_drvdata(pci, NULL);
>  err_acquire_irq:
>  	snd_hdac_bus_free_stream_pages(bus);
>  	snd_hdac_ext_stream_free_all(bus);
