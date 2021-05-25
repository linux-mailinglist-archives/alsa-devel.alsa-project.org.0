Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4634438FC7C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 10:16:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A59F11657;
	Tue, 25 May 2021 10:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A59F11657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621930572;
	bh=5AIJIS0sQeubVhK2/PT1mwSj1IqesMMb5LkVA8uvV84=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sDs9/ex8NB0Rkpp7Sm8L7CaIL85Gao548IQJM/eVOPHEqceNQQUPcgspOABsojABp
	 XAk8VR7Ks4gBsNXqBPf9oTa7uQeZI744BTS4Ax+kAYrewOxxEil1lpNHZnR07/cAGU
	 QI42Bp0Br1kSAiieBSrBnb4q3Ne7WMDY7a1liZ1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42048F80137;
	Tue, 25 May 2021 10:14:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4004F801EB; Tue, 25 May 2021 10:14:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A64CAF80113
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 10:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A64CAF80113
IronPort-SDR: S96aXehjCHfB6mbaBy/J33wI86aFRCdwhezuapcZ+rxGCKpPUjK+A5azcbPg0f2FlrSzPQIHwS
 d5YeiEO+8L9w==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="189512823"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="189512823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 01:14:30 -0700
IronPort-SDR: UXB5VV4ItGtVaylZs2wtBBQmp/1L4fi/RhN5F2J995yPla5geiSTrx1O8s5PcZ1NmZ3IinJS3P
 F5q/j8O14LPw==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="476307158"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO [10.252.39.140])
 ([10.252.39.140])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 01:14:29 -0700
Subject: Re: [PATCH] ALSA: hda: Add Lenovo ThinkStation P340 to
 power_save_denylist
To: Takashi Iwai <tiwai@suse.de>
References: <20210524152533.7479-1-peter.ujfalusi@linux.intel.com>
 <s5hfsybe0vo.wl-tiwai@suse.de>
From: "Ujfalusi, Peter" <peter.ujfalusi@linux.intel.com>
Message-ID: <3e7428d2-2cfd-5835-33ef-72f3a2f43324@linux.intel.com>
Date: Tue, 25 May 2021 11:14:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <s5hfsybe0vo.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kai.vehmanen@linux.intel.com
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



On 5/25/2021 10:19 AM, Takashi Iwai wrote:
> On Mon, 24 May 2021 17:25:33 +0200,
> Peter Ujfalusi wrote:
>>
>> On playback start there is a huge plock/pop noise via the green jack used
>> in Line out mode.
>>
>> The only way I was able to fix it to set the power_save to 0 for the
>> snd_hda_intel.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
>> ---
>> Hi Takashi,
>>
>> Changes since RFC:
>> - Fixed up the PCI ID
>>
>> ever since I have this workstation (three weeks) the plock/pop noise on playback
>> start bugged me. So far the only solution I have found is to disable the
>> power_save which I find acceptable on a desktop compared to the pops.
>>
>> The alsa-info.sh output is can be found here:
>> http://alsa-project.org/db/?f=414b1b236fc73db386ad4f938bc3b304f6b30b05
>>
>> Missing details from alsa-info output:
>> # lspci -nnk | grep -A2 Audio
>> 00:1f.3 Audio device [0403]: Intel Corporation Comet Lake PCH cAVS [8086:06c8]
>>         DeviceName: Onboard - Sound
>>         Subsystem: Lenovo Device [17aa:1048]
>>
>> CPU: i9-10900k
>>
>> The machine have ALC623 codec and the jacks are correctly discovered and they
>> do what they supposed to be.
>> When I have the headset connected to the front and audio is routed there the
>> line out (green jack) from the back still prodices the plock/pop.
>>
>> Is there a known quirk for similar issue or a better way to handle it?
> 
> In general, this deny list is the last resort when we couldn't find
> any other way to fix the click noise.

Sure, I'm not that familiar yet with the HDA code base.

> Let's check other possibilities
> at first, e.g. setting auto_mute_via_amp flag.  This can be achieved
> even via hints in an early patching specified via "patch" option of
> snd-hda-intel module (see Documentation/sound/hda/notes.rst for some
> information).

Unfortunately the auto_mute_via_amp has no effect on the pop.
line_in_auto_switch and pin_amp_workaround have no effect either.

fwiw, a simple
cat /proc/asound/card0/codec#0

generates plock/pop.

-- 
Péter
