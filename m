Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C737623C
	for <lists+alsa-devel@lfdr.de>; Fri,  7 May 2021 10:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E07B3169D;
	Fri,  7 May 2021 10:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E07B3169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620376789;
	bh=jNAfVIRoZkFEtdgkrLS3ecZjwjW5TryDNGg9s9SH74k=;
	h=From:Subject:To:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=G5zBcBV91xkl7CXX2k3v0eSNZw54SGQie5MsH/9j9wK1syAIIMHnm1eUEooe684qh
	 QyRy3fQsrKBfNqRPuBGHsmneMJqdOLYhR8hCinvvfFLGXnxUzi62F879ugQNXZDe3y
	 3MmWxslSGbcSwQxDbMlCZwjBfEButBeFuLkNBI5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83046F80108;
	Fri,  7 May 2021 10:38:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C34C4F80108; Fri,  7 May 2021 10:38:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9AB6F80105
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 10:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9AB6F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="BkX5znNn"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="gOYW9EX4"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 403DFA1A3D402
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 10:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620376684; bh=jNAfVIRoZkFEtdgkrLS3ecZjwjW5TryDNGg9s9SH74k=;
 h=From:Subject:To:Date:From;
 b=BkX5znNnqd7+3FMOj5iBg00WKN8wi1xVBKT/wlaVOUXQIHx3rwQnPIxYUo1oUHBS+
 8x7eqTb5bkJL5X2ZyU4UDK7g1KteJpxP54kDGTq3werU6UmHUGfixg3d5tQVOez78f
 i173ygRZrHC0jSsoBj3nsqGXzXme9Y+2nF3Nfb/U=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ms2XDea9n2a for <alsa-devel@alsa-project.org>;
 Fri,  7 May 2021 10:37:58 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id A5EE1A1A3D401
 for <alsa-devel@alsa-project.org>; Fri,  7 May 2021 10:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1620376678; bh=jNAfVIRoZkFEtdgkrLS3ecZjwjW5TryDNGg9s9SH74k=;
 h=From:Subject:To:Date:From;
 b=gOYW9EX4ZK0RdtlAkxvBlnWQjLspVmSpe4ssbr7keSOGwrJGI4GskUqJU0KcxVp7O
 rUHSBAkxiBnTsT2HmNZaAA0NH3WDXXFSbLGonsDQnRvHoh/70fOj0z+xmV9jSS9buw
 5Zr/YgOpbXEMnWrSefvNQGxafgyKuEuVlXSQTyVk=
From: Pavel Hofman <pavel.hofman@ivitera.com>
Subject: X-Fi USB HD - switching from USB1.1 to USB2?
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Message-ID: <8db4010d-462b-d044-38d9-3b527d84d70f@ivitera.com>
Date: Fri, 7 May 2021 10:37:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------BA38934F517A159C0FB828DB"
Content-Language: en-US
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
--------------BA38934F517A159C0FB828DB
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit

Hi,

The X-Fi USB HD device (and likely the similar 5.1 model too) can run at
USB1.1 (with limited samplerates) and USB2 modes (with full specs). In
linux the device stays at USB1.1. If connected to Windows with stock
windows USB driver the same happens. However, when the Creative
proprietary driver is installed, the device switches to USB2 and
supports all features. When rebooting to linux without re-plugging, the
USB2 mode stays and the device offers its USB2 configurations to
snd-usb-audio.

We captured USB packets in linux and Win7 with wireshark - both dumps
are included. The windows dump shows that in windows as well as in linux
the device starts as device 3.5.0 at USB1.1:

DEVICE DESCRIPTOR
    bLength: 18
    bDescriptorType: 0x01 (DEVICE)
    bcdUSB: 0x0110
    bDeviceClass: Device (0x00)
    bDeviceSubClass: 0
    bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
    bMaxPacketSize0: 64
    idVendor: Creative Technology, Ltd (0x041e)
    idProduct: Unknown (0x30d7)
    bcdDevice: 0x0100
    iManufacturer: 1
    iProduct: 2
    iSerialNumber: 3
    bNumConfigurations: 1


