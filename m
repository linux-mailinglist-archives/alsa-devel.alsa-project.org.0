Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B8C24019A
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Aug 2020 06:43:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537E61663;
	Mon, 10 Aug 2020 06:42:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537E61663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597034603;
	bh=GQE0goDD9PsxK1v7je/FYqzhKe3nJoK11jgjJpHOpN0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WLrzLj+2UZUMDgOlJQR3q8TVowIdaF4CDI8gFg8KeH8RXCIumiuZilC5hSMPabz/y
	 huuT/XVS/Kwry7ndIaitLW6LoRCa8i3C685IdwqcYeQC3EjzL9dqP5CkOy8wJ9iGox
	 rNaISo6k5dOb8r9tJ2zAuIvUojNHXMqHMAYSVDgs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7079DF80085;
	Mon, 10 Aug 2020 06:41:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F80DF8022B; Mon, 10 Aug 2020 06:41:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC932F80085
 for <alsa-devel@alsa-project.org>; Mon, 10 Aug 2020 06:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC932F80085
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 082134206F;
 Mon, 10 Aug 2020 04:41:26 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
To: tiwai@suse.com
Subject: [PATCH] ALSA: usb-audio: fix overeager device match for MacroSilicon
 MS2109
Date: Mon, 10 Aug 2020 13:41:17 +0900
Message-Id: <20200810044117.127713-1-marcan@marcan.st>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Hector Martin <marcan@marcan.st>
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

Matching by device matches all interfaces, which breaks the video/HID
portions of the device depending on module load order.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 sound/usb/quirks-table.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 9092cc0aa807..7cbb3d591a7f 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3645,7 +3645,13 @@ ALC1220_VB_DESKTOP(0x26ce, 0x0a01), /* Asrock TRX40 Creator */
  * with.
  */
 {
-	USB_DEVICE(0x534d, 0x2109),
+	.match_flags = USB_DEVICE_ID_MATCH_DEVICE |
+		       USB_DEVICE_ID_MATCH_INT_CLASS |
+		       USB_DEVICE_ID_MATCH_INT_SUBCLASS,
+	.idVendor = 0x534d,
+	.idProduct = 0x2109,
+	.bInterfaceClass = USB_CLASS_AUDIO,
+	.bInterfaceSubClass = USB_SUBCLASS_AUDIOCONTROL,
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
 		.vendor_name = "MacroSilicon",
 		.product_name = "MS2109",
-- 
2.27.0

