Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8828A483120
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 13:46:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0641D179C;
	Mon,  3 Jan 2022 13:45:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0641D179C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641213983;
	bh=w1qa1V533PZ+/sHR5wE2rkinyOOU5l7kSCGRZ9zxkbU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fTjzZZFm0a3fLUP9KQCuWoOZJ7q3YddA5/ceqwPPw4I7+zqmfh70qI1KYJs2DAZdZ
	 S5casLlovUy5teKKrky2oZ2bTkJywshQX7oQHh8vwsLnA05fYo22EULI5r7ZoaVgVo
	 +Pso64+TXR27FeRWQwS6ADpIwnnQ9eqgHm7ydgEc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60A8BF8007E;
	Mon,  3 Jan 2022 13:45:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3856AF80107; Mon,  3 Jan 2022 13:45:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 008E7F8007E
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 13:45:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 008E7F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="QI9A59xp"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="Eed5yBD3"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 76CD8A1A3D405;
 Mon,  3 Jan 2022 13:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641213900; bh=w1qa1V533PZ+/sHR5wE2rkinyOOU5l7kSCGRZ9zxkbU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QI9A59xp3OpK351bzD4dkF2i5K0P0z3ekxVbTSN/VdYIt71aR1N5X26NdHgPRKBJH
 +M1ORQxunwCi622aunZKWR1lY+L4Z6LgmOmZfD9hndwTXyh/VVmUm+nd8RU+yw3d7p
 iZ9aDbN1wT0MZa0BF9dJCyMXdaKyDP0TcXJtpGjc=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rVddUqfQGAq3; Mon,  3 Jan 2022 13:44:54 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 6D0B2A1A3D404;
 Mon,  3 Jan 2022 13:44:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641213894; bh=w1qa1V533PZ+/sHR5wE2rkinyOOU5l7kSCGRZ9zxkbU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Eed5yBD35HlGKg72tOvxtv2NyRqB0KoLqVPs6a1fVnL+2yNFMCbBrqq2h1YJo1us3
 MwT7kj+6B0+pyaZdlHgzmdKNkZeYnrqWbA/FdwonbmqgJKibTKkZXldfPaL4yEB165
 MOEzwp82eL8SL7xkefx7W8QVmXnyEwSujsD6W/LI=
Subject: Re: Correct stopping capture and playback substreams?
To: Takashi Iwai <tiwai@suse.de>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
 <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
 <s5ho84tm2vv.wl-tiwai@suse.de>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <8ec7d066-10cb-c075-7798-98bb15d0f2f6@ivitera.com>
Date: Mon, 3 Jan 2022 13:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <s5ho84tm2vv.wl-tiwai@suse.de>
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


Dne 03. 01. 22 v 13:15 Takashi Iwai napsal(a):
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
> unrecoverable.  That said, from the safety POV, the complete
> card-level disconnection would make sense, which has, of course, a
> clear downside for the smooth transition in the application as you
> described above.  But most applications should handle such a
> disconnection in anyway for the normal USB-audio devices that face
> more or less the same problem.
> 

Thanks for your valuable insight. IMO a major difference between host 
and gadget side is that when the USB cable gets disconnected, the host 
alsa device disappears, while the (existing) gadget alsa device just 
stops delivering/consuming samples (with the blocking read/write timing 
out, eventually).

I sent a series of RFC patches to linux-usb which handle signalling that 
the host started or stopped (+ cable disconnection) to the gadget side 
via alsa ctl + snd_ctl_notify, as sort of a side channel. A user-space 
example implementation of handling the ctl events on the gadget side is 
https://github.com/pavhofman/gaudio_ctl . The feature of stopping the 
alsa substreams is a mechanism e.g. for setups where the application 
keeps polling the alsa device whether it can be opened. Also sending a 
signal (term, hup, usr1, ...) to an app which is blocked on alsa 
read/write is more difficult without interrupting the blocking wait with 
snd_pcm_close by the gadget device.

I am not sure the stop should "destroy" the whole device, it seems a bit 
of overkill to me. Really just closing the device cleanly so that it 
must be again initialized with new hw_params (which can change between 
starts) would do, perhaps.

Thanks a lot,

Pavel.
