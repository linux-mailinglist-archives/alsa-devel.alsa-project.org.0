Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4AB19E7AF
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 23:07:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 95B3D1676;
	Sat,  4 Apr 2020 23:06:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 95B3D1676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586034465;
	bh=v2CXSpJoadCQ6dRHwm+fqdNgulGXSGavH5jMpSzEFok=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m5wFw2yZj7YPFSBtHxbvfh5jVLEWwmGZkVeQ2GI/Om9SzJZ/mxtkMNnYcOOzj1dTU
	 71vzzZhlR9RN7WrIzF5TyfZssjwmqWMD2bTWdf9oe4Kb+6C1GPq0hr51qFYQDcHqZe
	 iOtQZmFcToms4IRzda6x/em9DfVh4FTh7j7BNp2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C151F8014B;
	Sat,  4 Apr 2020 23:06:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 656AAF80148; Sat,  4 Apr 2020 23:05:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5E06F800E4
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 23:05:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E06F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="km7qdvU+"
Received: by mail-oi1-x22c.google.com with SMTP id k9so9558626oia.8
 for <alsa-devel@alsa-project.org>; Sat, 04 Apr 2020 14:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=v2CXSpJoadCQ6dRHwm+fqdNgulGXSGavH5jMpSzEFok=;
 b=km7qdvU+OLOF6JfXzO5yT2M8PGVfH/VN31O1j8roraZTxPYwQ0zU9XbpHXaDdQWdx7
 Wc4HusvI9NTCjyuCrvIzWaBl0JsPU+boWSWgKtfm79E1T28+w782DMXHS/zpFkPeJYDj
 OAlrS3KqUkK0c+WNMPJomC+iRqCUbZ/E8FZIZJsvTDG2fVsPvm3/aeVV9D1DHrBsIBFc
 RoL3RpMHxzpexirwZ/aKIJlniV+Racb2/X2WrA6tnFtgRthQ2QOVGLAwTayyKfyw4jot
 JzRrOqIe5ceOPNLDDc+tz6saUv82DIwhe1sqqJHATZj0t6R1DIROlkMHV+jgzYz5s16Z
 oyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=v2CXSpJoadCQ6dRHwm+fqdNgulGXSGavH5jMpSzEFok=;
 b=SPo7g3lgfyBX3FuJQEG6pr8X77ftN8otXiRPxKEqFUziS6neaoJ49kAJBp5ZMnXa6q
 TTpgSdM4ew0+Xqoc1g5oi8ZaEH345yvbcfEeBwYntftvnJi6MgKPjROQPzL72/65jxdT
 uXgm4+isoyQTd7vsABQ8obYSBgwNwf0MFhqKJfhdVm9E85BHQNSZgH9SQCBwsF+5ftaP
 3Sk9/qXNzra3RcxK571/mxu61/5hTcHd/vY3lpCXVNyiWHCqqaC+8sLQqvW7nXUMyREe
 vKAiLbFSr127q+M5LEY6vsiNo+wNEqREeK1EMhEro8ue0zpBv/ysLvaUYAcEGcYAkgPm
 dKsw==
X-Gm-Message-State: AGi0PuYf3cIleV31ZJZQInO5bdWTOzaCuc5DLRgmAalV3KymXXebdW6Q
 TrgexRg5mVdjEE+Il1tA3Tjcol/2uA2XnCcpAdc=
X-Google-Smtp-Source: APiQypILfBdPZ+s8uaj6hAz475I61hz5HRPIKdUK+rI779E2aIThoSKqFb0oH+9s4/mVsgwCW9hzDh3b5ZanztQrLeA=
X-Received: by 2002:aca:5403:: with SMTP id i3mr8026334oib.174.1586034352811; 
 Sat, 04 Apr 2020 14:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPXXXSDVGeEK_NCSkDMwTpuvVxYkWGdQk=L=bz+RN4XLiGZmcg@mail.gmail.com>
 <CAPXXXSBYcU1QamovmP-gVTXms67Xi_QpMCV=V3570q1nnuWqNw@mail.gmail.com>
