Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA03826903C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 17:41:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 55ECB16A6;
	Mon, 14 Sep 2020 17:40:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 55ECB16A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600098097;
	bh=RoTPtd9qHHuk1GM7mtTLP95n0k7SzFhORIof1s3mXI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nG7Krnl5UMx6Jq0n0Af8GCBxU/lEsMM0b29KxDEIyTK9NyC0Z5Tq0zdwe6eYMcAG1
	 s+2+hPn0U7RIq5+wTIJePd/KgdEdYgx/PrP06ACPLB5a37CNx+GwNvJKYwR7g6kzYO
	 QXzsWtDEQ4LnxNZQo5SiLzqIxtey+rVa9WLYk5dE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C34CFF802E0;
	Mon, 14 Sep 2020 17:38:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F93CF802DB; Mon, 14 Sep 2020 17:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D30DF8015A
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 17:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D30DF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="an12vcgs"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F5892193E;
 Mon, 14 Sep 2020 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600097889;
 bh=RoTPtd9qHHuk1GM7mtTLP95n0k7SzFhORIof1s3mXI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=an12vcgsLuq8dJy3avIewd9JstauxKo62seMlj12DUNw3bW7UjfEsJsX6MQnWjpUq
 ZNSgQKrQh4ZtDER7l7MUuGRfIuAhBOrjUQm/iYdmvY1VLD0rRlB14FWBcZyPlDhumj
 uRXdoq4OFhaqzm0J4VpPvm6Tc8OKPDUrUR6f/kAg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH v3 11/11] ALSA: remove calls to usb_pipe_type_check for
 control endpoints
Date: Mon, 14 Sep 2020 17:37:56 +0200
Message-Id: <20200914153756.3412156-12-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200914153756.3412156-1-gregkh@linuxfoundation.org>
References: <20200914153756.3412156-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, johan.hedberg@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, marcel@holtmann.org,
 linux-kernel@vger.kernel.org, tiwai@suse.com, stern@rowland.harvard.ed,
 linux-bluetooth@vger.kernel.org, Alexander Tsoy <alexander@tsoy.me>,
 Alan Stern <stern@rowland.harvard.edu>
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

A USB device will always haev a bi-directional endpoint 0, that's just
how the devices work, so no need to check for that in a few quirk tests
as it will always pass.

Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Alexander Tsoy <alexander@tsoy.me>
Cc: alsa-devel@alsa-project.org
Reported-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v3:
 - no change from v2

v2:
 - new patch, was not in v1 series, suggested by Alan.

 sound/usb/quirks.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 1b482848e73b..395d1ea6f03f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -885,8 +885,6 @@ static int snd_usb_nativeinstruments_boot_quirk(struct usb_device *dev)
 {
 	int ret;
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 				  0xaf, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 				  1, 0, NULL, 0, 1000);
@@ -994,8 +992,6 @@ static int snd_usb_axefx3_boot_quirk(struct usb_device *dev)
 
 	dev_dbg(&dev->dev, "Waiting for Axe-Fx III to boot up...\n");
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	/* If the Axe-Fx III has not fully booted, it will timeout when trying
 	 * to enable the audio streaming interface. A more generous timeout is
 	 * used here to detect when the Axe-Fx III has finished booting as the
@@ -1127,8 +1123,6 @@ static int snd_usb_motu_m_series_boot_quirk(struct usb_device *dev)
 {
 	int ret;
 
-	if (usb_pipe_type_check(dev, usb_sndctrlpipe(dev, 0)))
-		return -EINVAL;
 	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0),
 			      1, USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			      0x0, 0, NULL, 0, 1000);
-- 
2.28.0

