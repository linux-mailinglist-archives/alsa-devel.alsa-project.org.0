Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E6870C5A2
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 21:02:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2405D825;
	Mon, 22 May 2023 21:01:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2405D825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684782169;
	bh=qGC8daj78Jk8a3rYuhuY8wFNCfgvdjaJYpyjQG0HJkU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UC4KHZa6Rp84Ncu7G1Xs6qjAHusogaPz6aUS8gUssxbPYhJnjnqeE9D8247ALvWGe
	 NedIMx8xgmzqy30Kd5954bZPo4m4+I+6JrWBP1a/E1lKe0QBb36fquVOIqTX60mSvB
	 qqvlscuExXkS3v7KH55bGfuwiXwkQqw9CyOi+Xjw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E58FF80544; Mon, 22 May 2023 21:01:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF121F80249;
	Mon, 22 May 2023 21:01:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CBFDF8024E; Mon, 22 May 2023 21:01:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 761F1F80086
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 21:01:43 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 2BA481E2D;
	Mon, 22 May 2023 21:01:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 2BA481E2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1684782102; bh=t1obIzdB1YHyiAfSHlI2gjp/nRm8NmmeUVbX6hSBZ7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aCPkS/Z+P7s3W5/9BiFSHySCnKQWeryuaa5HeIlbgkrHcuGkN9nNqqvEz5W9dpYkl
	 BZwjm4632sV7GbyTD79TAD5D0ZW4jgvlcXV1l1xApzr7BCzS4j+0h/RYZhOKVQXycx
	 ij6ILt69fZxL7dQa2bfH3MGtvYOYbrC1Hld4RCig=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 22 May 2023 21:01:40 +0200 (CEST)
Message-ID: <caa57e43-7c47-5644-918b-65d0493fd996@perex.cz>
Date: Mon, 22 May 2023 21:01:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/36] ALSA: rawmidi: UMP support
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
References: <20230519093114.28813-1-tiwai@suse.de>
 <20230519093114.28813-4-tiwai@suse.de>
 <d22c2686-9b36-40b7-f284-17e8b78a04ac@perex.cz> <87mt1wygoz.wl-tiwai@suse.de>
 <6736e86b-f6bb-fc6f-ebc2-cb0c5f1d36fb@perex.cz> <87ilcky83k.wl-tiwai@suse.de>
 <877ct0y2iu.wl-tiwai@suse.de> <87y1lggwup.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <87y1lggwup.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: THAGTABWBYH3HEPNU7BGGOJPY75AJJY7
