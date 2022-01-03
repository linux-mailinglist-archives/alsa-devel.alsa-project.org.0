Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E12483099
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 12:34:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C95A1764;
	Mon,  3 Jan 2022 12:33:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C95A1764
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641209657;
	bh=9LZ0RRY8Ic03X5fIjs88tAay97OA0ptcncKH+NUmSPs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mMPA+6aCWN+sYsrhOWj0brR2fS2D+pcJp832reoiM7B9dHtjkWWWLWCIN/uFL7Y2h
	 P5DTLLGajtuvDxa9wsmcRi1o64+UiRilE+I4oltVcHA0mm3EXUvP4k9mLdaz/GYpTi
	 /S91MmIsI6Q5AF5LZCTlDQYyRz/3NVuJYAaEDzYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B311FF80107;
	Mon,  3 Jan 2022 12:33:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82C82F8013F; Mon,  3 Jan 2022 12:33:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03EEDF800C8
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 12:33:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03EEDF800C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="GDgFj1j6"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="UADTbWz0"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 91A2AA1A3D405;
 Mon,  3 Jan 2022 12:33:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641209580; bh=9LZ0RRY8Ic03X5fIjs88tAay97OA0ptcncKH+NUmSPs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=GDgFj1j68vY+ybMtISSGUKttanfURiIQUNFfcgd6+wCLylQg2jTn5vUGdd+RMBOym
 hK+s6OAeBIoC9puIylXsHkqk69TDfO+L8Xu5ccMcURre/3X+vvCXAOrnCqiNG1r8bG
 3KPDSsXBlwWt2w3zS1qc/EcISsEHE5D0UZ1E1kTk=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddAYjudbEIqX; Mon,  3 Jan 2022 12:32:55 +0100 (CET)
Received: from [192.168.105.22] (dustin.pilsfree.net [81.201.58.138])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id A405AA1A3D404;
 Mon,  3 Jan 2022 12:32:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1641209574; bh=9LZ0RRY8Ic03X5fIjs88tAay97OA0ptcncKH+NUmSPs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UADTbWz0CbiEg9i7wtgw+7UKUHD76yB4SkbEMS+OyHael3x/GO2Phckjxu2VrFciT
 i2dqYf0sZvwhesCqPoTmNYEd997s//WwApqoIR+Vkdr1WDc95opExL49RtxxyTJFwI
 3rtBY/sdw5cykhfiJfaxlY9CrNGRMlVnjlCDHnV0=
Subject: Re: Correct stopping capture and playback substreams?
To: Jaroslav Kysela <perex@perex.cz>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
Date: Mon, 3 Jan 2022 12:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Julian Scheel <julian@jusst.de>, Jack Pham <jackp@codeaurora.org>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 John Keeping <john@metanate.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 Yunhao Tian <t123yh.xyz@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
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



Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
> On 03. 01. 22 9:22, Pavel Hofman wrote:
>>
>> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>>> Hi Takashi,
>>>
>>> I am working on stopping alsa streams of audio USB gadget when USB host
>>> stops capture/playback/USB cable unplugged.
>>>
>>> For capture I used code from AK4114 SPDIF receiver
>>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590: 
>>>
>>>
>>>
>>> static void stop_substream(struct uac_rtd_params *prm)
>>> {
>>>       unsigned long _flags;
>>>       struct snd_pcm_substream *substream;
>>>
>>>       substream = prm->ss;
>>>       if (substream) {
>>>           snd_pcm_stream_lock_irqsave(substream, _flags);
>>>           if (snd_pcm_running(substream))
>>>               // TODO - correct handling for playback substream?
>>>               snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>>           snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>>       }
>>> }
>>>
>>> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP)
>>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63) 
>>>
>>>    Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED
>>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
>>>
>>> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
>>>
>>> Please what is the recommended way?
>>>
>>
>> Please can I ask for expert view on this issue? E.g. in SoX stopping the
>> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop
>> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with
>> non-recoverable status. I am considering implementing both methods and
>> letting users choose their suitable snd_pcm_stop operation (none
>> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
>> playback/capture stop, cable disconnection) with a configfs param. Would
>> this make sense?
> 
> The disconnection state is unrecoverable. It's expected that the device 
> will be freed and cannot be reused.
> 
> If you expect to keep the PCM device, we should probably introduce a new 
> function which puts the device to the SNDRV_PCM_STATE_OPEN state. In 
> this state, all I/O routines will return -EBADFD for the applications, 
> so they should close or re-initialize the PCM device completely.
> 
> https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794
> 

The fact is that after closing the USB host can re-open the device with 
different samplerate (and perhaps later on with different channels 
count/sample size). That would hint at the need to re-initialize the 
gadget side before opening  anyway.

As of keeping the device - it's likely some use cases would prefer 
keeping the device, to minimize the operations needed to react to the 
host-side playback/capture start.

A function you describe would make sense for this. IMO from the gadget 
POW there is no difference  between the host stopping playback/capture 
and cable disconnection, in both cases the data stream is stopped and 
next stream can have entirely different parameters. Maybe the gadget 
configfs parameter could only toggle between no action (i.e. current 
situation) and the new alsa function stopping the stream.

Jaroslav, please can you draft such a function? Perhaps both changes 
could make it to 5.17.

Thanks a lot,

Pavel.

