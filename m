Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 748702D32C2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 20:43:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18C0716D1;
	Tue,  8 Dec 2020 20:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18C0716D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607456598;
	bh=cO5gKq2wZL9uekt4QOfBAap4YG6oMeueLV+wVhhvlYA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LRBhHq60uk90x0KsRn4D62Eftlui43nGJqhIlruYLxv6rk/2FxWWy9qC44yCyqJqv
	 Hv4uyyCUJ81tflvY6IO/xCjmdoQwkqg5IwMBgh+6w+aycLwn9mUI+OF/6pvprMyO6S
	 R+FOc67f/TvF1yclF/MYxeNMeFbh28jen20nGpZk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45DAEF80130;
	Tue,  8 Dec 2020 20:41:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6606EF8019D; Tue,  8 Dec 2020 20:41:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AAB3F8010A
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:41:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AAB3F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de
 header.b="koiZ/K5F"
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 4C5BE160061
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 20:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1607456494; bh=cO5gKq2wZL9uekt4QOfBAap4YG6oMeueLV+wVhhvlYA=;
 h=Date:From:To:Cc:Subject:From;
 b=koiZ/K5FvgygI0qJKVUqnZsjZMRcL7dmI+Fv+ln9lvx5hT9VPff3OUW3v5pRkvhwm
 BtTokN0QXys8jVIeRkfASO3HtDe3NCQsL14yyeqrzf7CuXLUJZsJiOwKwPau4szyAv
 G4NwnEcPn806MEXm+EEePX4cJ/VRHdYq3RC+Duc1sHAf8J3cCDA9u8J36gy1O0IavH
 IwcUrpMwzHzpi8C1ARxurD2seeJCwVmDJPjsSfjBQ9/Sg5TQPyCyQfYyuSP1N2q61U
 JIJRzNFhhqtOO9bqefpwg0IRzHATTTGszxamROvxFENLlfsrNrzDFZq800R51RzYDf
 RqhymqoHdNiBQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Cr9Xs6DmTz9rxM;
 Tue,  8 Dec 2020 20:41:33 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 08 Dec 2020 20:41:33 +0100
From: meschi@posteo.de
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Steinberg UR22 Crackling and Clicks
In-Reply-To: <s5hft4gwdji.wl-tiwai@suse.de>
References: <ce03244f4699ffc9574ecc2dae41a417@posteo.de>
 <s5hft4gy4ar.wl-tiwai@suse.de> <61da73624ff3855867b8e65936fc2e1c@posteo.de>
 <s5hft4gwdji.wl-tiwai@suse.de>
Message-ID: <eb1baf202fa4cd74a502661bb0ce5279@posteo.de>
X-Sender: meschi@posteo.de
User-Agent: Posteo Webmail
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



Am 08.12.2020 15:57 schrieb Takashi Iwai:
> On Tue, 08 Dec 2020 15:50:28 +0100,
> meschi@posteo.de wrote:
>> 
>> > It's likely the issues with the implicit feedback.
>> >
>> > The latest development tree (either linux-next tree or
>> > topic/usb-audio-refactoring branch of my sound.git tree) contains the
>> > improvements of the implicit feedback mode.
>> >
>> >
>> > Takashi
>> 
>> Here is the cropped lsusb -v output:
>> I also have dmesg output with debug boot flag enabled.
>> 
>> Bus 001 Device 003: ID 0499:1509 Yamaha Corp. Steinberg UR22
> 
> OK, so it's a different device than UR22C.
> 
> Try to pass the module option quirk_alias=04991509:0499172f to
> snd-usb-audio.  This will make the device compatible with UR22C.
> 
> 
> Takashi

I removed snd_usb_audio and reloaded it with modprobe with the 
parameters.
$ modprobe snd_usb_audio quirk_alias=04991509:0499172f

When I try to play a file now this happens:
$ aplay -D plughw:CARD=UR22 ./file.wav
Playing WAVE './file.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, 
Stereo
aplay: set_params:1407: Unable to install hw params:
ACCESS:  RW_INTERLEAVED
FORMAT:  S16_LE
SUBFORMAT:  STD
SAMPLE_BITS: 16
FRAME_BITS: 32
CHANNELS: 2
RATE: 44100
PERIOD_TIME: (125011 125012)
PERIOD_SIZE: 5513
PERIOD_BYTES: 22052
PERIODS: (3 4)
BUFFER_TIME: 500000
BUFFER_SIZE: 22050
BUFFER_BYTES: 88200
TICK_TIME: 0

