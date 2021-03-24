Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518B3476F8
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Mar 2021 12:20:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E7A167D;
	Wed, 24 Mar 2021 12:19:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E7A167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616584819;
	bh=uYCZHrb+ntljRrlK8gEdvhwg5DVgKx8oqFAT1kOd04c=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gmpLqDQJWf22UKhoy7Y0XBWE0HeXlUXGrB8InIZCl4yTkXSGvkzmH+fPJ+I4ktshe
	 +FTM/09qNQ/mshWUTb+gkSNf4ZHSMgdxMJ+80XkdmiAy7jCszmr0zoecoMEvB9MoKa
	 76HbBfBQGlYm8t4ytZL5LjaP6mclfBD3NZiH3Lw8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 176D3F80240;
	Wed, 24 Mar 2021 12:19:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10F73F801EC; Wed, 24 Mar 2021 12:19:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40413F800FF
 for <alsa-devel@alsa-project.org>; Wed, 24 Mar 2021 12:19:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40413F800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="fqyIYvDb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5zu7e3QpaJYSsSrK/Xjn7U3xzJyiv8wEoifGidL4xng=; b=fqyIYvDbIj5Z7AJxFh8eGONww/
 vrf7NJ9Zsg2KC+Sj57EVn584axvbZQx7I+46f/lxFqo2TVgnTHP3nLBo21yzseeernrfsqxSxOSs+
 LvtdFlJle4AY9vyr36t0nsNxiaK1FPzdEeZ5H224aOyYzLE0mY7nQ2N2Zp7RXKuzgoJh1E7Fxgz1m
 pLYD1VtY23Cm6+PK4bYizFeR5k/82zUC7HqccvkjWFsAVc44CdBohF/ReSc20MOXdI5BWrMEgQyrn
 GgIui6YMdbgzGX1gX3VkXjFc80Un8pfSp8CkNymC4vKeoJuq+BNbgp4+OQHmvlNoJCto840XJyV+c
 EPQbFVug==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lP1XU-007p2H-IS; Wed, 24 Mar 2021 12:19:04 +0100
Subject: Re: [PATCH v2] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210324054253.34642-1-coding@diwic.se>
 <s5htup0amwk.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <cab75b18-37ca-eacb-deff-b25900b169ba@diwic.se>
Date: Wed, 24 Mar 2021 12:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5htup0amwk.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
Cc: alsa-devel@alsa-project.org
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


On 2021-03-24 11:03, Takashi Iwai wrote:
> On Wed, 24 Mar 2021 06:42:53 +0100,
> David Henningsson wrote:
>> This commit adds a new framing mode that frames all MIDI data into
>> 16-byte frames with a timestamp from the monotonic_raw clock.
>>
>> The main benefit is that we can get accurate timestamps even if
>> userspace wakeup and processing is not immediate.
>>
>> Signed-off-by: David Henningsson <coding@diwic.se>
> Thanks for the patch!
Thanks for the review :-)
> I seem to have overlooked your previous post, sorry.
>
> This looks like a good middle ground solution, while we still need to
> address the sequencer timestamp (basically we should be able to send
> an event with the timestamp prepared from the rawmidi side).

I believe the new framing mode would be useful both for readers of 
rawmidi devices, and the seq kernel module.

