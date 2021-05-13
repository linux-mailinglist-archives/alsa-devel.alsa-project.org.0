Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 179E637F8CC
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 15:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9930E17D1;
	Thu, 13 May 2021 15:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9930E17D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620912696;
	bh=sVnNtQv2K2Y1f75iKT3x+UM7vLb4r49d2IInCRba9oE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VAKPRPlqC8JQvniaBy8BYMZ0pIx6Qii9NTGa57PwXOS7UMaNn1pknVwVcFZXK3nvy
	 xKoOAcrSuokqw5bBgglAYpm5Ud8lbEu9ZWMV6NUxQzhSaD9TzSaBQTgaBdjf1Zwn75
	 946CnoAfyM0wn7xF+vI78hKa1GlMmwEM4KM4/47k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BA43F8016B;
	Thu, 13 May 2021 15:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D2D8AF8013A; Thu, 13 May 2021 15:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B56F9F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 15:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B56F9F8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="MH7trWGU"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="I7WGA+48"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 826A1A1A3D402;
 Thu, 13 May 2021 15:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620912577; bh=sVnNtQv2K2Y1f75iKT3x+UM7vLb4r49d2IInCRba9oE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MH7trWGU35DrUK5D/o0X91qDuat06/eDRjI9XJDecRki67WSUt6mj12F+r1qtLwv6
 QAtGIL+6vv3gnGmCmK8iqdyvZp8LMpyvXLbZ+jHdAo03Wpb5gKOcJOrUTbjJchSWST
 ThiC0SITS9ucPbOH3oGNe5YDOCi8Bh1pzSk3wAGg=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M92n7BAiYcFH; Thu, 13 May 2021 15:29:31 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id A2745A1A3D401;
 Thu, 13 May 2021 15:29:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620912571; bh=sVnNtQv2K2Y1f75iKT3x+UM7vLb4r49d2IInCRba9oE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=I7WGA+480vxCZlaarLH0UFOSbuPWoXKlfkFt8K9KcYI0LV0tDgNr5ByBNbxnR6cor
 f3wyoh4cpKzcbfI1WJLBWPqPQI9kQZ3YYtTKfkMREHSFpcJdEFquVnoxlQnktEcdEU
 km68yDGcZNYG+MYtTRiRIP8xu1toKEXkPMrVX2LQ=
Subject: Re: X-Fi USB HD - switching from USB1.1 to USB2?
To: Jaroslav Kysela <perex@perex.cz>
References: <8db4010d-462b-d044-38d9-3b527d84d70f@ivitera.com>
 <96d63dcf-9cbf-3f11-37a1-9ac190d283d5@perex.cz>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <2e199012-96dc-96bb-525f-db51d5359913@ivitera.com>
Date: Thu, 13 May 2021 15:29:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <96d63dcf-9cbf-3f11-37a1-9ac190d283d5@perex.cz>
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

