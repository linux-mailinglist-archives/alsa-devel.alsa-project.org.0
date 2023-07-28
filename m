Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6097668A9
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jul 2023 11:17:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE234843;
	Fri, 28 Jul 2023 11:16:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE234843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690535864;
	bh=v1M3g6LCrC50DHm3eqBbBYAbehxQ7o7s82SzzLhkH+I=;
	h=Date:To:Cc:From:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=LX5iPEictwWRK55BsHdMJda/58WVg5UHo4qo8JQxfadamXYCFKAFpDDD7ik7mJ4+n
	 I+teNBFvr3jBwbs1hsankTJWOzb5Uj3DlabBHE39PiXj3atjC1VsRXYRalpOGitp2a
	 ac0Mcd16WFkNmqWwnmzPPtWzaFUxas/wHudwdLVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 483AAF80535; Fri, 28 Jul 2023 11:16:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB2E8F80163;
	Fri, 28 Jul 2023 11:16:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F19EFF8019B; Fri, 28 Jul 2023 11:16:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from asave02.hostfactory.ch (asave02.hostfactory.ch
 [217.150.252.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57689F80153
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 11:16:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57689F80153
Received: from server11.hostfactory.ch ([185.117.169.60])
	by asave02.hostfactory.ch with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <michele.perrone@weiss.ch>)
	id 1qPJa0-0008Ei-LU; Fri, 28 Jul 2023 11:16:14 +0200
Received: from [192.168.0.84]
 (156.14.3.213.static.wline.lns.sme.cust.swisscom.ch [213.3.14.156])
	(Authenticated sender: michele.perrone@weiss.ch)
	by server11.hostfactory.ch (Postfix) with ESMTPSA id DB79C43E0A35A;
	Fri, 28 Jul 2023 11:16:11 +0200 (CEST)
Message-ID: <24703333-9250-40bf-e736-a5f3c4862034@weiss.ch>
Date: Fri, 28 Jul 2023 11:16:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: alsa-devel@alsa-project.org, Rolf Anderegg <rolf.anderegg@weiss.ch>
From: Michele Perrone <michele.perrone@weiss.ch>
Subject: [PATCH] ALSA: dice: add stream format parameters for Weiss devices
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <169053577217.19375.13988879792264296144@server11.hostfactory.ch>
X-PPP-Vhost: weiss.ch
X-Originating-IP: 185.117.169.60
X-SpamExperts-Domain: outboundprotection.hostfactory.ch
X-SpamExperts-Username: 185.117.169.60
Authentication-Results: hostfactory.ch;
 auth=pass smtp.auth=185.117.169.60@outboundprotection.hostfactory.ch
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.000249003705236)
X-Recommended-Action: accept
X-Filter-ID: 
 Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+OB6kRi2U6t4ng0F4ADDl5PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5ynOqv5wVH0VS/etXvrFNNzaJlM0GUlwLkcZrRacppWhTh3
 wKoTBNAKgp9qBcKLgDljPyzCxIJm7qFlTroi9VKv/7Rl0Dd5eFQ0eM8i42SsSUGlz8CJSOMrvzx9
 TVg3RkU6ceNXnqnZsMnhmFkK4tG3p8jZ4AoGBlDR94YkH0RjFcsS2wyX4wFvfD5xwAerAR9lOVrL
 YTpDlVt2LhrK2BfEQs6EgGedxeuvfrMrARjFPJ3lBFw+LV6wnDcfFauiy+Lk/agSvtgte2zCXW1J
 lwXnBK88wSgI9iE9tWo2DOKsd0rqhy+tapdwJ8uKml1tG0Pt3JsC5e/DlYVV9jqBtc/t9a3fvBg8
 I7q5hFKojyxxcVkDWpg3cUqnTXK7+jR2jt1xuwt6BW/LqWzUw+fkjzpuRAwX31WVY5lWjWxuGSRu
 xdeJD5/Wl4aBF+CY0mxh2pSR7yU2QIWCTCd5A9CNaN6paFkTJ4dzaT5WOYMHNmXuCAc8I07FTFcj
 pdfX/Jcr87eGViJEv8gnXwaY4FVZI6Eg7ykLMcR7AtVunU3VRH8MIoPAG/hXGFnK0pHY4oViMcpJ
 m5LNQv5sT1lAZq1aJGCAfGpYrEmIO9Je9m9d+jZQRhH0bwch8ObQw9ZPNCJxML0amUdylUIKhf3z
 2GAHxH7Iz4f/qeUJ3vo/M3fWKwSRsVKq9TQXy8hyeIiWcxFwtZCk154Sg1aThLqlP1z0xQk+cTgi
 emrqNmpKjo0G97L5/+s5cBcIwKukTjuVc8754b5KFq543anOrUIH9j7Rgnr80z6bhalFEM/pjPCQ
 A+BAltHtt5DV/zyyBNha86wyYiZqt07h63crK+1+ApyFeOZ3j+XRAPGuCjTpmIE9pj0CRFwURhkw
 M5r9ALbRISW5L/U8CVsONrMJuGzuoGnKTKcy/606F7WxDUnyM4xEuq0KGWAlkJRMfSaLY5o478vy
 21JXIL1yhbx+lHR95N7UQS3yUONgooB5i8FqEdsz9bWNGDzzel1w13bGW+s29HRNrK/+F5rVRK0C
 X3CW2U+EfTxUCCMOEETThRtg1ZxE9Le/4CiCBqrB4vMmHpjmx6wTDBz83NiF/nBAoZn20xvrvAJp
 QXfeNA9i3kTgY3EizleQ4iGhw88IBRKiKPHSHXUcP/8=