X-Message-ID-Hash: THAGTABWBYH3HEPNU7BGGOJPY75AJJY7
X-MailFrom: perex@perex.cz
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THAGTABWBYH3HEPNU7BGGOJPY75AJJY7/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 22. 05. 23 18:22, Takashi Iwai wrote:
> On Mon, 22 May 2023 14:27:37 +0200,
> Takashi Iwai wrote:
>>
>> On Mon, 22 May 2023 12:27:11 +0200,
>> Takashi Iwai wrote:
>>>
>>> On Mon, 22 May 2023 10:08:24 +0200,
>>> Jaroslav Kysela wrote:
>>>>
>>>> On 22. 05. 23 9:21, Takashi Iwai wrote:
>>>>> On Mon, 22 May 2023 08:34:20 +0200,
>>>>> Jaroslav Kysela wrote:
>>>>>>
>>>>>> On 19. 05. 23 11:30, Takashi Iwai wrote:
>>>>>>> This patch adds the support helpers for UMP (Universal MIDI Packet) in
>>>>>>> ALSA core.
>>>>>>>
>>>>>>> The basic design is that a rawmidi instance is assigned to each UMP
>>>>>>> Endpoint.  A UMP Endpoint provides a UMP stream, typically
>>>>>>> bidirectional (but can be also uni-directional, too), which may hold
>>>>>>> up to 16 UMP Groups, where each UMP (input/output) Group corresponds
>>>>>>> to the traditional MIDI I/O Endpoint.
>>>>>>>
>>>>>>> Additionally, the ALSA UMP abstraction provides the multiple UMP
>>>>>>> Blocks that can be assigned to each UMP Endpoint.  A UMP Block is a
>>>>>>> metadata to hold the UMP Group clusters, and can represent the
>>>>>>> functions assigned to each UMP Group.  A typical implementation of UMP
>>>>>>> Block is the Group Terminal Blocks of USB MIDI 2.0 specification.
>>>>>>>
>>>>>>> For distinguishing from the legacy byte-stream MIDI device, a new
>>>>>>> device "umpC*D*" will be created, instead of the standard (MIDI 1.0)
>>>>>>> devices "midiC*D*".  The UMP instance can be identified by the new
>>>>>>> rawmidi info bit SNDRV_RAWMIDI_INFO_UMP, too.
>>>>>>>
>>>>>>> A UMP rawmidi device reads/writes only in 4-bytes words alignment,
>>>>>>> stored in CPU native endianness.
>>>>>>>
>>>>>>> The transmit and receive functions take care of the input/out data
>>>>>>> alignment, and may return zero or aligned size, and the params ioctl
>>>>>>> may return -EINVAL when the given input/output buffer size isn't
>>>>>>> aligned.
>>>>>>>
>>>>>>> A few new UMP-specific ioctls are added for obtaining the new UMP
>>>>>>> endpoint and block information.
>>>>>>>
>>>>>>> As of this commit, no ALSA sequencer instance is attached to UMP
>>>>>>> devices yet.  They will be supported by later patches.
>>>>>>>
>>>>>>> Along with those changes, the protocol version for rawmidi is bumped
>>>>>>> to 2.0.3.
>>>>>>>
>>>>>>> Signed-off-by: Takashi Iwai <tiwai@suse.de>
>>>>>>
>>>>>> Reviewed-by: Jaroslav Kysela
>>>>>>
>>>>>> except:
>>>>>>
>>>>>>> +/* UMP Endpoint information */
>>>>>>> +struct snd_ump_endpoint_info {
>>>>>>> +	int card;			/* card number */
>>>>>>> +	int device;			/* device number */
>>>>>>
>>>>>> I suspect that those two fields were added to enumerate devices in the
>>>>>> control API. But this extension seems to be missing in your
>>>>>> patches. There is only SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE
>>>>>> implemented. Otherwise those two fields are not useful.
>>>>>
>>>>> The SNDRV_CTL_IOCTL_UMP_NEXT_DEVICE is looping over rawmidi, and
>>>>> snd_rawmidi_info is provided for (kernel) UMP implementation.
>>>>
>>>> Right. My point was that an application may be able to evaluate the
>>>> other UMP specific information from those new structures before the
>>>> rawmidi device is opened. So the CTL API extension may make sense.
>>>
>>> Point taken, and indeed it might make more sense to change the ioctl
>>> for looking at snd_ump_endpoint_info.  Will try to cook with it.
>>
>> FWIW, below is the patch to add two new ioctls for UMP EP/block
>> inquiries.  It's together with a slight change of ioctl callback.
>> Will be included in v2 patch set I'll submit later.
>>
>> The latest patches are found in topic/midi20 branch of sound git
>> tree.
> 
> There was a typo.  The corrected version below.
> 
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] ALSA: ump: Add ioctls to inquiry UMP EP and Block info via
>   control API
> 
> It'd be convenient to have ioctls to inquiry the UMP Endpoint and UMP
> Block information directly via the control API without opening the
> rawmidi interface, just like SNDRV_CTL_IOCTL_RAWMIDI_INFO.
> 
> This patch extends the rawmidi ioctl handler to support those; new
> ioctls, SNDRV_CTL_IOCTL_UMP_ENDPOINT_INFO and
> SNDRV_CTL_IOCTL_UMP_BLOCK_INFO, return the snd_ump_endpoint and
> snd_ump_block data that is specified by the device field,
> respectively.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Thanks. It looks good.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Reviewed-by: Jaroslav Kysela <perex@perex.cz>

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