After USB1.1 enumeration, the windows host controlled by the vendor
driver sends a request USR_FUNCTION_ABORT_PIPE to EP IN 6:


The EP IN 6  descriptor (from USB1.1 configuration):

ENDPOINT DESCRIPTOR
    bLength: 7
    bDescriptorType: 0x05 (ENDPOINT)
    bEndpointAddress: 0x86  IN  Endpoint:6
        1... .... = Direction: IN Endpoint
        .... 0110 = Endpoint Number: 0x6
    bmAttributes: 0x03
        .... ..11 = Transfertype: Interrupt-Transfer (0x3)
    wMaxPacketSize: 64
        ...0 0... .... .... = Transactions per microframe: 1 (0)
        .... ..00 0100 0000 = Maximum Packet Size: 64
    bInterval: 1

The request sent by the host is:
USB URB
    [Source: host]
    [Destination: 3.5.6]
    USBPcap pseudoheader length: 27
    IRP ID: 0xfffffa80073ee120
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
    IRP information: 0x00, Direction: FDO -> PDO
    URB bus id: 3
    Device address: 5
    Endpoint: 0x86, Direction: IN
    URB transfer type: USB IRP Info (0xfe)
    Packet Data Length: 0


The device responds with a proprietary response, with a different source
3.5.127:
USB URB
    [Source: 3.5.127]
    [Destination: host]
    USBPcap pseudoheader length: 27
    IRP ID: 0xfffffa80073ee120
    IRP USBD_STATUS: USBD_STATUS_SUCCESS (0x00000000)
    URB Function: URB_FUNCTION_ABORT_PIPE (0x0002)
    IRP information: 0x01, Direction: PDO -> FDO
        0000 000. = Reserved: 0x00
        .... ...1 = Direction: PDO -> FDO (0x1)
    URB bus id: 3
    Device address: 5
    Endpoint: 0xff, Direction: IN
        1... .... = Direction: IN (1)
        .... 1111 = Endpoint number: 15
    URB transfer type: Unknown (0xff)
        [Expert Info (Error/Malformed): USBPcap did not recognize URB
Function code (report to desowin.org/USBPcap)]
            [USBPcap did not recognize URB Function code (report to
desowin.org/USBPcap)]
            [Severity level: Error]
            [Group: Malformed]
    Packet Data Length: 0


Immediately after that the device re-connects as 3.6.0 and reports its
USB2.0 description:

DEVICE DESCRIPTOR
    bLength: 18
    bDescriptorType: 0x01 (DEVICE)
    bcdUSB: 0x0200
    bDeviceClass: Device (0x00)
    bDeviceSubClass: 0
    bDeviceProtocol: 0 (Use class code info from Interface Descriptors)
    bMaxPacketSize0: 64
    idVendor: Creative Technology, Ltd (0x041e)
    idProduct: Unknown (0x30d7)
    bcdDevice: 0x0100
    iManufacturer: 1
    iProduct: 2
    iSerialNumber: 3
    bNumConfigurations: 1

This is a regular USB-audio device which works OK in snd-usb-audio, as
tested after rebooting from windows to linux.

Please is there any similar case handled by the existing alsa usb driver
which we could try to modify and test? My USB skills are not up to
writing the required code myself from scratch, unfortunately.

Thanks a lot,

Pavel.




--------------BA38934F517A159C0FB828DB
Content-Type: application/gzip;
 name="X-Fi USB HD WIN7 driver creative 1.3.26.25.pcapng.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="X-Fi USB HD WIN7 driver creative 1.3.26.25.pcapng.gz"

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
5XBqARxdhwsfhFML4FAd/g1UjytuUGMAAA==
--------------BA38934F517A159C0FB828DB
Content-Type: application/gzip;
 name="xfi-linux-usb-cap.pcapng.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="xfi-linux-usb-cap.pcapng.gz"

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
KxPLiex/n1u38Tec3HeojIMAAA==
--------------BA38934F517A159C0FB828DB--
