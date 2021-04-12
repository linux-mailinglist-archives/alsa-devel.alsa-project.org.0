Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FD35D21F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 22:38:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EEE41607;
	Mon, 12 Apr 2021 22:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EEE41607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618259881;
	bh=fO1sSWG54fhR97oHlIQTwd0IXy4Uq3ZazimFKqQiomk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+X3CEEqrqHwVGDBk6Y6Cw+8g7mQ0R3TZh26xvtwjcNnuW86N586FzFy6DMffFVJW
	 EN9NwLOnVrpHgHD+7udTahRQt3sKR6oZeQfyr6WBhRjWu4xTZ9S+Sv939oTgZD8BH2
	 4r5xd5NrONVtVa+3SJpYce5dGAERmzh5vfaKbYHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5675CF80271;
	Mon, 12 Apr 2021 22:36:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C733F80269; Mon, 12 Apr 2021 22:36:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 331F3F800FF
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 22:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 331F3F800FF
IronPort-SDR: 9qkGx1dYjXMj4gruRTJoRxHwdI7DjJsS2PiqDWL4s/FBiZ0gUBfKjNa910ISDA00+TY98HERB+
 7+RTLiwr9U7A==
X-IronPort-AV: E=McAfee;i="6200,9189,9952"; a="174373821"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="174373821"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 13:36:23 -0700
IronPort-SDR: ToCvfQcqpijjWAZMzeI3Pg6gVTnJUpGPt7PNvVQMMqgtM+2oimDdSSnH1zrOSfOwE78NlIE32o
 RXkPkrol8xHA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="381704698"
Received: from raneil-mobl.amr.corp.intel.com (HELO [10.212.14.111])
 ([10.212.14.111])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 13:36:22 -0700
Subject: Re: [PATCH] ASoC: Intel: Handle device properties with software node
 API
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20210322110638.2681-1-heikki.krogerus@linux.intel.com>
 <786795eb-6832-fd7d-4674-65be394c083d@linux.intel.com>
 <YFm0u9k/DNy5URsR@kuha.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <39e2ab87-3b70-8659-6282-5b03d30f901b@linux.intel.com>
Date: Mon, 12 Apr 2021 15:36:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YFm0u9k/DNy5URsR@kuha.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, Bard Liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Heikki,

>>> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
>>> index 06df2d46d910b..4a9817a95928c 100644
>>> --- a/sound/soc/intel/boards/bytcht_es8316.c
>>> +++ b/sound/soc/intel/boards/bytcht_es8316.c
>>> @@ -544,7 +544,7 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>>>    		props[cnt++] = PROPERTY_ENTRY_BOOL("everest,jack-detect-inverted");
>>>    	if (cnt) {
>>> -		ret = device_add_properties(codec_dev, props);
>>> +		ret = device_create_managed_software_node(codec_dev, props, NULL);
>>
>> I don't think this is correct. This is using the codec_dev device, but this
>> property is created in the machine driver - different device. I think the
>> proper fix is to remove the property in the machine driver .remove()
>> callback, as done below for the SoundWire case, and not to rely on devm_
>> with the wrong device.
>>
>> there was a thread between July and October on this in
>> https://github.com/thesofproject/linux/pull/2306/
>>
>> It seems that we need to restart this work.
>>
>> Heikki, do you mind if I take your patches (keeping you as the author) and
>> rework+test them with the SOF tree + CI ?
> 
> OK by me (though, I'm not sure about the author part after that).

I took the code and split it in two for BYT/CHT (modified to remove 
devm_) and SoundWire parts (added as is).

https://github.com/thesofproject/linux/pull/2810

Both cases result in a refcount error on device_remove_sof when removing 
the platform device. I don't understand the code well enough to figure 
out what happens, but it's likely a case of the software node being 
removed twice?

kernel: [  872.695132] refcount_t: underflow; use-after-free.
kernel: [  872.695153] WARNING: CPU: 7 PID: 16086 at lib/refcount.c:28 
refcount_warn_saturate+0xa6/0xf0

<snip>

kernel: [  872.695222] CPU: 7 PID: 16086 Comm: rmmod Not tainted 
5.12.0-rc4-pr2810-5522-default #439c50f6
kernel: [  872.695225] Hardware name: Intel Corporation Tiger Lake 
Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS 
TGLSFWI1.R00.3264.A00.2006251828 06/25/2020
kernel: [  872.695226] RIP: 0010:refcount_warn_saturate+0xa6/0xf0

< snip>

kernel: [  872.695244] Call Trace:
kernel: [  872.695248]  sof_sdw_rt711_exit+0x2d/0x40 [snd_soc_sof_sdw]
kernel: [  872.695253]  mc_remove+0xa8/0xe0 [snd_soc_sof_sdw]
kernel: [  872.695256]  ? rt711_rtd_init+0x170/0x170 [snd_soc_sof_sdw]
kernel: [  872.695259]  platform_remove+0x1a/0x40
kernel: [  872.695264]  device_release_driver_internal+0xf1/0x1d0
kernel: [  872.695267]  bus_remove_device+0xed/0x160
kernel: [  872.695269]  device_del+0x187/0x3e0
kernel: [  872.695272]  platform_device_del.part.0+0xe/0x60
kernel: [  872.695274]  platform_device_unregister+0x17/0x30
kernel: [  872.695277]  snd_sof_device_remove+0x53/0xf0 [snd_sof]
kernel: [  872.695283]  sof_pci_remove+0x15/0x40 [snd_sof_pci]
kernel: [  872.695286]  pci_device_remove+0x36/0xa0
kernel: [  872.695290]  device_release_driver_internal+0xf1/0x1d0
kernel: [  872.695292]  driver_detach+0x42/0x90
kernel: [  872.695294]  bus_remove_driver+0x56/0xd0
kernel: [  872.695296]  pci_unregister_driver+0x36/0x80
kernel: [  872.695299]  __x64_sys_delete_module+0x18f/0x250

