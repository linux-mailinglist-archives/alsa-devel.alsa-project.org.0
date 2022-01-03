Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52B48312F
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 13:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54F8C17A8;
	Mon,  3 Jan 2022 13:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54F8C17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641214545;
	bh=BrTlml0xBVKPn4Wi1nT1qAMQkOQ2OQsE99VCpJHmwJM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PxGSYH13n5KMI3bveI9dj/58kgUBnKJXbeJWLziTUYulTxQS17WzrQZrArgkllhgn
	 zvMhN7lhyGBNHSzJR3aLkIX3nyc8Is/bkUw4KiKPvTMSF/L4fXKuFunUwKktFBhmSb
	 hcEo1vYyhnuk99BDP1t3k8TDbn7YJU2ec3Nq0CCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6034F8007E;
	Mon,  3 Jan 2022 13:54:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A98FF800E3; Mon,  3 Jan 2022 13:54:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0414EF800E3
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 13:54:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0414EF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="OtZKl6Kw"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="RE9lTgg5"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 17D9BA1A3D405;
 Mon,  3 Jan 2022 13:54:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641214460; bh=BrTlml0xBVKPn4Wi1nT1qAMQkOQ2OQsE99VCpJHmwJM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OtZKl6Kw8aJQbT75fw67k/BhP6SI7bIz5dqM3V4V10CC1+aLFsVu/WOr5ViLpJaGZ
 Bd8PJ30gUqd1cRARLVKKYK71BnxTmVBTBxlHWQHqJJQRJvuuwxHO4SOP69XR6LvFq8
 m5LvqLnLFmC5QMfv1bIqPZrct2qQT9rHFGDrw0gQ=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qy4kPZ4bL_Je; Mon,  3 Jan 2022 13:54:14 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 2A365A1A3D404;
 Mon,  3 Jan 2022 13:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641214454; bh=BrTlml0xBVKPn4Wi1nT1qAMQkOQ2OQsE99VCpJHmwJM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RE9lTgg518V1Sv0GBNNuoUxHAmhG8kixF3VeFQEi5tzK7i7VYOj0D3gP9CfcDkaho
 KaYHZC0c6VxEVI9jsjeh0CAi0L/SgDHrflDZZwAb3QecakNFIqKuWpw5gPjJwk2i+J
 4bueDkoPjOpI97GBUdDR7dFCyJpDyCEXFoXzk/O4=
Subject: Re: Correct stopping capture and playback substreams?
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
 <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
 <s5ho84tm2vv.wl-tiwai@suse.de>
 <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <86ad951b-29f7-59ef-d369-a6c06f9422a4@ivitera.com>
Date: Mon, 3 Jan 2022 13:54:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



Dne 03. 01. 22 v 13:28 Jaroslav Kysela napsal(a):
> On 03. 01. 22 13:15, Takashi Iwai wrote:
>> On Mon, 03 Jan 2022 12:32:53 +0100,
>> Pavel Hofman wrote:
>>>
>>>
>>>
>>> Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
>>>> On 03. 01. 22 9:22, Pavel Hofman wrote:
>>>>>
>>>>> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>>>>>> Hi Takashi,
>>>>>>
>>>>>> I am working on stopping alsa streams of audio USB gadget when USB 
>>>>>> host
>>>>>> stops capture/playback/USB cable unplugged.
>>>>>>
>>>>>> For capture I used code from AK4114 SPDIF receiver
>>>>>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> static void stop_substream(struct uac_rtd_params *prm)
>>>>>> {
>>>>>>        unsigned long _flags;
>>>>>>        struct snd_pcm_substream *substream;
>>>>>>
>>>>>>        substream = prm->ss;
>>>>>>        if (substream) {
>>>>>>            snd_pcm_stream_lock_irqsave(substream, _flags);
>>>>>>            if (snd_pcm_running(substream))
>>>>>>                // TODO - correct handling for playback substream?
>>>>>>                snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>>>>>            snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>>>>>        }
>>>>>> }
>>>>>>
>>>>>> For setup I found calling snd_pcm_stop(substream, 
>>>>>> SNDRV_PCM_STATE_SETUP)
>>>>>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>>>>>>
>>>>>>
>>>>>>     Or for both capture and playback using 
>>>>>> SNDRV_PCM_STATE_DISCONNECTED
>>>>>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103). 
>>>>>>
>>>>>>
>>>>>> Or perhaps using snd_pcm_dev_disconnect(dev) or 
>>>>>> snd_pcm_drop(substream)?
>>>>>>
>>>>>> Please what is the recommended way?
>>>>>>
>>>>>
>>>>> Please can I ask for expert view on this issue? E.g. in SoX 
>>>>> stopping the
>>>>> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not 
>>>>> stop
>>>>> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits 
>>>>> with
>>>>> non-recoverable status. I am considering implementing both methods and
>>>>> letting users choose their suitable snd_pcm_stop operation (none
>>>>> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
>>>>> playback/capture stop, cable disconnection) with a configfs param. 
>>>>> Would
>>>>> this make sense?
>>>>
>>>> The disconnection state is unrecoverable. It's expected that the
>>>> device will be freed and cannot be reused.
>>>>
>>>> If you expect to keep the PCM device, we should probably introduce a
>>>> new function which puts the device to the SNDRV_PCM_STATE_OPEN
>>>> state. In this state, all I/O routines will return -EBADFD for the
>>>> applications, so they should close or re-initialize the PCM device
>>>> completely.
>>>>
>>>> https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794 
>>>>
>>>>
>>>
>>> The fact is that after closing the USB host can re-open the device
>>> with different samplerate (and perhaps later on with different
>>> channels count/sample size). That would hint at the need to
>>> re-initialize the gadget side before opening  anyway.
>>>
>>> As of keeping the device - it's likely some use cases would prefer
>>> keeping the device, to minimize the operations needed to react to the
>>> host-side playback/capture start.
>>>
>>> A function you describe would make sense for this. IMO from the gadget
>>> POW there is no difference  between the host stopping playback/capture
>>> and cable disconnection, in both cases the data stream is stopped and
>>> next stream can have entirely different parameters. Maybe the gadget
>>> configfs parameter could only toggle between no action (i.e. current
>>> situation) and the new alsa function stopping the stream.
>>>
>>> Jaroslav, please can you draft such a function? Perhaps both changes
>>> could make it to 5.17.
>>
>> (Sorry for the delayed response, as I've been on vacation and now
>> catching up the huge pile of backlogs...)
>>
>> About the change to keep PCM OPEN state: I'm afraid that the
>> disconnection in the host side may happen at any time, and keeping the
>> state OPEN would confuse the things if the host is indeed
>> unrecoverable.
> 
> I don't think so. The SNDRV_PCM_IOCTL_HW_PARAMS must be issued by the 
> application (in the PCM_OPEN state) and if the USB bus connection is no 
> longer active, it may fail. We can distinguish between host -> device 
> disconnection and device -> host one. It is not really a similar thing.
> 
> I think that the idea was to avoid to re-build the whole card / device 
> structure for the fixed device allocation.
> 
> Pavel, if the USB host is not connected to the gadget, where the 
> playback PCM device fails now ? Is the PCM device created or not ?
> 

The gaudio PCM device is created when the gadget function is activated 
(module loaded), regardless whether the USB host is actually connected. 
The playback/capture fails after the blocking read/write times out. The 
data delivery/consumption method is simply not called when no usb 
requests get completed 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L147 
.

The current code does basically nothing to the alsa pcm stream at 
capture/playback start/stop by the host (called when altsetting changes 
in the gadget) 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L468 
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L557

Best regards,

Pavel.
