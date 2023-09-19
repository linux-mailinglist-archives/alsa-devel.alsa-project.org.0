Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2093A7A65BF
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 15:52:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B77EA4D;
	Tue, 19 Sep 2023 15:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B77EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695131550;
	bh=+J3MG488bmnVB+qwR/tYZJ+rvOJbY2vNog81jESwLhE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ix3V3WEo5NxCO6SWPdDOTSd0qI7yAuVI7MddpuR+quYVIyvkL0tRakPzE5GoBx7gi
	 Em8bkAERzXGJcnFEj4/UQ80zxvgD5Y7r/d6VfNwVvbj38xIfFy2o3F+zwlKFxo9KmF
	 t6bBIAxEOQTuUvGgZ2sk4hDSCafQDAnOrweDjXU4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79F1EF80125; Tue, 19 Sep 2023 15:51:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22B72F800F4;
	Tue, 19 Sep 2023 15:51:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FC6FF8025A; Tue, 19 Sep 2023 15:51:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_FILL_THIS_FORM_SHORT,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3625F80124
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 15:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3625F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nW/vWI3v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695131492; x=1726667492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+J3MG488bmnVB+qwR/tYZJ+rvOJbY2vNog81jESwLhE=;
  b=nW/vWI3vdcsrdOk5Q5FrT1jwN/2JW1LBYHW+9hmAYaHjzWhXn0LcqXch
   VwsJvkAhLMdCXdjfGcxQcbK4dM5cNjfhCvcV/BHMvlt7Tyg1oThzKZyzW
   gv12dihmtu9Wy7hZWrvw9WBUuMqU5dcEa06QPLfjQW5WS/ffLU9m/Cf5G
   rPT10GMDpubAZUkJR7FqtyVudqBVOcr706k5DGvGrl1WLtg2fo+okgqf2
   wp3X0sTsK1H1dExm7AGSmUbi5FFJlP6f8ibc7/2DDPgkVWOGpF1YeBwq2
   AYB05kIWB8lWSLsYNjitT+kXe6Nx3MhnKisgM62R0QFujSnUz+sm0SksB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359337936"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="359337936"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:51:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="1076981257"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="1076981257"
Received: from jelyouss-mobl.ger.corp.intel.com (HELO [10.249.47.85])
 ([10.249.47.85])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 06:51:23 -0700
Message-ID: <5eafb0a8-b8a9-4d4e-81e8-8f4c35c4037e@linux.intel.com>
Date: Tue, 19 Sep 2023 16:51:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: hda: hda_auto_parser: Always set codec->fixup_name
 when a quirk found
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: tiwai@suse.com, perex@perex.cz, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
References: <20230919132322.17352-1-peter.ujfalusi@linux.intel.com>
 <87wmwmwagn.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87wmwmwagn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UOONT3XKBVMRV7EEK3Z25XGWR3LD6LSL
X-Message-ID-Hash: UOONT3XKBVMRV7EEK3Z25XGWR3LD6LSL
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOONT3XKBVMRV7EEK3Z25XGWR3LD6LSL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 19/09/2023 16:37, Takashi Iwai wrote:
> On Tue, 19 Sep 2023 15:23:22 +0200,
> Peter Ujfalusi wrote:
>>
>> If a fixup is found via a quirk then the codec->fixup_name is only set if
>> CONFIG_SND_DEBUG_VERBOSE is enabled, otherwise the fixup_name is set to
>> NULL.
>>
>> This will result prints in __snd_hda_apply_fixup() when applying the found
>> fixup for example:
>> ehdaudio0D0: ALC236: Apply fix-func for (null)
> 
> Are you sure this doesn't break?  snd_pci_quirk.name is defined only
> when CONFIG_SND_DEBUG_VERBOSE=y.

Right, that might cause some issues (I have it enabled), hrm, but the
print in __snd_hda_apply_fixup() is not much of a help in this case..

> 
> thanks,
> 
> Takashi
> 
> 
>> Fixes: 73355ddd8775 ("ALSA: hda: Code refactoring snd_hda_pick_fixup()")
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> ---
>>  sound/pci/hda/hda_auto_parser.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/sound/pci/hda/hda_auto_parser.c b/sound/pci/hda/hda_auto_parser.c
>> index 7c6b1fe8dfcc..7b1ddb8d40cb 100644
>> --- a/sound/pci/hda/hda_auto_parser.c
>> +++ b/sound/pci/hda/hda_auto_parser.c
>> @@ -1043,9 +1043,8 @@ void snd_hda_pick_fixup(struct hda_codec *codec,
>>  
>>   found_device:
>>  	id = q->value;
>> -#ifdef CONFIG_SND_DEBUG_VERBOSE
>>  	name = q->name;
>> -#endif
>> +
>>  	codec_dbg(codec, "%s: picked fixup %s for %s %04x:%04x\n",
>>  		  codec->core.chip_name, name ? name : "",
>>  		  type, q->subvendor, q->subdevice);
>> -- 
>> 2.42.0
>>

-- 
Péter