I have also been thinking of doing something in usb-midi (because I 
assume that's the most common way to do midi input these days), to 
improve performance for packets with more than three bytes in them. 
Right now a sysex would be cut off in chunks of three bytes, each one 
with its own timestamp. If so, that would be a later patch.

>
> The implementation itself looks good to me.  But this needs to bump
> the SNDRV_RAWMIDI_VERSION for indicating the new API.

Sure, I'll send a v3 with a bumped SNDRV_RAWMIDI_VERSION.

I'm also considering adding "time when the stream started" in the 
snd_rawmidi_status timestamp to get a fixed starting point for the 
timestamps, unless the field was reserved for some other purpose? The 
status timestamp would only be added if the framing mode is enabled. If 
so, that change would go into the same version bump. Does that sound 
good to you?

// David

>
>
> Takashi
>
>> ---
>>
>> v2: Fixed checkpatch errors.
>>
>>   include/sound/rawmidi.h     |  1 +
>>   include/uapi/sound/asound.h | 18 ++++++++++++++-
>>   sound/core/rawmidi.c        | 45 ++++++++++++++++++++++++++++++++++++-
>>   3 files changed, 62 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
>> index 334842daa904..4ba5d2deec18 100644
>> --- a/include/sound/rawmidi.h
>> +++ b/include/sound/rawmidi.h
>> @@ -81,6 +81,7 @@ struct snd_rawmidi_substream {
>>   	bool opened;			/* open flag */
>>   	bool append;			/* append flag (merge more streams) */
>>   	bool active_sensing;		/* send active sensing when close */
>> +	u8 framing;			/* whether to frame data (for input) */
>>   	int use_count;			/* use counter (for output) */
>>   	size_t bytes;
>>   	struct snd_rawmidi *rmidi;
>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>> index 535a7229e1d9..f33076755025 100644
>> --- a/include/uapi/sound/asound.h
>> +++ b/include/uapi/sound/asound.h
>> @@ -736,12 +736,28 @@ struct snd_rawmidi_info {
>>   	unsigned char reserved[64];	/* reserved for future use */
>>   };
>>   
>> +enum {
>> +	SNDRV_RAWMIDI_FRAMING_NONE = 0,
>> +	SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
>> +	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW,
>> +};
>> +
>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 7
>> +
>> +struct snd_rawmidi_framing_tstamp {
>> +	unsigned int tv_sec;	/* seconds */
>> +	unsigned int tv_nsec;	/* nanoseconds */
>> +	unsigned char length;
>> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
>> +};
>> +
>>   struct snd_rawmidi_params {
>>   	int stream;
>>   	size_t buffer_size;		/* queue size in bytes */
>>   	size_t avail_min;		/* minimum avail bytes for wakeup */
>>   	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
>> -	unsigned char reserved[16];	/* reserved for future use */
>> +	unsigned char framing;		/* For input data only, frame incoming data */
>> +	unsigned char reserved[15];	/* reserved for future use */
>>   };
>>   
>>   #ifndef __KERNEL__
>> diff --git a/sound/core/rawmidi.c b/sound/core/rawmidi.c
>> index aca00af93afe..cd927ba178a6 100644
>> --- a/sound/core/rawmidi.c
>> +++ b/sound/core/rawmidi.c
>> @@ -721,6 +721,7 @@ int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
>>   			     struct snd_rawmidi_params *params)
>>   {
>>   	snd_rawmidi_drain_input(substream);
>> +	substream->framing = params->framing;
>>   	return resize_runtime_buffer(substream->runtime, params, true);
>>   }
>>   EXPORT_SYMBOL(snd_rawmidi_input_params);
>> @@ -963,6 +964,44 @@ static int snd_rawmidi_control_ioctl(struct snd_card *card,
>>   	return -ENOIOCTLCMD;
>>   }
>>   
>> +static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
>> +			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
>> +{
>> +	struct snd_rawmidi_runtime *runtime = substream->runtime;
>> +	struct snd_rawmidi_framing_tstamp frame;
>> +	struct snd_rawmidi_framing_tstamp *dest_ptr;
>> +	int dest_frames = 0;
>> +	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
>> +
>> +	frame.tv_sec = tstamp->tv_sec;
>> +	frame.tv_nsec = tstamp->tv_nsec;
>> +	if (snd_BUG_ON(runtime->hw_ptr & 15 || runtime->buffer_size & 15 || frame_size != 16))
>> +		return -EINVAL;
>> +
>> +	while (src_count > 0) {
>> +		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
>> +			runtime->xruns += src_count;
>> +			return dest_frames * frame_size;
>> +		}
>> +		if (src_count >= SND_RAWMIDI_FRAMING_DATA_LENGTH)
>> +			frame.length = SND_RAWMIDI_FRAMING_DATA_LENGTH;
>> +		else {
>> +			frame.length = src_count;
>> +			memset(frame.data, 0, SND_RAWMIDI_FRAMING_DATA_LENGTH);
>> +		}
>> +		memcpy(frame.data, buffer, frame.length);
>> +		buffer += frame.length;
>> +		src_count -= frame.length;
>> +		dest_ptr = (struct snd_rawmidi_framing_tstamp *) (runtime->buffer + runtime->hw_ptr);
>> +		*dest_ptr = frame;
>> +		runtime->avail += frame_size;
>> +		runtime->hw_ptr += frame_size;
>> +		runtime->hw_ptr %= runtime->buffer_size;
>> +		dest_frames++;
>> +	}
>> +	return dest_frames * frame_size;
>> +}
>> +
>>   /**
>>    * snd_rawmidi_receive - receive the input data from the device
>>    * @substream: the rawmidi substream
>> @@ -977,6 +1016,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
>>   			const unsigned char *buffer, int count)
>>   {
>>   	unsigned long flags;
>> +	struct timespec64 ts64;
>>   	int result = 0, count1;
>>   	struct snd_rawmidi_runtime *runtime = substream->runtime;
>>   
>> @@ -988,7 +1028,10 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
>>   		return -EINVAL;
>>   	}
>>   	spin_lock_irqsave(&runtime->lock, flags);
>> -	if (count == 1) {	/* special case, faster code */
>> +	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP_MONOTONIC_RAW) {
>> +		ktime_get_raw_ts64(&ts64);
>> +		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
>> +	} else if (count == 1) {	/* special case, faster code */
>>   		substream->bytes++;
>>   		if (runtime->avail < runtime->buffer_size) {
>>   			runtime->buffer[runtime->hw_ptr++] = buffer[0];
>> -- 
>> 2.25.1
>>
