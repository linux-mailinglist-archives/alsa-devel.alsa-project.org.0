Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6E37B625D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Oct 2023 09:16:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C406886E;
	Tue,  3 Oct 2023 09:15:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C406886E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696317380;
	bh=EVtKTrfrbj1XCTOf55slOIXSe1B7F9FizV0UJfRCpN0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kiWt/T7GVY5nG/33taNqlY7zvmR1XcvPrcekqtETFNDJIxaUOZjtCLAC/xLHJNqQN
	 Chx2HxERM2hgbOQGp697OlnzNRyNE5y1KF53NHEXIvQ0EqjqLhI7zLIN+dXV/YSM5O
	 AveR/KNU0M9aAr0h+J8dOykbA8xcmEFZc0DvYIV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C5DEF80130; Tue,  3 Oct 2023 09:15:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E462F80310;
	Tue,  3 Oct 2023 09:15:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A38BF8047D; Tue,  3 Oct 2023 09:15:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 49A82F80130;
	Tue,  3 Oct 2023 09:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49A82F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NHiTDOol
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696317321; x=1727853321;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=EVtKTrfrbj1XCTOf55slOIXSe1B7F9FizV0UJfRCpN0=;
  b=NHiTDOolN99YlEj6yeGtT/WMIjvA2zNgkhgCn7YpD0dwEcrkl+YsKGW1
   bi++xaF6NjVu4HiPQSIB9GYqT8orqnvUs+PoTHt6eqM8rad71ei/gNWth
   woQT0LL0Ahsq2ewqYIyDH6xVrCbDqyb6nVBo3N7EmuJSrU6tDoUFK3PlP
   l5FnvmoKA46gq4tOgzFqsSLgVl97nVbYl6jd1Eq9RSqyonDw8YriE1hoZ
   yZ8ua67zbot4pHAKyDokDsWEspzHaR5Lv6RZcPnr9GDw3sCZ4+oDJ57s7
   To6m5Cl55bfrcGJGS8sMjjJeC06GdPcteYNhVXqkcvRLsI0dgrsXkvEGS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="385632750"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="385632750"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 00:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10851"; a="816579985"
X-IronPort-AV: E=Sophos;i="6.03,196,1694761200";
   d="scan'208";a="816579985"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.91])
 ([10.94.0.91])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 00:15:08 -0700
Message-ID: <881c99b5-f64e-4c74-1420-8eec08cca0ce@linux.intel.com>
Date: Tue, 3 Oct 2023 09:15:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 10/12] ASoC: Intel: Skylake: Move snd_hdac_i915_init to
 before probe_work.
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
References: <20230929145123.233838-1-maarten.lankhorst@linux.intel.com>
 <20231002165202.17863-1-maarten.lankhorst@linux.intel.com>
 <8a506cfa-7274-b760-1fc1-60d0e5b75a8b@linux.intel.com>
In-Reply-To: <8a506cfa-7274-b760-1fc1-60d0e5b75a8b@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DUEVNEM7KCSIUQCMRDFXFR26I3B7R4CE
X-Message-ID-Hash: DUEVNEM7KCSIUQCMRDFXFR26I3B7R4CE
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DUEVNEM7KCSIUQCMRDFXFR26I3B7R4CE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/3/2023 8:55 AM, Amadeusz Sławiński wrote:
> On 10/2/2023 6:52 PM, Maarten Lankhorst wrote:
>> Now that we can use -EPROBE_DEFER, it's no longer required to spin off
>> the snd_hdac_i915_init into a workqueue. It's likely the whole workqueue
>> can be destroyed, but I don't have the means to test this.
>>
>> Removing the workqueue would simplify init even further, but is left
>> as exercise for the reviewer.
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Acked-by: Mark Brown <broonie@kernel.org>
>> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
>> Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>> ---
> 
> Isn't the convention that your Signed-off should be last when you are 
> sending the patches? Or does it only apply to Signed-off lines 
> themselves and other lines can be anywhere?
> 
And rereading kernel documentation, it really seems to be a bit 
ambiguous, well ignore the comment then.
