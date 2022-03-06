Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF74CF319
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 09:01:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F299E171A;
	Mon,  7 Mar 2022 09:00:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F299E171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646640077;
	bh=q/NzmywQOjZmGS9Wryb56KK9ZpOHfq5wvsJc+MQijW0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HYrv8meIZK+u01O8SkrUQ2LI1exGnvBeFxDAFJ9eEZcVPqepZJihNJJqkomY3wmyL
	 QZbMqIlPjxXMSvCNUPtsVxhzG6jSyOHZ2tRn/egDxCqhu4Rssr7U+uP+GDOS5px0Jv
	 BQOb9kowH2U3p9nHQXUHA0Fxg5cKRAh/LtyGXEu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55F5DF80159;
	Mon,  7 Mar 2022 09:00:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C12BF8019D; Sun,  6 Mar 2022 23:18:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailout08.hostingdiscounter.nl (mailout08.hostingdiscounter.nl
 [IPv6:2a00:1478:200:0:f:1099:0:1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E340F800E9
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 23:18:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E340F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=veniogames.com header.i=@veniogames.com
 header.b="Uy36EdMk"
Received: from localhost (localhost [127.0.0.1])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTP id DB2A870A
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 23:18:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mailout08.hostingdiscounter.nl
Received: from mailout08.hostingdiscounter.nl ([127.0.0.1])
 by localhost (mailout08.hostingdiscounter.nl [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id uieTX9Jc7a7X for <alsa-devel@alsa-project.org>;
 Sun,  6 Mar 2022 23:18:05 +0100 (CET)
Received: from mail201.hostingdiscounter.nl (mail201.hostingdiscounter.nl
 [IPv6:2a00:1478:20:0:5:18:0:1])
 by mailout08.hostingdiscounter.nl (Postfix) with ESMTPS
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 23:18:05 +0100 (CET)
Received: from [192.168.1.104] (42-170-250-62.ftth.glasoperator.nl
 [62.250.170.42])
 by mail201.hostingdiscounter.nl (Postfix) with ESMTPSA id 1FD683F8EA
 for <alsa-devel@alsa-project.org>; Sun,  6 Mar 2022 23:18:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=veniogames.com;
 s=default; t=1646605085;
 bh=9rnv5+r0WAoLlkdm8seL2jpjWIWr0urTwV/ukfa9bok=;
 h=Date:From:To:Subject:From;
 b=Uy36EdMk6chhy4F0N5fWGBd8Dbb+deFoMhOAqHppb+0YZh5Xxqy30mflyCmnEWNyD
 qFOlaOZtzqcQNSsJbm86Y9z2OrnmlWZB/2BIhxDAq/0El4qRhoja8gq4dL6C2B9ulP
 1hhyEZat1TEMnUT60K6NzEpAIENpIkd27VwBLv7MbMVG3XGJfubQGSmSDiLg6pcCTm
 FmHfF4NQS4WCJjwsjahV+0I2mjnfZb4zffQvH9c2Y9NtnAGfzzaSJIiW8TgUU7MW/y
 utV7Pma+OcE3lHe9V8lYl4XhsG5KakyR8H2SzX3BHQXN+QXl4bqdlYACtu8PIPvTPX
 m0AyALENmDBzg==
Message-ID: <4e509aea-e563-e592-e652-ba44af6733fe@veniogames.com>
Date: Sun, 6 Mar 2022 23:18:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Ruud van Asseldonk <ruud@veniogames.com>
To: alsa-devel@alsa-project.org
Subject: Regression playing 24bit/96kHz audio on USB audio interface between
 5.10.94 and 5.15.21
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 07 Mar 2022 09:00:08 +0100
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

I have a program that configures a Behringer UMC404HD 192k USB audio 
interface for playback as follows (pseudocode):

   snd_pcm_hw_params_set_channels(pcm, hwp, 2);
   snd_pcm_hw_params_set_format(pcm, hwp, SND_PCM_FORMAT_S24_3LE);
   snd_pcm_hw_params_set_access(pcm, hwp, SND_PCM_ACCESS_MMAP_INTERLEAVED);
   snd_pcm_hw_params_set_rate(pcm, hwp, val=96000, dir=0);
   snd_pcm_hw_params_set_period_size_near(pcm, hwp, val=513, dir=0);
   // If I confirm at this point with snd_pcm_hw_params_get_period_size,
   // I get back 513.
   snd_pcm_hw_params_set_buffer_size_near(pcm, hwp, val=2052);
   snd_pcm_hw_params(pcm, hwp);
   // If I confirm with snd_pcm_hw_params_get_buffer_size,
   // I get back 2052.

On Linux 5.10.94 (specifically Arch Linux ARM package 
linux-rpi-5.10.94-1), this succeeds, and I can play back audio just 
fine. On 5.15.21 (specifically linux-rpi-5.15.21-3), all the calls 
succeed apart from the last one, which returns EINVAL.

(My actual program is written in Rust and uses a Rust wrapper library 
for libasound, https://docs.rs/alsa/0.6.0/alsa/, but the calls should be 
the ones listed.)

I confirmed with snd_pcm_hw_params_test_format that the S24_3LE format 
is supported. On both kernels it is successful. I confirmed with 
snd_pcm_hw_params_test_rate that 96 kHz is supported. On both kernels it 
is successful. There are differences though. When I query these:

   snd_pcm_hw_params_get_period_size_min
   snd_pcm_hw_params_get_period_size_max
   snd_pcm_hw_params_get_buffer_size_min
   snd_pcm_hw_params_get_buffer_size_max

Then on 5.10.94 (the good version), I get:

   period size min/max: 12/32768, buffer size min/max: 24/65536

But on 5.15.21 (the bad version), I get:

   period size min/max: 13/71332, buffer size min/max: 26/142663

Also, after I set the period size to 513, if I then query the buffer 
size min/max, on 5.10.94 I get:

   buffer size min/max: 1026/65536

But on 5.15.21 I get:

   buffer size min/max: 1027/142663

In lsmod, snd_usb_audio shows up, and from lsusb -v, the UMC404HD 
appears to be a standard USB audio interface. The lsusb output is 
identical on both kernels.

Please let me know if there is anything I can do to help further 
diagnose the issue, or if I should report this elsewhere.

Kind regards,
Ruud van Asseldonk
