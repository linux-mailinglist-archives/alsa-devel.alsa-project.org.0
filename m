Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7380822204
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jan 2024 20:31:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02AB3E85;
	Tue,  2 Jan 2024 20:31:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02AB3E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704223872;
	bh=ilO5IzhQ3Hwvx3JB2WQjM6kgLpNd1YFCiNdkM3lmNDU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o86Fbere3xZj5ErOQ+H33juWofmpaCox3+FvB8bv2ogdV1sX2rlgo6ESkvQD7+7KS
	 7xhmCrXxOi3lij99FNK6gJzjCtpeguwD+MtpJ4bvu08dU8zdbf6ZgYfQSMLT6z3/tD
	 +Ay5u0vtsgfF7AaT7XSqNek12DuGo6AdK7p/TD6A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B16AEF80564; Tue,  2 Jan 2024 20:30:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18602F80570;
	Tue,  2 Jan 2024 20:30:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA7A8F80424; Tue,  2 Jan 2024 20:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5C31F80051
	for <alsa-devel@alsa-project.org>; Tue,  2 Jan 2024 20:30:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5C31F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WgpMOVJp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704223828; x=1735759828;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ilO5IzhQ3Hwvx3JB2WQjM6kgLpNd1YFCiNdkM3lmNDU=;
  b=WgpMOVJpnVMZzPmQ8nYfA7woXJPm79zlAw3Y+aOhrAtrM7IUIh/Tz8cT
   utBdasL2/V1QzFDyJ8VFQBnZtt6Z5isTwoTl2lTe6Z9DkpF2oJwUHMxRn
   V1zHcdLCxGewogcp2vW4ajx1YwjVsAf1u5xJosr9B8Bbvc1E1wwuaKifo
   ViI3ZSK6tAhKAapRng+ZNTp+hSECs6QNRiknvcGxtbV2LxVW7Y8NfapKJ
   vuPo2TfbSVe6vc/82/0xKc85xfygf4XWKevwy4U8Jh47kvv4/vzdej0Ig
   zpnrJ0jjnnb3kpjF2D/c0gktTZBPjivj0tVCn61TEWQ7xEN3p2Rl7vdmA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="4192269"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600";
   d="scan'208";a="4192269"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 01:07:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="772784129"
X-IronPort-AV: E=Sophos;i="6.04,324,1695711600";
   d="scan'208";a="772784129"
Received: from jomolloy-mobl.ger.corp.intel.com (HELO [10.252.51.93])
 ([10.252.51.93])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2024 01:07:54 -0800
Message-ID: <3260e806-a708-4462-9d4e-346e54143a65@linux.intel.com>
Date: Tue, 2 Jan 2024 11:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Oops in hdac_hda_dev_probe (6.7-rc7)
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <ZYvUIxtrqBQZbNlC@shine.dominikbrodowski.net>
 <87sf3lxiet.wl-tiwai@suse.de> <ZY7kosArPqhlCfOA@shine.dominikbrodowski.net>
 <874jg1x7ao.wl-tiwai@suse.de> <ZY_Gb8-rncuOjRq-@shine.dominikbrodowski.net>
 <87plyovwg7.wl-tiwai@suse.de>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87plyovwg7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EY5PMW5TVKSP5HSWZKK2TQHTI7DWSIXU
X-Message-ID-Hash: EY5PMW5TVKSP5HSWZKK2TQHTI7DWSIXU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EY5PMW5TVKSP5HSWZKK2TQHTI7DWSIXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 30/12/2023 12:03, Takashi Iwai wrote:
> On Sat, 30 Dec 2023 08:27:43 +0100,
> Dominik Brodowski wrote:
>>
>> Am Fri, Dec 29, 2023 at 06:11:43PM +0100 schrieb Takashi Iwai:
>>> On Fri, 29 Dec 2023 16:24:18 +0100,
>>> Dominik Brodowski wrote:
>>>>
>>>> Hi Takashi,
>>>>
>>>> many thanks for your response. Your patch helps half-way: the oops goes
>>>> away, but so does the sound... With your patch, the decisive lines in dmesg
>>>> are:
>>>>
>>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
>>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
>>>> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
>>>> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
>>>> 	sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
>>>> 	sof_sdw sof_sdw: snd_soc_register_card failed -517
>>>> 	platform sof_sdw: deferred probe pending
>>>>
>>>> With a revert of the a0575b4add21, it is:
>>>>
>>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
>>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
>>>> 	sof-audio-pci-intel-tgl 0000:00:1f.3: Topology: ABI 3:22:1 Kernel ABI 3:23:0
>>>> 	sof_sdw sof_sdw: ASoC: Parent card not yet available, widget card binding deferred
>>>> 	sof_sdw sof_sdw: hda_dsp_hdmi_build_controls: no PCM in topology for HDMI converter 3
>>>> 	input: sof-soundwire HDMI/DP,pcm=5 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input14
>>>> 	input: sof-soundwire HDMI/DP,pcm=6 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input15
>>>> 	input: sof-soundwire HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sof_sdw/sound/card0/input16
>>>>
>>>> Maybe this helps a bit further?
>>>
>>> Thanks for quick testing.
>>> It shows at least that my guess wasn't wrong.
>>>
>>> The problem could be the initialization order in the caller side.
>>> Can the patch below work instead?
>>
>> Unfortunately, no:
>>
>> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware info: version 2:2:0-57864
>> sof-audio-pci-intel-tgl 0000:00:1f.3: Firmware: ABI 3:22:1 Kernel ABI 3:23:0
>> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
>> sof_sdw sof_sdw: snd_soc_register_card failed -517
>> sof_sdw sof_sdw: ASoC: CODEC DAI intel-hdmi-hifi1 not registered
>> sof_sdw sof_sdw: snd_soc_register_card failed -517
>> platform sof_sdw: deferred probe pending
> 
> Hm, then it might be the logical failure of that commit.
> Peter?
> 
> Without a fix in the next few days, we'll have to revert it before
> 6.7.

The fix for this was sent early December:
https://lore.kernel.org/linux-sound/20231207095425.19597-1-peter.ujfalusi@linux.intel.com/

It had the correct Fixes tag but it did not made it to 6.7-rc while
a0575b4add21 did made it.

Mark, Takashi, can you pick the fix for 6.7 (it is in -next)? I think we
might have time for it to land?

-- 
Péter