X-Report-Abuse-To: spam@asave01.hostfactory.ch
Message-ID-Hash: EQ4TPNSJTCIZGFZYFXOBT5BYNZRZWGNJ
X-Message-ID-Hash: EQ4TPNSJTCIZGFZYFXOBT5BYNZRZWGNJ
X-MailFrom: michele.perrone@weiss.ch
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EQ4TPNSJTCIZGFZYFXOBT5BYNZRZWGNJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hard-coded stream format parameters are added for Weiss Engineering
FireWire devices. When the device vendor and model match, the parameters
are copied into the stream format cache. This allows for setting all
supported sampling rates up to 192kHz, and consequently adjusting the
number of available I/O channels.

Signed-off-by: Rolf Anderegg <rolf.anderegg@weiss.ch>
Signed-off-by: Michele Perrone <michele.perrone@weiss.ch>
---
  sound/firewire/dice/Makefile     |   2 +-
  sound/firewire/dice/dice-weiss.c | 120 +++++++++++++++++++++++++++++++
  sound/firewire/dice/dice.c       |  72 +++++++++++++++++++
  3 files changed, 193 insertions(+), 1 deletion(-)
  create mode 100644 sound/firewire/dice/dice-weiss.c

diff --git a/sound/firewire/dice/Makefile b/sound/firewire/dice/Makefile
index a5f3fbf28b8c..bac8712f9014 100644
--- a/sound/firewire/dice/Makefile
+++ b/sound/firewire/dice/Makefile
@@ -2,5 +2,5 @@
  snd-dice-objs := dice-transaction.o dice-stream.o dice-proc.o 
dice-midi.o \
           dice-pcm.o dice-hwdep.o dice.o dice-tcelectronic.o \
           dice-alesis.o dice-extension.o dice-mytek.o dice-presonus.o \
-         dice-harman.o dice-focusrite.o
+         dice-harman.o dice-focusrite.o dice-weiss.o
  obj-$(CONFIG_SND_DICE) += snd-dice.o
