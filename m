Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D935B6B8
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Apr 2021 21:18:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3144C1675;
	Sun, 11 Apr 2021 21:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3144C1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618168723;
	bh=5ynsQN0GT3QX8ZRSKv6ZipAbgGALziM/548aaV3lELg=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PL8+4861l95dF6i2z1p6xcPTeWnnT60x1ZHYxRDov5P48abeys6HPvilbLB86YrTF
	 DuNfrrs2bMsPSYQgACW/jUzHxhyshUguFgpEkDn0korFHJ+d1MLe4fpQOmhS6gnkIK
	 pcOx1gYdhEqasMqt8z45N/aOwUSVHFUceF5DROU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 682B0F8022D;
	Sun, 11 Apr 2021 21:17:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0779F8013D; Sun, 11 Apr 2021 21:17:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94982F8013D
 for <alsa-devel@alsa-project.org>; Sun, 11 Apr 2021 21:17:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94982F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="aEGno7QH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jX/cnMbWBq27uzo3PbdjEieTrUsio/SfDpikiYtkTD8=; b=aEGno7QH6056opTqJEqPlys4Fx
 wa1ElBTa6OGrvQO41OacuCjy66RCbfzmI5e+zK44F9oiisbPVDdVTEM6AAj/cDZmESq3CummTg7co
 vKv4Vju29odAD6JThQXP3CjoGBRSBQKj80D0bdMmlMLnrUYq1eRmmDlTrdrcid3bOGnn2E5aWSzSS
 wPI9nMaufpfAb3Srbb/DvLsUGvc7TqVZCgNpjrlzoHxSY1ZvDSKIz25p/OWGnr3U5IxreVFUxudnO
 9034a6rrGg/mCzWYJkfQxgJFM3oo40MjcQqTn+zJw3US99iVB1/vrOm8az+fld1ECskAwHUoNCG9I
 R0d16zJQ==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lVfZw-00Dyoy-K7; Sun, 11 Apr 2021 21:17:04 +0200
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210410120229.1172054-1-coding@diwic.se>
 <df8cc177-f91d-28b1-c8df-1162dc136657@perex.cz>
 <bb91fc79-1b61-b051-1543-b5c8b1633fb3@diwic.se>
 <87f906a5-b77f-d3e8-29d7-7ce6e35c452a@perex.cz>
From: David Henningsson <coding@diwic.se>
Message-ID: <1351b161-f663-b6a8-a7a5-09f44d8ddb30@diwic.se>
Date: Sun, 11 Apr 2021 21:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <87f906a5-b77f-d3e8-29d7-7ce6e35c452a@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Id: coding@diwic.se
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

Hi,

as a short reply to all of the review comments below:

I don't care either way. I can change things if it makes you happy. But 
at this point I have a hard time figuring out what are brainstorming 
suggestions, and what are things I need to change before the patch is 
merged.

Could both of you give a clear ack (or similar) so I know that I know 
that once I make a [PATCH v5] it is very likely to be merged? Or are 
there more discussions / reviews / etc to be had first?

// David


