Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F76482F40
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jan 2022 10:11:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 213791765;
	Mon,  3 Jan 2022 10:10:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 213791765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641201090;
	bh=Ctb2T9/FDjgQqm35TzBFxoO509g9w9Itwh4MINcoUjU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sz2hn0d39FAXQJFbPK2X2LX39llaUIPzX7uAcg77hy9FpeZrjYRwsolUwfOF4hPAR
	 iy4eXja+WFdAg3Ze39J36WgMaN/qL4boubRYIT0a/GviKtrTprMbKBcHTNRaM2CSPH
	 +CAsUUzwONwx063D4Z0OgO5VFlZppsyySYcKjEGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FC0BF8013F;
	Mon,  3 Jan 2022 10:10:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6206F80107; Mon,  3 Jan 2022 10:10:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, NICE_REPLY_A, PRX_BODYSUB_1, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 076B1F800E3
 for <alsa-devel@alsa-project.org>; Mon,  3 Jan 2022 10:10:12 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4CDCCA003F;
 Mon,  3 Jan 2022 10:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4CDCCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1641201011; bh=36elMzOjC2t9Ge/O3AEf4SWjPMqu5xmCcz05Jm3I1+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=zZ+QaPkePcL7oUg0J2V96bp6WtvC/FCk6wKqHobi4H3LlphPIWZAXATBpZIzpJ0dk
 G8PQ980phkFYbXuCMvqbUlVzVFpixX2qograCzyZ/9Hh9nz8ycvzCn2WziiOQJiUN6
 Mw//TqT9GXESHVRSykWtqJU2uQY3zgo1TjbylVq8=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon,  3 Jan 2022 10:10:01 +0100 (CET)
Message-ID: <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
Date: Mon, 3 Jan 2022 10:10:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Correct stopping capture and playback substreams?
Content-Language: en-US
To: Pavel Hofman <pavel.hofman@ivitera.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 03. 01. 22 9:22, Pavel Hofman wrote:
> 
> Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
>> Hi Takashi,
>>
>> I am working on stopping alsa streams of audio USB gadget when USB host
>> stops capture/playback/USB cable unplugged.
>>
>> For capture I used code from AK4114 SPDIF receiver
>> https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590:
>>
>>
>> static void stop_substream(struct uac_rtd_params *prm)
>> {
>>       unsigned long _flags;
>>       struct snd_pcm_substream *substream;
>>
>>       substream = prm->ss;
>>       if (substream) {
>>           snd_pcm_stream_lock_irqsave(substream, _flags);
>>           if (snd_pcm_running(substream))
>>               // TODO - correct handling for playback substream?
>>               snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
>>           snd_pcm_stream_unlock_irqrestore(substream, _flags);
>>       }
>> }
>>
>> For setup I found calling snd_pcm_stop(substream, SNDRV_PCM_STATE_SETUP)
>> (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63)
>>    Or for both capture and playback using SNDRV_PCM_STATE_DISCONNECTED
>> (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
>>
>> Or perhaps using snd_pcm_dev_disconnect(dev) or snd_pcm_drop(substream)?
>>
>> Please what is the recommended way?
>>
> 
> Please can I ask for expert view on this issue? E.g. in SoX stopping the
> stream with SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not stop
> the application, while with SNDRV_PCM_STATE_DISCONNECTED SoX exits with
> non-recoverable status. I am considering implementing both methods and
> letting users choose their suitable snd_pcm_stop operation (none
> (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
> playback/capture stop, cable disconnection) with a configfs param. Would
> this make sense?

The disconnection state is unrecoverable. It's expected that the device will 
be freed and cannot be reused.

If you expect to keep the PCM device, we should probably introduce a new 
function which puts the device to the SNDRV_PCM_STATE_OPEN state. In this 
state, all I/O routines will return -EBADFD for the applications, so they 
should close or re-initialize the PCM device completely.

https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
