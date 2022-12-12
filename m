Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D175C649EFF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Dec 2022 13:42:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6112A198F;
	Mon, 12 Dec 2022 13:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6112A198F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670848963;
	bh=sLDrp4sU9u2owq3/YwAXp4AxlPAdm9r9oftZ9MI+oaU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Unlu7YEA/jQoVohbQPvCCzfOyS5XvA22mE6sNZQhpQGLKtzKnrYEOnk6rrWEiZvDd
	 0o+3PhkGS/5TMkwOOoQriIKNgkxyLsb3/0jwEB0CrHVEnoYSxGqOrkLFxKlRB2+gLs
	 6jdBCtlKKdsaaAGFgzac05GA88D9k9S2BxM7Mqz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E61FF80141;
	Mon, 12 Dec 2022 13:41:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42B27F804B4; Mon, 12 Dec 2022 13:41:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82719F80141
 for <alsa-devel@alsa-project.org>; Mon, 12 Dec 2022 13:41:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82719F80141
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 secure) header.d=perex.cz header.i=@perex.cz header.a=rsa-sha256
 header.s=default header.b=le85da02
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id E4214A0040;
 Mon, 12 Dec 2022 13:41:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz E4214A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1670848900; bh=zE5QnlRXrIKq2RAIWSGzg6ApMcQCwZBI4S3Oezjc3Cc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=le85da028aQDSVRtFX7i43nvWVs9oSoMZetM8hDxG9BHR9mTdg0p0sVzssyF458JI
 mKXyn26W4fhvupCwCkA61Xc5+lsXqtK+0KiN7LlGIpbEzaC5LrD1Wtz90U4xZVwcX2
 xOOIrXn406+mH9g/4U8C+eoYPy/uKNIk651u7uac=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 12 Dec 2022 13:41:35 +0100 (CET)
Message-ID: <1ad74b4b-4252-4bcb-b8a3-211ca7528989@perex.cz>
Date: Mon, 12 Dec 2022 13:41:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: Regression playing 24bit/96kHz audio on USB audio interface
 between 5.10.94 and 5.15.21
Content-Language: en-US
To: Ruud van Asseldonk <ruud@veniogames.com>
References: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
 <9da2f631-4b45-9c5e-4349-488eea9436aa@veniogames.com>
 <Y5ZGw/3GHXSUduEc@geday> <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <99245e87-f970-5660-d2af-82180e7a98d3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Thorsten Leemhuis <regressions@leemhuis.info>,
 Takashi Iwai <tiwai@suse.com>, Geraldo Nascimento <geraldogabriel@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 12. 12. 22 10:48, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> On 11.12.22 22:08, Geraldo Nascimento wrote:
>> On Sun, Dec 11, 2022 at 04:30:11PM +0100, Ruud van Asseldonk wrote:
>>> Hi all,
>>>
>>> This issue is still present in 5.15.82, is there anything I can do to
>>> diagnose this further?
>>
>> Hi Ruud,
>>
>> Sorry for your troubles. You could use "git bisect" to try to pinpoint
>> the exact commit that introduces failure for you.
> 
> Yeah, that would be helpful. But 5.15 is quite old by now. Before going
> down that route you might want to try the latest kernel (e.g. Linux
> 6.1), as the problem might have been fixed in between, without the fix
> being backported.

It seems like a problem in the hw_params constraints / refining. There are lot of changes in the USB audio driver between 5.10/5.15. There is also HW_CONST_DEBUG define in sound/usb/pcm.c which enables the debug output for the refining.

Just curious: What's behind the value 513 (period size)? It does not match the time (5.34ms for 96kHz) nor a binary value. I would use 480 (5ms) or so.

And the final note: I gave a quick test with UMC204HD with the 6.0.9 kernel and it appears that this problem is not present in the recent kernel:

# aplay -Dhw:U192k --period-size=513 --buffer-size=2052 -c 4 -r 96000 -f S16_LE --dump-hw-params /dev/zero
Playing raw data '/dev/zero' : Signed 16 bit Little Endian, Rate 96000 Hz, Channels 4
HW Params of device "hw:U192k":
--------------------
ACCESS:  MMAP_INTERLEAVED RW_INTERLEAVED
FORMAT:  S16_LE S32_LE
SUBFORMAT:  STD
SAMPLE_BITS: [16 32]
FRAME_BITS: [64 128]
CHANNELS: 4
RATE: [44100 192000]
PERIOD_TIME: [125 1000000]
PERIOD_SIZE: [6 192000]
PERIOD_BYTES: [64 3072000]
PERIODS: [2 1024]
BUFFER_TIME: (62 2000000]
BUFFER_SIZE: [12 384000]
BUFFER_BYTES: [96 6144000]
TICK_TIME: ALL
--------------------
# cat /proc/asound/card2/pcm0p/sub0/hw_params
access: RW_INTERLEAVED
format: S16_LE
subformat: STD
channels: 4
rate: 96000 (96000/1)
period_size: 513
buffer_size: 2052

# aplay -Dplughw:U192k --period-size=513 --buffer-size=2052 -c 2 -r 96000 -f S24_3LE --dump-hw-params /dev/zero
ACCESS:  MMAP_INTERLEAVED MMAP_NONINTERLEAVED MMAP_COMPLEX RW_INTERLEAVED RW_NONINTERLEAVED
FORMAT:  S8 U8 S16_LE S16_BE U16_LE U16_BE S24_LE S24_BE U24_LE U24_BE S32_LE S32_BE U32_LE U32_BE FLOAT_LE FLOAT_BE FLOAT64_LE FLOAT64_BE MU_LAW A_LAW IMA_ADPCM S20_LE S20_BE U20_LE U20_BE S24_3LE S24_3BE U24_3LE U24_3BE S20_3LE S20_3BE U20_3LE U20_3BE S18_3LE S18_3BE U18_3LE U18_3BE
SUBFORMAT:  STD
SAMPLE_BITS: [4 64]
FRAME_BITS: [4 640000]
CHANNELS: [1 10000]
RATE: [4000 4294967295]
PERIOD_TIME: [125 1000000]
PERIOD_SIZE: (0 4294967295]
PERIOD_BYTES: (0 4294967295]
PERIODS: (0 4294967295]
BUFFER_TIME: [1 4294967295]
BUFFER_SIZE: [1 4294967295]
BUFFER_BYTES: [1 4294967295]
TICK_TIME: ALL
# cat /proc/asound/card2/pcm0p/sub0/hw_params
access: MMAP_INTERLEAVED
format: S32_LE
subformat: STD
channels: 4
rate: 96000 (96000/1)
period_size: 513
buffer_size: 2052

I would also use S32_LE native format in your app, the S24_3LE is not supported with your hw directly. The alsa-lib does conversion.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
