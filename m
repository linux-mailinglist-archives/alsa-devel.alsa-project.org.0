Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD68376268
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 10:52:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8201416AA;
	Fri,  7 May 2021 10:51:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8201416AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620377541;
	bh=iWNovQzDmsi+d1oVqTiyxGlDM7Z/nF/Y6aMulgz3U0E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BZ/PodBSDIr1KbNOVG9dSM5mBqNvT85OEz7DUYwstHjUTYajTLzrBlsrd//CKOpmH
	 vPIHoa6t5C8LjUpT/ew1Nc6dM/g+/f1J1qvAUztUHiVjSKAxUNKvNGR0iAIizFl7ev
	 z9rxJCvXppwcDXQ84N7LWIu7TeHLApKNGcb4+LaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16F92F80257;
	Fri,  7 May 2021 10:50:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B2A3F8025F; Fri,  7 May 2021 10:50:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A0AAF80105
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 10:50:40 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 6AF57A0040;
 Fri,  7 May 2021 10:50:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 6AF57A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1620377439; bh=4SYTgxkVDfWMJ/eG6hZjmcX0mhSKZ2gDxUHiJ0n2CgU=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=E4mfe6zDtz5Yz0jjDGYbDCFuIV3QGKBfGle65t8EliI7znnLeH8Wrf+OuU/rOwdWq
 8m73qp2BylnyowpH/usAvSZ4ui5FtRQ2RuiOQNIkkhd2SLlHodJyK/QNlXUH2OP1pg
 sh4q3zwD52BEvJwUTdSBv3Bcq9644k0fn/HHALcw=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  7 May 2021 10:50:37 +0200 (CEST)
Subject: Re: X-Fi USB HD - switching from USB1.1 to USB2?
To: Pavel Hofman <pavel.hofman@ivitera.com>
References: <8db4010d-462b-d044-38d9-3b527d84d70f@ivitera.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <96d63dcf-9cbf-3f11-37a1-9ac190d283d5@perex.cz>
Date: Fri, 7 May 2021 10:50:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8db4010d-462b-d044-38d9-3b527d84d70f@ivitera.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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

Dne 07. 05. 21 v 10:37 Pavel Hofman napsal(a):
> Hi,
> 
> The X-Fi USB HD device (and likely the similar 5.1 model too) can run at
> USB1.1 (with limited samplerates) and USB2 modes (with full specs). In
> linux the device stays at USB1.1. If connected to Windows with stock
> windows USB driver the same happens. However, when the Creative
> proprietary driver is installed, the device switches to USB2 and
> supports all features. When rebooting to linux without re-plugging, the
> USB2 mode stays and the device offers its USB2 configurations to
> snd-usb-audio.
> 
> We captured USB packets in linux and Win7 with wireshark - both dumps
> are included. The windows dump shows that in windows as well as in linux
> the device starts as device 3.5.0 at USB1.1:
> 
> DEVICE DESCRIPTOR
>     bLength: 18
>     bDescriptorType: 0x01 (DEVICE)
>     bcdUSB: 0x0110
>     bDeviceClass: Device (0x00)
>     bDeviceSubClass: 0
>     bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
>     bMaxPacketSize0: 64
>     idVendor: Creative Technology, Ltd (0x041e)
>     idProduct: Unknown (0x30d7)
>     bcdDevice: 0x0100
>     iManufacturer: 1
>     iProduct: 2
>     iSerialNumber: 3
>     bNumConfigurations: 1
> 
> 
> After USB1.1 enumeration, the windows host controlled by the vendor
> driver sends a request USR_FUNCTION_ABORT_PIPE to EP IN 6:
> 
> 
> The EP IN 6  descriptor (from USB1.1 configuration):
> 
> ENDPOINT DESCRIPTOR
>     bLength: 7
>     bDescriptorType: 0x05 (ENDPOINT)
>     bEndpointAddress: 0x86  IN  Endpoint:6
>         1... .... = Direction: IN Endpoint
>         .... 0110 = Endpoint Number: 0x6
>     bmAttributes: 0x03
>         .... ..11 = Transfertype: Interrupt-Transfer (0x3)
>     wMaxPacketSize: 64
>         ...0 0... .... .... = Transactions per microframe: 1 (0)
>         .... ..00 0100 0000 = Maximum Packet Size: 64
>     bInterval: 1
> 
> The request sent by the host is:
> USB URB
>     [Source: host]
>     [Destination: 3.5.6]
>     USBPcap pseudoheader length: 27
>     IRP ID: 0xfffffa80073ee120
>     IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
>     URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
>     IRP information: 0x00, Direction: FDO -> PDO
>     URB bus id: 3
>     Device address: 5
>     Endpoint: 0x86, Direction: IN
>     URB transfer type: USB IRP Info (0xfe)
>     Packet Data Length: 0
> 
> 
> The device responds with a proprietary response, with a different source
> 3.5.127:
> USB URB
>     [Source: 3.5.127]
>     [Destination: host]
>     USBPcap pseudoheader length: 27
>     IRP ID: 0xfffffa80073ee120
>     IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
>     URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
>     IRP information: 0x01, Direction: PDO -> FDO
>         0000 000. = Reserved: 0x00
>         .... ...1 = Direction: PDO -> FDO (0x1)
>     URB bus id: 3
>     Device address: 5
>     Endpoint: 0xff, Direction: IN
>         1... .... = Direction: IN (1)
>         .... 1111 = Endpoint number: 15
>     URB transfer type: Unknown (0xff)
>         [Expert Info (Error/Malformed): USBPcap did not recognize URB
> Function code (report to desowin.org/USBPcap)]
>             [USBPcap did not recognize URB Function code (report to
> desowin.org/USBPcap)]
>             [Severity level: Error]
>             [Group: Malformed]
>     Packet Data Length: 0
> 
> 
> Immediately after that the device re-connects as 3.6.0 and reports its
> USB2.0 description:
> 
> DEVICE DESCRIPTOR
>     bLength: 18
>     bDescriptorType: 0x01 (DEVICE)
>     bcdUSB: 0x0200
>     bDeviceClass: Device (0x00)
>     bDeviceSubClass: 0
>     bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
>     bMaxPacketSize0: 64
>     idVendor: Creative Technology, Ltd (0x041e)
>     idProduct: Unknown (0x30d7)
>     bcdDevice: 0x0100
>     iManufacturer: 1
>     iProduct: 2
>     iSerialNumber: 3
>     bNumConfigurations: 1
> 
> This is a regular USB-audio device which works OK in snd-usb-audio, as
> tested after rebooting from windows to linux.
> 
> Please is there any similar case handled by the existing alsa usb driver
> which we could try to modify and test? My USB skills are not up to
> writing the required code myself from scratch, unfortunately.

The switch can be probably implemented in the user space (libusb + udev
rules). There is something similar for modems (usb_modeswitch).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
