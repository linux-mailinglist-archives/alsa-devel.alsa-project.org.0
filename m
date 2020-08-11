Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB575241AF2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 14:27:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8385210E;
	Tue, 11 Aug 2020 14:26:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8385210E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597148860;
	bh=qj4IcTrLhEQ0TJHEdVU5A5IdVITfa2Y5krv3bfMuY/o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=klFc3A/QsUXo9lTon2ekMG13gEX6wjtFewnqFUTdS9xwuQizd2oIyi2AS+8v8z/zJ
	 zLNuB4WnAD0btouYzxZPHdSqeoaRYe37D+b5GIwuLwCvoXSbKTaXeLdwg19V2ILpXb
	 981rcQszX4C8BZ2ktf43wGcXNj2E7r0l+G5qsyQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E527FF801A3;
	Tue, 11 Aug 2020 14:25:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E14B8F80171; Tue, 11 Aug 2020 14:25:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A85BF80161
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 14:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A85BF80161
Received: from [114.253.245.60] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1k5TKx-00025J-Ts; Tue, 11 Aug 2020 12:25:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	kai.heng.feng@canonical.com
Subject: [PATCH] ALSA: hda - reverse the setting value in the micmute_led_set
Date: Tue, 11 Aug 2020 20:24:30 +0800
Message-Id: <20200811122430.6546-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: stable@vger.kernel.org
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

Before the micmute_led_set() is introduced, the function of
alc_gpio_micmute_update() will set the gpio value with the
!micmute_led.led_value, and the machines have the correct micmute led
status. After the micmute_led_set() is introduced, it sets the gpio
value with !!micmute_led.led_value, so the led status is not correct
anymore, we need to set micmute_led_polarity = 1 to workaround it.

Now we fix the micmute_led_set() and remove micmute_led_polarity = 1.

Fixes: 87dc36482cab ("ALSA: hda/realtek - Add LED class support for micmute LED")
Reported-and-suggested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 09d93dd88713..073029aeaf3c 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4125,7 +4125,7 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 	struct alc_spec *spec = codec->spec;
 
 	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->micmute_led_polarity, !!brightness);
+			    spec->micmute_led_polarity, !brightness);
 	return 0;
 }
 
@@ -4162,8 +4162,6 @@ static void alc285_fixup_hp_gpio_led(struct hda_codec *codec,
 {
 	struct alc_spec *spec = codec->spec;
 
-	spec->micmute_led_polarity = 1;
-
 	alc_fixup_hp_gpio_led(codec, action, 0x04, 0x01);
 }
 
@@ -4414,7 +4412,6 @@ static void alc233_fixup_lenovo_line2_mic_hotkey(struct hda_codec *codec,
 {
 	struct alc_spec *spec = codec->spec;
 
-	spec->micmute_led_polarity = 1;
 	alc_fixup_hp_gpio_led(codec, action, 0, 0x04);
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->init_amp = ALC_INIT_DEFAULT;
-- 
2.17.1

