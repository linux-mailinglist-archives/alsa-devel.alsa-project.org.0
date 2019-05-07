Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E55D15752
	for <lists+alsa-devel@lfdr.de>; Tue,  7 May 2019 03:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B54518FF;
	Tue,  7 May 2019 03:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B54518FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557192685;
	bh=kN8ka/QOSmwpmSYkeVEXpMkrM/RuTl/UprgWehbl4HM=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aqcA5SFBYgcM+XV+gkTWDTfpMXhVQvfG7pZsidC5HauYBtvOQfE9Up1aM2hWjb0Cq
	 K33+XM0w0Dw6Wld1MifPhq3dc8ENh4AHN7bCjguyjtVC2Zeico341l0sEq6v7+xyxj
	 Cd0e6GUs+V/vsIYRxrhYBKxq0bFCFie4nyrEBPIE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3AE9F89671;
	Tue,  7 May 2019 03:29:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E5D4F89674; Tue,  7 May 2019 03:29:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63BC6F89671
 for <alsa-devel@alsa-project.org>; Tue,  7 May 2019 03:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63BC6F89671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 18:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,440,1549958400"; d="scan'208";a="140749827"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga008.jf.intel.com with ESMTP; 06 May 2019 18:29:28 -0700
Received: from fmsmsx116.amr.corp.intel.com (10.18.116.20) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 18:29:28 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 fmsmsx116.amr.corp.intel.com (10.18.116.20) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 6 May 2019 18:29:28 -0700
Received: from shsmsx103.ccr.corp.intel.com ([169.254.4.70]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.126]) with mapi id 14.03.0415.000;
 Tue, 7 May 2019 09:29:26 +0800
From: "Yang, Libin" <libin.yang@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai
 <tiwai@suse.de>
Thread-Topic: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
 monitor in hw_params
Thread-Index: AQHVA9v3OuP7ztZrUkauVERTrsPn8qZdtWkAgAABAQCAAAHCgIAAAM+AgAABCgCAAR580A==
Date: Tue, 7 May 2019 01:29:25 +0000
Message-ID: <96A12704CE18D347B625EE2D4A099D19528376FA@SHSMSX103.ccr.corp.intel.com>
References: <1557125960-29353-1-git-send-email-libin.yang@intel.com>
 <bebcb1f6-1d8b-63aa-a22d-b48047b64809@linux.intel.com>
 <s5hzhnz3817.wl-tiwai@suse.de>
 <5286a2bd-cb71-8094-84d5-6ac2ad2b1c02@linux.intel.com>
 <s5hwoj337lw.wl-tiwai@suse.de>
 <e735010d-f6c0-5b20-98bb-ecfa52b8cfe8@linux.intel.com>
In-Reply-To: <e735010d-f6c0-5b20-98bb-ecfa52b8cfe8@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWQyZDkzZjgtMDg5YS00NWEyLWFiYWQtNmM2YzU4M2Y0ZmY3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT05JXC9kelY3SmRqVTBjRVcrbXFvWUhLRk9nRGg0Z2dUWGpiUlR3ZWtMeHhJdlllMmVtT251NEVJbjZTaHNLOHIifQ==
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "subhransu.s.prusty@intel.com" <subhransu.s.prusty@intel.com>,
 "samreen.nilofer@intel.com" <samreen.nilofer@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi Pierre,

>-----Original Message-----
>From: Pierre-Louis Bossart [mailto:pierre-louis.bossart@linux.intel.com]
>Sent: Monday, May 6, 2019 11:54 PM
>To: Takashi Iwai <tiwai@suse.de>
>Cc: Yang, Libin <libin.yang@intel.com>; alsa-devel@alsa-project.org;
>broonie@kernel.org; subhransu.s.prusty@intel.com;
>samreen.nilofer@intel.com
>Subject: Re: [alsa-devel] [RFC PATCH] ASoC: codec: hdac_hdmi: no checking
>monitor in hw_params
>
>On 5/6/19 10:50 AM, Takashi Iwai wrote:
>> On Mon, 06 May 2019 17:47:25 +0200,
>> Pierre-Louis Bossart wrote:
>>>
>>> On 5/6/19 10:41 AM, Takashi Iwai wrote:
>>>> On Mon, 06 May 2019 17:37:32 +0200,
>>>> Pierre-Louis Bossart wrote:
>>>>>
>>>>> On 5/6/19 1:59 AM, libin.yang@intel.com wrote:
>>>>>> From: Libin Yang <libin.yang@intel.com>
>>>>>>
>>>>>> This patch move the check of monitor from hw_params to trigger
>callback.
>>>>>>
>>>>>> The original code will check the monitor presence in hw_params. If
>>>>>> the monitor doesn't exist, hw_params will return -ENODEV. Mostly this
>is OK.
>>>>>>
>>>>>> However, pulseaudio will check the pcm devices when kernel is booting
>up.
>>>>>> It will try to open, set hw_params, prepare such pcm devices. We
>>>>>> can't guarantee that the monitor will be connected when kernel is
>booting up.
>>>>>> Especially, hdac_hdmi will export 3 pcms at most. It's hard to say
>>>>>> users will connect 3 monitors to the HDMI/DP ports. This will
>>>>>> cause pulseaudio fail in parsing the pcm devices because the
>>>>>> driver will return -ENODEV in hw_params.
>>>>>>
>>>>>> This patch tries to move the check of monitor presence into
>>>>>> trigger callback. This can "trick" the pulseaudio the pcm is ready.
>>>>>>
>>>>>> This bug is found when we try to enable HDMI detection in
>>>>>> gnome-sound-setting for ASoC hdac_hdmi. After we enable the hdmi
>>>>>> in UCM, pulseaudio will try to parse the hdmi pcm devices. It will
>>>>>> cause failure if there are no monitors connected.
>>>>>
>>>>> Out of curiosity, how is this handled in the legacy driver? I
>>>>> haven't done this for a long time but I remember very clearly being
>>>>> able to play on the HDMI:3,7, etc devices without any monitors
>>>>> connected. You'd get of course no sound but there was no error
>>>>> reported to userspace. The hardware is perfectly capable of pushing
>>>>> samples into the display controller using the HDAudio/iDisp link.
>>>>
>>>> As mentioned in the thread, PA just picks up the stream that is
>>>> connected via a monitor by checking / notified by the corresponding
>>>> Jack control.  On hdac_hdmi driver, the jack control has different
>>>> base name that is irrelevant with the output pins, so PA doesn't
>>>> know how to interpret it, hence it's ignored.
>>>
>>> Yes, but do we have any error checks in the hw_params or trigger
>>> cases with the legacy driver?
>>
>> No, it just continues playing without the actual output.
>
>ok, so could we remove all these error checks then for hdac_hdmi? The
>problem is really the output selection on jack detect/monitor reconfigurations,
>those checks don't add much value, do they?

Yes, I'm planning to remove the checks in hdac_hdmi. Before that, I will 
do some tests on it.

The monitor check in hw_params only impacts on the playback flow.

Regards,
Libin
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
