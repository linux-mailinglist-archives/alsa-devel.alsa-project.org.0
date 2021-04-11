Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C535B668
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 19:54:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A4DE1673;
	Sun, 11 Apr 2021 19:53:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A4DE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618163645;
	bh=MFiZ/ifk2dpnrTMOdcFnFsLjPuGSomhsRiY3hpRLdSc=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jwB5ird/aLRDraiAJS/Pfd7s2f4Fb6+gtub8cLgswU9k4FkDbBxpvbLKBbP/+mJEg
	 8n/9Pgv/eQ1eB+G4vEA1KmP1H51voFOog58c7ooPxnYUinhsEgkOwcS5wVjIIuV8MW
	 a2ToqZN/DKd5WETtoHL+OTsX2tQJEtDoOjINRUsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DE3FCF800EE;
	Sun, 11 Apr 2021 19:52:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 288EAF8022B; Sun, 11 Apr 2021 19:52:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE23FF80164
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 19:52:26 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 17219A003F;
 Sun, 11 Apr 2021 19:52:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 17219A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618163546; bh=xpTfXfO+rCqqYSWvHoK0jdt5Omk8ocCQ5qXbLzyo1ik=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=B4K8P90TEgvHYeazFLcSalJRQ9uNmVvuCqcoO7QyVl6gbwv6iHEVQrQ7zzUBdgexJ
 I4o85HTB/K9WqrsLpmOkpPQIhUpMSWNe8y6rinCnoESoek7BZkhMMX9j3VXymq0BPS
 LEh38iKyVnLZJIBcOFKZggyrlpyhETudLD8Stnwo=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 11 Apr 2021 19:52:22 +0200 (CEST)
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: David Henningsson <coding@diwic.se>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210410120229.1172054-1-coding@diwic.se>
 <df8cc177-f91d-28b1-c8df-1162dc136657@perex.cz>
 <bb91fc79-1b61-b051-1543-b5c8b1633fb3@diwic.se>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <87f906a5-b77f-d3e8-29d7-7ce6e35c452a@perex.cz>
