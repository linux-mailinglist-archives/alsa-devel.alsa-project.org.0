Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C73CA35C3F8
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Apr 2021 12:28:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 471A315E5;
	Mon, 12 Apr 2021 12:27:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 471A315E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618223313;
	bh=s84ZpemkVrv5IGrWc9awIFRLdcPHmIK146XGv87TtJA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KC8s9WHmHNlsoO4xgaBAvYC7Jsz+ipAbF/0G+9Hg0Mk0uoRAe3CnqgLnmUm8a5z8r
	 /vghoChkTulqDTf+k56chsi/Lz0W5c+SKSzaotMbBnyaMtrZc+OS+r3LQKIHTC21ho
	 0WP8BJnca+6vHETlmmK8HJcyl38Xs1M6VKGiJ6bo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA12F8013D;
	Mon, 12 Apr 2021 12:27:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0925F80269; Mon, 12 Apr 2021 12:27:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10B33F8013D
 for <alsa-devel@alsa-project.org>; Mon, 12 Apr 2021 12:26:53 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 3D4FDA003F;
 Mon, 12 Apr 2021 12:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 3D4FDA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1618223213; bh=mP7jD+Wdbl5nyRM3he7m+UhPkVQWKpg3SscUsz2bNas=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jBB8SbdhByTf+UcGBVfbWPZicwUqOMFBPYb9RoNID8ksi79HUNgOIpQWZ/gfu9G2N
 DAg8BRHKXCEv3UAxyDDqfrX8L/hfWg1DD2C8TxnQ3f8djhD9n8dnx7W750zgV+PhT9
 6sxipYoiZeSk7X4WBrRPVGk7ABGksaE35mloa5KY=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Apr 2021 12:26:49 +0200 (CEST)
Subject: Re: [PATCH v4] sound: rawmidi: Add framing mode
To: Takashi Iwai <tiwai@suse.de>
References: <20210410120229.1172054-1-coding@diwic.se>
 <df8cc177-f91d-28b1-c8df-1162dc136657@perex.cz>
 <bb91fc79-1b61-b051-1543-b5c8b1633fb3@diwic.se>
 <87f906a5-b77f-d3e8-29d7-7ce6e35c452a@perex.cz>
 <s5hk0p73l36.wl-tiwai@suse.de>
 <822b7ebf-71ac-2f84-731d-65e772eea1ff@perex.cz>
 <s5hfszv3jjq.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <a2d31a49-ec28-8b54-6632-3d24c96b624a@perex.cz>
Date: Mon, 12 Apr 2021 12:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <s5hfszv3jjq.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, David Henningsson <coding@diwic.se>
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

Dne 12. 04. 21 v 12:04 Takashi Iwai napsal(a):
> On Mon, 12 Apr 2021 11:43:02 +0200,
> Jaroslav Kysela wrote:
>>
>> Dne 12. 04. 21 v 11:31 Takashi Iwai napsal(a):
>>> On Sun, 11 Apr 2021 19:52:21 +0200,
>>> Jaroslav Kysela wrote:
>>>>>>>   struct snd_rawmidi_params {
>>>>>>>   	int stream;
>>>>>>>   	size_t buffer_size;		/* queue size in bytes */
>>>>>>>   	size_t avail_min;		/* minimum avail bytes for wakeup */
>>>>>>>   	unsigned int no_active_sensing: 1; /* do not send active sensing byte in close() */
>>>>>>> -	unsigned char reserved[16];	/* reserved for future use */
>>>>>>> +	unsigned char framing;		/* For input data only, frame incoming data */
>>>>>> We can move this flag to above 32-bit word (no_active_sensing). I'm not sure,
>>>>>> if we need 8 bits for this. It's first change after 20 years. Another flag may
>>>>>> obsolete this one.
>>>>>
>>>>> Not sure what you mean by this, could you show the code? Framing is an 
>>>>> enum rather than a flag, in case we find other framing formats with 
>>>>> other sizes that would obsolete this one.
>>>>
>>>> unsigned int no_active_sensing: 1;
>>>> unsigned int framing32: 1;
>>>> unsigned int framing64: 1; /* future extension, framing32 == 0 in this case */
>>>>
>>>> or:
>>>>
>>>> unsigned int framing_mode: 3;	/* three bits for future types */
>>>>
>>>> perhaps also:
>>>>
>>>> unsigned int clock_type: 3;	/* three bits for the clock type selection */
>>>
>>> The usage of bit fields in an ioctl struct is a bad idea from the
>>> compat layer POV.  Let's avoid it.
>>
>> What exactly do you mean?
> 
> The compat layer has the hard time to deal with the conversion of bit
> fields to a different struct.  And, it's a nightmare for the emulator
> like QEMU.  If it has to convert the ioctl struct, it has to consider
> about the byte order as well (and there is no strict definition how to
> put the bit fields in C language).

The endianness of the 32-bit word can be changed quite easily - and the
situation is similar to bit flags stored in the 32-bit word. Nobody prevents
QEMU to work with the whole 32-bit word instead bit fields in this case.

The linux compat layer may copy the whole 32-bit word, too.

I think that your argument is not so strong here.

> That said, a bit field can be useful for the internal object
> definition (if there is no racy access), but not for an object for the
> communication that may be interpreted among different architectures.

In this case, we have 31 free bits and this information can be stored there. I
would prefer to keep the reserved bytes for some large fields.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
