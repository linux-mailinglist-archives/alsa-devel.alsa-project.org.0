Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F88363D30
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 10:16:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B93D167A;
	Mon, 19 Apr 2021 10:15:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B93D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618820205;
	bh=RysmSnLmDpzom1YsW5lm+XbAA5KjEECkm4HJNQDVEtU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LFfBvC6Q5Oy6q6eUhfLpfzwDwUC69iW7RU7kLpcTvsPi8T1B4vXGKvdMVV4J5u7wS
	 K5onWKq4f5wVQ3cPVQ+Ca/t84w985tXAvShrTGCEfROeqf1xyZDPq0D6ViRQP9oqxW
	 xKg8z6GC9wh9GpLmDIwq9LVhzgtBhYD6sOJ2ew4k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B09DCF800C5;
	Mon, 19 Apr 2021 10:15:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B067EF800C5; Mon, 19 Apr 2021 10:15:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB2DDF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 10:15:01 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A4991A003F;
 Mon, 19 Apr 2021 10:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A4991A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618820100; bh=zMHjZt9Dgvs2ove8kkJatKhOkNfPoHSqHOKutc8D/Kk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oGq+v5xLkSdu+lmP8XMCSkdiWX6ws4Mmt+77/mkoLZzfF8TFBHOusPbN8a7rhEnx9
 iMkkX4sBA7M72Q4FYPLnAa7VDI1CTYNWRj/oP6qHO7EvMLYEe+6puFxyVvwNW+3Gz0
 3GIqWfPj3IythbKKMgyJo8nw3UZgANG3o+ks/vaw=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 19 Apr 2021 10:14:57 +0200 (CEST)
Subject: Re: [PATCH v5] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>, David Henningsson <coding@diwic.se>
References: <20210418151217.208582-1-coding@diwic.se>
 <a0928012-ff8d-3253-4cc6-89bf69d4cfdd@perex.cz>
 <ba6c46da-4778-8bd7-d1ca-6bcc77137645@diwic.se>
 <s5hk0oyg225.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <433c9201-65f3-c844-e3ef-c71ac01d75fa@perex.cz>
Date: Mon, 19 Apr 2021 10:14:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <s5hk0oyg225.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

Dne 19. 04. 21 v 9:34 Takashi Iwai napsal(a):
> On Mon, 19 Apr 2021 08:22:50 +0200,
> David Henningsson wrote:
>>
>>
>> On 2021-04-18 20:24, Jaroslav Kysela wrote:
>>> Dne 18. 04. 21 v 17:12 David Henningsson napsal(a):
>>>
>>>> +#define SND_RAWMIDI_FRAMING_DATA_LENGTH 16
>>> SNDRV_ prefix should be here.
>>
>> Ack
>>
>>>
>>>> +
>>>> +struct snd_rawmidi_framing_tstamp {
>>>> +	/* For now, frame_type is always 0. Midi 2.0 is expected to add new
>>>> +	 * types here. Applications are expected to skip unknown frame types.
>>>> +	 */
>>>> +	u8 frame_type;
>>>> +	u8 length; /* number of valid bytes in data field */
>>>> +	u8 reserved[2];
>>>> +	u32 tv_nsec;		/* nanoseconds */
>>>> +	u64 tv_sec;		/* seconds */
>>>> +	u8 data[SND_RAWMIDI_FRAMING_DATA_LENGTH];
>>> What about to move the fields to union (except for frame_type) like we do for
>>> 'struct snd_ctl_event' in case when we need to reorganize the contents for
>>> future types?
>>
>> So the two degrees of freedom would be
>>
>> 1) the SNDRV_RAWMIDI_MODE_FRAMING_32BYTES indicates that the frame
>> size is 32 bytes and the first byte of that frame is frame_type
>>
>> 2) the frame_type of every frame indicates the format of the other 31
>> bytes, and an application is expected to ignore unknown frame_types,
>> so we can add new frame_types in a backwards compatible way.
>>
>> We'll end up with:
>>
>> struct snd_rawmidi_framing_32bytes {
>>     u8 frame_type;
>>     union {
>>         struct {
>>             u8 length; /* number of valid bytes in data field */
>>             u8 reserved[2];
>>             u32 tv_nsec;        /* nanoseconds */
>>             u64 tv_sec;        /* seconds */
>>             u8 data[SNDRV_RAWMIDI_FRAMING_32BYTES_FOO_LENGTH];
>>         } foo;
>>         u8 reserved[31];
>>     } data;
>> };
>>
>> ...except I don't know what we should replace foo with. We can't call
>> it "midi1" or "type0" or such because many different frame_types might
>> share the same interior format.
> 
> I thought of the use of union, but concluded that it doesn't give any
> good benefit.  Practically seen, defining two structs would be far
> easier, and if you want to code something in user-space for another
> new frame format, you would just use the new struct as is, as long as
> the size fits correctly.

Ok.

>>> As I noted, I would prefer to add 'unsigned int mode;' and define
>>> SNDRV_RAWMID_MODE_XXX bit flags and groups with framing and clock_type groups.
>>> There's no reason to stick with 'clockid_t' (which is integer anyway). We're
>>> using just a subset.
>>>
>>> #define SNDRV_RAWMIDI_MODE_FRAMING_MASK        (7<<0)
>>> #define SNDRV_RAWMIDI_MODE_FRAMING_SHIFT       0
>>> #define SNDRV_RAWMIDI_MODE_FRAMING_NONE	       (0<<0)
>>> #define SNDRV_RAWMIDI_MODE_FRAMING_32BYTES     (1<<0)
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_MASK          (7<<3)
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_SHIFT         3
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_NONE	       (0<<3)
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_REALTIME      (1<<3)
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC     (2<<3)
>>> #define SNDRV_RAWMIDI_MODE_CLOCK_MONOTONIC_RAW (3<<3)
>>>
>>> In this case, we can use 26-bits in future for extensions.
>>
>> Well, for me this is mostly bikeshedding. But as long as you and
>> Takashi can't agree on whether bitfields/bimasks/etc are good or bad,
>> I'm just stuck between the two of you and can't actually improve
>> Linux's capability to be a great pro audio OS, and that is utterly
>> frustrating. I don't care if the two of you decides who's going to win
>> this through this list, a conference call, a game of SuperTuxKart or
>> thumb wrestling, just reach consensus somehow. Okay?
> 
> Oh, don't get me wrong, I have no objection to the bit flags at all.
> My objection was against the use of C language bit-fields
> (e.g. unsigned int foo:5) as Jaroslav suggested in his earlier reply.
> That's not portable, hence unsuitable for ioctl structs.  OTOH, the
> explicit bit flags are very common in ABI definitions.
> 
> And I have no strong opinion on the flag definitions.  I find it OK to
> keep two uchar fields (that are mostly enough for near future
> extensions), but having a 32bit full bit flag would be of course OK
> from ABI design POV (and one less code in the compat function).
> 
> That said, there is no disagreement about the flag definition at all.
> You can pick up what you believe the best.

I have two reasons to pick the flags rather uchar fields (a bit non-standard
in the ALSA ioctl API):

1) save bits for future use
2) align to 4 bytes - with 2 uchar, we have 2 bytes pad

So, instead to split the 4 bytes from the reserved area, allocate the whole
32-bit word and allocate bits from it.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
