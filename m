Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E593A4FA02
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Mar 2025 10:28:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892A960354;
	Wed,  5 Mar 2025 10:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892A960354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741166928;
	bh=9gQbIzNVhoQIzovUWfH4Y8HRetH01I6z6Lsb0q2aHIw=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mEx8iLmq3x9XtZbx2N7NWCk7eSUtBRkflDe8wAIouJNgwziAGpUQuF/yEnk694z9e
	 1JFwhxeqH7MeZxUr3cvFhAaCh0LzgZ8IB+l9jZVlygmxqDLmUrpZFTNfEzf8uuPxMJ
	 aWQ04Cpn00cU4BPIyzGUU3HLur6wwaU0DN/1ck4s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76334F805E1; Wed,  5 Mar 2025 10:28:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 075ECF805CB;
	Wed,  5 Mar 2025 10:28:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA103F8016E; Mon, 24 Feb 2025 03:05:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E6B0BF800E4
	for <alsa-devel@alsa-project.org>; Mon, 24 Feb 2025 03:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B0BF800E4
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c0a159ded2so374782685a.0
        for <alsa-devel@alsa-project.org>;
 Sun, 23 Feb 2025 18:05:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740362720; x=1740967520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVSqNcKUIfRzpV19zNdCPiE9Blq9UeTeZ8GctWrqf18=;
        b=IalGU5Ru9ysSnKzLPpAapPMH4q+TDDa5HO/uGfikv7xWbPzeuL1b2sSngRt0D9LhvP
         VkvkU6unvgCDPtDu4gGKAqfMYAX2HRYfjHkTUCHmvCNHBUQ7JvvWS5aKcMXx2kpjL8An
         2wLBd3pJhiDoGUeC+WDTwTurWXIO/I7nyIN4EaIeag82jhSUWoAjIB5DRv8ZNZMk11iZ
         BsKXEQ4sfvBn1JuL8XLsGlbg2MrNJVRuqn+/by7a9eTNCmgv7HaLqZ7OZGkAhJigv+Yn
         shjU91muO/tc7+1PeU5uEXNadafioNntFeI4ObkboeVyQVCSOlxBz7JIy7P7y6oMhe98
         Qh9w==
X-Gm-Message-State: AOJu0YwUDzekNmcPZO5lJ5ztvCvGDEHsRJV1cun7QtPHHYhz74SMBMyB
	Xfo8ZOY4OX1ssiTLM1uW7zCQiuKbRW8uMrrHVlFX/v40wP84n40+q3/Aw7sJaBo=
X-Gm-Gg: ASbGncvwCGUdTm0etwWmgjaPLRjq+hK649k+/Omq0vH3hmiKwJls017J2Kl5GudCXaD
	PL9WLaI/hJppfn1x6gvhTZxCFJdjMEagwMTAg2zgah7LLVvOK1iM6cI0nom2l1ZlWHasBhACcTc
	uQba9c+/78gHQAiD28THguu8qeWw0IrWeVqK2hr1CJfvKlkVfxnKO6IS5OQQg2Oj/00TWHPotME
	8ofI18Y68d0ABdRzK39gJOi+zSX9W1OEEX0x2GSsk50KA8IkIBlJgIeHkoO0Aetby7ndXaw2LED
	xJZ3PZDZk8lKqUj4RINITLJM3WULlk9LZtjtMVqO9USRTjBYJ7g7pEEFiJJj+E8UK3ralKIN2U4
	=
X-Google-Smtp-Source: 
 AGHT+IF6iwICUSk+b1IO+uE+zwHiHZiORQJtLH2vrnQbUznZwi8Rq4pitvGbR8IsgoDR9Pw4drt85w==
X-Received: by 2002:a05:620a:2a12:b0:7c0:b1f3:b4a6 with SMTP id
 af79cd13be357-7c0cef6edb1mr1696014585a.57.1740362720522;
        Sun, 23 Feb 2025 18:05:20 -0800 (PST)
Received: from arch.localdomain (pool-108-30-255-102.nycmny.fios.verizon.net.
 [108.30.255.102])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7c0b3bf7374sm697988585a.95.2025.02.23.18.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 18:05:20 -0800 (PST)
From: Hoku Ishibe <me@hokuishi.be>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.com,
	Hoku Ishibe <me@hokuishi.be>
Subject: [PATCH] ALSA: hda: intel: Add Dell ALC3271 to power_save denylist
Date: Sun, 23 Feb 2025 21:05:17 -0500
Message-ID: <20250224020517.51035-1-me@hokuishi.be>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: nono6217n@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: H2AID3OXQX6ESUBZEGHOHOPG33CAIS2B
X-Message-ID-Hash: H2AID3OXQX6ESUBZEGHOHOPG33CAIS2B
X-Mailman-Approved-At: Wed, 05 Mar 2025 09:27:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H2AID3OXQX6ESUBZEGHOHOPG33CAIS2B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Dell XPS 13 7390 with the Realtek ALC3271 codec experiences
persistent humming noise when the power_save mode is enabled.
This issue occurs when the codec enters power saving mode,
leading to unwanted noise from the speakers.

This patch adds the affected model (PCI ID 0x1028:0x0962) to the
power_save denylist to ensure power_save is disabled by default,
preventing power-off related noise issues.

Steps to Reproduce
1. Boot the system with `snd_hda_intel` loaded.
2. Verify that `power_save` mode is enabled:
```sh
cat /sys/module/snd_hda_intel/parameters/power_save
````
output: 10 (default power save timeout)
3. Wait for the power save timeout
4. Observe a persistent humming noise from the speakers
5. Disable `power_save` manually:
```sh
echo 0 | sudo tee /sys/module/snd_hda_intel/parameters/power_save
````
6. Confirm that the noise disappears immediately.

This issue has been observed on my system, and this patch
successfully eliminates the unwanted noise. If other users
experience similar issues, additional reports would be helpful.


Signed-off-by: Hoku Ishibe <me@hokuishi.be>
---
 sound/pci/hda/hda_intel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 7d7f9aac50a9..ff536a0e480c 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -2232,6 +2232,8 @@ static const struct snd_pci_quirk power_save_denylist[] = {
 	SND_PCI_QUIRK(0x1631, 0xe017, "Packard Bell NEC IMEDIA 5204", 0),
 	/* KONTRON SinglePC may cause a stall at runtime resume */
 	SND_PCI_QUIRK(0x1734, 0x1232, "KONTRON SinglePC", 0),
+	/* Dell ALC3271 */
+	SND_PCI_QUIRK(0x1028, 0x0962, "Dell ALC3271", 0),
 	{}
 };
 
-- 
2.48.1

