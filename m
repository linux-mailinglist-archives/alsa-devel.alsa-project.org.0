Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D63977286C
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Aug 2023 16:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5D8184D;
	Mon,  7 Aug 2023 16:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5D8184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691420313;
	bh=SaHNAycvvF2ElR8nisXlQ70kDCQK0462eRAig4OuDxs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VO+LdC7nSUhcpVUJmXPD/QlHFiBeiO8AAzSJwvnwOunu3JH0CiclMpAKk7vKera0i
	 pG0yJ2Vel+xkwmbw03cC0EsSMtN4UiRGcpx+fihuzPDIg9xwYeyMu09Q28+APH6Dha
	 59sYRrLAhglDjqX+kiJGgFT/Ia9ZgV1zY5HGKWXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F691F80579; Mon,  7 Aug 2023 16:56:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A0D0F80567;
	Mon,  7 Aug 2023 16:56:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6781F80535; Mon,  7 Aug 2023 16:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6A36F8016B;
	Mon,  7 Aug 2023 16:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A36F8016B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UedA8ygB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691420208; x=1722956208;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SaHNAycvvF2ElR8nisXlQ70kDCQK0462eRAig4OuDxs=;
  b=UedA8ygBejgKHnZU5I/0NjtHAiCPPGunOOo+O/isdKmAEPzoupLgA/kZ
   Ys4U3IPxdAw8T0YIFfmDC//s8B86c23AfFXU7FQRYFCVaVCdNhSDlbBqx
   BzFnED2c8pzeU44kEwWcFyvvfzgKnQeAOHSOQ2pDP6Poyjy9z5VeDBb4R
   qRGbZZKnbmOAEfwkA46T5Osx9Jndca7E2S8PsEsxIgHYw49XdVyE0wrbR
   vmNHvO0zjn05li4baPd1hmUNf/Mkmwn8BouTcerYJdnQ1QJY0xCKFXgHg
   WC0py3DSqNJcrlaFgNtmDYK6Com4WEOTP/Jhph47TXFsdxKcycrObpdXs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="434410602"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="434410602"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="1061623874"
X-IronPort-AV: E=Sophos;i="6.01,262,1684825200";
   d="scan'208";a="1061623874"
Received: from hweelee-mobl.amr.corp.intel.com (HELO [10.209.181.215])
 ([10.209.181.215])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2023 07:56:38 -0700
Message-ID: <92d03e5e-c0b4-98ef-5f02-6088b4a0e5f8@linux.intel.com>
Date: Mon, 7 Aug 2023 09:11:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v3 4/9] ALSA: hda/i915: Allow xe as match for
 i915_component_master_match
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
 <20230807090045.198993-5-maarten.lankhorst@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230807090045.198993-5-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5WSDZWYDQB25HMQ5QQRWPSBSYQXXCV23
X-Message-ID-Hash: 5WSDZWYDQB25HMQ5QQRWPSBSYQXXCV23
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
> xe is a new driver for intel GPU's that shares the sound related code
> with i915.
> 
> Don't allow it to be modprobed though; the module is not upstream yet
> and we should exclusively use the EPROBE_DEFER mechanism.

The wording hasn't changed and remains confusing, likely to trigger all
paranoia triplines. Consider rewording if there's an update.

> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/hda/hdac_i915.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/hdac_i915.c b/sound/hda/hdac_i915.c
> index 961fcd3397f4..12c1f8d93499 100644
> --- a/sound/hda/hdac_i915.c
> +++ b/sound/hda/hdac_i915.c
> @@ -115,7 +115,8 @@ static int i915_component_master_match(struct device *dev, int subcomponent,
>  	hdac_pci = to_pci_dev(bus->dev);
>  	i915_pci = to_pci_dev(dev);
>  
> -	if (!strcmp(dev->driver->name, "i915") &&
> +	if ((!strcmp(dev->driver->name, "i915") ||
> +		 !strcmp(dev->driver->name, "xe")) &&
>  	    subcomponent == I915_COMPONENT_AUDIO &&
>  	    connectivity_check(i915_pci, hdac_pci))
>  		return 1;
