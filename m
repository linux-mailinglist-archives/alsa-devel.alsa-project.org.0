Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0846C639EA0
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 02:11:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86DFD1693;
	Mon, 28 Nov 2022 02:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86DFD1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669597895;
	bh=bThzG3aRgB/sOrGMJQB5LC1dlBBXr23rW/xD9I0gXNQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R677rsqzMZCBYzJEXacSnzBdtlE+JLJrbeWVZZ4jQIY1VOUOEuLQKmfil8U6qSXjL
	 6+w3/ihGDtFMHoWQC8DnQzdp1Gqs1a2oNFJ/P4UmyANMQQOePEf1WENaSLbUUv0Q7k
	 dVHLhWXYDrjrQWo/VrnjsCGYbz8V4aeSqoRzmR70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F3AEF802BE;
	Mon, 28 Nov 2022 02:10:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D903BF8027D; Mon, 28 Nov 2022 02:10:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A092BF80169
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 02:10:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A092BF80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="UzR8DcMQ"
Received: by mail-ed1-x531.google.com with SMTP id r26so11400207edc.10
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 17:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4rtPx/wHRBmLXkavVYA1NDTQhY5kq6GDYlUhH/xUxZE=;
 b=UzR8DcMQoFb5PzukzVAW8QM40EE80GdkFkg90endjIMDfCTyc7qzl5ISMWKRw/kQHN
 GC+JvePNfeK7QWSwGMHD3kh0n4L8NbR8nXSnf3eTJtW1igI1nf7GamgA1V1hzEQ+b487
 gQ/jzHz5pbKl1vhMF5FEZdSfdMfjgDKV3DrEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4rtPx/wHRBmLXkavVYA1NDTQhY5kq6GDYlUhH/xUxZE=;
 b=VLl6e+KUXKsGG/CgU6rGOY30zG+zO3q89HiVAT2bHCljNsrePItEfR2UpNzn9oRanC
 D5Q5H+dJqHL9oxU9fdkhCJ9NqiZRZXMBlr0sQN9tjTI3soTjF9/yql5uGjOutUuoaqAU
 pU1JcMs6wsr7DH+PcrtKFw7boRponpKl6wXmY8+RC7BgiIwKKKh+zcAFi1/H3WH1wvGb
 lY0YipjU+i7vEPQBzFrUbXdFV7YF5h51nF+Pcl6aqvraQitYNmuoZq0UEFDTjloZi4Pd
 PFecd3syDY1xfaSo9LRTtAXuomWn4Kdg1P6W7HZvTTMDgRxhyyqTFwAZHTJPsEZrMxxj
 Plww==
X-Gm-Message-State: ANoB5pnSFvFkopxuBF45uDbkcPRczruBgBgcFUcSdiIwdxEdy+ScSoJT
 LIrCsw1VL6u1BcrrRGW4KQqnnHwA/aEH6Q==
X-Google-Smtp-Source: AA0mqf7vS5N9OhHs7DIepOllox7bl/JKHWyYuEoPKq1KHkrQhkmTIaI5jvdwYa7cTtunenn67/QVGw==
X-Received: by 2002:a05:6402:541a:b0:463:be84:5283 with SMTP id
 ev26-20020a056402541a00b00463be845283mr4173024edb.7.1669597830462; 
 Sun, 27 Nov 2022 17:10:30 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 r9-20020a50aac9000000b00461c6e8453dsm4618920edc.23.2022.11.27.17.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 17:10:30 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 02:10:22 +0100
