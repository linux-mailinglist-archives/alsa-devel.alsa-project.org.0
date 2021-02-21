Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A063209C3
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Feb 2021 12:22:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0AF4167B;
	Sun, 21 Feb 2021 12:22:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0AF4167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613906576;
	bh=+yn4I07GuNJt9G9CeKGoqVMgQEpSLTgbddXBAvuoVeQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RFp9pMnfm0Dab4RSOZTFyCNmiTEiCvZSGyEoZ2Vq1CM5PcGUiA4WF5Jg5tLqjv6JY
	 KwYNFOGOENjeGPYhLobb8w7ZfAhoNkYiL3iZhLp4k/LIjhyB3wB/DrVrd2rZopJKvp
	 5onTsOvCM/KxRRbeFYeVgbrlnYNihLIusONKzcPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6076F802E3;
	Sun, 21 Feb 2021 12:20:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6648F802E7; Sun, 21 Feb 2021 12:20:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CB40DF802CA
 for <alsa-devel@alsa-project.org>; Sun, 21 Feb 2021 12:20:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CB40DF802CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="SrCRIT09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613906422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1XHUTrMYfcsd0xjns0+GFYY0GDMZ8I7C7nLDv7eA2tg=;
 b=SrCRIT09kEOQSS9GTDDXlpI44aFw/oeS7qJL6nMjUwVRTwcynVYY5YBzbew/aTR2aoKwaP
 kUalzicy/bt28VnnMwxIsHfwllllPaHRe0WyKVfxcC6/U8tKUmPfB/Qt6MWvftEpMuNqI1
 rEtdBNZXsnk5T/NmcIAdxYD47fFEcyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-SIAV9lFHPHqdlJIZBUIoxw-1; Sun, 21 Feb 2021 06:20:20 -0500
X-MC-Unique: SIAV9lFHPHqdlJIZBUIoxw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77070107ACE4;
 Sun, 21 Feb 2021 11:20:19 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D1D6268F;
 Sun, 21 Feb 2021 11:20:17 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH v3 4/7] HID: lenovo: Remove lenovo_led_brightness_get()
Date: Sun, 21 Feb 2021 12:20:02 +0100
Message-Id: <20210221112005.102116-5-hdegoede@redhat.com>
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

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since lenovo_led_brightness_get() just returns the last set value
it does not add any functionality, so we can just remove it.

Reviewed-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/hid/hid-lenovo.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index b2596ed37880..1b8dd85ceb05 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -774,22 +774,6 @@ static void lenovo_led_set_tpkbd(struct hid_device *hdev)
 	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
 }
 
-static enum led_brightness lenovo_led_brightness_get(
-			struct led_classdev *led_cdev)
-{
-	struct device *dev = led_cdev->dev->parent;
-	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
-	int led_nr = 0;
-
-	if (led_cdev == &data_pointer->led_micmute)
-		led_nr = 1;
-
-	return data_pointer->led_state & (1 << led_nr)
-				? LED_FULL
-				: LED_OFF;
-}
-
 static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
@@ -837,7 +821,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
-	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
@@ -846,7 +829,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
-	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
-- 
2.30.1

