Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D4E3161D
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 22:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB09167E;
	Fri, 31 May 2019 22:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB09167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559334334;
	bh=f/3APuAqn3CakN/0khkgB34sJV7LlZGRrNiB5zkPffs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jaXSys4wkst2HM4BWyS2slkKiArA02l7DzIgowZFFyptTPQNau17sBhVwrAwkOjIU
	 NxPeMOVMH6K5gHui3bb0vaN4i421xNyWgu0gjsSfaay1asY6FdxXN2wyb88LN1gchE
	 sTJ+fFY2fymn6o+xhfmbTKVf8XJrhr9qjz35Xhd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A2CBCF896F2;
	Fri, 31 May 2019 22:23:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3D16F896E5; Fri, 31 May 2019 22:23:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C26FFF8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 22:23:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C26FFF8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 13:23:38 -0700
X-ExtLoop1: 1
Received: from gpanchal-mobl.amr.corp.intel.com (HELO [10.254.189.1])
 ([10.254.189.1])
 by fmsmga008.fm.intel.com with ESMTP; 31 May 2019 13:23:38 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <s5h7ea6lfaa.wl-tiwai@suse.de>
 <1f3059d6-b271-f612-c670-e7214674892f@linux.intel.com>
 <s5h36kulc07.wl-tiwai@suse.de>
 <a2737284-ee55-59e5-cab7-2503d27c92bb@linux.intel.com>
 <s5hzhn2jvf2.wl-tiwai@suse.de> <s5hv9xqjto3.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <68aa2fa2-41fc-3dfb-c82f-1f88be5bd867@linux.intel.com>
Date: Fri, 31 May 2019 15:23:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hv9xqjto3.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Keyon Jie <yang.jie@linux.intel.com>
Subject: Re: [alsa-devel] Why open-coding in sof_hda_bus_init()?
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



On 5/31/19 2:44 PM, Takashi Iwai wrote:
> On Fri, 31 May 2019 21:06:25 +0200,
> Takashi Iwai wrote:
>>
>> On Fri, 31 May 2019 20:31:33 +0200,
>> Pierre-Louis Bossart wrote:
>>>
>>> On 5/31/19 1:22 PM, Takashi Iwai wrote:
>>>> On Fri, 31 May 2019 19:43:59 +0200,
>>>> Pierre-Louis Bossart wrote:
>>>>>
>>>>> On 5/31/19 12:11 PM, Takashi Iwai wrote:
>>>>>> Hi,
>>>>>>
>>>>>> while looking at SOF code due to the recent debugging session, I
>>>>>> noticed that sof_hda_bus_init() is basically an open-code of the
>>>>>> existing snd_hdac_ext_bus_init().  Why don't we simply call
>>>>>> snd_hdac_ext_bus_init() like below?
>>>>>
>>>>> It's intentional.
>>>>> We've been asked since Day1 of SOF on ApolloLake to provide a
>>>>> 'self-contained' controller-only support that has no dependency on the
>>>>> snd_hdac library for solutions where HDaudio links+codecs are not used
>>>>> (typically IOT devices). This was driven by the lack of separation
>>>>> between layers in that library as well as a desire to have a
>>>>> dual-license. That's why you see the init and some of the basic
>>>>> utilities re-implemented for SOF.
>>>>>
>>>>> However for cases where HDaudio+HDMI are required, we didn't want to
>>>>> reinvent the wheel - HDaudio is complicated enough - and do make use
>>>>> of this snd_hdac library.
>>>>>
>>>>> We have a config SND_SOC_SOF_HDA that controls in which mode we
>>>>> operate, and it enables HDMI by default (for I2S+HDMI solutions). To
>>>>> get external HDaudio codecs you need the additional SOF_HDAUDIO_CODEC
>>>>> kconfig.
>>>>>
>>>>> Does this help?
>>>>
>>>> Well, what's wrong with the conditional build with Kconfig?
>>>> You can just wrap the call snd_hdac_ext_bus_init() with #if/endif,
>>>> e.g. in soc/sof/intel/hda.h,
>>>>
>>>> static inline void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
>>>> 				    const struct hdac_ext_bus_ops *ext_ops)
>>>> {
>>>> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
>>>> 	snd_hdac_ext_bus_init(bus, dev, NULL, NULL, ext_ops);
>>>> #endif
>>>> }
>>>
>>> We still need initializations for some of the data structures when
>>> SOF_HDA is not defined.
>>
>> Which data structure?  The function above is only initializing the
>> given struct hdac_bus object.  I'm not suggesting to change the caller
>> site, hda_init() of sound/soc/sof/intel/hda.c.

we need everything that was removed in your proposal :-)

-	memset(bus, 0, sizeof(*bus));
-	bus->dev = dev;
-
-	bus->io_ops = &io_ops;
-	INIT_LIST_HEAD(&bus->stream_list);
-
-	bus->irq = -1;
-	bus->ext_ops = ext_ops;
-
-	/*
-	 * There is only one HDA bus atm. keep the index as 0.
-	 * Need to fix when there are more than one HDA bus.
-	 */
-	bus->idx = 0;
-
-	spin_lock_init(&bus->reg_lock);

This is the smallest set of initialization needed when you don't need 
hdmi/hdaudio codec support.

> 
> Also, if the size matters: we can split hda-core code between the thin
> bus accessor and the rest.  Basically what you need unconditionally is
> the functions in sound/hda/hdac_bus.c, and they are fairly independent
> from other HD-audio functios, so it can be its own module.  And the
> recent ext_bus init and exit implementations are very close to the
> bare init/exit code, too, so they can be simply moved into the
> hdac-core-bus or provided as a static inline, too.
> 
> 
> In anyway, my point is that there are tons better way than the open
> code of such a complex object initialization.

It's actually not open-coding based on copy/paste, it took us a long 
time to figure out what was strictly necessary.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
