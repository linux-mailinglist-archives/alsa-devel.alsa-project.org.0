Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E07383B41
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 19:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C3101672;
	Mon, 17 May 2021 19:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C3101672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621272457;
	bh=GGC4D830nRLB6xDcm7kbAiFUDdc9s8Xc05K0Wf7YGv0=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YDrDe1Rn4k+80T046TsLGnCLVwD8Gz11jo1elmRHkqkZ57bNh5UzKMz9mjwUGmuio
	 xeCKmE4uzFBB8Y8anOfUCfX4Rx9PJPBbLhd2V4gVh2rB21K1QTazyTa4OJAdFyz5gE
	 25SLof11ayrufGRd/H2kPzc9e0jXZ1rNcmdV2FMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A948F80246;
	Mon, 17 May 2021 19:26:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA9AF8020B; Mon, 17 May 2021 19:26:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36CC7F80169
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 19:26:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36CC7F80169
Received: by m.b4.vu (Postfix, from userid 1000)
 id C97E1604B6D7; Tue, 18 May 2021 02:55:53 +0930 (ACST)
Date: Tue, 18 May 2021 02:55:53 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org
Subject: [BUG] ALSA: usb-audio: Scarlett 2 mixer driver fails on ehci-pci
Message-ID: <20210517172553.GA85102@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hi there,

I'm trying to track down an issue with my Scarlett Gen 2 mixer driver
that has been reported by a few people, and I can now reliably
reproduce the issue, but I need some help in figuring out where
exactly the issue is and how to fix it please.

The issue only occurs when attempting to use the interface on a USB
port using ehci-pci. xhci_hcd USB ports work fine.

The issue occurs when sending the first vendor-specific USB command,
but only when sending from the kernel driver. Sending the same USB
packets from user-space works fine(!).

I did initially think that the fault could have been due to earlier
USB messages putting the device into a state where it would reject the
vendor-specific USB commands, but I have carefully ruled that out &
have gotten identical usbmon traces from device power-on up until the
device responds differently, the only difference beforehand being
whether the USB packet was sent from the kernel driver or user-space.

The messages look like this in "usbmon -s 10000 -fu" when sent from
user-space (or when sent from the kernel driver when the interface is
plugged in to an xhci_hcd port):

ffff888125855200 1006026497 S Ci:2:040:0 s a1 00 0000 0005 0018 24 <
ffff888125855200 1006026680 C Ci:2:040:0 0 24 = 66191018 73190604 01000000 01000000 00040000 00000000

And like this when sent from the kernel driver when the interface is
plugged in to an ehci-pci port:

ffff88810487a300 3686673995 S Ci:2:036:0 s a1 00 0000 0005 0018 24 <
ffff88810487a300 3692178724 C Ci:2:036:0 -2 0

Identical messages sent according to usbmon, but they must be
different somehow!

The kernel code to send that message looks like this:

  return snd_usb_ctl_msg(
    dev, usb_sndctrlpipe(dev, 0),
    usb_req,
    USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_IN,
    0, interface, buf, size);

and helper.c snd_usb_ctl_msg() then calls usb_control_msg().

For sending arbitrary USB packets from user-space for testing, I'm
using libusb and:

  int ret = usb_control_msg(
    devh, reqtype, request, value, index, buf, size, 1000
  );

So, I presume usbmon isn't giving me the full story? How can I
determine the difference between the kernel and the user-space
usb_control_msg() functions? I see that I can #define EHCI_URB_TRACE
in ehci-hcd.c. Can anyone with more experience than me let me know if
I'm going in the right direction to track this down?

Thanks,
Geoffrey.