Dne 07. 05. 21 v 10:50 Jaroslav Kysela napsal(a):
> Dne 07. 05. 21 v 10:37 Pavel Hofman napsal(a):
>> Hi,
>>
>> The X-Fi USB HD device (and likely the similar 5.1 model too) can run at
>> USB1.1 (with limited samplerates) and USB2 modes (with full specs). In
>> linux the device stays at USB1.1. If connected to Windows with stock
>> windows USB driver the same happens. However, when the Creative
>> proprietary driver is installed, the device switches to USB2 and
>> supports all features. When rebooting to linux without re-plugging, the
>> USB2 mode stays and the device offers its USB2 configurations to
>> snd-usb-audio.
>>
>> We captured USB packets in linux and Win7 with wireshark - both dumps
>> are included. The windows dump shows that in windows as well as in linux
>> the device starts as device 3.5.0 at USB1.1:
>>
>> DEVICE DESCRIPTOR
>>     bLength: 18
>>     bDescriptorType: 0x01 (DEVICE)
>>     bcdUSB: 0x0110
>>     bDeviceClass: Device (0x00)
>>     bDeviceSubClass: 0
>>     bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
>>     bMaxPacketSize0: 64
>>     idVendor: Creative Technology, Ltd (0x041e)
>>     idProduct: Unknown (0x30d7)
>>     bcdDevice: 0x0100
>>     iManufacturer: 1
>>     iProduct: 2
>>     iSerialNumber: 3
>>     bNumConfigurations: 1
>>
>>
>> After USB1.1 enumeration, the windows host controlled by the vendor
>> driver sends a request USR_FUNCTION_ABORT_PIPE to EP IN 6:
>>
>>
>> The EP IN 6  descriptor (from USB1.1 configuration):
>>
>> ENDPOINT DESCRIPTOR
>>     bLength: 7
>>     bDescriptorType: 0x05 (ENDPOINT)
>>     bEndpointAddress: 0x86  IN  Endpoint:6
>>         1... .... = Direction: IN Endpoint
>>         .... 0110 = Endpoint Number: 0x6
>>     bmAttributes: 0x03
>>         .... ..11 = Transfertype: Interrupt-Transfer (0x3)
>>     wMaxPacketSize: 64
>>         ...0 0... .... .... = Transactions per microframe: 1 (0)
>>         .... ..00 0100 0000 = Maximum Packet Size: 64
>>     bInterval: 1
>>
>> The request sent by the host is:
>> USB URB
>>     [Source: host]
>>     [Destination: 3.5.6]
>>     USBPcap pseudoheader length: 27
>>     IRP ID: 0xfffffa80073ee120
>>     IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
>>     URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
>>     IRP information: 0x00, Direction: FDO -> PDO
>>     URB bus id: 3
>>     Device address: 5
>>     Endpoint: 0x86, Direction: IN
>>     URB transfer type: USB IRP Info (0xfe)
>>     Packet Data Length: 0
>>
>>
>> The device responds with a proprietary response, with a different source
>> 3.5.127:
>> USB URB
>>     [Source: 3.5.127]
>>     [Destination: host]
>>     USBPcap pseudoheader length: 27
>>     IRP ID: 0xfffffa80073ee120
>>     IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
>>     URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
>>     IRP information: 0x01, Direction: PDO -> FDO
>>         0000 000. = Reserved: 0x00
>>         .... ...1 = Direction: PDO -> FDO (0x1)
>>     URB bus id: 3
>>     Device address: 5
>>     Endpoint: 0xff, Direction: IN
>>         1... .... = Direction: IN (1)
>>         .... 1111 = Endpoint number: 15
>>     URB transfer type: Unknown (0xff)
>>         [Expert Info (Error/Malformed): USBPcap did not recognize URB
>> Function code (report to desowin.org/USBPcap)]
>>             [USBPcap did not recognize URB Function code (report to
>> desowin.org/USBPcap)]
>>             [Severity level: Error]
>>             [Group: Malformed]
>>     Packet Data Length: 0
>>
>>
>> Immediately after that the device re-connects as 3.6.0 and reports its
>> USB2.0 description:
>>
>> DEVICE DESCRIPTOR
>>     bLength: 18
>>     bDescriptorType: 0x01 (DEVICE)
>>     bcdUSB: 0x0200
>>     bDeviceClass: Device (0x00)
>>     bDeviceSubClass: 0
>>     bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
>>     bMaxPacketSize0: 64
>>     idVendor: Creative Technology, Ltd (0x041e)
>>     idProduct: Unknown (0x30d7)
>>     bcdDevice: 0x0100
>>     iManufacturer: 1
>>     iProduct: 2
>>     iSerialNumber: 3
>>     bNumConfigurations: 1
>>
>> This is a regular USB-audio device which works OK in snd-usb-audio, as
>> tested after rebooting from windows to linux.
>>
>> Please is there any similar case handled by the existing alsa usb driver
>> which we could try to modify and test? My USB skills are not up to
>> writing the required code myself from scratch, unfortunately.
> 
> The switch can be probably implemented in the user space (libusb + udev
> rules). There is something similar for modems (usb_modeswitch).
> 
> 						Jaroslav

Thank you for your useful suggestion. I am trying to send the command
from userspace with pyusb. I can write/read from the given EP, but
honestly, my knowledge of USB details is very poor. I found a discussion
about MS Windows URB_FUNCTION_ABORT_PIPE which presumably is not
available in linux kernel directly, but as usb_clear_halt()
https://linux-usb-devel.narkive.com/jkl4OpsE/urb-function-abort-pipe .
But here I am in user space.

Please what should be the steps in emulating the above captured USB?
Just some quazi-code would suffice, I will find a way to send it from
userspace.

Thank you very much for any help.

Pavel.


