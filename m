Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628CE314C9
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 20:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC6E5165E;
	Fri, 31 May 2019 20:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC6E5165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559327608;
	bh=GpO12wq9Jgm+0Xn1fa8YOvhxCfwDz8nWYJekCJe0tsc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srJR7CjbUNkx2iM6wgJ8RrSPXcu//dZd2QCbyqmfLiK1VbOhBpahDfNZxjatxTPpc
	 RddTXM0rcC7/4SxgFNuUHtuHrgrSpC7Og6QHJPs6K3fGGcd+YV2AgdxCLAwsUDwko3
	 9uRtRE4LYaqleT0jt/Jv8bOpRbhTNudP68EVehoA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A5D0F896F2;
	Fri, 31 May 2019 20:31:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15735F896E5; Fri, 31 May 2019 20:31:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38D56F80C1B
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 20:31:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38D56F80C1B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 11:31:34 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2019 11:31:34 -0700
Received: from mayurda-mobl.amr.corp.intel.com (unknown [10.252.130.8])
 by linux.intel.com (Postfix) with ESMTP id D51C3580105;
 Fri, 31 May 2019 11:31:33 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <s5h7ea6lfaa.wl-tiwai@suse.de>
 <1f3059d6-b271-f612-c670-e7214674892f@linux.intel.com>
 <s5h36kulc07.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <a2737284-ee55-59e5-cab7-2503d27c92bb@linux.intel.com>
Date: Fri, 31 May 2019 13:31:33 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h36kulc07.wl-tiwai@suse.de>
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

On 5/31/19 1:22 PM, Takashi Iwai wrote:
> On Fri, 31 May 2019 19:43:59 +0200,
> Pierre-Louis Bossart wrote:
>>
>> On 5/31/19 12:11 PM, Takashi Iwai wrote:
>>> Hi,
>>>
>>> while looking at SOF code due to the recent debugging session, I
>>> noticed that sof_hda_bus_init() is basically an open-code of the
>>> existing snd_hdac_ext_bus_init().  Why don't we simply call
>>> snd_hdac_ext_bus_init() like below?
>>
>> It's intentional.
>> We've been asked since Day1 of SOF on ApolloLake to provide a
>> 'self-contained' controller-only support that has no dependency on the
>> snd_hdac library for solutions where HDaudio links+codecs are not used
>> (typically IOT devices). This was driven by the lack of separation
>> between layers in that library as well as a desire to have a
>> dual-license. That's why you see the init and some of the basic
>> utilities re-implemented for SOF.
>>
>> However for cases where HDaudio+HDMI are required, we didn't want to
>> reinvent the wheel - HDaudio is complicated enough - and do make use
>> of this snd_hdac library.
>>
>> We have a config SND_SOC_SOF_HDA that controls in which mode we
>> operate, and it enables HDMI by default (for I2S+HDMI solutions). To
>> get external HDaudio codecs you need the additional SOF_HDAUDIO_CODEC
>> kconfig.
>>
>> Does this help?
> 
> Well, what's wrong with the conditional build with Kconfig?
> You can just wrap the call snd_hdac_ext_bus_init() with #if/endif,
> e.g. in soc/sof/intel/hda.h,
> 
> static inline void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev,
> 				    const struct hdac_ext_bus_ops *ext_ops)
> {
> #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> 	snd_hdac_ext_bus_init(bus, dev, NULL, NULL, ext_ops);
> #endif
> }

We still need initializations for some of the data structures when 
SOF_HDA is not defined.

> 
> In genral, the open-code is very bad from the maintenance POV.  And,
> even worse, currently the hda-bus.c does only initialization, and the
> release is with the hda-bus code.

I agree, it's not ideal at all, but the snd_hdac library isn't great 
either...
We'll see what we can do, the hda code in SOF is being revisited since 
there's just too much duplications between the two modes, we can rework 
the init while we're at it.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
