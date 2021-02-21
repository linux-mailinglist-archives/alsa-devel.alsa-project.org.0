Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E78A3209C2
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:22:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3621686;
	Sun, 21 Feb 2021 12:21:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3621686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613906566;
	bh=55anyKuFi2fxY8ihba1RWO9rPm+z7lVXzGx63JQ/yJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYD3DM6jasNe47sRMRz6UfEY6nCTuYj0dcxZPUP6BcpeX8PdJf8tVGsynD7yXKZ3k
	 vYXIR5J3Vgd+JZQGCnuplXTgWSEdF66VaYG2xcCn7eFYid9NEycNECMbs6RwymtvLG
	 9y2toEKAFcZPI7m/yoW5hcyplIZP6rBYKWbajL14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14974F802DB;
	Sun, 21 Feb 2021 12:20:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6672F802E2; Sun, 21 Feb 2021 12:20:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D00A8F80152
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D00A8F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KJLCYPhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613906419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iX0cNjQmZHy4OyRs7N5fibYSZZQznF42u0dwIt7UY28=;
 b=KJLCYPhGvWDikYuleH7Gjf+QuHxbJZTJYuvnqnQ7UTjlrRWwY2mOF+bHDRMxgvzLQBMQsk
 bcDjxcHSWPBiiqlFoRuU4oSwJwe1OuCANqFV0v0HiLxrr181qNjdveXHhZNdYrVWjDG0sU
 nvswHmTRBAS8tzIyLFDTiD+yW0KF3Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-cja4P8-UO36iRd4X_FAcKw-1; Sun, 21 Feb 2021 06:20:17 -0500
X-MC-Unique: cja4P8-UO36iRd4X_FAcKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 067FF18449E1;
 Sun, 21 Feb 2021 11:20:16 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 932DF6268F;
 Sun, 21 Feb 2021 11:20:14 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 2/7] HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error
 handling
Date: Sun, 21 Feb 2021 12:20:00 +0100
Message-Id: <20210221112005.102116-3-hdegoede@redhat.com>
In-Reply-To: <20210221112005.102116-1-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-leds@vger.kernel.org, linux-input@vger.kernel.org
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

Fix the following issues with lenovo_led_set_tp10ubkbd() error handling:

1. On success hid_hw_raw_request() returns the number of bytes sent.
   So we should check for (ret != 3) rather then for (ret != 0).

2. Actually propagate errors to the caller.

3. Since the LEDs are part of an USB keyboard-dock the mute LEDs can go
   away at any time. Don't log an error when ret == -ENODEV and set the
   LED_HW_PLUGGABLE flag to avoid errors getting logged when the USB gets
   disconnected.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Return -EIO when hid_hw_raw_request() returns a value != 3 and >= 0

Changes in v2:
- Rewrite to fix a bunch of other error-handling issues too
---
 drivers/hid/hid-lenovo.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 4dc5e5f932ed..ee175ab54281 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -62,8 +62,8 @@ struct lenovo_drvdata {
 #define TP10UBKBD_LED_OFF		1
 #define TP10UBKBD_LED_ON		2
 
-static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
-				     enum led_brightness value)
+static int lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
+				    enum led_brightness value)
 {
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
 	int ret;
@@ -75,10 +75,18 @@ static void lenovo_led_set_tp10ubkbd(struct hid_device *hdev, u8 led_code,
 	data->led_report[2] = value ? TP10UBKBD_LED_ON : TP10UBKBD_LED_OFF;
 	ret = hid_hw_raw_request(hdev, data->led_report[0], data->led_report, 3,
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret)
-		hid_err(hdev, "Set LED output report error: %d\n", ret);
+	if (ret != 3) {
+		if (ret != -ENODEV)
+			hid_err(hdev, "Set LED output report error: %d\n", ret);
+
+		ret = ret < 0 ? ret : -EIO;
+	} else {
+		ret = 0;
+	}
 
 	mutex_unlock(&data->led_report_mutex);
+
+	return ret;
 }
 
 static void lenovo_tp10ubkbd_sync_fn_lock(struct work_struct *work)
@@ -349,7 +357,7 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct lenovo_drvdata *data = hid_get_drvdata(hdev);
-	int value;
+	int value, ret;
 
 	if (kstrtoint(buf, 10, &value))
 		return -EINVAL;
@@ -364,7 +372,9 @@ static ssize_t attr_fn_lock_store(struct device *dev,
 		lenovo_features_set_cptkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
-		lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		ret = lenovo_led_set_tp10ubkbd(hdev, TP10UBKBD_FN_LOCK_LED, value);
+		if (ret)
+			return ret;
 		break;
 	}
 
@@ -785,6 +795,7 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
 	u8 tp10ubkbd_led[] = { TP10UBKBD_MUTE_LED, TP10UBKBD_MICMUTE_LED };
 	int led_nr = 0;
+	int ret = 0;
 
 	if (led_cdev == &data_pointer->led_micmute)
 		led_nr = 1;
@@ -799,11 +810,11 @@ static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tpkbd(hdev);
 		break;
 	case USB_DEVICE_ID_LENOVO_TP10UBKBD:
-		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
+		ret = lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static int lenovo_register_leds(struct hid_device *hdev)
@@ -825,6 +836,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
 	if (ret < 0)
@@ -833,6 +845,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
 	if (ret < 0) {
-- 
2.30.1