In-Reply-To: <CAPXXXSBYcU1QamovmP-gVTXms67Xi_QpMCV=V3570q1nnuWqNw@mail.gmail.com>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Sun, 5 Apr 2020 00:05:41 +0300
Message-ID: <CAB=otbS1RTnn9PixJYjsW4U_37GcFvR-O3WZ-7YnamdcDGKvRA@mail.gmail.com>
Subject: Re:
To: Colin Williams <colin.williams.seattle@gmail.com>,
 Linux USB <linux-usb@vger.kernel.org>, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
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

Please also add to CC related mailing lists (alsa-devel, linux-usb) rather
then directly emailing - community may also help with the issue. Also it can be
googled so if somebody else have same issue it can find answers faster.

On Fri, Apr 3, 2020 at 10:56 AM Colin Williams
<colin.williams.seattle@gmail.com> wrote:
>
> https://ubuntuforums.org/showthread.php?t=2439897
>
> On Thu, Apr 2, 2020 at 4:50 PM Colin Williams <colin.williams.seattle@gmail.com> wrote:
>>
>> Hello,
>>
>> Is it possible that one of these commits or related broke support for the Blue Mic Yeti?
>>
>> https://github.com/torvalds/linux/blame/ac438771ccb4479528594c7e19f2c39cf1814a86/sound/usb/stream.c#L816

Tha'ts workaround to ignore last altsetting which is the same as previous.
During UAC3 implementation, I reimplemented that workaround carefully,
but I didn't have (and still do not own) any Blue Mic USB device.
I don't know whether it was tested after that by anyone.

>>
>> I am getting the following when I plug my mic in:

Which kernel version is that? Have you tried latest Linux Kernel?

>>
>> [ 1283.848740] usb 1-1.2: new full-speed USB device number 82 using ehci-pci
>> [ 1283.964802] usb 1-1.2: New USB device found, idVendor=b58e, idProduct=9e84, bcdDevice= 1.00
>> [ 1283.964808] usb 1-1.2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
>> [ 1283.964810] usb 1-1.2: Product: Yeti Stereo Microphone
>> [ 1283.964812] usb 1-1.2: Manufacturer: Blue Microphones
>> [ 1284.080671] usb 1-1.3: new low-speed USB device number 83 using ehci-pci
>> [ 1284.784678] usb 1-1.3: device descriptor read/64, error -32
>> [ 1285.180674] usb 1-1.3: device descriptor read/64, error -32
>> [ 1285.992682] usb 1-1.3: new low-speed USB device number 84 using ehci-pci
>> [ 1286.696672] usb 1-1.3: device descriptor read/64, error -32
>> [ 1287.092695] usb 1-1.3: device descriptor read/64, error -32
>> [ 1287.200804] usb 1-1-port3: attempt power cycle
>> [ 1287.804662] usb 1-1.3: new low-speed USB device number 85 using ehci-pci
>> [ 1288.220686] usb 1-1.3: device not accepting address 85, error -32
>> [ 1288.508685] usb 1-1.3: new low-speed USB device number 86 using ehci-pci
>> [ 1288.924690] usb 1-1.3: device not accepting address 86, error -32
>> [ 1288.924916] usb 1-1-port3: unable to enumerate USB device
>> [ 1288.925391] usb 1-1.2: USB disconnect, device number 82
>> [ 1289.308736] usb 1-1.3: new low-speed USB device number 87 using ehci-pci
>> [ 1289.596727] usb 1-1.3: device descriptor read/64, error -32
>> [ 1289.992635] usb 1-1.3: device descriptor read/64, error -32
>> [ 1290.596683] usb 1-1.3: new low-speed USB device number 88 using ehci-pci
>> [ 1290.888718] usb 1-1.3: device descriptor read/64, error -32
>> [ 1291.284673] usb 1-1.3: device descriptor read/64, error -32
>> [ 1291.392928] usb 1-1-port3: attempt power cycle

Looking at this log, it seems the issue happens during enumeration,
so mentioned workaround isn't executed yet at this moment.
So it seems this is related to USB core, not to ALSA driver.

Thanks,
Ruslan

>>
>> Furthermore, there is some evidence this is happening to other users:
>>
>> https://askubuntu.com/questions/1027188/external-yeti-michrophone-not-detected-on-ubuntu-18-04
>>
>> Best Regards,
>>
>> Colin Williams
>>
>>
