Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 524B7150C1
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2019 17:55:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5AB01926;
	Mon,  6 May 2019 17:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5AB01926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557158157;
	bh=5VOn4FhLH6zT8gZwJ1G9VAZdca/xR2UiKt/3vC1KHpo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q2ZRysjtqLBjADPnaWHOUA1iYTzZfoSqbHX/8m9Z7f15T5xxd4v3r8OByBsik7RzQ
	 2lWNOnfYb/qmAV8MbJpIyRP21KrnitajXE+oktzasvTFDN2tOfNl77AEydg6DJJ1WL
	 anmRi7H9PX2qKNkvjp6LlmNs7tNK7BpPlz26AeLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCE9EF896F0;
	Mon,  6 May 2019 17:54:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33A3CF896FD; Mon,  6 May 2019 17:54:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F93FF80C07
 for <alsa-devel@alsa-project.org>; Mon,  6 May 2019 17:54:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F93FF80C07
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 08:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,438,1549958400"; d="scan'208";a="344038413"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga005.fm.intel.com with ESMTP; 06 May 2019 08:54:04 -0700
Received: from slaugust-mobl.amr.corp.intel.com (unknown [10.254.21.102])
 by linux.intel.com (Postfix) with ESMTP id 7217B580238;
 Mon,  6 May 2019 08:54:03 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <bebcb1f6-1d8b-63aa-a22d-b48047b64809@linux.intel.com>
 <s5hzhnz3817.wl-tiwai@suse.de>
 <5286a2bd-cb71-8094-84d5-6ac2ad2b1c02@linux.intel.com>
 <s5hwoj337lw.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <e735010d-f6c0-5b20-98bb-ecfa52b8cfe8@linux.intel.com>
Date: Mon, 6 May 2019 10:54:02 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hwoj337lw.wl-tiwai@suse.de>
Content-Language: en-US
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 subhransu.s.prusty@intel.com, samreen.nilofer@intel.com
Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 5/6/19 10:50 AM, Takashi Iwai wrote:
> On Mon, 06 May 2019 17:47:25 +0200,
> Pierre-Louis Bossart wrote:
>>
>> On 5/6/19 10:41 AM, Takashi Iwai wrote:
>>> On Mon, 06 May 2019 17:37:32 +0200,
>>> Pierre-Louis Bossart wrote:
>>>>
>>>> On 5/6/19 1:59 AM, libin.yang@intel.com wrote:
>>>>> From: Libin Yang <libin.yang@intel.com>
>>>>>
>>>>> This patch move the check of monitor from hw_params to trigger callback.
>>>>>
>>>>> The original code will check the monitor presence in hw_params. If the
>>>>> monitor doesn't exist, hw_params will return -ENODEV. Mostly this is OK.
>>>>>
>>>>> However, pulseaudio will check the pcm devices when kernel is booting up.
>>>>> It will try to open, set hw_params, prepare such pcm devices. We can't
>>>>> guarantee that the monitor will be connected when kernel is booting up.
>>>>> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say users
>>>>> will connect 3 monitors to the HDMI/DP ports. This will cause pulseaudio
>>>>> fail in parsing the pcm devices because the driver will return -ENODEV in
>>>>> hw_params.
>>>>>
>>>>> This patch tries to move the check of monitor presence into trigger
>>>>> callback. This can "trick" the pulseaudio the pcm is ready.
>>>>>
>>>>> This bug is found when we try to enable HDMI detection in
>>>>> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi in UCM,
>>>>> pulseaudio will try to parse the hdmi pcm devices. It will cause failure if
>>>>> there are no monitors connected.
>>>>
>>>> Out of curiosity, how is this handled in the legacy driver? I haven't
>>>> done this for a long time but I remember very clearly being able to
>>>> play on the HDMI:3,7, etc devices without any monitors
>>>> connected. You'd get of course no sound but there was no error
>>>> reported to userspace. The hardware is perfectly capable of pushing
>>>> samples into the display controller using the HDAudio/iDisp link.
>>>
>>> As mentioned in the thread, PA just picks up the stream that is
>>> connected via a monitor by checking / notified by the corresponding
>>> Jack control.  On hdac_hdmi driver, the jack control has different
>>> base name that is irrelevant with the output pins, so PA doesn't know
>>> how to interpret it, hence it's ignored.
>>
>> Yes, but do we have any error checks in the hw_params or trigger cases
>> with the legacy driver?
> 
> No, it just continues playing without the actual output.

ok, so could we remove all these error checks then for hdac_hdmi? The 
problem is really the output selection on jack detect/monitor 
reconfigurations, those checks don't add much value, do they?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
