Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD24035D11D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 21:34:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C92115F9;
	Mon, 12 Apr 2021 21:33:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C92115F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618256072;
	bh=QDhVz9v8TxGJf78jhvkyG4Xxw1ddBbkFeCRG2zd5p7w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OodocomClb0a9CaeJKHrgMQooRNQ0RxlHiIsqDPv3s8TXX6nfPwDGwf+cpgM+exPJ
	 F6DEyXUW8g2K8rPEUXrBHdnG+WjOU4zDdpFkgebR/Wg826ijrnP1zfj+Zp03gdaiS9
	 ClKK0TDNwoHzYdxzn1JBKPPYyCkK7QCiBoY4F+gs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82663F800D3;
	Mon, 12 Apr 2021 21:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03DADF80269; Mon, 12 Apr 2021 21:33:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8E21F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 21:32:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8E21F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="Os3IikV3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ygX1adLghyhtNSREBhi5HYWIXSM/gHlI6YHSur1jB4U=; b=Os3IikV3QmTE1qKeUWtrms0ouF
 iYWDUcbyz23Gw8m+qoJ1edy0c9ImwOj5uSrtT5025FmiraSkeE9y/DNVQioxKV29SzL1mtdb5STTe
 Pr8pkaFdtuELti2rs7aYLnnGtNQ647HhixY5I+dwXn7oMIrzHwBb7Yzz+aNS2zKaM16vNtOE1eOSG
 c0kt+IdAIzpYKhJRTY8Q+HgoW/H89KEoccniLln2bo17kcu4eN+ANXvrEEvTx114fT16dhKFxp/uU
 VMgB5TA8P3AK/5FWL7NFy0W1Y3d9ENFM/wv9RWboTG0WKuwP3bRv1fBfvc44g5FIQ10VR7TXYyHae
 ODTC49hA==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.7]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lW2Il-0095Mv-BH; Mon, 12 Apr 2021 21:32:51 +0200
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210410120229.1172054-1-coding@diwic.se>
 <s5him4r3k1d.wl-tiwai@suse.de>
From: David Henningsson <coding@diwic.se>
Message-ID: <e912ae71-5b52-8b1f-b3fa-b9bb6420be29@diwic.se>
Date: Mon, 12 Apr 2021 21:32:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5him4r3k1d.wl-tiwai@suse.de>
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


On 2021-04-12 11:54, Takashi Iwai wrote:
> On Sat, 10 Apr 2021 14:02:29 +0200,
> David Henningsson wrote:
>> +struct snd_rawmidi_framing_tstamp {
>> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
>> +	 * types here. Applications are expected to skip unknown frame types.
>> +	 */
>> +	unsigned char frame_type;
>> +	unsigned char length; /* number of valid bytes in data field */
>> +	unsigned char reserved[2];
>> +	unsigned int tv_nsec;		/* nanoseconds */
>> +	unsigned long long tv_sec;	/* seconds */
> Please use u32 and u64 here instead of int and long long.
> We really want to be specific about the field types.
>
>> +static int receive_with_tstamp_framing(struct snd_rawmidi_substream *substream,
>> +			const unsigned char *buffer, int src_count, struct timespec64 *tstamp)
> Pass const to tstamp.
>
>> +{
>> +	struct snd_rawmidi_runtime *runtime = substream->runtime;
>> +	struct snd_rawmidi_framing_tstamp *dest_ptr;
>> +	struct snd_rawmidi_framing_tstamp frame = { .tv_sec = tstamp->tv_sec, .tv_nsec = tstamp->tv_nsec };
>> +
>> +	int dest_frames = 0;
>> +	int frame_size = sizeof(struct snd_rawmidi_framing_tstamp);
>> +
>> +	if (snd_BUG_ON(runtime->hw_ptr & 0x1f || runtime->buffer_size & 0x1f || frame_size != 0x20))
> The frame_size check should be rather BUILD_BUG_ON() as it's constant.
> And the buffer_size check is... well, not sure whether we need here.
> snd_BUG_ON() is performed even if there is no debug option set (but
> the debug message is suppressed).
>
>> +		return -EINVAL;
>> +	while (src_count > 0) {
>> +		if ((int)(runtime->buffer_size - runtime->avail) < frame_size) {
>> +			runtime->xruns += src_count;
>> +			return dest_frames * frame_size;
> Better to break the loop for unifying the exit path.
>
>> @@ -987,8 +1035,15 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
>>   			  "snd_rawmidi_receive: input is not active!!!\n");
>>   		return -EINVAL;
>>   	}
>> -	spin_lock_irqsave(&runtime->lock, flags);
>> -	if (count == 1) {	/* special case, faster code */
>> +	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
>> +		if (substream->clock_type == CLOCK_MONOTONIC_RAW)
>> +			ktime_get_raw_ts64(&ts64);
>> +		else
>> +			ktime_get_ts64(&ts64);
>> +		spin_lock_irqsave(&runtime->lock, flags);
>> +		result = receive_with_tstamp_framing(substream, buffer, count, &ts64);
>> +	} else if (count == 1) {	/* special case, faster code */
>> +		spin_lock_irqsave(&runtime->lock, flags);
>>   		substream->bytes++;
>>   		if (runtime->avail < runtime->buffer_size) {
>>   			runtime->buffer[runtime->hw_ptr++] = buffer[0];
>> @@ -999,6 +1054,7 @@ int snd_rawmidi_receive(struct snd_rawmidi_substream *substream,
>>   			runtime->xruns++;
>>   		}
>>   	} else {
>> +		spin_lock_irqsave(&runtime->lock, flags);
>>   		substream->bytes += count;
>>   		count1 = runtime->buffer_size - runtime->hw_ptr;
>>   		if (count1 > count)
> It's error-prone to put the spin_lock_irqsave() in various places.
> If you want to get the timestamp outside the spinlock inevitably, just
> do it before the spin_lock_irqsave() line,
>
> 	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
> 		if (substream->clock_type == CLOCK_MONOTONIC_RAW)
> 			ktime_get_raw_ts64(&ts64);
> 		else
> 			ktime_get_ts64(&ts64);
> 	}

Thanks for the review.

I'll refactor this part into a separate function. The rest I'll just fix 
the way you suggest.

>
> 	spin_lock_irqsave(&runtime->lock, flags);
> 	if (substream->framing == SNDRV_RAWMIDI_FRAMING_TSTAMP) {
> 		....
> 	} else if (count == 1) {	/* special case, faster code */
> 		....
>
> And, the patch misses the change in rawmidi_compat.c.  It's also the
> reason we'd like to avoid the bit fields usage, too.  (Not only that,
> though.)
>
> One thing I'm considering is how to inform the current framing and the
> timestamp mode to user-space.  Currently we have only the ioctl to set
> the values but not to inquiry.

Yes, this is the same as we do with PCM. There is no ioctl to get 
current hw/sw params either.

> Should we put those new information into the info or the status ioctl?

I would prefer neither, because it is not necessary and creates an 
inconsistency with PCM.

> If so, it might be also helpful to inform the frame byte size
> explicitly there, instead of assuming only a constant.

If userspace has verified the kernel protocol version and successfully 
calledSNDRV_RAWMIDI_IOCTL_PARAMS with the framing byte/bitfield/whatever 
set, then userspace can be sure that the frames are according to the 
snd_rawmidi_framing_tstamp struct. Knowing the frame byte size but not 
knowing the exact format is of no use to userspace anyway, right?

// David
