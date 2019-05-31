Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF1131655
	for <lists+alsa-devel@lfdr.de>; Fri, 31 May 2019 23:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 559031686;
	Fri, 31 May 2019 23:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 559031686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559336471;
	bh=1bP2KhWRkhNNJ/3Q676KLWtUErG6H0/EjukJMHWOQwE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CFFWZpNE7wn/WWcI2sQdrcOVoXXaFnMAQhqYuDjqI7UYjHNoOO2LZ7tfrX9iXId7a
	 9A62dA6fKiO311lYPFJp4wU5bjHwkkj9rCVUQal3YaFFXA0f6mBvS+hYOGGcZa2FJu
	 AJ9oQJsUFz1PHE3C4mn+jc/mnW7SY5glP5NV3FSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F049F896E4;
	Fri, 31 May 2019 22:59:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3B73F896E5; Fri, 31 May 2019 22:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D5E1F8072E
 for <alsa-devel@alsa-project.org>; Fri, 31 May 2019 22:59:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D5E1F8072E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 May 2019 13:59:17 -0700
X-ExtLoop1: 1
Received: from gpanchal-mobl.amr.corp.intel.com (HELO [10.254.189.1])
 ([10.254.189.1])
 by fmsmga008.fm.intel.com with ESMTP; 31 May 2019 13:59:17 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <s5h7ea6lfaa.wl-tiwai@suse.de>
 <1f3059d6-b271-f612-c670-e7214674892f@linux.intel.com>
 <s5h36kulc07.wl-tiwai@suse.de>
 <a2737284-ee55-59e5-cab7-2503d27c92bb@linux.intel.com>
 <s5hzhn2jvf2.wl-tiwai@suse.de> <s5hv9xqjto3.wl-tiwai@suse.de>
 <68aa2fa2-41fc-3dfb-c82f-1f88be5bd867@linux.intel.com>
 <s5hmuj2jr9a.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <13dce83f-a092-6d9f-4676-8e3fc46bdc23@linux.intel.com>
Date: Fri, 31 May 2019 15:59:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <s5hmuj2jr9a.wl-tiwai@suse.de>
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


>> we need everything that was removed in your proposal :-)
>>
>> -	memset(bus, 0, sizeof(*bus));
>> -	bus->dev = dev;
>> -
>> -	bus->io_ops = &io_ops;
>> -	INIT_LIST_HEAD(&bus->stream_list);
>> -
>> -	bus->irq = -1;
>> -	bus->ext_ops = ext_ops;
>> -
>> -	/*
>> -	 * There is only one HDA bus atm. keep the index as 0.
>> -	 * Need to fix when there are more than one HDA bus.
>> -	 */
>> -	bus->idx = 0;
>> -
>> -	spin_lock_init(&bus->reg_lock);
>>
>> This is the smallest set of initialization needed when you don't need
>> hdmi/hdaudio codec support.
> 
> I don't understand it...  Why SOF core needs to initialize the content
> of HD-audio bus object even if you won't use it?

we do use it left and right, but we only use the 'controller/DMA' parts 
of that structure. we have zero use for CORB/RIRB and codec-specific 
stuff when I2S and DMIC are the only connections to 3rd party chips

> 
> IOW, what's the merit of having hda-bus.c with the copy of
> snd-hda-core code?  As far as I see, both hda.c and hda-bus.c are
> linked into the same snd-sof-intel-hda-common module.  And, the former
> has the direct calls of HD-audio core API (with
> CONFIG_SND_SOC_SOF_HDA); i.e. snd-sof-intel-hda-common already depends
> on snd-hda-core if CONFIG_SND_SOC_SOF_HDA is on, no matter how you
> code hda-bus.c.

I agree we could implement hda-bus in a cleaner way - but it's a very 
small file. A larger core repartitioning would take quite a bit of time, 
and in the mean time we already have to sort out all the deltas between 
legacy driver and hdac library.

Anyways, that's it for me this week, enjoy your vacation!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
