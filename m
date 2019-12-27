Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9F712B39A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 10:44:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9888E171A;
	Fri, 27 Dec 2019 10:43:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9888E171A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577439862;
	bh=arw+3s7Lonw0BMbsZswn7Z71ouPboM6dTU9FUeZreu8=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XoQygRjPvCgKtSVaCmib1GJEQ7ny7xH635sbCsjGcRElSYJlnnuDhgOt/dibqD7jL
	 6FMgqV7pZ1we7jQgoFIyIJEgK4/pjubo44NqCvprzz8iHjNaFdNEwLcX1Zon4zciBv
	 oqsGJCGqDu9I4FELeKfUcTIzs2eJqHzoJJn9/Rzs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47A64F80132;
	Fri, 27 Dec 2019 10:42:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8098F80132; Fri, 27 Dec 2019 10:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from chris.boyle.name (ipv6.chris.boyle.name
 [IPv6:2001:4b98:dc0:41:216:3eff:fe18:4418])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B874EF800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 10:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B874EF800CD
Received: by chris.boyle.name (Postfix, from userid 1000)
 id A9B553DE5E; Fri, 27 Dec 2019 10:40:53 +0100 (CET)
Date: Fri, 27 Dec 2019 10:40:53 +0100
From: Chris Boyle <chris@boyle.name>
To: alsa-devel@alsa-project.org
Message-ID: <20191227094053.GA12167@nova.chris.boyle.name>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [alsa-devel] [PATCH] ALSA: usb-audio: fix Corsair Virtuoso mixer
	label collision
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

The Corsair Virtuoso RGB Wireless is a USB headset with a mic and a
sidetone feature. Label its mixer appropriately instead of all
"Headset", so that applications such as Pulseaudio don't just move
the sidetone control when they intend the main Headset control.

Signed-off-by: Chris Boyle <chris@boyle.name>
---
 sound/usb/mixer_maps.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 73baf398c84a..d094934ae6c5 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -349,6 +349,16 @@ static const struct usbmix_name_map dell_alc4020_map[] = {
 	{ 0 }
 };
 
+/*
+ * Corsair Virtuoso calls everything "Headset" without this, leading to
+ * applications moving the sidetone control instead of the main one.
+ */
+static const struct usbmix_name_map corsair_virtuoso_map[] = {
+	{ 3, "Mic Capture" },
+	{ 6, "Sidetone Playback" },
+	{ 0 }
+};
+
 /*
  * Control map entries
  */
@@ -468,6 +478,16 @@ static struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x05a7, 0x1020),
 		.map = bose_companion5_map,
 	},
+	{
+		/* Corsair Virtuoso (wired mode) */
+		.id = USB_ID(0x1b1c, 0x0a41),
+		.map = corsair_virtuoso_map,
+	},
+	{
+		/* Corsair Virtuoso (wireless mode) */
+		.id = USB_ID(0x1b1c, 0x0a42),
+		.map = corsair_virtuoso_map,
+	},
 	{ 0 } /* terminator */
 };
 
-- 
2.20.1


-- 
Chris Boyle
https://chris.boyle.name/
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
