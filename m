Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC7320630
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 17:34:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC54F1667;
	Sat, 20 Feb 2021 17:33:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC54F1667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613838840;
	bh=fzKOZDQiE0wquADPOdlahML/kQ7l8tAtB4xE6bA1IM4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ss10fCZqmico6p/Io11ttn6QuuLV9l1ceu6UbUT4svPfNuJX/jJn404EcONIMdeJ6
	 BlhduP1YosL7NmAmd+MZYkVJcgGPpT4SJWyRJRhv3TYl4t5KKMt/UTSxEObDVnrhp8
	 yqYgoeXJKRjiaOayMiUwNt6ENovz2DdHKFWdJndA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42708F800C7;
	Sat, 20 Feb 2021 17:32:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B396AF8015A; Sat, 20 Feb 2021 17:32:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BEBBF8011C
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 17:32:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BEBBF8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="PNPohfea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613838741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qx11CZ5+lK21NSKCmGUQAraLywcyCc6f99uNUBTXYaQ=;
 b=PNPohfeaAPZiMFSUFOF7pJJbwk6LA8NOWWkirX0INVPKBC9meHgymbLRYfJQFodjqPq1Ii
 oXArnpMX+FOhVsS0agWToKs3KzPmvwhoQfhi+aUQJl5F5M0f4y6aFgOj/RYW2lsIqNtbjD
 FTfF1gQOuN5hUiubntZt7AsW00bpB1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-WRoOfztHPpeISnhn2WbP4g-1; Sat, 20 Feb 2021 11:32:18 -0500
X-MC-Unique: WRoOfztHPpeISnhn2WbP4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046491005501;
 Sat, 20 Feb 2021 16:32:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562DA6062F;
 Sat, 20 Feb 2021 16:32:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 1/3] HID: elan: Silence mute LED errors being logged when the
 device is unplugged
Date: Sat, 20 Feb 2021 17:32:09 +0100
Message-Id: <20210220163211.323178-1-hdegoede@redhat.com>
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

Being integrated into an USB keyboard-dock the mute LED can go away
at any time, leading to the following errors:

[  918.667671] elan 0003:04F3:0755.0002: Failed to set mute led brightness: -19
[  918.667737] leds elan:red:mute: Setting an LED's brightness failed (-19)

Fix this by making the following changes:

1. Don't log an error from elan_mute_led_set_brigtness() when ret == ENODEV
2. Set the LED_HW_PLUGGABLE flag on the mute LED led_classdev

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index dae193749d44..71740988a3f6 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -445,7 +445,8 @@ static int elan_mute_led_set_brigtness(struct led_classdev *led_cdev,
 	kfree(dmabuf);
 
 	if (ret != ELAN_LED_REPORT_SIZE) {
-		hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
+		if (ret != -ENODEV)
+			hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
 		return ret;
 	}
 
@@ -462,6 +463,7 @@ static int elan_init_mute_led(struct hid_device *hdev)
 	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
+	mute_led->flags = LED_HW_PLUGGABLE;
 	mute_led->dev = &hdev->dev;
 
 	return devm_led_classdev_register(&hdev->dev, mute_led);
-- 
2.30.1

