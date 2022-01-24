Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7D4498A6D
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 20:03:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C391289D;
	Mon, 24 Jan 2022 20:02:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C391289D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643051018;
	bh=ZUBe+QDlDLgEabG8pAFLEDuWfYDLWvwpjLpiX5DpbDc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z0DDiY5/6gI+4nuTOBbom8tXbNPCKCOOvsuu0f6+i7gaJ/kfScuqJ2ttAYY2hjy5X
	 4JrcwOuvjyqaQaHjwgomYQCYed68M+LNvFMqLVr9Egr1wjylr7vGnzHWJUL56AF9/h
	 56No7pgBvyGPzJgBD3yHnajd2SDS6NZlMdY73FXQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85391F80083;
	Mon, 24 Jan 2022 20:02:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AB48F8027C; Mon, 24 Jan 2022 20:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10CE4F800E9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 20:02:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10CE4F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="LzVP7L0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643050946; x=1674586946;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZUBe+QDlDLgEabG8pAFLEDuWfYDLWvwpjLpiX5DpbDc=;
 b=LzVP7L0IvNilX3/gsxxfugELlrQEB/QknKyeB6L0cSpn4tcLGsnL8AGZ
 oxTe/qLvn66EGm9bsdAvvpmFHv+W3vqkbjKqpvoHBOjwS1PpYqK2EGqKz
 ScEOarmibaM8Zp17dsgtN0+UYLNgh6pisJ7TQojpxDAivI6e9To3cvkth
 DOJN8l+2VDp6zPPEAE5agexvvbW7WQP/DvrInQ1f52m8hisTkg1urlWg4
 DDPinFX+FtMY/aXMSTAQT+DkKKVlXEr11uHfptsMa3gYwXHwXRBHUQMLm
 6PPOE+UnArCUH5+8f1uhUPjmA+zrKULxPgZPsEl5SsIqVKXGeYjoG82M8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="244957363"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="244957363"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 11:02:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479194927"
Received: from jindalan-mobl.amr.corp.intel.com (HELO [10.212.11.218])
 ([10.212.11.218])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 11:02:20 -0800
Message-ID: <1164c015-46b3-1efc-b5ce-044cc3492b78@linux.intel.com>
Date: Mon, 24 Jan 2022 13:02:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: No sound on gpd pocket 3
Content-Language: en-US
To: anthony tonitch <d.tonitch@gmail.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>
References: <CAAEBy7fQ6x95H5XkaKmXWsB1KCDbYAFtA5zUZ03ToJSegHb05w@mail.gmail.com>
 <d08bfba6-3aa8-e0d6-6d21-8734eed55978@linux.intel.com>
 <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <CAAEBy7exurcqZ+7Js27O7bWHsJQ9tQ_2yWXDeA3_smr5BDc5RA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 1/24/22 12:35, anthony tonitch wrote:
> HO, I'm really sorry, I did this alsa-info from my main computer over
> ssh and I might have typed the command on the wrong terminal :'(
> here it is http://alsa-project.org/db/?f=8ec2e745ceafb1a659d71eff99ad3a9eda3eb62d

ah, now it's starting to make sense.

I am afraid you have the ES8316 codec, or one of its variants.
/sys/bus/acpi/devices/ESSX8326:00/status 	 15

so no you don't want to use options snd-intel-dspcfg dsp_driver=1 but

options snd-intel-dspcfg dsp_driver=3

The auto-detection don't work because we use a different codec HID for
the driver selection


	{
		.flags = FLAG_SOF,
		.device = 0x5a98,
		.codec_hid = "ESSX8336",
	},

as well as the machine driver selection

	{
		.id = "ESSX8336",
		.drv_name = "sof-essx8336",
		.sof_tplg_filename = "sof-glk-es8336.tplg",
	},

This is really a problematic set of devices, where absolutely all
possible I2S links have been used, along with GPIO settings and DMICs.

Please file a bug on https://github.com/thesofproject/linux/issues so
that we can keep track of this and suggest solution.

Thanks!

> Le lun. 24 janv. 2022 à 18:11, Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> a écrit :
>>
>>
>>
>> On 1/24/22 10:52, anthony tonitch wrote:
>>> Hello,
>>>
>>> I have a problem I guess related to sof... I already asked on the irc
>>> #alsa@libera.chat and gnarface advised me to come and ask on this
>>> mailing list!
>>
>> using "options snd-intel-dspcfg dsp_driver=1" to avoid using SOF isn't
>> very helpful on an AMD platform :-)
>>
>> 08:00.1 Audio device [0403]: NVIDIA Corporation GP104 High Definition
>> Audio Controller [10de:10f0] (rev a1)
>>         Subsystem: PNY Device [196e:11a0]
>> 0a:00.3 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Family
>> 17h (Models 00h-0fh) HD Audio Controller [1022:1457]
>>         Subsystem: ASUSTeK Computer Inc. Device [1043:86c7]
>>
>> Best of luck!
>>
>>>
>>> I am struggling to make the sound of my gpd pocket 3 to work on linux
>>> (archlinux to be precise)! In fact, the sound is not supposed to work
>>> out of the box as other users tested it before me! but they all had
>>> the solution to set the dsp_driver and this didn't worked for me!
>>> I checked several times to see if the module was loaded properly and
>>> yes it is (as you can also check in the alsa-info at the end of the mail)!
>>>
>>> If I do aplay -l I get a bunch of hdmi connection that is not working
>>> at all! I'm really lost here and I don't even know what to look for
>>> anymore
>>>
>>> The sound works great on windows so This doens't seems to be hardware problem ?!
>>> and I tried to plug an usb headset which give me sound so I doesn't
>>> seems to be config related either ?! (tho the jack doesn't work)
>>>
>>> I asked on several places already. I post the different links here in
>>> case you want to check but I don't have any response to any post
>>> unfortunately!
>>>
>>> - Post on Archlinux BBS: https://bbs.archlinux.org/viewtopic.php?id=273044
>>> - Post on subreddit GPDPocket:
>>> https://www.reddit.com/r/GPDPocket/comments/s31qi8/gpd_p3_no_sound_linux/
>>>
>>> - Screenshot and bios picture of maybe relevant informations:
>>>     - https://imgur.com/a/DouSB3m
>>>     - https://imgur.com/a/K232PLJ
>>>
>>> I hope there is enough informations to help me debug this but if you
>>> need anything I can provide it! this is a small pc and I'm usualy
>>> quarrying it around!
>>> I know this is better to send mail but if you need me to chat for any
>>> reason (it would be easier for instance) I'm usually hanging on the
>>> libera.chat irc as tonitch you can pm or tag me on #alsa
>>>
>>> Here is the alsa-info.sh :
>>> http://alsa-project.org/db/?f=6ddb669a19086cebdb121c97c25bbdccb98e856d
>>>
>>> Thanks a lot for your help!
>>>
>>> PS: Ubuntu mate have released their official pocket 3 distribution and
>>> I tried it but the sound didn't worked either, here is the alsa-info
>>> In case this help ?! :
>>> http://alsa-project.org/db/?f=df4c183fd00cec224006ec8caa228705399ad873
