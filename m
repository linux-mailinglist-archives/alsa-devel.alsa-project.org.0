Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3762E1AE666
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Apr 2020 21:58:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3921666;
	Fri, 17 Apr 2020 21:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3921666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587153520;
	bh=TjQS62BhQYWzHLheN4JrcmFEUcUEsv2zXdqRYx7OPWA=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Cab9Y6QMfC8bw6Dr9Mxb1MXZK1g8b89GaxpVpkt7BPf+syE/1pX/haQ9nnBo+AqLF
	 ItP4lxoNbZYBtRgeOISvY1ITzTVSiDE4PMdf/7CWlUR+haQW4Uz8sJhMsl4BY9E7jv
	 jzR0BkLS/PwjzhxnLRuH0mVYushkNnBTMNZ9G4gc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AD7F8025F;
	Fri, 17 Apr 2020 21:56:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1816F80245; Fri, 17 Apr 2020 21:56:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 858AEF8012E
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 21:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 858AEF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Bm+2DNzO"
Received: by mail-lf1-x143.google.com with SMTP id h6so2815748lfc.0
 for <alsa-devel@alsa-project.org>; Fri, 17 Apr 2020 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rHO8ss8cWyNdi/+Xjl1djUCrSYC338F8uVEr+rv7X0Y=;
 b=Bm+2DNzO54NqhtE0pb+fnTXW08nMnqaf6HgYOGJzf/pFHiL//3MpEABA6SBzU6wPr/
 PNby/FXG3kNU4VzHi0tIx2NjQSiqINgT0bjF8oKT/bXNS+pi9M16aOXzay/m198gcyII
 1ykoUEqNtx8id2dldhuPBNRy9BtJUtSkhgdf55ZUgdpIfEf5HZjFWrLCCxV1Cec0zssM
 o0bEMo7mAq6hZ9UwLXlAXfDeo3EM6JT879xKSY7oB977wYOd8CCHZKlEHz0s3OeXoYbc
 sPKIIxB/DoujQ/bkElluFK+IrIiCcg84MHTuN6kXW+EHRYW08kz4ldTz+PREttq5Cw6L
 uUwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rHO8ss8cWyNdi/+Xjl1djUCrSYC338F8uVEr+rv7X0Y=;
 b=LUyJmVlLM5yiiuelE6X68i7LUAcYFC9LJu3XrcWLK9rugpHQNed2M7s/PYY5piv/eb
 8Tvhe5Qwj0NvV/u/CBz0PsduCd14Tu6Fg+CTHP/xM2+5vjIb6rVasdV2AFazKMUB142x
 IVKxqcVhiKQn97kDLMf4sAqJNulcz5f5FJzS9LvCOxud7SWzhlfhf4NjxCiWIo7GcArc
 z5LmfqcUzXFa0yCrNBGSDLAAkot8uYz+LnoJmioJsdABxHdnAHYAW5Fgs7mdmwj943Ln
 XhbMfI4DdOtAYmldC6awwmoYTjOPXPWvFYWlGq0jGEortwVQLe4Mb8D0Wf1CPnOVQBw6
 yvEw==
X-Gm-Message-State: AGi0PublZtEQX3fwZcfBjPjY6Gw8cLE9MyHGigSC6tS3iiM0SO9oT9wo
 orHRxVAruoHi3EejZIejYeO1PXE+DnqvbOiq9TBAPgZ8GaY=
X-Google-Smtp-Source: APiQypKRtmNRQY89PUL9lWX40lJMi8/eSBGPdhM+40oElqH8XsWNBgICHhHkx2N4fjinxCs/6s2HSBarzRQMHFmYFCY=
X-Received: by 2002:a19:b10:: with SMTP id 16mr3142194lfl.133.1587153405884;
 Fri, 17 Apr 2020 12:56:45 -0700 (PDT)
MIME-Version: 1.0
From: Gregorio Rodrigo <grrodre@gmail.com>
Date: Fri, 17 Apr 2020 21:56:35 +0200
Message-ID: <CAB1DPjYoOKSnnu3Yz88Y1AWrRT0E0WEjd-6d5Ar4yrrW6aasyw@mail.gmail.com>
Subject: Bug WD19 dockstation
To: alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
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

Hi everyone,
I am not sure if this is the proper way to submit a bug/ticket/question.

I posted a message here
https://github.com/edrose/dell-dock-audio-fix/issues/2#issuecomment-615290731
and got the suggestion to write to the alsa mail list.

I have a WD19 docking station and the lineout is not recognized. It seems
it is recognized as an input. However it works if I run the speaker-test
command. Anyone knows if I can apply those UCM settings or how could I do
it?

I copy here the message.

I have a WD19 docking station and i am facing the same problem.

Debian GNU/Linux bullseye/sid \n \l
Linux xps 5.5.0-1-amd64 #1
<https://github.com/edrose/dell-dock-audio-fix/issues/1> SMP Debian
5.5.13-2 (2020-03-30) x86_64 GNU/Linux

pactl list cards

Card #1 <https://github.com/edrose/dell-dock-audio-fix/issues/1>
Name: alsa_card.usb-Generic_USB_Audio_200901010001-00
Driver: module-alsa-card.c
Owner Module: 25
Properties:
alsa.card = "2"
alsa.card_name = "WD19 Dock"
alsa.long_card_name = "Dell-WD15-Dock"
alsa.driver_name = "snd_usb_audio"
device.bus_path = "pci-0000:00:14.0-usb-0:9.3.4:1.0"
sysfs.path =
"/devices/pci0000:00/0000:00:14.0/usb3/3-9/3-9.3/3-9.3.4/3-9.3.4:1.0/sound/card2"
udev.id = "usb-Generic_USB_Audio_200901010001-00"
device.bus = "usb"
device.vendor.id = "0bda"
device.vendor.name = "Realtek Semiconductor Corp."
device.product.id = "402e"
device.product.name = "USB Audio"
device.serial = "Generic_USB_Audio_200901010001"
device.string = "2"
device.description = "USB Audio"
module-udev-detect.discovered = "1"
device.icon_name = "audio-card-usb"
Profiles:
input:analog-stereo: Analog Stereo Input (sinks: 0, sources: 1, priority:
65, available: yes)
output:analog-stereo: Analog Stereo Output (sinks: 1, sources: 0, priority:
6500, available: yes)
output:analog-stereo+input:analog-stereo: Analog Stereo Duplex (sinks: 1,
sources: 1, priority: 6565, available: yes)
off: Off (sinks: 0, sources: 0, priority: 0, available: yes)
Active Profile: output:analog-stereo+input:analog-stereo
Ports:
analog-input-mic: Microphone (priority: 8700, latency offset: 0 usec)
Properties:
device.icon_name = "audio-input-microphone"
Part of profile(s): input:analog-stereo,
output:analog-stereo+input:analog-stereo
analog-output-headphones: Headphones (priority: 9900, latency offset: 0
usec)
Properties:
device.icon_name = "audio-headphones"
Part of profile(s): output:analog-stereo,
output:analog-stereo+input:analog-stereo

http://alsa-project.org/db/?f=616054544b8748431c354f1affbfd705c88fad37

If i run manualy speaker-test and select the proper subdevice, i get sound
over the lineoutput. I cannot set it as default (or i dont know how to do
it).
It seems that if i am able to set the UCM2 configuration from WD15 should
work. Any advise?

Thank you in advance.