On 2021-04-11 19:52, Jaroslav Kysela wrote:
> Dne 11. 04. 21 v 6:34 David Henningsson napsal(a):
>> On 2021-04-10 14:23, Jaroslav Kysela wrote:
>>> Dne 10. 04. 21 v 14:02 David Henningsson napsal(a):
>>>> This commit adds a new framing mode that frames all MIDI data into
>>>> 32-byte frames with a timestamp.
>>>>
>>>> The main benefit is that we can get accurate timestamps even if
>>>> userspace wakeup and processing is not immediate.
>>>>
>>>> Testing on a Celeron N3150 with this mode has a max jitter of 2.8 ms,
>>>> compared to the in-kernel seq implementation which has a max jitter
>>>> of 5 ms during idle and much worse when running scheduler stress tests
>>>> in parallel.
>>>>
>>>> Signed-off-by: David Henningsson <coding@diwic.se>
>>>> ---
>>>>    include/sound/rawmidi.h     |  2 ++
>>>>    include/uapi/sound/asound.h | 26 ++++++++++++++--
>>>>    sound/core/rawmidi.c        | 60 +++++++++++++++++++++++++++++++++++--
>>>>    3 files changed, 84 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/include/sound/rawmidi.h b/include/sound/rawmidi.h
>>>> index 334842daa904..b0057a193c31 100644
>>>> --- a/include/sound/rawmidi.h
>>>> +++ b/include/sound/rawmidi.h
>>>> @@ -81,6 +81,8 @@ struct snd_rawmidi_substream {
>>>>    	bool opened;			/* open flag */
>>>>    	bool append;			/* append flag (merge more streams) */
>>>>    	bool active_sensing;		/* send active sensing when close */
>>>> +	u8 framing;			/* whether to frame input data */
>>>> +	clockid_t clock_type;		/* clock source to use for input framing */
>>>>    	int use_count;			/* use counter (for output) */
>>>>    	size_t bytes;
>>>>    	struct snd_rawmidi *rmidi;
>>>> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
>>>> index 535a7229e1d9..af8e60740218 100644
>>>> --- a/include/uapi/sound/asound.h
>>>> +++ b/include/uapi/sound/asound.h
>>>> @@ -710,7 +710,7 @@ enum {
>>>>     *  Raw MIDI section - /dev/snd/midi??
>>>>     */
>>>>    
>>>> -#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 1)
>>>> +#define SNDRV_RAWMIDI_VERSION		SNDRV_PROTOCOL_VERSION(2, 0, 2)
>>>>    
>>>>    enum {
>>>>    	SNDRV_RAWMIDI_STREAM_OUTPUT = 0,
>>>> @@ -736,12 +736,34 @@ struct snd_rawmidi_info {
>>>>    	unsigned char reserved[64];	/* reserved for future use */
>>>>    };
>>>>    
>>>> +enum {
>>>> +	SNDRV_RAWMIDI_FRAMING_NONE = 0,
>>>> +	SNDRV_RAWMIDI_FRAMING_TSTAMP,
>>>> +	SNDRV_RAWMIDI_FRAMING_LAST = SNDRV_RAWMIDI_FRAMING_TSTAMP,
>>>> +};
>>>> +
>>>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
>>>> +
>>>> +struct snd_rawmidi_framing_tstamp {
>>>> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
>>>> +	 * types here. Applications are expected to skip unknown frame types.
>>>> +	 */
>>>> +	unsigned char frame_type;
>>>> +	unsigned char length; /* number of valid bytes in data field */
>>>> +	unsigned char reserved[2];
>>>> +	unsigned int tv_nsec;		/* nanoseconds */
>>>> +	unsigned long long tv_sec;	/* seconds */
>>>> +	unsigned char data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
>>>> +};
>>>> +
>>>>    struct snd_rawmidi_params {
>>>>    	int stream;
>>>>    	size_t buffer_size;		/* queue size in bytes */
>>>>    	size_t avail_min;		/* minimum avail bytes for wakeup */
>>>>    	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
>>>> -	unsigned char reserved[16];	/* reserved for future use */
>>>> +	unsigned char framing;		/* For input data only, frame incoming data */
>>> We can move this flag to above 32-bit word (no_active_sensing). I'm not sure,
>>> if we need 8 bits for this. It's first change after 20 years. Another flag may
>>> obsolete this one.
>> Not sure what you mean by this, could you show the code? Framing is an
>> enum rather than a flag, in case we find other framing formats with
>> other sizes that would obsolete this one.
> unsigned int no_active_sensing: 1;
> unsigned int framing32: 1;
> unsigned int framing64: 1; /* future extension, framing32 == 0 in this case */
>
> or:
>
> unsigned int framing_mode: 3;	/* three bits for future types */
>
> perhaps also:
>
> unsigned int clock_type: 3;	/* three bits for the clock type selection */
>
>>>> +		return -EINVAL;
>>>>    	if (params->avail_min < 1 || params->avail_min > params->buffer_size)
>>>>    		return -EINVAL;
>>>>    	if (params->buffer_size != runtime->buffer_size) {
>>>> @@ -720,7 +722,16 @@ EXPORT_SYMBOL(snd_rawmidi_output_params);
>>>>    int snd_rawmidi_input_params(struct snd_rawmidi_substream *substream,
>>>>    			     struct snd_rawmidi_params *params)
>>>>    {
>>>> +	if (params->framing) {
>>>> +		if (params->framing > SNDRV_RAWMIDI_FRAMING_LAST)
>>>> +			return -EINVAL;
>>>> +		/* framing requires a valid clock type */
>>>> +		if (params->clock_type != CLOCK_MONOTONIC_RAW && params->clock_type != CLOCK_MONOTONIC)
>>>> +			return -EINVAL;
>>> The CLOCK_REALTIME may be supported, too. For example, the input subsystem
>>> supports those three timestamps and we support this in the PCM interface, too.
>> OTOH, the seq subsystem supports only the monotonic clock. And nobody
>> has complained so far. This can be added in a later patch if there is a
>> need for it.
> The monotonic clock source is used only internally for diffs - the seq timer
> starts with zero. So the monotonic clock is _NOT_ exported.
>
> In PCM interface, we have also all three clock sources. We're using own enum
> there, too (SNDRV_PCM_TSTAMP_TYPE_...).
>
>>>> +static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
>>>> +			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
>>>> +{
>>>> +	struct snd_rawmidi_runtime *runtime = substream->runtime;
>>>> +	struct snd_rawmidi_framing_tstamp *dest_ptr;
>>>> +	struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
>>>> +
>>>> +	int dest_frames = 0;
>>>> +	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
>>>> +
>>>> +	if (snd_BUG_ON(runtime->hw_ptr & 0x1f || runtime->buffer_size & 0x1f || frame_size != 0x20))
>>>> +		return -EINVAL;
>>>> +	while (src_count > 0) {
>>>> +		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
>>>> +			runtime->xruns += src_count;
>>>> +			return dest_frames * frame_size;
>>>> +		}
>>>> +		if (src_count >= SND_RAWMIDI_FRAMING_DATA_LENGTH)
>>>> +			frame.length = SND_RAWMIDI_FRAMING_DATA_LENGTH;
>>>> +		else {
>>>> +			frame.length = src_count;
>>>> +			memset(frame.data, 0, SND_RAWMIDI_FRAMING_DATA_LENGTH);
>>> We know the length here, so we can skip the zeroing the copied bytes with
>>> memcpy().
>> True, but I believe this would generate slightly faster code because
>> SND_RAWMIDI_FRAMING_DATA_LENGTH is a constant.
> It's questionable.
>
> 					Jaroslav
>
