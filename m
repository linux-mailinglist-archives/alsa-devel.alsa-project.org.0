Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B577A5C30
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 10:12:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5A5950;
	Tue, 19 Sep 2023 10:11:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5A5950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695111163;
	bh=OZbEguRFpUGKBttyltywMb2YDsVq3c8PF0CFpNc720Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IdkvZKygW97syo90S6iqp8fvFBopIs1LjGYpyU/CCfjrgDtB12d+RurcBc50Vhrub
	 QoKEVBAfFc/UsYuujs3neQWH3JrE7n3n56hwgaduAS13mPgTEeZM+Playh+EQA8fNs
	 VBxCNMrWuAb5bntMK8F6tk7fp8Fn7cyh2qQJAXbY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AF18F8056F; Tue, 19 Sep 2023 10:11:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EEA3F800F4;
	Tue, 19 Sep 2023 10:11:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EBF8F8047D; Mon, 18 Sep 2023 20:01:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33264F800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 20:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33264F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WDDbIpq5
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3159b524c56so938998f8f.1
        for <alsa-devel@alsa-project.org>;
 Mon, 18 Sep 2023 11:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695060070; x=1695664870;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmvXpKMQno5A00syG83s4F0RNpgRyQmZAnIOeoswnyc=;
        b=WDDbIpq5KzUXR2Ni726AJKcFikJM6S8QPmY9rXbBnZrzW+HCUOOTChJWf9zAYmTB/G
         r/HCnNXAGKX4amLOdrwLmzDND1z5jlUVbFGBQCgpq1ll5YNaw32G1n1Oj4WQzhakBfgU
         hm6xHLIskKRV9pyI8xXnboDssX6Go0c9tvackZhsaZxJ3mo5C5Us3YDf0S+7YumOa49I
         u15ygwY2eI0ZyJYHA6+aclrrWVMe6mbtRyHupaxSE9G3Bl5w3r0H1SLEMFwmaa1UqJOZ
         syQfOOIeM10K1C6FsSanHVVWKk46oELIpSjboig5d8ZmZNnoUzvGGPiJ8qdyYLD9fyDv
         m4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060070; x=1695664870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmvXpKMQno5A00syG83s4F0RNpgRyQmZAnIOeoswnyc=;
        b=p6k/hAvNAJiGmEI6JrchuuJtLlZmzoBd1Nl6ONZqW0Xunkn9yh2u0FepXkRXJONCqL
         4ENlTj6mdqKjoK3pniaHGDD3IASuJvtfWDfDMz9/03a3nTBWr2tJU4oG+18/DrGjXhkc
         l7GnEi+z0TBRe38trZbXuKwIPWFYus9AOasH18/PrIOxaZ407fPUlUFHe7MTgK2k5nvQ
         jPSuhJaMKYUxVrR7K8NofeYxqiAFVaL02sOoaaUktmaO3hOW915atE3yXjXsWJeOj6VL
         H90oWSVJAngNGOEOy53dX9hjxA9Q7sDtdkbBjcvr0M8FzmwlOGhmHvx13AoI6F0b0IeS
         Syeg==
X-Gm-Message-State: AOJu0YySvtlSr1aGhQ2JAIi8UUjV0QUPdJtER/VHO1Wsl5/GLWcgcAoh
	16dIlp/HBpLeISu48oMUcYI=
X-Google-Smtp-Source: 
 AGHT+IFMam+SIBnrILBvXkxg6UIOQQFVn9y5rVGYJ0W5QBzWp1JYIJWw8cm9B41ENMDf1GLXaWzZvA==
X-Received: by 2002:adf:ec4f:0:b0:31f:a717:f1cc with SMTP id
 w15-20020adfec4f000000b0031fa717f1ccmr7638106wrn.5.1695060069900;
        Mon, 18 Sep 2023 11:01:09 -0700 (PDT)
Received: from ivan-B550MH.domain.name ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 o6-20020adfeac6000000b0031c6dc684f8sm13232942wrn.20.2023.09.18.11.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:01:09 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: [PATCH 1/2] ALSA: docs: Add Marian M2 driver documentation
Date: Mon, 18 Sep 2023 22:00:49 +0400
Message-Id: <20230918180050.6166-1-ivan.orlov0322@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: ivan.orlov0322@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: LPROGFXYOPXWL5LCISKDYQCV56BK72RD
X-Message-ID-Hash: LPROGFXYOPXWL5LCISKDYQCV56BK72RD
X-Mailman-Approved-At: Tue, 19 Sep 2023 08:10:56 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LPROGFXYOPXWL5LCISKDYQCV56BK72RD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation for the new MARIAN Seraph M2 sound card. It covers
current development status, available controls of the card and
information about the integrated loopback.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
 Documentation/sound/cards/index.rst     |   1 +
 Documentation/sound/cards/marian-m2.rst | 104 ++++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 Documentation/sound/cards/marian-m2.rst

diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index e68bbb13c384..e873592d8d00 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -19,3 +19,4 @@ Card-Specific Information
    serial-u16550
    img-spdif-in
    pcmtest
+   marian-m2
diff --git a/Documentation/sound/cards/marian-m2.rst b/Documentation/sound/cards/marian-m2.rst
new file mode 100644
index 000000000000..a968feea79c0
--- /dev/null
+++ b/Documentation/sound/cards/marian-m2.rst
@@ -0,0 +1,104 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================
+MARIAN Seraph M2 Driver
+=======================
+
+Sep 18, 2023
+
+Ivan Orlov <ivan.orlov0322@gmail.com>
+
+STATE OF DEVELOPMENT
+====================
+
+This driver is based on initial driver written by Florian Faber in 2012, which seemed to work fine.
+However, the initial code contained multiple issues, which had to be solved before sending the
+driver upstream.
+
+The vendor lost the full documentation, so what we have here was recovered from drafts and found
+after experiments with the card.
+
+What seems to be working fine:
+- Playback and capture for all supported rates
+- Integrated loopback (with some exceptions, see below)
+
+MEMORY MODEL
+============
+
+The hardware requires one huge contiguous DMA space to be allocated. After allocation, the bus address of
+this buffer should be written to the hardware register.
+
+We can split this space into two parts: the first one contains samples for capture, another one contains
+play samples:
+
+CAPTURE_CH_0, CAPTURE_CH_1, ..., CAPTURE_CH_127 | PLAY_CH_0, PLAY_CH_1, ..., PLAY_CH_127
+
+The card supports the non-interleaved access mode only, so samples for each channel lay together:
+
+C0, C0, ..., C0, C1, C1, ..., C1, ..., C127 | C0, C0, ..., C0, C1, C1, ..., C1, ..., C127
+
+The count of samples per each channel buffer needs to be set explicitly, so the address of the first
+byte of the playback data depends on this value. The playback buffer starts where the capture buffer ends.
+It makes the arbitrary period count/buffer size feature impossible to implement, and the driver supports only
+2 periods per buffer.
+
+Controls
+========
+
+Input 1 Sync
+    0 - No signal, 1 - valid MADI signal found, 2 - Synced with MADI signal
+Input 2 Sync
+    0 - No signal, 1 - valid MADI signal found, 2 - Synced with MADI signal
+
+Input 1 Channel Mode
+    0 - 56 channels, 1 - 64 channels
+Input 2 Channel Mode
+    0 - 56 channels, 1 - 64 channels
+
+Input 1 Frame Mode
+    0 - 48 kHz, 1 - 96 kHz
+Input 2 Frame Mode
+    0 - 48 kHz, 1 - 96 kHz
+
+Input 1 Frequency
+    Measured frequency on Input 1
+Input 2 Frequency
+    Measured frequency on Input 2
+
+Output 1 Channel Mode
+    0 - 56 channels, 1 - 64 channels
+Output 2 Channel Mode
+    0 - 56 channels, 1 - 64 channels
+
+Output 1 Frame Mode
+    0 - 48 kHz, 1 - 96 kHz
+Output 2 Frame Mode
+    0 - 48 kHz, 1 - 96 kHz
+
+Clock Source
+    Internal/Sync Bus, Input Port 1, Input Port 2
+
+Speed mode
+    VCO clock range (slow/fast)
+
+DCO Frequency (Hz)
+
+DCO Frequency (ms)
+
+DCO Detune
+    Range: -200...200
+
+Loopback
+    Enable/Disable integrated loopback
+
+
+Loopback
+========
+
+The card contains integrated loopback. When it is enabled, it sets the hardware’s DAW-in memory pointer
+to the hardware’s DAW-out memory. So, what you play is what you record.
+
+You can enable the integrated loopback using the corresponding control.
+
+The loopback seems to work well on lower rates (like 28000). However, when the rate goes higher, I observe
+multiple mistakes in recorded byte ordering.
-- 
2.34.1

