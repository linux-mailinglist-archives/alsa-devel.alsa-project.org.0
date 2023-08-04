Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA47739A2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 12:37:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7DEF82C;
	Tue,  8 Aug 2023 12:36:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7DEF82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691491031;
	bh=eJzJo9AR2BodOCVYp/r933ED2YT4HHaNcfP+gWBSxys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ER+LADY45puccBYBTkwBGllsrMNzBlXaqIXAhTuG59Uxd4c3Cwp8dUhEGiBldz8Vx
	 A0LjAFoJV3KdOnLv9Jkg71GsvdDjYpoyOoSz/GxnovGfq73FKiVZHtD3wO8sPXYdRW
	 b85X7rrONZEXT3Sxi3BVddFM3gNbEIrPAgRWSBH0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33325F8055C; Tue,  8 Aug 2023 12:35:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2265F80553;
	Tue,  8 Aug 2023 12:35:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BA67F8025A; Fri,  4 Aug 2023 16:31:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EEDFF80087;
	Fri,  4 Aug 2023 16:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EEDFF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BwRCgzKG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691159495; x=1722695495;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=eJzJo9AR2BodOCVYp/r933ED2YT4HHaNcfP+gWBSxys=;
  b=BwRCgzKGLr3wAjB1WBGxvhXoG8f3dU2tNLCL/dRQP5DZYSgQS7EkwEii
   RS2K4SSWSUu17Ic2TPUTDs81W/fpC2B36ndhYEMqyZ0A8pGifXRwV9mb9
   sio84ZDDkApIPouC/Q8iqlF8c6y/lRhGtTrZqYr2/AkxNscIw3vovqhqh
   HTN9Utty5x2BQSfpOjDG4bT0RN5EyHqLhR4yvLHIUPThUwN++XGTGvoL4
   DQpDg6j1+EmB+VbZ1F8Glf5wYOB2gNIP5LTHGd8OAAUzlutxh/uDWibnG
   7z96zWAVp3TTG1N7dIax7uxhsPeIHWTeJwyCqQweF+AKj9p1Eb997ABd0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="367625033"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="367625033"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 07:31:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="1060751622"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200";
   d="scan'208";a="1060751622"
Received: from kwhite1-mobl.ger.corp.intel.com (HELO [10.251.210.112])
 ([10.251.210.112])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2023 07:31:23 -0700
Message-ID: <6469f503-df51-f25f-28ec-6ade51fda5a6@linux.intel.com>
Date: Fri, 4 Aug 2023 16:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ASoC: SOF: Intel: Move binding to display driver outside
 of deferred probe
To: Mark Brown <broonie@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <87r0oohyea.wl-tiwai@suse.de>
 <ec653abc-f2f8-8a9d-4b8a-ea9d985d32fe@linux.intel.com>
 <f6efb6f9-11ae-e901-f2a5-a4ef94590290@linux.intel.com>
 <2719a8fc-d2e5-f499-ac4d-cf322941526c@linux.intel.com>
 <383ebe0e-e333-4b6e-8688-98a20977d03c@sirena.org.uk>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <383ebe0e-e333-4b6e-8688-98a20977d03c@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MailFrom: maarten.lankhorst@linux.intel.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FZDXNNJUKE7MEEHM42UHFJVCIX2YZZI4
X-Message-ID-Hash: FZDXNNJUKE7MEEHM42UHFJVCIX2YZZI4
X-Mailman-Approved-At: Tue, 08 Aug 2023 10:35:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FZDXNNJUKE7MEEHM42UHFJVCIX2YZZI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hey,

Den 2023-08-04 kl. 13:59, skrev Mark Brown:
> On Fri, Aug 04, 2023 at 12:47:54PM +0200, Maarten Lankhorst wrote:
>> On 2023-08-01 18:32, Pierre-Louis Bossart wrote:
>> This mail can be applied with git am -c.
>> ------8<---------
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
> Don't do this, it breaks my automation and means I very nearly just
> skipped the patch entirely since it looked like the middle of some x86
> discussion.

Yeah, it's replacing the patch from earlier. I can resend, but means 
having to add all acks, r-b'd, etc. :)

If you have scripts that do that, all the better.

Cheers,

~Maarten

