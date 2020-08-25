Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0F2251CA9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 17:51:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765F91688;
	Tue, 25 Aug 2020 17:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765F91688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598370680;
	bh=WPGBfT6+wJd5mO9GZi4RvVOLaEga3u2PLY/hSoyNobE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SHULkT0IUnAZ4rf5PFrmDWfI1wdBqMSa9kkH6guURSZj15CpN5V3FpffG/iXy8hoJ
	 sNxhZ2S+4MspD+TaAcoNiPdqKa0KCV/RBpiLqZO7NZoMAILY0yO9ISdToLUtv2Ntu/
	 5qdIZsmC6TD/fM3L1ou8tnKz1qB2TJhMuxFoAxS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E02FF800EB;
	Tue, 25 Aug 2020 17:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E19E5F8025A; Tue, 25 Aug 2020 17:49:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A27EF800EB
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 17:49:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A27EF800EB
Received: from [192.168.1.3] ([46.142.162.226]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mlf8e-1ktFQN0hve-00iliU; Tue, 25 Aug 2020 17:49:25 +0200
Subject: Re: [PATCH] Add basic capture support for Pioneer DJ DJM-250MK2
To: =?UTF-8?B?RnJhbnRpxaFlayBLdcSNZXJh?= <konference@frantovo.cz>
References: <20200825153113.6352-1-konference@frantovo.cz>
 <1b3af11b-939e-1822-2d87-fd1f64dd7200@frantovo.cz>
From: Fabian Lesniak <fabian@lesniak-it.de>
Autocrypt: addr=fabian@lesniak-it.de; keydata=
 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
 k8EdVs3L
Message-ID: <dddee951-0722-b355-09ae-8519220f77cd@lesniak-it.de>
Date: Tue, 25 Aug 2020 17:49:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1b3af11b-939e-1822-2d87-fd1f64dd7200@frantovo.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Provags-ID: V03:K1:ac6eSwANihYTWLwOcF/EFeGB0lQojzNzO0A6QwVss74dAuTSmeO
 CwDmsxJ20PFswuU2m/m6+QVjeCAQ66yb59q5SdbhIgqTl2vEyYH4TN9LPCciPPOglEf2N56
 FXRvB8be9mX45CnQAAET+vV/j+IxzmqdJUOCVkkmueujji87U61Njj3vU4QboqA5Mv4RkeL
 cSxaaT4DhxbULdodxys8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FBzM1KpRm8w=:byp/gRx7rxWye+/V8hKTJn
 dVVbt20hxd5dyUT8na26cgMO2DFEZbc5U0b2I4emZi0KtfbSAiJHmO7VvMan1y/7iLHNFGLqL
 c4M2XHE79MTO3Z2ixlo4VPIzBfguKJheBAjGCeIU7xXhAfW73K6dfGxEcbDcpNLrvnN0/kv0d
 gJhSvfl2rsdxjkeGw1Aa8shl5l9jqQtQnG6ZMcNTC8C/+MUW6E92U8qH4gWtKihbFANk/x6FR
 SaE+YQFP62gJHmqUIvYU2OUIuM49SmWQsNYB2kFe2cWRGpyYmqVK9uMfTXreUjqqIv7bth5Cl
 6BiNRTk0GNESHIHhgirtBqa81tf09kJpRSx0ukPj5GGIIqkNtaLDyIhJveSpe6jNKZx/6hwhZ
 YpqeO1iJdIED9qkkdTqwwYK6vomobKr51f4s7G2ZnR3PXeoKWDn3wdK9Co4BpXbK2XsYGxok6
 F8iDFhqwiriFmqcYXYPJ9pbo6oh1YlPzRom7T7hsMAseF1Ym06VKNcFNkCmgVaWI+fAI88S2E
 DfQsg+U5aaLzqP3USNks6kQ/lDUybiXTNfXvgnPi6daW0WbYs1coOvpFZaoyQ5XLaaPv3Xejl
 lfYiKTtZIRfL3oyPxb98o5m4Uyw+0AgTZ3fueyEvp6PyJYXVX47GpjHV3/k7ese6Agx0HZ3gB
 h0/Mjqla8c/Mu9n+Hgr7QUyHPjExdxzn38k3pe1U4WSTmP1uOJ9j3d2xunfoFnG/y7nMISNrH
 XikXxBT6l30aIoab4Je6efVQk7T0G/giexj14l9SV3XqeW4L0b4MaTSpBQQIrJGBKNlJSIfNw
 k++YoYLzLdVhpOjkosIvZTqxcBTz50iclY1Q3e4aKk/2Nb+Jde+ODePEh9SlrwRXC60kx9u
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Dmitry Panchenko <dmitry@d-systems.ee>
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

Hello Franta,
> 2) The channels 1-2, 2-3 and 3-5, both recording and playback, can be configured/mapped (by an USB URB command) to various sources. I wrote some userspace C code for testing purposes that uses libusb-1.0/libusb.h, so I can switch the channels. How this feature should be provided to the user? Should the USB commands be issued from the kernel driver or from userspace? Is there any existing similar example?

I have implemented these controls in mixer_quirks.c back when I fought
with these mixers. As I have not tested them against the current master
and your changes yet, I'll just drop a gist with the old patches from
last September if you want to have a look (patch 0003 is the one with
the mixer controls):

https://gist.github.com/flesniak/074ab23bbc833663b782f44174eae6a4

I will try to test that single patch together with your patches and
submit them if it works. I remember faintly that alsamixer did not show
the TLV dB range correctly, probably I was using DECLARE_TLV_DB_RANGE
incorrectly.

Cheers

Fabian

