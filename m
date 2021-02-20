Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAF2320632
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 17:34:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E46A81676;
	Sat, 20 Feb 2021 17:34:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E46A81676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613838891;
	bh=eQyHO5GdPVm8tpcTdC2KcENugFbFuLgTP40t2fpDd8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A5MASRDpThEOqYcOk8zR4elhz8S3EElPaBwFdD3LKrCtnEWRUMguM5JfO28q6J9L3
	 hbaiThcifxdwSpNyq3Scczw7cGjtLKB5BDRZHfNrnvMpW7VAcG4GJuL2ak4pY9QMlf
	 wHXwIFnEYLo91tCVZyWg4rsFxSsXDgRdyCrQIRTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1AABF802A9;
	Sat, 20 Feb 2021 17:32:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A17EF801DB; Sat, 20 Feb 2021 17:32:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01617F8020C
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 17:32:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01617F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PD1DxZfM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613838746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c7VKymmQZ3Xc4Y43PAd9Aaj3siwoR45oU3rmUaaB60g=;
 b=PD1DxZfM7tZLIMxMz86cI91Abyk8TIKcdHG2iNcsihZp+I5aj6DJiZNCFI+WW7QDXbxgQM
 9U8+9cAaQftN80HQmDJJ5Qf//i7QZ+VUL3NTOlVT2EziiEJSBgJkDRn3j23ZwZ5CK/aiBp
 66lcEMlPItkm5kxUF508ikeyG5+gZic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-rlc8v1FOOriW0BrgrUb_VA-1; Sat, 20 Feb 2021 11:32:24 -0500
X-MC-Unique: rlc8v1FOOriW0BrgrUb_VA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3300A80402C;
 Sat, 20 Feb 2021 16:32:23 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72AD6062F;
 Sat, 20 Feb 2021 16:32:21 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 3/3] HID: elan: Remove elan_mute_led_get_brigtness()
Date: Sat, 20 Feb 2021 17:32:11 +0100
Message-Id: <20210220163211.323178-3-hdegoede@redhat.com>
In-Reply-To: <20210220163211.323178-1-hdegoede@redhat.com>
References: <20210220163211.323178-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
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

Since elan_mute_led_get_brigtness() just returns the last set value
it does not add any functionality, so we can just remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 6958649ece22..f1ac0443ee67 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -410,15 +410,6 @@ static int elan_start_multitouch(struct hid_device *hdev)
 	return 0;
 }
 
-static enum led_brightness elan_mute_led_get_brigtness(struct led_classdev *led_cdev)
-{
-	struct device *dev = led_cdev->dev->parent;
-	struct hid_device *hdev = to_hid_device(dev);
-	struct elan_drvdata *drvdata = hid_get_drvdata(hdev);
-
-	return drvdata->mute_led_state;
-}
-
 static int elan_mute_led_set_brigtness(struct led_classdev *led_cdev,
 				       enum led_brightness value)
 {
@@ -461,7 +452,6 @@ static int elan_init_mute_led(struct hid_device *hdev)
 
 	mute_led->name = "elan:red:mute";
 	mute_led->default_trigger = "audio-mute";
-	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
 	mute_led->flags = LED_HW_PLUGGABLE;
-- 
2.30.1

