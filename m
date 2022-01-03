Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7C5483102
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 13:29:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BD801784;
	Mon,  3 Jan 2022 13:29:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BD801784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641212993;
	bh=wIhk7ar1O0efTb6vP0dBvBL+R2w7keYOCYir4u56IwM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BBrQqk7W8RCuraDj3Ovluhjv5QMfScGenE/3ygcD/oJ9s17zv25n1A271JDE4Mlz1
	 mZBQw9eSBcNNvxIJMLhMGmhGrMe2yyofuoKA17qTbYLnwt7zEwXE9bqMIlPHFMzfxa
	 jymElr3FQmAtlfBhyo55VaEXmBEUEUZLWo641Sh0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90436F8013F;
	Mon,  3 Jan 2022 13:28:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC83F80107; Mon,  3 Jan 2022 13:28:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61844F8007E
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 13:28:33 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7C6A4A0040;
 Mon,  3 Jan 2022 13:28:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7C6A4A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1641212908; bh=Xof2WKElXmenIQgFZezAvXYN+P+VCsCATHtA+a2bvEc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=KRmKQznCZUuELuH/1dydU5QM4riOP87XkyvWLGfLAMqOmCYbFCChUcIxL1osbvLP8
 OamgAQdnEJByMUdtRYfxFUuCRU8uE1JfowntOXrcF5C/EcJ2ivom7QaXQ1hvZ7yTfB
 /J9H+EyaqpqrH+lujY1IEJca88xZEKRc5/4C9Ls8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Jan 2022 13:28:18 +0100 (CET)
Message-ID: <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
Date: Mon, 3 Jan 2022 13:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Correct stopping capture and playback substreams?
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Pavel Hofman <pavel.hofman@ivitera.com>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
 <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
 <s5ho84tm2vv.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5ho84tm2vv.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Julian Scheel <julian@jusst.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Jack Pham <jackp@codeaurora.org>, John Keeping <john@metanate.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>, Yunhao Tian <t123yh.xyz@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
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

On 03. 01. 22 13:15, Takashi Iwai wrote:
> On Mon, 03 Jan 2022 12:32:53 +0100,
> Pavel Hofman wrote:
>>
>>
>>
>> Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
>>> On 03. 01. 22 9:22, Pavel Hofman wrote:
>>>>
>>>> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>>>>> Hi Takashi,
>>>>>
>>>>> I am working on stopping alsa streams of audio USB gadget when USB host
>>>>> stops capture/playback/USB cable unplugged.
>>>>>
>>>>> For capture I used code from AK4114 SPDIF receiver
>>>>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590:
>>>>>
>>>>>
>>>>>
>>>>> static void stop_substream(struct uac_rtd_params *prm)
>>>>> {
>>>>>        unsigned long _flags;
>>>>>        struct snd_pcm_substream *substream;
>>>>>
>>>>>        substream = prm->ss;
>>>>>        if (substream) {
>>>>>            snd_pcm_stream_lock_irqsave(substream, _flags);
>>>>>            if (snd_pcm_running(substream))
>>>>>                // TODO - correct handling for playback substream?
>>>>>                snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>>>>            snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>>>>        }
>>>>> }
>>>>>
>>>>> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP)
>>>>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63)
>>>>>
>>>>>     Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED
>>>>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
>>>>>
>>>>> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
>>>>>
>>>>> Please what is the recommended way?
>>>>>
>>>>
>>>> Please can I ask for expert view on this issue? E.g. in SoX stopping the
>>>> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop
>>>> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with
>>>> non-recoverable status. I am considering implementing both methods and
>>>> letting users choose their suitable snd_pcm_stop operation (none
>>>> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
>>>> playback/capture stop, cable disconnection) with a configfs param. Would
>>>> this make sense?
>>>
>>> The disconnection state is unrecoverable. It's expected that the
>>> device will be freed and cannot be reused.
>>>
>>> If you expect to keep the PCM device, we should probably introduce a
>>> new function which puts the device to the SNDRV_PCM_STATE_OPEN
>>> state. In this state, all I/O routines will return -EBADFD for the
>>> applications, so they should close or re-initialize the PCM device
>>> completely.
>>>
>>> https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794
>>>
>>
>> The fact is that after closing the USB host can re-open the device
>> with different samplerate (and perhaps later on with different
>> channels count/sample size). That would hint at the need to
>> re-initialize the gadget side before opening  anyway.
>>
>> As of keeping the device - it's likely some use cases would prefer
>> keeping the device, to minimize the operations needed to react to the
>> host-side playback/capture start.
>>
>> A function you describe would make sense for this. IMO from the gadget
>> POW there is no difference  between the host stopping playback/capture
>> and cable disconnection, in both cases the data stream is stopped and
>> next stream can have entirely different parameters. Maybe the gadget
>> configfs parameter could only toggle between no action (i.e. current
>> situation) and the new alsa function stopping the stream.
>>
>> Jaroslav, please can you draft such a function? Perhaps both changes
>> could make it to 5.17.
> 
> (Sorry for the delayed response, as I've been on vacation and now
> catching up the huge pile of backlogs...)
> 
> About the change to keep PCM OPEN state: I'm afraid that the
> disconnection in the host side may happen at any time, and keeping the
> state OPEN would confuse the things if the host is indeed
> unrecoverable.

I don't think so. The SNDRV_PCM_IOCTL_HW_PARAMS must be issued by the 
application (in the PCM_OPEN state) and if the USB bus connection is no longer 
active, it may fail. We can distinguish between host -> device disconnection 
and device -> host one. It is not really a similar thing.

I think that the idea was to avoid to re-build the whole card / device 
structure for the fixed device allocation.

Pavel, if the USB host is not connected to the gadget, where the playback PCM 
device fails now ? Is the PCM device created or not ?

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
