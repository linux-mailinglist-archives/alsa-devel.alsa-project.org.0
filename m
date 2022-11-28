Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB85663A466
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 10:12:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B18616BE;
	Mon, 28 Nov 2022 10:11:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B18616BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669626748;
	bh=kX5q/LQa03Qii9iO9IQ/nJfIRw9n1NXI7ONu/Y5ZJ24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3FSfdiwkNjumyrjtZBVgqT1ktU1bGdU8YWPBdyKSfG1Vsssjb43QIzSDr1uhOUak
	 sLqmEdu8ADnbE9FOBFzZLgt4G/4jRtnx5oOqojM8V/MAA+pwXuARJwX6E4ZbCM1xFQ
	 vCARcbTUD2/DELGP6ma+Y9l3rLj19mr3I+NlwgxY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55FDAF8020D;
	Mon, 28 Nov 2022 10:10:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45C05F80557; Mon, 28 Nov 2022 10:10:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C17FAF8020D
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 10:10:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C17FAF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="CGIt3hTL"
Received: by mail-ej1-x62c.google.com with SMTP id b2so7805373eja.7
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 01:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9ubdN1bACjKh+qjO28e9C129nQGAl5iy3AArXYr64tA=;
 b=CGIt3hTLCHNo7o4kNPYEi01hMNFq6HcqbpnhXDpYaolzFNCWPKZDVAiKB0j/C5S+O0
 0XBTmjLWIAsGP7fP+zKvcfefLmGVkmOKMAulmY0h4aUBuLvXLckOD+81KwAaEuJjZUni
 TtdfCWzaJp5TO9hlGKgX6DsLDa3FClxwPkUlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ubdN1bACjKh+qjO28e9C129nQGAl5iy3AArXYr64tA=;
 b=UFCgL9rujruWAxeGW6m87ymM/3vfZw1tNFWNxN1dsmieeO8Ycy8PQyIMhDKclUUpTK
 Vf0Ovco/zZfhPc7F9gYSNgzuwaYqkDxMOuUPL0Og74s3gVqv3AuHSt9wHpselmotcQ8v
 onyABza4Upn+ffPwSBhDc+2/R5tKQ6RVIJvpvVXZbFydyzM5oiJ5hlYek+8HtpddwyXv
 62CGlBCLU4vaftB8KbllFU31Jcxp9exLXb+2nZTimUD/wl2MLZKzm3dWVX6P8nVXOFGN
 1DziqNzLFDCiFwgFuKs2mujrfQUbmeDXMJJ7l8BlMwAsA5xAlkLSmylBXwceI28mflav
 Z5pQ==
X-Gm-Message-State: ANoB5pkrQEwBrbiXeNxccB3xduoWIg1i5Ow86VyTa6gqB+Gc7cYOxBfp
 x7sDhpNr1pWufbXAsGjaGjdBgA==
X-Google-Smtp-Source: AA0mqf7CDadNIIxLmDaGMGWeVngi50o9v9Dqym8FZqs9w0o8qAyuABJVXcuAWg331ZRRka79f2HTMg==
X-Received: by 2002:a17:906:65c4:b0:7ad:d250:b907 with SMTP id
 z4-20020a17090665c400b007add250b907mr42053835ejn.737.1669626637954; 
 Mon, 28 Nov 2022 01:10:37 -0800 (PST)
Received: from alco.roam.corp.google.com (80.71.134.83.ipv4.parknet.dk.
 [80.71.134.83]) by smtp.gmail.com with ESMTPSA id
 p35-20020a056402502300b00463b9d47e1fsm4932346eda.71.2022.11.28.01.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 01:10:37 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 28 Nov 2022 10:10:14 +0100
Subject: [PATCH v3 2/2] ALSA: core: Fix deadlock when shutdown a frozen
 userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221127-snd-freeze-v3-2-a2eda731ca14@chromium.org>
References: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
In-Reply-To: <20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org>
To: Takashi Iwai <tiwai@suse.com>, Len Brown <len.brown@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=2405; i=ribalda@chromium.org; 
 h=from:subject:message-id;
 bh=kX5q/LQa03Qii9iO9IQ/nJfIRw9n1NXI7ONu/Y5ZJ24=; 
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjhHsK3xG667lVW6abqTwHNWMFth1Fvx2d+BxA++3v
 Kyqt7PGJAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4R7CgAKCRDRN9E+zzrEiHESEA
 CH6yG+4PYU2KPtT5xs5JZ3tJVMf2A/fn6qpW4cAnsLipCsTlfOiePAN1wcBS5ofPRJp0YcP38QoFX/
 ru3NhJ4QwocI5S9bqFFkLYq2NgKN4/RAwtvl0ODLqIlqsZgS4+QqHUQFyu6x2i6iAAgpSAH7dRWHPQ
 gd1rFeUjycV+Eb7yEPekd2NhF9P8BYCVIvvtceM20Y2G0NFKZaS59NVs8xSssTz4wL39E3dFj08Zne
 AVkUr2z80tttz2l7BKr6LDTC4tJHN+Qm9oEd0uEumZQ/BY3arElxHfG6twOR3Sawt15eWV59bQLLsf
 eWwbgxtUwTjSD2QTGC4aAtd03VrZhUPohtn/sMkvasE86nMJJJvRQlnPldg+h+r2K93jQX8L8FRhZN
 PNoC9mxMuZCRq1falbvBOri3SWEterzZ+ZSg1KN38/e/m+ace1HOWEfIVcU8vB3Hz0CwdLmI38vbrn
 CSJlv31Lpjey1qOwNsnWSAY/Qzko/OqCvzrJkHSbSmYLUtAnvsis01HZJkcsoUTOuOpkSKTxDr4C6d
 4TCVkwVMjud6BJynkM/qKgHEFJZAsEHG6AfWlHqUzmpEP6PmSe4LvP0UV+tmi4kA7dcHqLwZtxkuE6
 tBq2wZ3oRpgTh8whQ1+4Emlv31nvmWoo58hmWc2V/JKJM+IpxnBDPM/rxU2g==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9
Cc: "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
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

Fixes: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 sound/core/init.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/core/init.c b/sound/core/init.c
index 5377f94eb211..bc038b49d4d3 100644
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
 
+	if (processes_frozen()) {
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
+	if (processes_frozen())
+		return 0;
+
 	/* wait, until all devices are ready for the free operation */
 	wait_for_completion(&released);
 

-- 
2.38.1.584.g0f3c55d4c2-goog-b4-0.11.0-dev-696ae
