Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830463DAB0
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Nov 2022 17:31:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFA716CB;
	Wed, 30 Nov 2022 17:30:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFA716CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669825901;
	bh=s0WnrFHmqOACfzcMu26gBeBYl3edpjiybthmxKpH+/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zru1NOyHPJC3Y+g9cpNOsPhoFoxUJwItr+OcpdlF2eLmPDrmsbpBKjzsRxGcTVF6i
	 isDKsoCkJ95M/LsTXbo9xkSxoOvVWpWraORcPTP7I3rZqDZ+ULrzGwvecWzr3ZCRx2
	 WDbVhNAdCmyElvZ4oYWLxbHDfFvOjpCH7cPUghH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C06A7F80571;
	Wed, 30 Nov 2022 17:30:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 013FCF80567; Wed, 30 Nov 2022 17:29:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69BC6F80166
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 17:29:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69BC6F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="mOuVUHz6"
Received: by mail-ed1-x536.google.com with SMTP id z92so14340058ede.1
 for <alsa-devel@alsa-project.org>; Wed, 30 Nov 2022 08:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6ETFY98Djerultq4KLtR6AVoerFeGGcqSarOrF7urjY=;
 b=mOuVUHz6VN9M0sllJmsb8AWyBmul/XEfCrj9eIQSCZjFUDF2baPxWJOeDVOMZSnvsC
 oM6RwONvZ3w12cZNmJ2WZFy0tsZnMQ+WSa7DS7CobK466Rr9nc5/LzgOdRYMc+GKKsFD
 WvEoE1qPjS5SexDn61VP+p0uIRiEE8bDv8VtY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6ETFY98Djerultq4KLtR6AVoerFeGGcqSarOrF7urjY=;
 b=HruN4+5bEysikMlPz+0shFNL2DuJnXCUniYdwcs81lEyNcb/UW66GIO5ajPwtjPEPW
 bI/l6PSakZgyz+VwUQH0fRrftEx3b/rw+CvcSeGEgnn+2m7EnsM7DgjpFsbQVF8Oaf2I
 DWM2i/IuqGdOJEezBatHb3lTLvKjCcVzPtA1i3/gPCaIWFcYWyM71tBidn4aYmSSwkIA
 m96AmEiXLwwR8NDbuwFgLrW8GqAuLIP0FJgNHHhgCCvNSohxUVjROBYEdMzVpDgiqnxk
 DXhXiNGGNCwSBBlnAjgwdqPOFW4TKou8zVe0kYf0DoY4kNJ6o1bl+EFMWlihhOYjZpaB
 vMAg==
X-Gm-Message-State: ANoB5plH8BAnrGwjaThTrGhfui4x5al2CWPgSGgYBksKcJb+uQJOd4aY
 g9AYhfPoKUMldRZIi0jDvtYwDw==
X-Google-Smtp-Source: AA0mqf4PjxFiboFRsFVuSbBdqbmaMnkL1+svg0ftRlMBulSysWMsHV2ZIZrCJx8REYR+ImWj8qndAA==
X-Received: by 2002:a05:6402:3226:b0:461:37c2:e85c with SMTP id
 g38-20020a056402322600b0046137c2e85cmr46479326eda.74.1669825784487; 
 Wed, 30 Nov 2022 08:29:44 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 cz15-20020a0564021caf00b004589da5e5cesm786114edb.41.2022.11.30.08.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 08:29:44 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 30 Nov 2022 17:29:21 +0100
Subject: [PATCH v7 2/2] ASoC: SOF: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v7-2-127c582f1ca4@chromium.org>
References: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
In-Reply-To: <20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Chromeos Kdump <chromeos-kdump@google.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Eric Biederman <ebiederm@xmission.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2186; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=s0WnrFHmqOACfzcMu26gBeBYl3edpjiybthmxKpH+/s=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjh4Tz1DIcr4kWbbZ1fXNR7GOJEmWiNmJULPm1G4vq
 7JEKT8SJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4eE8wAKCRDRN9E+zzrEiCmTD/
 9r90EMfLYitLj+CAj5pTW15Y84UH1h3P61FQVh32MliSSUHIdaXNjseCKrv7e+tRpc41lSmcj/OW74
 WxrUoPxQ1Hktiy++0SXNp4dS91cD+tbXSaBxWj4qoKjJOq0JH+W60hWylFoZ2/Om+iyC2ul4p4tlqS
 dLqbMKMExGlamGKbby4s30fBpiAf8AlaeucTa92XDjOkMh27VVRldIAwqJWJopV9PuD8JzoMUGZ90L
 /bXspDsLDMWxAklJhaDhZXnyaUb/nXV4fyfpMkrIVptlxBnU7Bjt7lnxMRO6nmXIE0ukVeedXvacU5
 8mxayfCFK1shZEtL7dOFQsmKWJFX3dFCX6NGYbw1A452mgfZZS4rLwkVpBlzKdrir8u6NwERyd5sEI
 InfH5v89rrFOTctLuieBszRFPTd6pZhoS0reV7c1tyqR87MJvAXGNdvnEJawj9LSFmQXUOF3fxBho+
 NXeyIahMvQZrYm43EwYWLNdvflN+eBi5mRkOWJlLb1IsHfDZdZV3Esdzse4iw2k/dHLRN2j2cN4NMq
 evboar7x2Z0aZo1yEP9zFjFAS3V7tnv2ZayHWT3F5veuN2sPxKpy4/MQSY8tibH0uGYZDi7/UCdIlX
 4+H6VL5A+bSxCSTd/vzO13wZs8Y+XagJNmDmIxBL/e3Tf4M7ZjMznFTHqfuw==
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

During kexec(), the userspace might frozen. Therefore we cannot wait
for it to complete.

During a kexec with frozen processe do not unregister the clients.

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