Subject: [PATCH v2] ALSA: core: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2836; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=bThzG3aRgB/sOrGMJQB5LC1dlBBXr23rW/xD9I0gXNQ=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhAqAgz6GX+nVta5dYboWjnLx1ooIVZ4GxuPVK4GE
 sUiAjxqJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4QKgAAKCRDRN9E+zzrEiKSnD/
 9AIHnQ5OfDU4aPlfzZKbTEIv1bKBvOi4LYh4P5qKmBroX6tBRqNdNmBWPOEzfKTzvOynP98c95o5kF
 0KNIFK4lLja8CWhPvaSxrtY2DA3kRSoQ4utnYTZ0mumkpDQnIY9FWiyCbgjFi5csOq66gKfNR8gnWl
 qYm68hnhTUc5L4ZlLwYO4U/yR05NY68CMaQWqTztlwBiizmP/5hhKpz0+Z1aFOVd0iW2QAGAMH56u6
 IAZx9UrWJIOpqsL2QphwPABwkTHP7GiFezPWEDZCbojXnD0Plhnupm52KPN5JTTBEWuLFewyIvkMl3
 NMdFI+5kBgmuTPRsuw9/0Oq4rJHTvKcCD/tPr0ZDGiM9HXzyq2rKgjaYYkNu/qLqHpPoSbQJf+wVlm
 liRLhc+6ajmFpjwE4hHmPtC2r36HMbY93awNIgDanHxOS+W1wImoQtnydqZOVVQdy1bs17lnTGsz5v
 XcoA/HkMl/vjHeX1+6eJrig+0YsuF1o1IELyRa7xLGxIYmuN6CNvafbRoCNUVysps02u7QZrbbSmQE
 gBZMcCM8mGpOuo2AQknJXQACmh+/jBU+IUjuWpUbOjlhzPdMQrfHhl83IloPSd+ToqlemWd01WnBfc
 jE8lWgP4Ut6Atz0aHs7iLHV0ypJUoGyCvuag1WgoPgUNH6YNBZpz+fKffrsQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>
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

If the user space is frozen, we cannot wait for it to complete.

This fixes:

[   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) done.
[  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 seconds.
[  246.819035] Call Trace:
[  246.821782]  <TASK>
[  246.824186]  __schedule+0x5f9/0x1263
[  246.828231]  schedule+0x87/0xc5
[  246.831779]  snd_card_disconnect_sync+0xb5/0x127
...
[  246.889249]  snd_sof_device_shutdown+0xb4/0x150
[  246.899317]  pci_device_shutdown+0x37/0x61
[  246.903990]  device_shutdown+0x14c/0x1d6
[  246.908391]  kernel_kexec+0x45/0xb9

And

[  246.893222] INFO: task kexec-lite:4891 blocked for more than 122 seconds.
[  246.927709] Call Trace:
[  246.930461]  <TASK>
[  246.932819]  __schedule+0x5f9/0x1263
[  246.936855]  ? fsnotify_grab_connector+0x5c/0x70
[  246.942045]  schedule+0x87/0xc5
[  246.945567]  schedule_timeout+0x49/0xf3
[  246.949877]  wait_for_completion+0x86/0xe8
[  246.954463]  snd_card_free+0x68/0x89
...
[  247.001080]  platform_device_unregister+0x12/0x35

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: "Joel Fernandes (Google)" <joel@joelfernandes.org>
---
Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER 
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org
---
 sound/core/init.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index 5377f94eb211..35fb71177fea 100644
--- a/sound/core/init.c
+++ b/sound/core/init.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/file.h>
+#include <linux/freezer.h>
 #include <linux/slab.h>
 #include <linux/time.h>
 #include <linux/ctype.h>
@@ -573,6 +574,13 @@ void snd_card_disconnect_sync(struct snd_card *card)
 		return;
 	}
 
+#ifdef CONFIG_FREEZER
+	if (pm_freezing) {
+		dev_err(card->dev, "Userspace is frozen, skipping sync\n");
+		return;
+	}
+#endif
+
 	spin_lock_irq(&card->files_lock);
 	wait_event_lock_irq(card->remove_sleep,
 			    list_empty(&card->files_list),
@@ -658,6 +666,15 @@ int snd_card_free(struct snd_card *card)
 	ret = snd_card_free_when_closed(card);
 	if (ret)
 		return ret;
+
+#ifdef CONFIG_FREEZER
+	/*
+	 * If userspace is frozen the wait from completion will never end.
+	 */
+	if (pm_freezing)
+		return 0;
+#endif
+
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
