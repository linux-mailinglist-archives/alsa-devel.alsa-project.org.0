Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E684639D9C
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Nov 2022 23:31:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B06A3169F;
	Sun, 27 Nov 2022 23:30:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B06A3169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669588288;
	bh=vSOpuuFdgZYxy52S82bSfaK5WHtlLvOplTVJgBOEdKQ=;
	h=From:Date:Subject:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dLi+xDqKc3SUfHyQLDrlWTf/4os7IIDLIJ/CPJJtKenRUG7SyuQ6VYdZ1RtbZBBl7
	 vwtRTkpgLf1jKjUhWPOQiTqVfD7PgFPBJVLauvjgS9RBmCvxmuhwXLG9dgzU8635VW
	 zgqzrH/IJHF5LtyaCeGXPeMvyONfkvowRm98ZBeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 477CFF800B6;
	Sun, 27 Nov 2022 23:30:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9ECD2F8027D; Sun, 27 Nov 2022 23:30:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4338F80169
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 23:30:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4338F80169
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="LKmXdS07"
Received: by mail-ej1-x630.google.com with SMTP id b2so5461536eja.7
 for <alsa-devel@alsa-project.org>; Sun, 27 Nov 2022 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vy6b+2Jwie5oAuVhXrhPa4s/4ks+I1u0OeKd1k4SuIk=;
 b=LKmXdS07E0cLjEcc25SkOtUZ6q0AoXJyoF7DsqDJlA1V/2XvRhIKzHCEg68NGAzD7r
 Y2BuDEBLUODq7x0lvWK6S8/YHBdeA9sBVDcfwebSRZRlfqQSd/HpbFkZqx0T2+ctgxcS
 7jOtcl+ybQC3x6lVkDEq52M1i5nbZyLwpljPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vy6b+2Jwie5oAuVhXrhPa4s/4ks+I1u0OeKd1k4SuIk=;
 b=AgtISlAAwej8lyplvcHLRRjK32mKIQS75wgxiVNvvzpD0AdCAKX5/eHCeE2lxNhw8I
 TiqnbBdTNJfmsHrzXIBm8gAi4A9lPiqcH0gtdNWbvPV4naxo6zl42zEfoM5APFroG4ZW
 V3VuXjRXtVoIMjx3ub2v3FBxGuRBUt9jOUEvlfAiqTzMH8nGzf2ME6FUt94icdR1Kdwf
 Qjh4HBAwIs3QsjcBSNAGD5a+OjoQcDdlnGGOhbDZKZbLjirvoh/Gy/FFTWNvwypdqFYQ
 Mjhc8xnvob9Ck38vY+766MrALsP7coihtMxbjG8XOH9rUDlvdODcEHowkLknJ59nb4qF
 XJNA==
X-Gm-Message-State: ANoB5pmcJzA9F03C8t4o0wmw2r0dABtTverHn+6dt0gULw15xOy3M79T
 7EyIdr2jROBjlMi1Bjkq2BD/gQ==
X-Google-Smtp-Source: AA0mqf5LFUClf1GDAUddkscW14iXIuCzDLQWdIk1JMIZKw4h0FDA4woo/jU5jbd2cg9Vy+gNGKRrKw==
X-Received: by 2002:a17:906:5a9a:b0:7bc:26e:a259 with SMTP id
 l26-20020a1709065a9a00b007bc026ea259mr13377644ejq.445.1669588222698; 
 Sun, 27 Nov 2022 14:30:22 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 vl8-20020a170907b60800b007addcbd402esm4183300ejc.215.2022.11.27.14.30.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 14:30:22 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Sun, 27 Nov 2022 23:30:02 +0100
Subject: [PATCH] ALSA: core: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v1-0-57461a366ec2@chromium.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=vSOpuuFdgZYxy52S82bSfaK5WHtlLvOplTVJgBOEdKQ=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjg+Ts3gkK1hK2p3ewizPoTXeV1WIlrp0gIhqZLpA1
 3rMnizuJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4Pk7AAKCRDRN9E+zzrEiP61D/
 sF2Ki3YHyJZ/4vkhqHlo8n1XnQivdvWiFYO2jHO2uk/4yoC9D+HHxcoalwLTDz8uJKYrD9fCm20+NV
 CGgLa7G6xaEmfUh2qAj31vzUGgSYEkJcxjkBf9jnb5GuoQnParEV5Tf9oZg89NcAeexpnXvIYldxxw
 Ruq8gmQW6Rlrd3unW9PniqUH7h+NKm1eO333NM0/ymN0RuaK3CULN0yV3xDw1+RfcoAwe6A2mfIS1o
 tc6mXX7Qnn5dQvCIfj+6afdjVcdlSQx30v4EYNi4fuNJv2TatkfXU9zPjMOQNtz4hldGraxFfo3vkt
 hyoVX5xn9vYMpfbr46KIA9lD36dlVXP8uwQQhtaLpjP3AMABJMKzFzKnIsJx9lBEKQoM6GrWYXbvL/
 r5/39XGXfCVpbKtwc869iMNiQvcVuaDxq3j79GpbYAhN9ingNa664n8UMmZASAhd1lCttx2lQ3fRfp
 yF1nYWl9Dam0QLQKt2ou3lgiCQctHsPdJiO3R23HJYFJz4llfZCX0yzErMc3cLLm3iumWproTh97kh
 AQ87U6E1CJyXygA9eqOS3OPnJo50Api7+CmFVFuITDmcMtzh4L9Zw3sqIsQykbefH1BW3MR0dpN3Cz
 mMVsvOKhKMzD5RDOjICrWS8ak3/lN6pRav13Q4KuLhk3vX03xlah4XBo2fiA==
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
 sound/core/init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index 5377f94eb211..f614a2cdea3d 100644
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
@@ -573,6 +574,11 @@ void snd_card_disconnect_sync(struct snd_card *card)
 		return;
 	}
 
+	if (pm_freezing) {
+		dev_err(card->dev, "Userspace is frozen, skipping sync\n");
+		return;
+	}
+
 	spin_lock_irq(&card->files_lock);
 	wait_event_lock_irq(card->remove_sleep,
 			    list_empty(&card->files_list),
@@ -658,6 +664,13 @@ int snd_card_free(struct snd_card *card)
 	ret = snd_card_free_when_closed(card);
 	if (ret)
 		return ret;
+
+	/*
+	 * If userspace is frozen the wait from completion will never end.
+	 */
+	if (pm_freezing)
+		return 0;
+
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
 

---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>
