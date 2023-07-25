Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2486476181B
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jul 2023 14:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E731152E;
	Tue, 25 Jul 2023 14:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E731152E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690287545;
	bh=+Ocevg64N0aIV9rG69RXaUubDlT2/mkhIyMR1Q1WkzY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gmn2mgjLkUEitKLUkiRg5U961XBtdR8GZPL/rrVo1eayu3gzeA+YE6XOg8TYrbM/N
	 AKG3B1B5NHFWmpgD25vKGSjO9E+6D2+PD8pgp28GtczKpIUiejfw0AOz0JXYWbg/4a
	 LWO//9Jpq8HAg/mLOT4UymHeMO0ngbUy6YiKz+uk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E61EF802E8; Tue, 25 Jul 2023 14:18:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8566AF80163;
	Tue, 25 Jul 2023 14:18:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 782EBF8019B; Tue, 25 Jul 2023 14:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE622F80149;
	Tue, 25 Jul 2023 14:18:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE622F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lsHFyz4K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690287487; x=1721823487;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Ocevg64N0aIV9rG69RXaUubDlT2/mkhIyMR1Q1WkzY=;
  b=lsHFyz4K+fdESzgYfgsT8DS4UAGqgxAdjyzzlmgzBoHsBApuRK4KFlmD
   Wlzq4pw8u3YSIeulg/s5dckgtipUnGzUT+K8R9Z0Sje0Q86U0Y5dpJLcU
   zgsfI8Vrv5fF2Wy7uit3XLnY3cD8FnPJRJ8h28z8iQKOU5I6wlfGOv0bB
   +8uhZm6EypsvdQrXA585FWdJEqqw0Xfs2ARPUqBCS4wFZZUdMFWL8/HK1
   Oauh6p9uUmKOL0nWJ7lImH8x/dmweT5zQgj6DVSJJ8m9I/yyqpi6v0g/G
   qeovcvS+aSl+r+6U++6+lEF9CGECspFEkJ9R7RrsLqzzwxI5pJo4dRUU8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352601905"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="352601905"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:17:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791367909"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200";
   d="scan'208";a="791367909"
Received: from mongola-mobl.ger.corp.intel.com (HELO [10.249.37.129])
 ([10.249.37.129])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 05:17:56 -0700
Message-ID: <b0037097-b917-9069-7d8f-07e0317d6b9f@linux.intel.com>
Date: Tue, 25 Jul 2023 13:52:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH v2 2/9] ALSA: hda/i915: Allow override of gpu binding.
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org
Cc: sound-open-firmware@alsa-project.org, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown
 <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>
References: <20230719164141.228073-1-maarten.lankhorst@linux.intel.com>
 <20230719164141.228073-3-maarten.lankhorst@linux.intel.com>
 <9b285ede-eaeb-40a2-086d-30cf74185784@linux.intel.com>
 <d75c1902-b715-4a33-1965-ec06d625e3ac@linux.intel.com>
 <932c4293-375f-685c-2cfd-0bc80fd80683@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <932c4293-375f-685c-2cfd-0bc80fd80683@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B6Q7QN522MKU4DQJ6CTB4OMBC44K475A
X-Message-ID-Hash: B6Q7QN522MKU4DQJ6CTB4OMBC44K475A
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B6Q7QN522MKU4DQJ6CTB4OMBC44K475A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


>>>> @@ -121,6 +128,9 @@ static int i915_gfx_present(struct pci_dev
>>>> *hdac_pci)
>>>>   {
>>>>       struct pci_dev *display_dev = NULL;
>>>>   +    if (!gpu_bind || (gpu_bind < 0 &&
>>>> video_firmware_drivers_only()))
>>>> +        return false;
>>
>>
>> Bear with me since I am just going back to work mode but I can't figure
>> out what the second part of the test does
>>
>> bool video_firmware_drivers_only(void)
>> {
>>     return video_nomodeset;
>> }
>> EXPORT_SYMBOL(video_firmware_drivers_only);
>>
>> and video_nomodeset=1 by default, so why would we return false when
>> gpu_bind = -1?
>>
>> This seems to be a change of functionality, what am I missing?
> video_nomodeset is 0 by default, only when nomodeset is given as
> argument is it set to 1. :-)


I must be missing something on how the default is handled.

bool video_firmware_drivers_only(void)
{
	return video_nomodeset;
}
EXPORT_SYMBOL(video_firmware_drivers_only);

static int __init disable_modeset(char *str)
{
	video_nomodeset = true;

isn't default 'true' then?
