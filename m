Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E8B363B6D
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 08:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E641E16AE;
	Mon, 19 Apr 2021 08:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E641E16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618813480;
	bh=b/IReye49LV3jqHo1KOx4fr2Rezvn0OHKGojH50GcUo=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6K727TX193TcBcsIWT2AyjMdSHG3jGHiy0Ryp1vyF58+w5e/TTSLJWghBaOjNfQR
	 QGx3F17yTcUvW6WwfvzZWxv92E1Readw7is+X6RWS6wJh3DIKR9HtT/gcSFGnLEA4s
	 XTuXHuRm4mb0ut1VIfOE7xiDvcKv1dFTzjDZsRpk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51D4AF80256;
	Mon, 19 Apr 2021 08:23:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EE47F80227; Mon, 19 Apr 2021 08:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from ns4.inleed.net (mailout4.inleed.net
 [IPv6:2a0b:dc80:cafe:104::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 198D1F8014D
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 08:23:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198D1F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=diwic.se header.i=@diwic.se
 header.b="QStktnoe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=diwic.se;
 s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mrJEc3GQNlkJdnjSd+Q20OtyX+ITe71PtJOscxUVPlo=; b=QStktnoetQqMtZ/1KULOePaekx
 BxPXrhVSaljrI3BP0HkUNH9z/0C0UjMjsKwPgNqEmbbgjWUcc3z4yqNBjSNz8bdTIMXQSN8lsUdk6
 Jocqz9qUUTWMcGUAzisX4yB/vcxKTEahPs2LqrIoOLTNsHKcu+34oMiSv3BQ7CKrnlKvwj/HIk6tJ
 SzGFeUULnOaduxzl/K0bLnZYOSLePfob4RKV+OoU5JszFpBbWn8oGkH2oZjw83bndGa/fAFpqQ2fG
 AXehz/63a14H7074yTmQiFhZJG316sy0Zw1vC2i+Z9VDhUaud7mGD6+p/zt6yuHD2YwuHs/hwZAqA
 pyhlY0EA==;
Received: from c83-254-143-147.bredband.comhem.se ([83.254.143.147]
 helo=[192.168.5.6]) by ns4.inleed.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <coding@diwic.se>)
 id 1lYNJI-001WmI-KI; Mon, 19 Apr 2021 08:23:04 +0200
Subject: Re: [PATCH v5] sound: rawmidi: Add framing mode
To: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
 tiwai@suse.de
References: <20210418151217.208582-1-coding@diwic.se>
 <a0928012-ff8d-3253-4cc6-89bf69d4cfdd@perex.cz>
From: David Henningsson <coding@diwic.se>
Message-ID: <ba6c46da-4778-8bd7-d1ca-6bcc77137645@diwic.se>
Date: Mon, 19 Apr 2021 08:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a0928012-ff8d-3253-4cc6-89bf69d4cfdd@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 2021-04-18 20:24, Jaroslav Kysela wrote:
> Dne 18. 04. 21 v 17:12 David Henningsson napsal(a):
>
>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
> SNDRV_ prefix should be here.

Ack

>
>> +
>> +struct snd_rawmidi_framing_tstamp {
>> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
>> +	 * types here. Applications are expected to skip unknown frame types.
>> +	 */
>> +	u8 frame_type;
>> +	u8 length; /* number of valid bytes in data field */
>> +	u8 reserved[2];
>> +	u32 tv_nsec;		/* nanoseconds */
>> +	u64 tv_sec;		/* seconds */
>> +	u8 data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
> What about to move the fields to union (except for frame_type) like we do for
> 'struct snd_ctl_event' in case when we need to reorganize the contents for
> future types?

So the two degrees of freedom would be

1) the SNDRV_RAWMIDI_MODE_FRAMING_32BYTES indicates that the frame size 
is 32 bytes and the first byte of that frame is frame_type

2) the frame_type of every frame indicates the format of the other 31 
bytes, and an application is expected to ignore unknown frame_types, so 
we can add new frame_types in a backwards compatible way.

We'll end up with:

struct snd_rawmidi_framing_32bytes {
     u8 frame_type;
     union {
         struct {
             u8 length; /* number of valid bytes in data field */
             u8 reserved[2];
             u32 tv_nsec;        /* nanoseconds */
             u64 tv_sec;        /* seconds */
             u8 data[SNDRV_RAWMIDI_FRAMING_32BYTES_FOO_LENGTH];
         } foo;
         u8 reserved[31];
     } data;
};

...except I don't know what we should replace foo with. We can't call it 
"midi1" or "type0" or such because many different frame_types might 
share the same interior format.


>
>> +};
>> +
>>   struct snd_rawmidi_params {
>>   	int stream;
>>   	size_t buffer_size;		/* queue size in bytes */
>>   	size_t avail_min;		/* minimum avail bytes for wakeup */
>>   	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
>> -	unsigned char reserved[16];	/* reserved for future use */
>> +	unsigned char framing;		/* For input data only, frame incoming data */
>> +	unsigned char clock_type;	/* Type of clock to use for framing, same as clockid_t */
>> +	unsigned char reserved[14];	/* reserved for future use */
> As I noted, I would prefer to add 'unsigned int mode;' and define
> SNDRV_RAWMID_MODE_XXX bit flags and groups with framing and clock_type groups.
> There's no reason to stick with 'clockid_t' (which is integer anyway). We're
> using just a subset.
>
> #define SNDRV_RAWMIDI_MODE_FRAMING_MASK        (7<<0)
> #define SNDRV_RAWMIDI_MODE_FRAMING_SHIFT       0
> #define SNDRV_RAWMIDI_MODE_FRAMING_NONE	       (0<<0)
> #define SNDRV_RAWMIDI_MODE_FRAMING_32BYTES     (1<<0)
> #define SNDRV_RAWMIDI_MODE_CLOCK_MASK          (7<<3)
> #define SNDRV_RAWMIDI_MODE_CLOCK_SHIFT         3
> #define SNDRV_RAWMIDI_MODE_CLOCK_NONE	       (0<<3)
> #define SNDRV_RAWMIDI_MODE_CLOCK_REALTIME      (1<<3)
> #define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC     (2<<3)
> #define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW (3<<3)
>
> In this case, we can use 26-bits in future for extensions.

Well, for me this is mostly bikeshedding. But as long as you and Takashi 
can't agree on whether bitfields/bimasks/etc are good or bad, I'm just 
stuck between the two of you and can't actually improve Linux's 
capability to be a great pro audio OS, and that is utterly frustrating. 
I don't care if the two of you decides who's going to win this through 
this list, a conference call, a game of SuperTuxKart or thumb wrestling, 
just reach consensus somehow. Okay?

>
>> +struct timespec64 get_framing_tstamp(struct snd_rawmidi_substream *substream)
>> +{
>> +	struct timespec64 ts64 = {0, 0};
>> +
>> +	if (substream->framing != SNDRV_RAWMIDI_FRAMING_TSTAMP)
>> +		return ts64;
>> +	if (substream->clock_type == CLOCK_MONOTONIC_RAW)
>> +		ktime_get_raw_ts64(&ts64);
>> +	else
>> +		ktime_get_ts64(&ts64);
>> +	return ts64;
>> +}
> Missing the realtime clock type here.
>
> 					Jaroslav
>
