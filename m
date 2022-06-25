Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B8955A89B
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 12:18:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1509173B;
	Sat, 25 Jun 2022 12:17:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1509173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656152312;
	bh=2lcG7v4KHB62VHk0Eev8KTk8NwGztNLbSVfutxoIDb4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WfnkHeL1YJi/TG+hZ9mAzfORvibESgAKddG8G81w4Ily7yLVvHRGAaX8ikMnmHB+0
	 Z5ioyKrgIohhb+CTYMXLw9lsShwQo/neCRjSP4JZNp+sXzPqDEIv1FjTiUsGyV5Slg
	 AFT02XVdr/Asm0pXMPLrzw7mQORCetq/0iBLLeHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3D39F8010B;
	Sat, 25 Jun 2022 12:17:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B498F80162; Sat, 25 Jun 2022 12:17:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mx1.mythic-beasts.com (mx1.mythic-beasts.com
 [IPv6:2a00:1098:0:86:1000:0:2:1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65B72F80107
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 12:17:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65B72F80107
Received: from [217.155.36.16] (port=41862 helo=[192.168.1.22])
 by mailhub-cam-d.mythic-beasts.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <john-linux@pelago.org.uk>)
 id 1o52qy-00992B-G3; Sat, 25 Jun 2022 11:17:25 +0100
Message-ID: <32f309b8-2722-6baa-18ae-95ad05c8dc53@pelago.org.uk>
Date: Sat, 25 Jun 2022 11:17:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: Quirks for MacroSilicon MS2100/MS2106
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
References: <795d8e1a-8fc7-2302-613e-ff1743de5c16@pelago.org.uk>
 <878rpnncov.wl-tiwai@suse.de> <fac65634-a702-84c4-da8d-60e01d309c7c@perex.cz>
 <298967f1-841b-4b39-9a6e-8bf22c49181d@www.fastmail.com>
 <3b6cef6b-674d-339a-7221-c72d54805bca@perex.cz>
 <YrZ8QDN5jobAq7jk@workstation>
From: John Veness <john-linux@pelago.org.uk>
In-Reply-To: <YrZ8QDN5jobAq7jk@workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BlackCat-Spam-Score: 0
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

Thanks for all the discussions so far. A lot of it is over my head, but 
I appreciate it!

> Even with this patch, there is a remaining problem, which is not present > in the MS2109. The sound sample values range from 0x0000 to 0x7fff, 
with> silence around 0x4000, i.e. 15-bit-ish audio. This actually sounds 
OK to> the ear (although half as loud as it should be), but looks odd 
when> looking at the waveform, and makes volume meters always think the 
sound> is very loud.
On further inspection, the last hex digit of the samples are always 0 or 
8. So the least significant three bits are always zero, and technically 
the values range from 0x0000 to 0x7ff8, not 0x7fff as I said before.

> To convert to s16le, I can bitshift one bit left, and subtract 32768.
> I'm told that this isn't something that can or should be done in the
> kernel, but should be in userspace. Any more advice on how to fix this
> remaining quirk would be very welcome.

I don't know if this makes things more complicated. It is still the case 
that the conversion described above to s16le makes the waveforms look 
correct (and the volume correct), even if the lowest four bits are zero.

John Veness
