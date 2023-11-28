Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6837FB6EB
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 11:16:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2441836;
	Tue, 28 Nov 2023 11:16:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2441836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701166575;
	bh=65Id7+ZmuDtmrZfPTK8wqeJENzNAYWzYS1CDivxGT6M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MV5hNsbTojfCQuDdu6BqgKYLDbnN6q4QCorIWO7wzI1MxvB21J/Pdyjv/VFQ0B5J4
	 7CGZdxNdJRlAtCJorWbeI1395zY22Czc2+7SpcoR/lfAth+h6sxcKvrZLg/bdyPE3h
	 WYnErw5paMn63VCg6cceVe+UamHcwsyz0D7DyVXc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03AF5F80571; Tue, 28 Nov 2023 11:15:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C31EF8057C;
	Tue, 28 Nov 2023 11:15:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5455F800F5; Tue, 28 Nov 2023 11:15:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A9A20F800F5
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 11:15:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9A20F800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CxXrWWar
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701166545; x=1732702545;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=65Id7+ZmuDtmrZfPTK8wqeJENzNAYWzYS1CDivxGT6M=;
  b=CxXrWWarKFOEc0iLqdAMoYefMOLG3W3JAH9J7/kZUyVVZwZS3BfqBV7j
   CAAZ7+mi0RV+2wuW3lF2fvB1NJEsPo1RKd0yWb1M9JvNqusri77dEDZ5p
   HjUtzlWFbxOptWPgR5kqLGgUHmPA3eZaO40sHsnCSyD2nTqWTYrF3YyrD
   dNSR+A/wWHHXrpDNjRtjzVO0ARsrlCYrm++30P8cifxouxZXVxp+8uIkM
   p//oxeo8eOsyF4v6jxiQfCGVXLvAkUD5agcfKMneOmgZmYyHO5nQu8MYm
   t0XV+lSvRBd0VctTgwTsKhHew2SR5K5lKJU2DhlfCrUH6A3AvHpdILURM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="391766028"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="391766028"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="1015868142"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600";
   d="scan'208";a="1015868142"
Received: from anikafix-mobl.ger.corp.intel.com (HELO [10.251.221.103])
 ([10.251.221.103])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 02:15:25 -0800
Message-ID: <96d334c1-9c6b-415b-bfb8-1fab29b1d223@linux.intel.com>
Date: Tue, 28 Nov 2023 12:16:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ALSA: hda/hdmi: Add helper function to check if a
 device is HDMI codec
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
References: <20231127130245.24295-1-peter.ujfalusi@linux.intel.com>
 <20231127130245.24295-2-peter.ujfalusi@linux.intel.com>
 <87jzq3pc6r.wl-tiwai@suse.de>
 <d2fff7cd-ea4b-41b9-992b-fab6ba6549ec@linux.intel.com>
 <87cyvvp8t6.wl-tiwai@suse.de>
 <8ede931b-8c9c-4b95-83e5-5f0db9819e8e@linux.intel.com>
 <878r6jp6jd.wl-tiwai@suse.de>
 <b0c4b724-fe34-4e55-81fe-146e1b52839d@linux.intel.com>
 <875y1np5g2.wl-tiwai@suse.de>
 <be4c418d-5147-4d4b-aa9b-a8e6f3c10a30@linux.intel.com>
 <87y1eimd23.wl-tiwai@suse.de>
 <e40a3b5d-425e-427c-bec2-6b82d8f5ee94@linux.intel.com>
 <87ttp6mc04.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ttp6mc04.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VAGAGH65HSGUUU3ZWTL7RRAMER5TRNLX
X-Message-ID-Hash: VAGAGH65HSGUUU3ZWTL7RRAMER5TRNLX
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VAGAGH65HSGUUU3ZWTL7RRAMER5TRNLX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 28/11/2023 12:02, Takashi Iwai wrote:
> On Tue, 28 Nov 2023 10:53:56 +0100,
> Péter Ujfalusi wrote:
>>
>>
>>
>> On 28/11/2023 11:39, Takashi Iwai wrote:
>>> Hm...  I still find it's a bad move to use an exported symbol from
>>> another codec driver.
>>
>> The other option is to check for 0x4 (or address 2), but I'm not sure if
>> this is Intel only or universally true for HDMI codecs.
>>
>>> And, I wonder what if you have a system that has only one HDMI codec
>>> without analog one?  Would it still work with your change? 
>>
>> Yes, it works with only HDMI codec (for example on SoundWire laptops) or
>> with UP2 board which only have HDMI audio support by default.
> 
> Interesting.  With your patch 2, hdac_hda_hdmi_codec is without the
> DAPM definitions, and even if that's the only one that is registered,
> it will still work?  So it means that it works without DAPM
> definitions at all?

Well, it is a bit more 'interesting' from that angle.
for patch two we needed:
https://lore.kernel.org/linux-sound/20231124124015.15878-1-peter.ujfalusi@linux.intel.com/

The reason is that prior to patch 2 the analog codec would create the
DAPM widgets for the HDMI also and the DAPM route would be available but
the HDMI would still not work:
we had PCMs for HDMI but non operational ones.

If we had a codec+HDMI then we would have the warnings that the second
codec is registering the same DAPM widgets again.

With the linked patch plus this series we will not register the DAPM
widgets and the machine driver would drop the routes.
The PCMs will be still created and they will be still non functional but
we will have no warning when the system have two codecs.

The core HDA+patch_hdmi is needed for the hdac_hda to have working HDMI
audio, but the patch init is after the codec driver's probe:

# dmesg | grep peter
[ 4088.698111] [peter] hdac_hda_dev_probe: is_hdmi_codec(): 0
[ 4088.698112] [peter] hdac_hda_dev_probe: hdev->is_hdmi: 0
[ 4088.698114] [peter] hdac_hda_dev_probe: snd_hda_device_is_hdmi(): 1
[ 4088.862882] [peter] patch_i915_tgl_hdmi: ENTER
[ 4088.862886] [peter] alloc_intel_hdmi: ENTER
[ 4088.872269] [peter] generic_hdmi_build_pcms: ENTER
[ 4088.872279] [peter] hdac_hda_codec_probe: is_hdmi_codec(): 1

We need to know if the codec is HDMI or not in hdac_hda_dev_probe()

I would rather not risk to move the hdac_hda as Intel only using address
2 as HDMI indication - which I'm still not sure if it is Intel only or
generic HDA convention.

-- 
Péter