Date: Sun, 11 Apr 2021 19:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <bb91fc79-1b61-b051-1543-b5c8b1633fb3@diwic.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 11. 04. 21 v 6:34 David Henningsson napsal(a):
> 
> On 2021-04-10 14:23, Jaroslav Kysela wrote:
>> Dne 10. 04. 21 v 14:02 David Henningsson napsal(a):
>>> This commit adds a new framing mode that frames all MIDI data into
>>> 32-byte frames with a timestamp.
>>>
>>> The main benefit is that we can get accurate timestamps even if
>>> userspace wakeup and processing is not immediate.
>>>
>>> Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
>>> compared to the in-kernel seq implementation which has a max jitter
>>> of 5 ms during idle and much worse when running scheduler stress tests
>>> in parallel.
>>>
>>> Signed-off-by: David Henningsson <coding@diwic.se>
>>> ---
>>>   include/sound/rawmidi.h     |  2 ++
>>>   include/uapi/sound/asound.h | 26 ++++++++++++++--
>>>   sound/core/rawmidi.c        | 60 +++++++++++++++++++++++++++++++++++--
>>>   3 files changed, 84 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
>>> index 334842daa904..b0057a193c31 100644
>>> --- a/include/sound/rawmidi.h
>>> +++ b/include/sound/rawmidi.h
>>> @@ -81,6 +81,8 @@ struct snd_rawmidi_substream {
>>>   	bool opened;			/* open flag */
>>>   	bool append;			/* append flag (merge more streams) */
>>>   	bool active_sensing;		/* send active sensing when close */
>>> +	u8 framing;			/* whether to frame input data */
>>> +	clockid_t clock_type;		/* clock source to use for input framing */
>>>   	int use_count;			/* use counter (for output) */
>>>   	size_t bytes;
>>>   	struct snd_rawmidi *rmidi;
>>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>>> index 535a7229e1d9..af8e60740218 100644
>>> --- a/include/uapi/sound/asound.h
>>> +++ b/include/uapi/sound/asound.h
>>> @@ -710,7 +710,7 @@ enum {
>>>    *  Raw MIDI section - /dev/snd/midi??
>>>    */
>>>   
>>> -#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
>>> +#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
>>>   
>>>   enum {
>>>   	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
>>> @@ -736,12 +736,34 @@ struct snd_rawmidi_info {
>>>   	unsigned char reserved[64];	/* reserved for future use */
>>>   };
>>>   
>>> +enum {
>>> +	SNDRV_RAWMIDI_FRAMING_NONE = 0,
>>> +	SNDRV_RAWMIDI_FRAMING_TSTAMP,
>>> +	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP,
>>> +};
>>> +
>>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
>>> +
>>> +struct snd_rawmidi_framing_tstamp {
>>> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
>>> +	 * types here. Applications are expected to skip unknown frame types.
>>> +	 */
>>> +	unsigned char frame_type;
>>> +	unsigned char length; /* number of valid bytes in data field */
>>> +	unsigned char reserved[2];
>>> +	unsigned int tv_nsec;		/* nanoseconds */
>>> +	unsigned long long tv_sec;	/* seconds */
>>> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
>>> +};
>>> +
>>>   struct snd_rawmidi_params {
>>>   	int stream;
>>>   	size_t buffer_size;		/* queue size in bytes */
>>>   	size_t avail_min;		/* minimum avail bytes for wakeup */
>>>   	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
>>> -	unsigned char reserved[16];	/* reserved for future use */
>>> +	unsigned char framing;		/* For input data only, frame incoming data */
>> We can move this flag to above 32-bit word (no_active_sensing). I'm not sure,
>> if we need 8 bits for this. It's first change after 20 years. Another flag may
>> obsolete this one.
> 
> Not sure what you mean by this, could you show the code? Framing is an 
> enum rather than a flag, in case we find other framing formats with 
> other sizes that would obsolete this one.

unsigned int no_active_sensing: 1;
unsigned int framing32: 1;
unsigned int framing64: 1; /* future extension, framing32 == 0 in this case */

or:

unsigned int framing_mode: 3;	/* three bits for future types */

perhaps also:

unsigned int clock_type: 3;	/* three bits for the clock type selection */

>>> +		return -EINVAL;
>>>   	if (params->avail_min < 1 || params->avail_min > params->buffer_size)
>>>   		return -EINVAL;
>>>   	if (params->buffer_size != runtime->buffer_size) {
>>> @@ -720,7 +722,16 @@ EXPORT_SYMBOL(snd_rawmidi_output_params);
>>>   int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
>>>   			     struct snd_rawmidi_params *params)
>>>   {
>>> +	if (params->framing) {
>>> +		if (params->framing > SNDRV_RAWMIDI_FRAMING_LAST)
>>> +			return -EINVAL;
>>> +		/* framing requires a valid clock type */
>>> +		if (params->clock_type != CLOCK_MONOTONIC_RAW && params->clock_type != CLOCK_MONOTONIC)
>>> +			return -EINVAL;
>> The CLOCK_REALTIME may be supported, too. For example, the input subsystem
>> supports those three timestamps and we support this in the PCM interface, too.
> OTOH, the seq subsystem supports only the monotonic clock. And nobody 
> has complained so far. This can be added in a later patch if there is a 
> need for it.

The monotonic clock source is used only internally for diffs - the seq timer
starts with zero. So the monotonic clock is _NOT_ exported.

In PCM interface, we have also all three clock sources. We're using own enum
there, too (SNDRV_PCM_TSTAMP_TYPE_...).

>>> +static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
>>> +			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
>>> +{
>>> +	struct snd_rawmidi_runtime *runtime = substream->runtime;
>>> +	struct snd_rawmidi_framing_tstamp *dest_ptr;
>>> +	struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
>>> +
>>> +	int dest_frames = 0;
>>> +	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
>>> +
>>> +	if (snd_BUG_ON(runtime->hw_ptr & 0x1f || runtime->buffer_size & 0x1f || frame_size != 0x20))
>>> +		return -EINVAL;
>>> +	while (src_count > 0) {
>>> +		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
>>> +			runtime->xruns += src_count;
>>> +			return dest_frames * frame_size;
>>> +		}
>>> +		if (src_count >= SND_RAWMIDI_FRAMING_DATA_LENGTH)
>>> +			frame.length = SND_RAWMIDI_FRAMING_DATA_LENGTH;
>>> +		else {
>>> +			frame.length = src_count;
>>> +			memset(frame.data, 0, SND_RAWMIDI_FRAMING_DATA_LENGTH);
>> We know the length here, so we can skip the zeroing the copied bytes with
>> memcpy().
> 
> True, but I believe this would generate slightly faster code because 
> SND_RAWMIDI_FRAMING_DATA_LENGTH is a constant.

It's questionable.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
