Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E35993209C5
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:23:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 784A51699;
	Sun, 21 Feb 2021 12:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 784A51699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613906621;
	bh=Y4Q7IcHQVY4pnmuZJLf+Zdx4JFwvNAAHMlw2nGyLBnE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ay8shLwsNTCxuui3v+XqHmben6aiE6FvtSfrHQr0YJjl/hSWm5T+xvhVWoC3wSFAH
	 tq7cZoB//DIYNiYnjRDGUa1TGKt23d/a/qb73Mm1mAigiuZi9SWxJpnXMT+96tF4dG
	 LYmm0TxwsTcQZc+8jyMKgwClxdbt820LewJ7n6tE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DD9AF8042F;
	Sun, 21 Feb 2021 12:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5B41FF802DB; Sun, 21 Feb 2021 12:20:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C6B9F80082
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C6B9F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="hEyKZELm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613906422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ot+0g9GWkCqpBL6S3yzV/ByKfCVx9uehwlhhtjWHdO0=;
 b=hEyKZELmQzxRs5VBJLmIoo6lxXdfYzlclCJR/0Rl2muyXwPzP2ZxVVIuh/MQgXspefAVnM
 j1nq6fbrCxEUx9hziooRUSnl0RZ26Zii6HiW/y3xo6BRsAVxCqRnWpuLtzMluOjIZFRz+h
 QSxzifzql91iKiWJI6hECWxTRkIQujE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-aOLDViHJNeuXNNl7k0VdKw-1; Sun, 21 Feb 2021 06:20:15 -0500
X-MC-Unique: aOLDViHJNeuXNNl7k0VdKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C5501005501;
 Sun, 21 Feb 2021 11:20:14 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D828D62A24;
 Sun, 21 Feb 2021 11:20:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 1/7] HID: lenovo: Use brightness_set_blocking callback for
 setting LEDs brightness
Date: Sun, 21 Feb 2021 12:19:59 +0100
Message-Id: <20210221112005.102116-2-hdegoede@redhat.com>
In-Reply-To: <20210221112005.102116-1-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The lenovo_led_brightness_set function may sleep, so we should have the
the led_class_dev's brightness_set_blocking callback point to it, rather
then the regular brightness_set callback.

When toggled through sysfs this is not a problem, but the brightness_set
callback may be called from atomic context when using LED-triggers.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index c6c8e20f3e8d..4dc5e5f932ed 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -777,7 +777,7 @@ static enum led_brightness lenovo_led_brightness_get(
 				: LED_OFF;
 }
 
-static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
+static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
 	struct device *dev = led_cdev->dev->parent;
@@ -802,6 +802,8 @@ static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
+
+	return 0;
 }
 
 static int lenovo_register_leds(struct hid_device *hdev)
@@ -822,7 +824,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
-	data->led_mute.brightness_set = lenovo_led_brightness_set;
+	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
 	if (ret < 0)
@@ -830,7 +832,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
-	data->led_micmute.brightness_set = lenovo_led_brightness_set;
+	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
 	if (ret < 0) {
-- 
2.30.1

