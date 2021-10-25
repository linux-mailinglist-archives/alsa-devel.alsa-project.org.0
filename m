Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA7B4395CE
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 14:14:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39D3C16CE;
	Mon, 25 Oct 2021 14:13:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39D3C16CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635164071;
	bh=AIRpCXor1U3q6Kur0f/NIMUI4ChvteaRnPofgExILTU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Skq95KUZ5yufyR3Q22XFfaPn8ZW8Rn8tkB0TZPuYE81xJfdyuwXmyfTH3X2hX7ac2
	 C6XPTlW2EsBOdm436cmfafMK1N8gRFpi2GY38bvM+td2+JWBr0qX8jwcXFeMRXtrwj
	 +ch7CG5yA9KqjvgXDdn3ptzsf3vYBuBeSiL48elo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 282B7F804F1;
	Mon, 25 Oct 2021 14:12:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E3A3F80166; Mon, 25 Oct 2021 14:12:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AFC9F80166
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 14:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AFC9F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iaKp0d2w"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9612F60EBC;
 Mon, 25 Oct 2021 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635163935;
 bh=AIRpCXor1U3q6Kur0f/NIMUI4ChvteaRnPofgExILTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iaKp0d2wbZft43JNyI03st7htu3joHqUI07uYXGUBF+J93Ptg1A9m1HLQAFEOTkpq
 FXDl5A3uUwwX0ke103BDG/1EeMujLlz+2WkDTzMdkdNIHrTCw0ktngfI70QRXAXDyg
 5zmIkQD1PxrE6AOb1drDQDt8B0blqisHJb5duNUTrRKuf1gPs2qjaHoCci/nJfDVD7
 Xv6VlLIRAVc+eQP1aPJmxs8pi72I3pGiI6LcbMscT3lzHhOX9D2aTZ4qLKymEYTS7d
 v5lXRxb2OlDSyWPDSu/XmaB3e0+ppn6gjACmZQw7oo71nnCZ2zR19H6iNRnxMuC/hq
 feF2MpoxelV1w==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1meypa-0001iH-DA; Mon, 25 Oct 2021 14:11:58 +0200
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] sound: 6fire: fix control and bulk message timeouts
Date: Mon, 25 Oct 2021 14:11:41 +0200
Message-Id: <20211025121142.6531-2-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211025121142.6531-1-johan@kernel.org>
References: <20211025121142.6531-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
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

USB control and bulk message timeouts are specified in milliseconds and
should specifically not vary with CONFIG_HZ.

Fixes: c6d43ba816d1 ("ALSA: usb/6fire - Driver for TerraTec DMX 6Fire USB")
Cc: stable@vger.kernel.org      # 2.6.39
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 sound/usb/6fire/comm.c     | 2 +-
 sound/usb/6fire/firmware.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/6fire/comm.c b/sound/usb/6fire/comm.c
index 43a2a62d66f7..49629d4bb327 100644
--- a/sound/usb/6fire/comm.c
+++ b/sound/usb/6fire/comm.c
@@ -95,7 +95,7 @@ static int usb6fire_comm_send_buffer(u8 *buffer, struct usb_device *dev)
 	int actual_len;
 
 	ret = usb_interrupt_msg(dev, usb_sndintpipe(dev, COMM_EP),
-			buffer, buffer[1] + 2, &actual_len, HZ);
+			buffer, buffer[1] + 2, &actual_len, 1000);
 	if (ret < 0)
 		return ret;
 	else if (actual_len != buffer[1] + 2)
diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 8981e61f2da4..c51abc54d2f8 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -160,7 +160,7 @@ static int usb6fire_fw_ezusb_write(struct usb_device *device,
 {
 	return usb_control_msg_send(device, 0, type,
 				    USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				    value, 0, data, len, HZ, GFP_KERNEL);
+				    value, 0, data, len, 1000, GFP_KERNEL);
 }
 
 static int usb6fire_fw_ezusb_read(struct usb_device *device,
@@ -168,7 +168,7 @@ static int usb6fire_fw_ezusb_read(struct usb_device *device,
 {
 	return usb_control_msg_recv(device, 0, type,
 				    USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-				    value, 0, data, len, HZ, GFP_KERNEL);
+				    value, 0, data, len, 1000, GFP_KERNEL);
 }
 
 static int usb6fire_fw_fpga_write(struct usb_device *device,
@@ -178,7 +178,7 @@ static int usb6fire_fw_fpga_write(struct usb_device *device,
 	int ret;
 
 	ret = usb_bulk_msg(device, usb_sndbulkpipe(device, FPGA_EP), data, len,
-			&actual_len, HZ);
+			&actual_len, 1000);
 	if (ret < 0)
 		return ret;
 	else if (actual_len != len)
-- 
2.32.0

