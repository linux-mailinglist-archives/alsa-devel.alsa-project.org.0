Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C2ABAB6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ECA21607;
	Fri,  6 Sep 2019 16:19:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ECA21607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567779644;
	bh=MYlcNpSqGFoN3bcTgcAedZmoq3SzIVY0XeQW/iqnO3s=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzdY7zZ1a6R2hJVQ9SIXh4Rv0yKY/LQQFK/l4ot4rgOrHlCPelg18VHXPX9mHfgfr
	 4kzGGafPPgZZPx3QY0wVZ8ePB6c6RWZcSXHG+yoHTG67gf/x1idXusIQHxMKyOySAB
	 aHy/01eekL/zZcev7dzWUn7E0c6V/G02wnV91LF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E422F80394;
	Fri,  6 Sep 2019 16:19:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADFECF80394; Fri,  6 Sep 2019 16:18:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1602AF80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1602AF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp
 header.b="GYqLz5mr"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="fj9MN+qx"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 5CE0E37E;
 Fri,  6 Sep 2019 10:18:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 06 Sep 2019 10:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=zOlFGyJX9AmkU3YQje9mso+gBw0
 yyyweX+YAb+3WQRk=; b=GYqLz5mr4tXyK7LrweIk79lDcwFugcg8Y2MADMLfK+U
 HohiWG5n8EU6M2777NAXMgdMYUxEazK7MJsqyBpsTcS6gdaRe/dheUemT/AQtLda
 QWotKd5UG63zyxScJMBfCPms5PZs2fBXvMzfN3jkffsz87igi/PxowoR9ml4fNaL
 MhQX19/llSJNEpAOX0oxtDikBpz8EmMZa2DT+L9tmDcM+eIcnFsEv7lFfefUOLpc
 k9BAXHObwQK6zotScoi3aoFuvt4AImBV4rGCINVbO8Jeta7qWJ2XPDnvBJ33S/xX
 NnBHrHphHEtvN+mO5tM3yjpvbxXnc+u/WV3fqtR51aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zOlFGy
 JX9AmkU3YQje9mso+gBw0yyyweX+YAb+3WQRk=; b=fj9MN+qxT6MTyDbanKwTLe
 cr4lYNF6IqPC6iTh8ZVwRLi414BZHwrYn4cpLYLbCfBoOyiLb3/EfClc0ZJAMCjo
 XyFLMdzdq9qwjtZDn6BpsPuTuzYOYeAEnqE70OrbeMdnxWNirHgFoY4xr+UT08Ak
 pyS2+QhmNy03gUcosPUe+Y2gQMpqsVlk7U6AJqh8a7TuuD1p1alEz1zk0QUFexkX
 fItA293jaPjVIW2DJcfsK0kk9IiaFRepkQdVvtLkBwM8y7MfOgQG3iOcMUJ+r92B
 jYelT+C3enao6IEcIr78f8x4+xR6C4xNy4+DgcrYRxuUc6ENqlnpCmWm5y62PhSw
 ==
X-ME-Sender: <xms:xmpyXftoyAYpZeVU9mDSVTMKTwwAA9g8m_TvrTSc1wtg7gw4xzJveg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejledgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
 ertddtredvnecuhfhrohhmpefvrghkrghshhhiucfurghkrghmohhtohcuoehoqdhtrghk
 rghshhhisehsrghkrghmohgttghhihdrjhhpqeenucfkphepudegrdefrdejhedrudekud
 enucfrrghrrghmpehmrghilhhfrhhomhepohdqthgrkhgrshhhihesshgrkhgrmhhotggt
 hhhirdhjphenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:xmpyXTbLl0A0FZlN4mA-7YYR_Z0uXJ51Qkm5zNyu8FENOg8sAZ5Tkg>
 <xmx:xmpyXW_V_SLm41-k5MNDYGGbbPx5rA0enZRuZ9YY5_BLLtuP3ueg_w>
 <xmx:xmpyXbYd2hdDI3zJfcUFW_Jm7nSMsOdZqUSt2oFNxwOGiotbv1thAQ>
 <xmx:xmpyXXaZIYNavVc0dw9vd6sXC10l6FVvdxy5WwB6GVI44u-lkfkGrw>
Received: from workstation (ae075181.dynamic.ppp.asahi-net.or.jp [14.3.75.181])
 by mail.messagingengine.com (Postfix) with ESMTPA id F4008D6005A;
 Fri,  6 Sep 2019 10:18:44 -0400 (EDT)
Date: Fri, 6 Sep 2019 23:18:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: clemens@ladisch.de, tiwai@suse.de
Message-ID: <20190906141840.GA18662@workstation>
Mail-Followup-To: clemens@ladisch.de, tiwai@suse.de,
 alsa-devel@alsa-project.org
References: <20190906125544.13800-1-o-takashi@sakamocchi.jp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906125544.13800-1-o-takashi@sakamocchi.jp>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: firewire-tascam: add note for FE-8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, Sep 06, 2019 at 09:55:44PM +0900, Takashi Sakamoto wrote:
> Userspace applications can receive the transaction and parse it for
> control message via Linux FireWire subsystem, without any support by
> ALSA firewire-tascam driver. Therefore the driver gives no support
> for it.

For your information, this is a sample Python 3 script to listen the
transactions, utilizing PyGObject to load Hinawa-2.0 g-i.

```
#!/usr/bin/env python3

import gi
gi.require_version('Hinawa', '2.0')
from gi.repository import Hinawa

gi.require_version('GLib', '2.0')
from gi.repository import GLib

from signal import SIGINT
from struct import unpack, pack
from time import sleep

# Allocate address space to receive notification.
class Fe8Responder(Hinawa.FwResp):
    def __init__(self, unit):
        super().__init__()

        # Allocate within private space.
        addr = 0xffffe0000000
        while addr < 0xfffff0000000:
            try:
                self.register(unit, addr, 0x80)
                break
            except:
                addr += 0x80

        self.addr = addr

    def do_requested(self, tcode):
        frames = self.get_req_frame()

        # Just print the event. Practically translate it to general MIDI
        # messages and send the messages to the other processes via IPC such as
        # ALSA Sequencer.
        for i in range(0, len(frames), 4):
            print('{:08x}'.format(unpack('>I', frames[i:i+4])[0]))

        return Hinawa.FwRcode.COMPLETE


# For a case that the device is detected as '/dev/fw1'.
unit = Hinawa.FwUnit()
unit.open('/dev/fw1')
unit.listen()
resp = Fe8Responder(unit)

req = Hinawa.FwReq()

# Register the address.
addr_hi = pack('>H', unit.get_property('local-node-id'))
addr_hi += pack('>H', (resp.addr & 0xffff00000000) >> 32)
addr_lo = pack('>I', resp.addr & 0xffffffff)
req.write(unit, 0xffff00000314, addr_hi)
req.write(unit, 0xffff00000318, addr_lo)

# Enable notification.
req.write(unit, 0xffff00000310, pack('>I', 1))

# Turn on FireWire LED.
data = [0x00, 0x01, 0x00, 0x8e]
req.write(unit, 0xffff00000404, data)

# Wait for events.
def handle_unix_signal(loop):
    loop.quit()
loop = GLib.MainLoop()
GLib.unix_signal_add(GLib.PRIORITY_HIGH, SIGINT, handle_unix_signal, loop)
loop.run()

# Disable notification.
req.write(unit, 0xffff00000310, pack('>I', 0))

# Turn off FireWire LED.
data = [0x00, 0x00, 0x00, 0x8e]
req.write(unit, 0xffff00000404, data)

del req
del resp
del unit
```


Regards

Takashi Sakamoto
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
