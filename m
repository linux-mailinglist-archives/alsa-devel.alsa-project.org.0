Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B425A9D5
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:02:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDAD8180B;
	Wed,  2 Sep 2020 13:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDAD8180B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599044572;
	bh=j4+uze57jaKSPdl86kFYD2e9uQbKV5r15/uY12dIyTg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UO+i7TL3NHNUXSggTrIdTvDSJaXVmOLH66qP7Ag5X1vsy2d84+x9/vigy+mauzbSP
	 KSiiM8BI2qytZ/d5YBI/P64mDYRXme1pTFZ9k/wGzHnLb0XIQmNo2l342YaG8ghq2J
	 rekYzildzHz8LezmnwPTY9GtqpvGAV1QPQ5KH2ao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6146F80257;
	Wed,  2 Sep 2020 13:01:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 095DCF80268; Wed,  2 Sep 2020 13:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF6CCF80212
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6CCF80212
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KQUO8aM0"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B4462098B;
 Wed,  2 Sep 2020 11:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044458;
 bh=j4+uze57jaKSPdl86kFYD2e9uQbKV5r15/uY12dIyTg=;
 h=From:To:Cc:Subject:Date:From;
 b=KQUO8aM0q8lsyoUUjY1fm6YU4t2DKhsqnX34r/3z+mUnF/A0LAw4CpM+HoGp5C8jE
 ALIP8QBgkZVfrtSQC+aqQvkiNcSo74O8YlA/2qydObCgkoRhhadHuwtgZFMwm+W+Pt
 XNZGfKbfo3XL74KKdqVUQNqBunRG7kfSVX5o+8Uo=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 00/10] USB: new USB control message helper functions
Date: Wed,  2 Sep 2020 13:01:02 +0200
Message-Id: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org
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

In a recent discussion about a USB networking bug found by syzbot, and
fixed by Himadri Pandya, the design of the existing usb_control_msg()
call was brought up as not being the "nicest" thing to use by Dmitry
Vyukov:
	https://lore.kernel.org/r/CACT4Y+YbDODLRFn8M5QcY4CazhpeCaunJnP_udXtAs0rYoASSg@mail.gmail.com

The function makes it hard to get right, in that it will return the
number of bytes sent/received, but almost no one checks to see if a
short read/write happens.  With a malicious, or broken, USB device, this
can cause drivers to act on data that they did not anticipate, and
sometimes copy internal kernel data out to userspace.

So let's fix this up by creating two new functions,
usb_control_msg_send() and usb_control_msg_recv().  These functions
either complete the full transation, or they return an error, a short
send/recv is now an error.

They also accept data off of the stack, saving individual drivers the
pain of having to constantly allocate memory on their own for tiny
messages, thereby saving overall kernel code space.

The api also does not require a raw USB "pipe" to be sent to the
function, as we know the direction, so just pass in the endpoint number
instead, again making it easier on the USB driver author to use.

This series first takes a helper function out of the sound core for
verifying USB endpoints to be able to use internally, and then adds the
new functions, converts over some internal USB code to use them, and
then starts to clean up some drivers using these new functions, as an
example of the savings that can happen by using these functions.

Thanks to Dmitry and Himadri for the idea on how to do all of this.

greg k-h

Greg Kroah-Hartman (10):
  USB: move snd_usb_pipe_sanity_check into the USB core
  USB: add usb_control_msg_send() and usb_control_msg_recv()
  USB: core: message.c: use usb_control_msg_send() in a few places
  USB: core: hub.c: use usb_control_msg_send() in a few places
  USB: legousbtower: use usb_control_msg_recv()
  sound: usx2y: move to use usb_control_msg_send()
  sound: 6fire: move to use usb_control_msg_send() and
    usb_control_msg_recv()
  sound: line6: move to use usb_control_msg_send() and
    usb_control_msg_recv()
  sound: hiface: move to use usb_control_msg_send()
  Bluetooth: ath3k: use usb_control_msg_send() and
    usb_control_msg_recv()

 drivers/bluetooth/ath3k.c       |  90 +++++------------
 drivers/usb/core/hub.c          | 128 +++++++++---------------
 drivers/usb/core/message.c      | 171 ++++++++++++++++++++++++++++----
 drivers/usb/core/urb.c          |  29 ++++--
 drivers/usb/misc/legousbtower.c |  60 ++++-------
 include/linux/usb.h             |   7 ++
 sound/usb/6fire/firmware.c      |  38 +++----
 sound/usb/helper.c              |  16 +--
 sound/usb/helper.h              |   1 -
 sound/usb/hiface/pcm.c          |  14 ++-
 sound/usb/line6/driver.c        |  69 +++++--------
 sound/usb/line6/podhd.c         |  17 ++--
 sound/usb/line6/toneport.c      |   8 +-
 sound/usb/mixer_scarlett_gen2.c |   2 +-
 sound/usb/quirks.c              |  12 +--
 sound/usb/usx2y/us122l.c        |  42 ++------
 16 files changed, 345 insertions(+), 359 deletions(-)

-- 
2.28.0

