Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8892EC3A0
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jan 2021 20:03:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DA40167F;
	Wed,  6 Jan 2021 20:02:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DA40167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609959782;
	bh=5ZlK9kpXnAXPuh1JBUggeCh4OTzsAeQt2zt98u20BkA=;
	h=Subject:References:To:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBqGpbs+y+mRL6K2DCLvn8Pd1gx9Cb6YP76DP4Q+1v24DN+HQS6y2CP01ixqHi/Ne
	 ZeLDsbvnNZ829Pr1TbQwrdWPY+hPeaB7QScOBd4xOGxNSJbiSgnlvBnBZnXEAY5F8k
	 6wzBOJcoHrikMsJ+p7iffJwCXYtfofn43VmQ2aAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C97D4F800E3;
	Wed,  6 Jan 2021 20:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D08E5F80166; Wed,  6 Jan 2021 20:01:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
 (using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94E5AF800DD
 for <alsa-devel@alsa-project.org>; Wed,  6 Jan 2021 20:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94E5AF800DD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz
 header.b="YC3/t9Fd"
Received: from [192.168.1.4] (osma.doma.frantovo.cz [192.168.1.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: fiki@frantovo.cz)
 by posta.frantovo.cz (Postfix) with ESMTPSA id 682EC19FF1E;
 Wed,  6 Jan 2021 19:59:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
 s=default; t=1609959600;
 bh=5ZlK9kpXnAXPuh1JBUggeCh4OTzsAeQt2zt98u20BkA=;
 h=Subject:Cc:References:To:From:Date:In-Reply-To;
 b=YC3/t9FdOxCPoVGfne5UTW/IuRMFGl5o2zajts83sxabh0peusgyH3LwPWc0WBtdn
 ArvFnlAmqjWkiDmC3FbdNKeaj7/5mn33csrADbziK4iUdBiVUXexDIQl6fpRE/pXrp
 A3UN/uOV7AQlZLPKc038RmPQIzPNgMs0Ifo+SR/M=
Subject: Re: [PATCH 14/41] ALSA: usb-audio: Create endpoint objects at parsing
 phase - Pioneer DJ DJM-250MK2 stopped working
References: <20201123085347.19667-1-tiwai@suse.de>
 <20201123085347.19667-15-tiwai@suse.de>
 <f7e8fe36-571e-7b78-3abe-777e365b53b0@frantovo.cz>
 <s5h8s9a9bvh.wl-tiwai@suse.de>
 <90c7f45a-91e6-f4e2-97a5-81df773bc22a@frantovo.cz>
 <s5him8b7mvf.wl-tiwai@suse.de> <s5hble35xlo.wl-tiwai@suse.de>
 <153e3b6e-0481-1d2e-fd00-4a2391a8035b@frantovo.cz>
 <s5ha6tm30ac.wl-tiwai@suse.de>
To: alsa-devel@alsa-project.org
From: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>
Autocrypt: addr=konference@frantovo.cz; prefer-encrypt=mutual; keydata=
 xsDiBEjwoPcRBACBMDDYEUSJnvb+vp9ISGGgbVeCjRGgTUYL0y8DE38EiFXHvs5xnuQwjDnD
 g5voqSsrehxLu3AnLCXVZAmRwJUw++9WbvWkuiML122u+zHi8CKOEaJDw6Wy9+/XJZwwpGAO
 zqCVoMZ9BKbp/FYJZd30F8Syg8iRpwOAFO5/6rq+ewCgiYsx9Gs0FkaQE3dm2Gl3+vlxjr0D
 /30qARahDlIWv3xSR0XDQWGQd+6sq0kwfd63etqjQfeeq0KRAld6f3BsQhWKcQwm0kIww7yr
 OBas5mMyS+m9eNNo8Y1f995oGYkPtMVSkWZZ/chVe/HNCyZJmJj4MPBBiiuc3IK/HyC4VFU2
 rOzB8NL9EHGM71kDPWghPUvYjukfA/4jUsaJx9f1QWkJoxim+35T0L4ucyEMPKyf5I7H0jg9
 wW3/Ealit43uXHldrDfH6HGJqqBUQjiPwCygSgdiOwQcdmlcOGX5fXNC8ZXErwnjObL9oXTr
 tanK7BK93DTRUrL0G7g3gl8k2bVKG1eQ4bA/ZXMktuTN7Tu+/8mAycGVgs01RnJhbnRpxaFl
 ayBLdcSNZXJhIChGcmFudG92by5jeikgPGZyYW50YUBmcmFudG92by5jej7CYwQTEQIAIwIb
 AwYLCQgHAwIEFQIIAwQWAgMBAh4BAheABQJI8K31AhkBAAoJEHHVq8jcl9H3hMUAn3hlINxa
 qAfvvuqBuESuhLvie913AJ90YVNwCEwPrHp/b5iV5/c2sitcG87DTQRI8KEcEBAAtpx9vU1l
 lAFEQWQLVKsI2YTS5pQhwb/OVmIQLnM6vguFhMH0ZXSjsZrWkEvrvrPNncsB3QSYlS9Zed69
 UHq3obZ8Jy8E2mwhggdxfSWutelG3mqOh9NbHm9GUGyE7LhFAkjRONNwnF3Bt8AbnjCWbd+0
 gZeh2ojmvnmHVY/4qUtEUflN1tZfHhOu6S6CNFyv/QTj6vSueVIBqrtpJuFxisWdKw8Ff3jq
 sDL9lGPgsfOHoFTufpIAFchgGhw648YDBqDWX/vtIKqqnPbeSXMCqI9hrWtZwUanlJeOihT+
 sAaGYNXrz8JCbOe6rSA4pvV1eu4agelS7y9YXwn06kuWjBrqitFc8Oeu9iZLKkK3cEdfczr9
 WLig1El8wN/naE9/kfv4OPCLKramuM0RMNLIBWmYJSMwWQm3QdlrBasuuJZc1GMdjcRJpk5H
 wa4aWT1tA3qe+BIv8GCqRMo8q51U6mjGlOsH+VFe5fhhJTybWYkeGFn4k/AvV6dXj/MVyniD
 DeYqsrLVwwFlCMMqwCsyL0o69fVO8RsKNaWk/rzMjkuV6Cy3B7YYOj4YJkTDjnEXdvmPNVz7
 YVjS6RqLagltHwqgkzW9v0IHpwBn9sS29EqBkRbGk/8ed9taCH0RE3AUyyeR3/GWN2YgU62S
 /NxS/SgKE3398A+/b6O90oRMyd8AAwUP/jTAUDJBR3digLqsxsPGu0ivQYdVup0e9Xdz/5Mh
 6UqwGVsXnYjkBjfuJGtCIxdJJQ3ZZmsj2qVXwxTpLe6s1EKZorbh88bQKrlHThKVBlaFo6Hc
 wUbeYL/lXMyCJcDCtbUaYKeBrIV5UDjKA90lVYbhdUYVcf1ddBEtAFSjgg9cMuPYlZ9AB0cK
 2UPknm+c7P2Q/Ao1EGaTAQjpmu4RHGpdVZMaZCFYl2pK+UTWEp++vzb8NDDhfvN57TpadcYJ
 42wLFUVHwddOLYviPIMdwAWsFe4g5se9ogJu65rS5YU3Aekz2+uXIq91kN+mUaySZ4R2bUni
 yCJ6++Dq06awKCV2BSQai8HyhrFyyufX/XZW+4UEPTEQRwgA8BAdv/5zjfNLo5+TVSu0cbHQ
 eu9UTqwwC19KPSfHLzuzlQvsi2R0lt/tj487fTgjryTO0rtcKX06q996YU+2Wt1ltKFwyKsk
 2Zu3FM9Fo9gGufh325V9ItFyemb620zBaPiEi+HldgkeaNw0eyWCaiTCLaehZ7LBvsgBwv0M
 4vw2Rbtfi8gtY5wI3Xre37XcA9lNcqigsag+LPw2TaczGbahqeuXJCIEzOHnWWdzFwjvlIZI
 1IvmAU/9+vSLRyVvvJ5LjGFrUOib2jWJTL+mRsfYxI+st2o8BPH2kQ2ZeWHQUmYUPRhQwkkE
 GBECAAkFAkjwoRwCGwwACgkQcdWryNyX0ffmsQCeNj9hurvXwOQ5ZIjHiVhUDdftkGsAn2If
 hW6mcblB0mov13r3UFNF1TB7
Message-ID: <9a48d68a-2875-4906-1d5f-4004fc53c8d6@frantovo.cz>
Date: Wed, 6 Jan 2021 20:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5ha6tm30ac.wl-tiwai@suse.de>
Content-Type: multipart/mixed; boundary="------------864C9ECD76C3A14C8FC5A3F7"
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean
Cc: Takashi Iwai <tiwai@suse.de>, Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

This is a multi-part message in MIME format.
--------------864C9ECD76C3A14C8FC5A3F7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dne 06. 01. 21 v 10:03 Takashi Iwai napsal(a):
> OK, then could you try the v3 patch below?

I tried v3 patch. Playback works, but recording does not - i found errors=
 like these in the log during recording:

Jan=C2=A0 6 18:07:08 antracit kernel: [=C2=A0 619.973372] retire_capture_=
urb: 21 callbacks suppressed
Jan=C2=A0 6 18:07:13 antracit kernel: [=C2=A0 624.974175] retire_capture_=
urb: 9993 callbacks suppressed
Jan=C2=A0 6 18:07:18 antracit kernel: [=C2=A0 629.978015] retire_capture_=
urb: 9999 callbacks suppressed
Jan=C2=A0 6 18:08:04 antracit kernel: [=C2=A0 675.932930] retire_capture_=
urb: 102 callbacks suppressed
Jan=C2=A0 6 18:08:09 antracit kernel: [=C2=A0 680.936305] retire_capture_=
urb: 9998 callbacks suppressed
Jan=C2=A0 6 18:08:14 antracit kernel: [=C2=A0 685.940643] retire_capture_=
urb: 10000 callbacks suppressed
Jan=C2=A0 6 18:09:45 antracit kernel: [=C2=A0 776.168655] retire_capture_=
urb: 302 callbacks suppressed
Jan=C2=A0 6 18:09:50 antracit kernel: [=C2=A0 781.169504] retire_capture_=
urb: 9993 callbacks suppressed
Jan=C2=A0 6 18:09:55 antracit kernel: [=C2=A0 786.173337] retire_capture_=
urb: 9999 callbacks suppressed

(the original "Incompatible EP setup for 0x82" error was also present in =
the log)

The arecord command does nothing and after few seconds it fails with:

$ arecord -D hw:CARD=3DDJM250MK2 -f S24_3LE -c 8 -r 48000 > v3.wav
Recording WAVE 'stdin' : Signed 24 bit Little Endian in 3bytes, Rate 4800=
0 Hz, Channels 8
arecord: pcm_read:2153: read error: Input/output error

The stream0 files from v2 and v3 differs in: Playback / Implicit Feedback=
 Mode: Yes/No


BTW: playback or capture sometimes returns error for the first time but n=
ext attempts are successful. However I saw this behavior even in the olde=
r versions, so it is nothing v3 specific.

This is the error I got sometimes during the first run:

$ arecord -D hw:CARD=3DDJM250MK2 -f S24_3LE -c 8 -r 48000 > v3.wav
Recording WAVE 'stdin' : Signed 24 bit Little Endian in 3bytes, Rate 4800=
0 Hz, Channels 8
arecord: set_params:1407: Unable to install hw params:
ACCESS:=C2=A0 RW_INTERLEAVED
FORMAT:=C2=A0 S24_3LE
SUBFORMAT:=C2=A0 STD
SAMPLE_BITS: 24
FRAME_BITS: 192
CHANNELS: 8
RATE: 48000
PERIOD_TIME: (455104 455105)
PERIOD_SIZE: 21845
PERIOD_BYTES: 524280
PERIODS: 2
BUFFER_TIME: (910208 910209)
BUFFER_SIZE: 43690
BUFFER_BYTES: 1048560
TICK_TIME: 0

If I execute the same command again, it works. (but not in v3).

Franta


--------------864C9ECD76C3A14C8FC5A3F7
Content-Type: text/plain; charset=UTF-8;
 name="stream0-v3.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="stream0-v3.txt"

UGlvbmVlciBESiBDb3Jwb3JhdGlvbiBESk0tMjUwTUsyIGF0IHVzYi0wMDAwOjAwOjEyLjIt
MywgaGlnaCBzcGVlZCA6IFVTQiBBdWRpbwoKUGxheWJhY2s6CiAgU3RhdHVzOiBTdG9wCiAg
SW50ZXJmYWNlIDAKICAgIEFsdHNldCAxCiAgICBGb3JtYXQ6IFMyNF8zTEUKICAgIENoYW5u
ZWxzOiA4CiAgICBFbmRwb2ludDogMHgwMSAoMSBPVVQpIChBU1lOQykKICAgIFJhdGVzOiA0
ODAwMAogICAgRGF0YSBwYWNrZXQgaW50ZXJ2YWw6IDUwMCB1cwogICAgQml0czogMAogICAg
U3luYyBFbmRwb2ludDogMHg4MiAoMiBJTikKICAgIFN5bmMgRVAgSW50ZXJmYWNlOiAwCiAg
ICBTeW5jIEVQIEFsdHNldDogMQogICAgSW1wbGljaXQgRmVlZGJhY2sgTW9kZTogTm8KCkNh
cHR1cmU6CiAgU3RhdHVzOiBTdG9wCiAgSW50ZXJmYWNlIDAKICAgIEFsdHNldCAxCiAgICBG
b3JtYXQ6IFMyNF8zTEUKICAgIENoYW5uZWxzOiA4CiAgICBFbmRwb2ludDogMHg4MiAoMiBJ
TikgKEFTWU5DKQogICAgUmF0ZXM6IDQ4MDAwCiAgICBEYXRhIHBhY2tldCBpbnRlcnZhbDog
NTAwIHVzCiAgICBCaXRzOiAwCiAgICBTeW5jIEVuZHBvaW50OiAweDgyICgyIElOKQogICAg
U3luYyBFUCBJbnRlcmZhY2U6IDAKICAgIFN5bmMgRVAgQWx0c2V0OiAxCiAgICBJbXBsaWNp
dCBGZWVkYmFjayBNb2RlOiBObwo=
--------------864C9ECD76C3A14C8FC5A3F7--
