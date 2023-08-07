Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7197077286D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9E8C826;
	Mon,  7 Aug 2023 16:57:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9E8C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420324;
	bh=zgsHC0JFOAd4lgK0/kb45iQ6so6mT+vI8fCzwDnh0Yk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fgN7J9DF8Yjl00IUA3pWj+gup7+MThxqTWL3GK1pNkU+NIAtNqBQD0YiBZuy0Hcv7
	 13Ncci4uzut/BwwYoXhjZyxVGxYlRDERRnhOokp7zoGF9bUbQvUQ1FwlvrkgHmtowh
	 pPE6pyEPgo1QEXeATu8Oce7mV/kMm15/RFmD20Hg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D54B7F8057B; Mon,  7 Aug 2023 16:56:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5394EF80567;
	Mon,  7 Aug 2023 16:56:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE308F80558; Mon,  7 Aug 2023 16:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D3A4AF80087;
	Mon,  7 Aug 2023 16:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3A4AF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hbU4VdZy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420206; x=1722956206;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=zgsHC0JFOAd4lgK0/kb45iQ6so6mT+vI8fCzwDnh0Yk=;
  b=hbU4VdZya4e3dgPARir1q2Kr3WYFqfWmEEq9iSxByLfjyIKOVEbW6ilH
   aiDfLsru7+k8Jq1fICh82kl5JZDFctcJXoH0c5YgJyUWSdJoJgmnYqEzJ
   MAtA3mo9m/HLinf5itZv+fSSMVTgbXoRFagTSo/bOO5n/5lcbIuUMioyd
   BlekHazLt3hZITTVx5sVZ+K/q/o6E7SzYRVDHmlCGsO+Y1RaU8lkXkT5G
   PmQpbn1JPq+Geh1OhaKBxP6j5ELEmXmqodxn3x6CPkW8ei4rVd8kYlavu
   +EYN/sqsnsOfxXChlVJBV8Qay6rIEGzmHljPOn2RGQjr84OUzX5WKkRao
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410576"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410576"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623859"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623859"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:35 -0700
Message-ID: <cd826184-0a94-425b-8a6e-0988c997bf6f@linux.intel.com>
Date: Mon, 7 Aug 2023 09:06:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/9] ALSA: hda/i915: Allow override of gpu binding.
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
 <20230807090045.198993-3-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RVWOCHXVU5RVKMP6OMWE5K6VMQ45IDXO
X-Message-ID-Hash: RVWOCHXVU5RVKMP6OMWE5K6VMQ45IDXO
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
> Selecting CONFIG_DRM selects CONFIG_VIDEO_NOMODESET, which exports
> video_firmware_drivers_only(). This can be used as a first
> approximation on whether i915 will be available. It's safe to use as
> this is only built when CONFIG_SND_HDA_I915 is selected by CONFIG_I915.
> 
> It's not completely fool proof, as you can boot with "nomodeset
> i915.modeset=1" to make i915 load regardless, or use
> "i915.force_probe=!*" to never load i915, but the common case of
> booting with nomodeset to disable all GPU drivers this will work as
> intended.
> 
> Because of this, we add an extra module parameter,
> snd_hda_core.gpu_bind that can be used to signal users intent.
> -1 follows nomodeset, 0 disables binding, 1 forces wait/-EPROBE_DEFER
> on binding.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

