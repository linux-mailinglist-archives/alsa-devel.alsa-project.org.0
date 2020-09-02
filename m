Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F8525AA0B
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 13:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0ED7216BB;
	Wed,  2 Sep 2020 13:09:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0ED7216BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599045017;
	bh=tPRhJJgXvDc0IuVKlXjbFRDWA8BX95/8fwQ++InXL5E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FGqUAG9zB4uk1qR1m9HdeBPuzUlFQEhNtD6a9mm+VqSwotU2+T7fv5EilHqsfzfyX
	 sIItjrOIsDSRmUmTmNdc5q6Bp6VmIKzFbEQEtdPzvJDlUb06PG6v025nXSV61enjGs
	 VCZ5UdaDmYj5frT4/GIyZvKiioGb2P32FUmgXITk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 889E1F8034B;
	Wed,  2 Sep 2020 13:01:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A4DFEF80344; Wed,  2 Sep 2020 13:01:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32122F80332
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 13:01:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32122F80332
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="07OoVR0j"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB99E2166E;
 Wed,  2 Sep 2020 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599044489;
 bh=tPRhJJgXvDc0IuVKlXjbFRDWA8BX95/8fwQ++InXL5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=07OoVR0jEQGE5aJ5jGecu1PUSSxjmfVizWumbkwRmppmTzi/9M+GYZ6sLUlp/8xsA
 MatkLBEBframZqC4xWnXZgXV2Gexp07mxPQDdNbBrtzD/tJyKLiaWzNS5FIbLeFx4n
 BewIUXy+pc/RvMtGbdmQB3kbyYdWeaqMLVXio7Bs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: himadrispandya@gmail.com,
	dvyukov@google.com,
	linux-usb@vger.kernel.org
Subject: [PATCH 8/9] sound: 6fire: move to use new usb control functions...
Date: Wed,  2 Sep 2020 13:01:11 +0200
Message-Id: <20200902110115.1994491-10-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
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

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 sound/usb/6fire/firmware.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/sound/usb/6fire/firmware.c b/sound/usb/6fire/firmware.c
index 69137c14d0dc..e87bfa97be4e 100644
--- a/sound/usb/6fire/firmware.c
+++ b/sound/usb/6fire/firmware.c
@@ -158,29 +158,17 @@ static int usb6fire_fw_ihex_init(const struct firmware *fw,
 static int usb6fire_fw_ezusb_write(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret;
-
-	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0), type,
+	return usb_control_msg_send(device, 0, type,
 			USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 			value, 0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
 }
 
 static int usb6fire_fw_ezusb_read(struct usb_device *device,
 		int type, int value, char *data, int len)
 {
-	int ret = usb_control_msg(device, usb_rcvctrlpipe(device, 0), type,
+	return usb_control_msg_recv(device, 0, type,
 			USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE, value,
 			0, data, len, HZ);
-	if (ret < 0)
-		return ret;
-	else if (ret != len)
-		return -EIO;
-	return 0;
 }
 
 static int usb6fire_fw_fpga_write(struct usb_device *device,
-- 
2.28.0

