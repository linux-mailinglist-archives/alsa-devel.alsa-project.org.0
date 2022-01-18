Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEED54924A9
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jan 2022 12:21:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FA0016BA;
	Tue, 18 Jan 2022 12:20:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FA0016BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642504892;
	bh=sCHZeuXpHh7kWO1NdHGPUpAW+oHEv5N2RiIZ7ds/9s4=;
	h=Date:To:References:From:Subject:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldsnee7rs2vag8BsZbWjI5RY42v2kP6F0NHDZfVGZkdT4yheMSd7VFa63o50/Nlmv
	 A3BVPorBi7CKFKZhIR7nHwWfzA0oSUT7oNwIKYsBU7s9w+nQgfMhYzsrMw8NnSgPkd
	 nDZeXmEbyFSyTdbtMm5dIoTaOh4/bwDl0dW6wCsI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1B4BF80240;
	Tue, 18 Jan 2022 12:20:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7988DF8023B; Tue, 18 Jan 2022 12:20:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from server1.nandakumar.co.in (nandakumar.co.in [198.100.152.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0B7EF800D8
 for <alsa-devel@alsa-project.org>; Tue, 18 Jan 2022 12:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0B7EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nandakumar.co.in header.i=@nandakumar.co.in
 header.b="jYExgcKm"
Received: from [192.168.100.185] (unknown [61.3.211.127])
 by server1.nandakumar.co.in (Postfix) with ESMTPSA id 66B4EC816B;
 Tue, 18 Jan 2022 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nandakumar.co.in;
 s=mail; t=1642504818;
 bh=sCHZeuXpHh7kWO1NdHGPUpAW+oHEv5N2RiIZ7ds/9s4=;
 h=Date:To:References:Cc:From:Subject:In-Reply-To:From;
 b=jYExgcKmfoZr8GyJ7jL0Wna2D8FgAC4ErTbLjD2krI2R9V2TMPdrMr53K69kYBAOV
 U6ZzoiMtkYspsgL6VTTfE+4wJrCnhvw4ISEzR32hJdXlOSoVcjjYqpCyxkEQyDes0V
 o5Za7jK84s/9dmfl3ZfMrV9TlI9op0WO5SoGRYVw=
Message-ID: <7a505959-3111-ffaa-7e03-3d9edcf03a4d@nandakumar.co.in>
Date: Tue, 18 Jan 2022 16:50:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <d61a41eb-a820-b1ca-dcf6-f447f80494a8@nandakumar.co.in>
 <YeB2zEnPlwVEKbTI@geday>
 <e1a7d67d-9862-3085-4e01-091ca443d2df@nandakumar.co.in>
 <YeDw89KZOh4yG7c8@geday>
 <e30962b0-931c-83b4-12fb-aa5e377b4f4d@nandakumar.co.in>
 <YeEp5xUjf1DAeGTY@geday>
 <2137c7e3-805b-7371-6042-1c2d5f61e302@nandakumar.co.in>
 <YeH5FlQzM9PNm6s0@geday>
 <5fba3e63-6fd2-de1c-1564-ac6b8870e730@nandakumar.co.in>
 <YeNuSip2RcH4DlV+@geday>
From: Nandakumar Edamana <nandakumar@nandakumar.co.in>
Subject: Re: Behringer UMC202HD issues and a partial solution
In-Reply-To: <YeNuSip2RcH4DlV+@geday>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

I feel like I'm doing something wrong with the build and install 
process. Maybe it's been the case for the last couple of days, in which 
case I'm terribly sorry for the incorrect test results.

The problem is, I don't get any printk() outputs at all. I'd given `echo 
"7" > /proc/sys/kernel/printk`, and I even added a usb_audio_dbg() line, 
which didn't get printed either.

Then I saw this:

$ find /lib/modules/ -name 'snd-usb-audio.ko'|xargs ls
...
/lib/modules/5.15.13/extra/usb/snd-usb-audio.ko
/lib/modules/5.15.13/kernel/sound/usb/snd-usb-audio.ko
...

modprobe is using the kernel/ version while my commands were installing 
the extra/ version.

Then I used the following, which also installed the extra/ version:
sudo make -C /lib/modules/5.15.13/build M=sound modules_install

Are these two versions supposed to exist? What is the solution? Telling 
the kernel build system to choose the correct location or configuring 
modprobe or depmod or something? I tried to look it up, but didn't find 
any official recommendation.

Anyway, I ran this:

# Because I have space constraints
# find /lib/modules/5.15.13/ -name '*.ko' -exec strip --strip-unneeded {} +
# update-initramfs -u -k 5.15.13

That updated the extra/ version of snd-usb-audio. But even after a 
reboot, this is what I get:

# modprobe -r -v snd-usb-audio
rmmod snd_usb_audio
rmmod snd_usbmidi_lib
# modprobe -v snd_usb_audio dyndbg==p
insmod /lib/modules/5.15.13/kernel/sound/usb/snd-usbmidi-lib.ko
insmod /lib/modules/5.15.13/kernel/sound/usb/snd-usb-audio.ko index=-2 
index=-2 index=-2 dyndbg==p
# dmesg |grep 'implicit:'

Another thing is, even though I'd commented out my clock workaround, I'm 
not getting any clock-related warning at all (I'm sure those went away 
after I edited clock.c, and then performed a build+install).

-- 
Nandakumar Edamana
https://nandakumar.org

