Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD0163D9D9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 16:49:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2743F16F7;
	Wed, 30 Nov 2022 16:48:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2743F16F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669823354;
	bh=z1BRJ78WvLmPHnisXXoQjw9rs0LQQZ8YHVqPdLBDGn8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpmVAoPBuOPoAgX1Tr9BWkujdIe5vvlS605KkyFev8+MTWGPIgjQBHOAiWjeZggvI
	 OjGEsLQNYeIrF3U4ki8VP0D8dJft4+BkjxxrCYIdV/sjx5jvfLn4AkC/LkEOOdQj60
	 iqqPAueKUCyyFapw7tbeiRElu2avX5ewQc89KoQ0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AF3DF8053D;
	Wed, 30 Nov 2022 16:48:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A9EAF80559; Wed, 30 Nov 2022 16:47:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCF8F804E6
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 16:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCF8F804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RLfl+m/7"
Received: by mail-ed1-x52f.google.com with SMTP id l11so24616966edb.4
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 07:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/fLIsVAH72GYN4wSnEbMTMIto1VdntwqvQJh4XKX1N8=;
 b=RLfl+m/7E/E0w+XzZDQvyhYuzJclHPZLb/xSf+gTZ1X7y2BNXGynHFx0l2nbPf2//u
 QVuR8KoO0bXq/0ozfPU06OZ1ONR6QEfqUq2KJ24AvftES2ghu4Sqfn2ST/mcihAn89Nw
 DoGH5G8fkqo6dsa7Pf7WSY5UXM7UtHAfjZSvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/fLIsVAH72GYN4wSnEbMTMIto1VdntwqvQJh4XKX1N8=;
 b=ZbKjlAJ+mcqW4RsUDPEO9+u06q0rbkXcBoBsnc6OFIA1S+yMx3ECaayFwSi+hbIbMT
 Dwf58i/4UeanG8kcufLnwdi9XLc24ngYbEkXEp7x7rF4m5o9zqRRjmeUhNskEGgcoMzh
 SptTVd7M4hdgxnV0P87925F3NyH+psU1HDY/8sUgfaMVlUQZgrla5rRZ4yxIYteRwsNt
 ZnLVhzjJfRdTmx8oq8pOSQPiRoLqxhHANY3iD75yCaEnhBIy1uF4WwvKu/3h5eyg0H3I
 qKvbE8Jm1fu1B8eJ9eaExQIMMcHLzmTRP7Er6KWpGM3jXs0At1Hv5HAlychvIhsphxXP
 mgDg==
X-Gm-Message-State: ANoB5pnDLEwh8RdMke11hODvjhsWOECy6wVP7caf5NofDU+bc/4s4k3z
 EwXKe3L4FAAF/yJGN93Qi4rnZg==
X-Google-Smtp-Source: AA0mqf4IYiD9H16IuGz/np51rmxmX2exbBKAoU9sx6CGbOo8xnMm+kZ7DVDgJ9emxgRoPNGt2ivddw==
X-Received: by 2002:a05:6402:1f85:b0:462:2410:9720 with SMTP id
 c5-20020a0564021f8500b0046224109720mr12193484edc.84.1669823266173; 
 Wed, 30 Nov 2022 07:47:46 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:5b33:e3f2:6a0b:dcdd])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a17090623e900b007bf24b8f80csm775075ejg.63.2022.11.30.07.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 07:47:45 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 16:47:16 +0100
Subject: [PATCH v6 2/2] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v6-2-3e90553f64a5@chromium.org>
References: <20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org>
In-Reply-To: <20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org>
To: Chromeos Kdump <chromeos-kdump@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2174; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=z1BRJ78WvLmPHnisXXoQjw9rs0LQQZ8YHVqPdLBDGn8=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh3scbdrJzfpRqMNqZtaSFQjjhLnKBxlJMQeOOkOM
 m5234GiJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4d7HAAKCRDRN9E+zzrEiN/ID/
 9+jG5ZH/OSbpevz4Xx7ZmZUrjhaPMR5rVP35OfUsqfj/ADrCAhJC2vlwQpcs2lie7FAUKfb1BM4VWQ
 7EozfqEAJPYlbN6HiKf8Xidp9z8sW4/g/0gSEQ60cMBSEnM8UlVrqt2eFXi4ARZeoUzjr58IEXMjVu
 Rr37vapYJMliIJKpJ8oI3Bn8vwDFjC1hLjhEb5ZgTCIESl+/ZZb+jfCIlS2qytNrH4zjpoX5Hk8QZR
 GiiHXMQVXR/ynfZbB8tJI7mn024lZ/0OWniech+uJArvwaJxOM5zt5kxzweiQ9QH/L6IwPwzhfSYJV
 i2rmkKdEI1PYKK1MbUH0ep2XRYWO/B8w8MHBLK6JsqA8fSwJ+5YRMAnN96rHs7hUD6+J8P7rPrkkO0
 cIpHzcnsBkm8JJTTLEkkQI8gzeNzRjjW8yNlqoFnQnR7wi+wgcKAGzESkwWWysMGq7kvLU7+Q6Bwn6
 T9c+1s/pVqGANlQ4BuVOKgO1pgLNzRqfef1yz7c53cJ+VBHCGYGOZDIc29r/tH+Cep1mpSbhJSA2vj
 IGcfgZhuOGIhR9dctOZ/M8+g2BC5LwhhncH5hK6xPdecknFPpzElV3oXw8U8w9FLa/Bhgje6cPjGmS
 Phput94//O2tfEsQ92F9dOxUP5sj5cBNz6LJljSdByoRowt/YVTcfvnHkNkw==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: alsa-devel@alsa-project.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ricardo Ribalda <ribalda@chromium.org>, sound-open-firmware@alsa-project.org
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

During kexec(), the userspace is frozen. Therefore we cannot wait for it
to complete.

Avoid running snd_sof_machine_unregister during shutdown.

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

And:

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

Cc: stable@vger.kernel.org
Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/soc/sof/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 3e6141d03770..4301f347bb90 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -9,6 +9,7 @@
 //
 
 #include <linux/firmware.h>
+#include <linux/kexec.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/sof.h>
@@ -484,7 +485,8 @@ int snd_sof_device_shutdown(struct device *dev)
 	 * make sure clients and machine driver(s) are unregistered to force
 	 * all userspace devices to be closed prior to the DSP shutdown sequence
 	 */
-	sof_unregister_clients(sdev);
+	if (!kexec_with_frozen_processes())
+		sof_unregister_clients(sdev);
 
 	snd_sof_machine_unregister(sdev, pdata);
 

-- 
2.38.1.584.g0f3c55d4c2-goog-b4-0.11.0-dev-696ae