diff --git a/sound/firewire/dice/dice-weiss.c 
b/sound/firewire/dice/dice-weiss.c
new file mode 100644
index 000000000000..ad22bfafd324
--- /dev/null
+++ b/sound/firewire/dice/dice-weiss.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dice-weiss.c - a part of driver for DICE based devices
+ *
+ * Copyright (c) 2023 Rolf Anderegg and Michele Perrone
+ */
+
+#include "dice.h"
+
+struct dice_weiss_spec {
+    unsigned int tx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
+    unsigned int rx_pcm_chs[MAX_STREAMS][SND_DICE_RATE_MODE_COUNT];
+    bool has_midi;
+};
+
+/* Weiss DAC202: 192kHz 2-channel DAC */
+static const struct dice_weiss_spec dac202 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss MAN301: 192kHz 2-channel music archive network player */
+static const struct dice_weiss_spec man301 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire 
interface */
+static const struct dice_weiss_spec int202 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{0, 0, 0}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss INT203: 192kHz bidirectional 2-channel digital Firewire 
interface */
+static const struct dice_weiss_spec int203 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss ADC2: 192kHz A/D converter with microphone preamps and line 
inputs */
+static const struct dice_weiss_spec adc2 = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss DAC2/Minerva: 192kHz 2-channel DAC */
+static const struct dice_weiss_spec dac2_minerva = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface */
+static const struct dice_weiss_spec vesta = {
+    .tx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .rx_pcm_chs = {{2, 2, 2}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+/* Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU interface */
+static const struct dice_weiss_spec afi1 = {
+    .tx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
+    .rx_pcm_chs = {{24, 16, 8}, {0, 0, 0} },
+    .has_midi   = false
+};
+
+int snd_dice_detect_weiss_formats(struct snd_dice *dice)
+{
+    static const struct {
+        u32 model_id;
+        const struct dice_weiss_spec *spec;
+    } *entry, entries[] = {
+        {0x000007, &dac202},
+        {0x000008, &dac202}, /* Maya edition: same audio I/O as DAC202 */
+        {0x000006, &int202},
+        {0x00000a, &int203},
+        {0x00000b, &man301},
+        {0x000001, &adc2},
+        {0x000003, &dac2_minerva},
+        {0x000002, &vesta},
+        {0x000004, &afi1},
+    };
+    struct fw_csr_iterator it;
+    int key, val, model_id;
+    int i;
+
+    model_id = 0;
+    fw_csr_iterator_init(&it, dice->unit->directory);
+    while (fw_csr_iterator_next(&it, &key, &val)) {
+        if (key == CSR_MODEL) {
+            model_id = val;
+            break;
+        }
+    }
+
+    for (i = 0; i < ARRAY_SIZE(entries); ++i) {
+        entry = entries + i;
+        if (entry->model_id == model_id)
+            break;
+    }
+    if (i == ARRAY_SIZE(entries))
+        return -ENODEV;
+
+    memcpy(dice->tx_pcm_chs, entry->spec->tx_pcm_chs,
+           MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
+    memcpy(dice->rx_pcm_chs, entry->spec->rx_pcm_chs,
+           MAX_STREAMS * SND_DICE_RATE_MODE_COUNT * sizeof(unsigned int));
+
+    if (entry->spec->has_midi) {
+        dice->tx_midi_ports[0] = 1;
+        dice->rx_midi_ports[0] = 1;
+    }
+
+    return 0;
+}
diff --git a/sound/firewire/dice/dice.c b/sound/firewire/dice/dice.c
index 6c93e6e4982c..4bcd026a0b3f 100644
--- a/sound/firewire/dice/dice.c
+++ b/sound/firewire/dice/dice.c
@@ -396,6 +396,78 @@ static const struct ieee1394_device_id 
dice_id_table[] = {
          .match_flags = IEEE1394_MATCH_VERSION,
          .version     = DICE_INTERFACE,
      },
+    /* Weiss DAC202: 192kHz 2-channel DAC */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000007,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss DAC202: 192kHz 2-channel DAC (Maya edition) */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000008,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss MAN301: 192kHz 2-channel music archive network player */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x00000b,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss INT202: 192kHz unidirectional 2-channel digital Firewire 
interface */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000006,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss INT203: 192kHz bidirectional 2-channel digital Firewire 
interface */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x00000a,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss ADC2: 192kHz A/D converter with microphone preamps and 
line inputs */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000001,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss DAC2/Minerva: 192kHz 2-channel DAC */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000003,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss Vesta: 192kHz 2-channel Firewire to AES/EBU interface */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000002,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
+    /* Weiss AFI1: 192kHz 24-channel Firewire to ADAT or AES/EBU 
interface */
+    {
+        .match_flags    = IEEE1394_MATCH_VENDOR_ID |
+                  IEEE1394_MATCH_MODEL_ID,
+        .vendor_id    = OUI_WEISS,
+        .model_id    = 0x000004,
+        .driver_data = (kernel_ulong_t)snd_dice_detect_weiss_formats,
+    },
      { }
  };
  MODULE_DEVICE_TABLE(ieee1394, dice_id_table);

base-commit: 9b4469410cf9a0fcbccc92c480fd42f7c815a745
-- 
2.41.0


