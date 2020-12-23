Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 771332E1AA6
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Dec 2020 10:58:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B26A17C4;
	Wed, 23 Dec 2020 10:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B26A17C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608717517;
	bh=s6xfg+p/MyD4xGjYyM4ELwDcP6gn2NuWZR8JVBrM50Q=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=doEckLxhqv4liDm04Cse97T3o+JSjMtsgd2dze8ut3mZtBGIk1HYvYvOu+xbcwjQo
	 /vgJFfV+owPDhl3wDJL4IL8YVLgnIX5oQks4kz05pgTx7I8sX/zNDiNIXDIMgm3243
	 YsnqJ1oyXIKpOahwOm7IC8alKPss5coVk2yjn0eM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82669F801EB;
	Wed, 23 Dec 2020 10:57:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 14512F800BC; Wed, 23 Dec 2020 10:56:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8FC2DF80116
 for <alsa-devel@alsa-project.org>; Wed, 23 Dec 2020 10:56:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FC2DF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=metafoo.de header.i=@metafoo.de
 header.b="A3k0uc5u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=NXeKGEY3u7W/GCYxtzehcRKLskHSvgJV0Vp78KnqJhA=; b=A3k0uc5uZlNMfTObqYiiG8wiXW
 /GWW6ftsp/I0CUikRkyi2iqniquO9CG/8ZKLTSSU+Ee8OKnOKiTri3CUuBcoeE752izEqONMyn+FR
 I607GZ2Gm+7ftpSirab6ESMOSmunMWCdCcVTwhgQ3AKLzmxpmLB1e0VNaK+/PalF/Pml5K3em7zrO
 plQVPloB2u2G4huU7T742WjJz/WikogYhz3/dXkzQdt1fLU8jru9ZFC433g8D/SPMB4OFoXJhK3a1
 sbi7/TtDjV4pWImZJEv+R1wJeIN9nt6K5i6utjILLCttAXiPp6WUYtEYP/zcu2Jf0Lvn0Am3cEzQF
 nfklELzw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1ks0sy-0006tg-Q9; Wed, 23 Dec 2020 10:56:48 +0100
Received: from [62.216.202.54] (helo=[192.168.178.20])
 by sslproxy03.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1ks0sy-000S5Z-Md; Wed, 23 Dec 2020 10:56:48 +0100
Subject: Re: question about alsa tracepoints and alsa debugging
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 alsa-devel@alsa-project.org
References: <CALd3UbSrAqYFe5Z-S6NMKGaVMvOZx7C4zV5O7CwtTKPmV+UeVQ@mail.gmail.com>
 <CALd3UbS6MtKQEdhXQXH2GmU1EvZgS52XcTPihZ5wjb=4FaiYXA@mail.gmail.com>
 <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <8fc2a9ae-c87a-03cd-4349-81d0ea3380d3@metafoo.de>
Date: Wed, 23 Dec 2020 10:56:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CALd3UbQuDU6asvTkQTP48ct4hT9euUGUoenD5TW2ZD7gbuHPag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.102.4/26025/Tue Dec 22 13:51:35 2020)
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

On 12/23/20 5:31 AM, Bert Schiettecatte wrote:
> Hi all,
>
> I have a rk3288 board I am working with, it has two ADCs and one DAC.
> The ADCs are connected via an FPGA to the rk3288. The DAC is directly
> connected to the I2S port of the rk3288. The rk3288 generates the
> master clock. I am using buildroot and busybox and kernel 5.9.12
> (stable).
>
> I have a driver which receives the ADC data from the FPGA via SDIO.
> When I run speaker-test in the background and use arecord to record
> simultaneously in the foreground, both arecord and speaker-test seem
> to lock up. When I run speaker-test alone I do not have a problem. The
> playback device uses the rockchip_i2s.c driver while the capture
> device uses my SDIO driver.
>
> My driver based on dw_mmc.c calls snd_pcm_period_elapsed() for each
> buffer of frames that is ready. I can see that this is being called
> for a while when I start arecord in the foreground, until the lockup
> occurs. The moment I start arecord, the console output from
> speaker-test stops, so it's locked up by starting arecord.
Are these implemented as two separate sound cards? If so I don't see how 
they could interfere with each other. There should not be any shared 
resources or locks between them at least on the ALSA side.
> Previously this was working fine on kernel 4.11. However, since I updated to
> kernel 5.9.12 this no longer works. Has anything changed between 4.11
> and 5.9.12 that could be the cause of the problem?

There are almost 300k commits between v4.11 and v5.9.12 one of them 
surely could have added a new issue :)

If possible try to narrow this down a bit more, this will help to track 
this down. If this is a more general issue it is quite likely that this 
is a more recently introduced problem, otherwise others would have 
already run into it. Maybe try one of the stable kernels like v5.4.

>
> commands used for starting playback / trace capture and for recording -
> ./perf record -F 99 -g -e snd_pcm:* -e sched:sched_switch -e
> sched:sched_wakeup -e irq:* speaker-test -D
> hw:CARD=ak4458ak5558aud,DEV=0 -c8 -r192000 -FS32_LE -tsine &
> arecord -Dhw:CARD=ak4458ak5558aud,DEV=1 -fS32_LE -c16 -r192000
> /mnt/ramdisk/rec.wav
>
> I enabled the kernel options as described at
> https://www.kernel.org/doc/html/v5.9/sound/designs/tracepoints.html
> and have used perf to record a trace, which can be access here -
> https://kernel-debugging.s3-us-west-1.amazonaws.com/perf.data.script.211220202054.txt
> (exported using "perf script")
>
> The trace file shows "lockdep_recursion" at some point so I am
> wondering if my problem has to do with a deadlock somehow being
> caused.

lockdep_recursion is not even a function. I think this is just an 
incorrectly resolved stack trace.

To check if there is a locking issue somewhere compile your kernel with 
CONFIG_PROVE_LOCKING=y

Do both devices I2S and MMC use the same DMA? If so I could see things 
going wrong there since that would be shared resources in the DMA 
driver. If possible try to run the MMC driver without DMA and see what 
happens.

- Lars

