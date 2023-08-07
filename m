Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715A677286A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:58:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51A51847;
	Mon,  7 Aug 2023 16:57:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51A51847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420312;
	bh=WdpaDUvecnhweQASsk5g5/dbHTSyH4Xy8Pc9wywxPhQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gk5LWIUdXBG9AS4BifamysGnB6g39sGaUKuJInqEzO3saf4LztUPt5MiqKyPjCr4m
	 bK9vDy5Sn9NApO905IyhSdByMsXBYDCONirzC8FQa7ReJPFtiwh/AShjeIoJ1bKrJX
	 t/2RFXpMRsDgG30Oyb0T1xgSp5C7z7BAagW14gbA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 644BBF8055C; Mon,  7 Aug 2023 16:56:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 852C5F80557;
	Mon,  7 Aug 2023 16:56:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E374CF80535; Mon,  7 Aug 2023 16:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2565AF8016D;
	Mon,  7 Aug 2023 16:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2565AF8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=j3hFRVRU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420206; x=1722956206;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WdpaDUvecnhweQASsk5g5/dbHTSyH4Xy8Pc9wywxPhQ=;
  b=j3hFRVRU6+Zxnlf5KLU0WvocxfYi7x8oFDGlPIcemZNOFFiGezUyEqSA
   ++pmqrNUX4H7CxdH5gR/LprQ1V7pUT1tjyY/cnfRNeHZv18X5DBuOPbCC
   LxJVp2/JZqROBDfqhN/MQTdItR56EYnIkyeQ6UyL1TxF0erpGmA6LIJlP
   ev6U1BnYZTHjpMIeZwxPw7PQnB8LisnqZcV4ZifkEpX4nUB0WU/QZ5mLo
   k/hFwkNYCJ34pEd+7IEd2Y9kYAmBEBpka+E5W3QOAon3rh/ZwEQScdtop
   xIjbQyzqBc1oViw1ygrUFpsdLosB1is5fCoQk04C28En3yNr2x0X56TyW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410593"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410593"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623864"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623864"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:37 -0700
Message-ID: <451ab8a3-7c75-4aab-0b8b-554d9c44c34c@linux.intel.com>
Date: Mon, 7 Aug 2023 09:08:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/9] ALSA: hda/i915: Add an allow_modprobe argument to
 snd_hdac_i915_init
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
 <20230807090045.198993-4-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-4-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XT6TARP3K6MS55FAG6D5TIOTPUZ5VR6F
X-Message-ID-Hash: XT6TARP3K6MS55FAG6D5TIOTPUZ5VR6F
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
> Xe is a new GPU driver that re-uses the display (and sound) code from
> i915. It's no longer possible to load i915, as the GPU can be driven
> by the xe driver instead.
> 
> The new behavior will return -EPROBE_DEFER, and wait for a compatible
> driver to be loaded instead of modprobing i915.
> 
> Converting all drivers at the same time is a lot of work, instead we
> will convert each user one by one.
> 
> Changes since v1:
> - Use dev_err_probe to set a probe reason for debugfs' deferred_devices.

You want the changes below the --- line ...
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---

... here


>  include/sound/hda_i915.h        | 4 ++--
>  sound/hda/hdac_i915.c           | 8 ++++----
>  sound/pci/hda/hda_intel.c       | 2 +-
>  sound/soc/intel/avs/core.c      | 2 +-
>  sound/soc/intel/skylake/skl.c   | 2 +-
>  sound/soc/sof/intel/hda-codec.c | 2 +-
>  6 files changed, 10 insertions(+), 10 deletions(-)

