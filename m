Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C2F7A94BD
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 15:26:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC222DF6;
	Thu, 21 Sep 2023 15:25:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC222DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695302774;
	bh=2uOK8zthDQ//Qj4QJG5XL2Tu3KktpbEFPyIavM1QZvQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oL32zceiFOJ/vkqNJ5Q/ZXOkIXmiMkie7yHMPxD0rNMtiY13nxnq4zVh8rkhiskhh
	 Htsv9Zt18wbDm1UAKq4KB+xmqM2xMI1mHk6dNdaRQQaE1nVrNisnus6ptBI+xPGJE3
	 AuuElFiGWDxpKq0O0UXC6vEbmEBFo0a656qYOf94=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E85C6F805F7; Thu, 21 Sep 2023 15:23:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 438BDF805F7;
	Thu, 21 Sep 2023 15:23:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3E67F8047D; Wed, 20 Sep 2023 17:40:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37D92F800AA
	for <alsa-devel@alsa-project.org>; Wed, 20 Sep 2023 17:40:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37D92F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l1WHZ0qQ
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4047ef37f55so12980095e9.1
        for <alsa-devel@alsa-project.org>;
 Wed, 20 Sep 2023 08:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695224426; x=1695829226;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DmDW8C66MIXswoSM5nwW/iwY1HolEslG881LGV47I5g=;
        b=l1WHZ0qQ9cur1cZECHDgDPQm/wwwfPFo6mXeMRMUIWG1EPZR6g/WFFV01JXmtjj5Gj
         UTGLxJ2wvxJTEzhmYW6QUHXyyEX5G+Ad9Yc6BLzj4ZXfv792429BpvEcGlIFMXrqmT4a
         yr9q3Ll9Y0E13knpNOwSjDI5tlTSCZHBp0TfHBleLX0jmclqkPqKyf75rXy+26m0PsEC
         sMfGYDU7ZrCk9dN/9mtt6Kji+7siW4U1eiuhDacc/qgxno14qjxTb3VdBBKD0y1cJ6fp
         APPRnDGzQS6HX9DDBvc/BKspCM4/PV+0wVXevgXGR7gZMuwl8uO/rlnjnXuQ8rb5zBBO
         bA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224426; x=1695829226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DmDW8C66MIXswoSM5nwW/iwY1HolEslG881LGV47I5g=;
        b=lRHHU2rRAqXfRm91zg6pENRVOzlP+FIh5m1yDni4JlzKoo2gpmt0oqIiZE1zZGoRqs
         2uh6s2xFV42yB7HdRda1gRYd8N9DfTwjzZSTagdnrz+QdsvQk72a7yltpIL8HIJF2mxP
         Tn368zARzYMuaQPs4uXSk8Nj0tLFSRUlvAIfqkP4Sp9ztBXBQOFbo5W+NaDjDF8MpelR
         gakyT0KVj7F0sb20vi45MXA2fiWtSJrDrxntpL7aaRTvc/Mt9YBCJq46oAaEmlXdUbhc
         8ax1YeszeXNKx8iP4malYfI1AqMG4NoEIW3i+Qshn9d8QEej4Y4isKX+68XcfDLui8Em
         MY5g==
X-Gm-Message-State: AOJu0YxZxWuTU0/tGXZVKaUTCCvLAYxP3v03AHz437C5v/183Pqchz8E
	ZkPiz0PpSvgyvqnJXtd/Uqw=
X-Google-Smtp-Source: 
 AGHT+IGY6S/u4wuzGFZWQPzNYC/n7wkXF3frx60bMUjcaNO/YAYotJ4z2zy3bW0cajG5+rTtKldaGA==
X-Received: by 2002:a05:600c:358d:b0:3fe:d46a:ef4b with SMTP id
 p13-20020a05600c358d00b003fed46aef4bmr2783826wmq.1.1695224425927;
        Wed, 20 Sep 2023 08:40:25 -0700 (PDT)
Received: from ivan-B550MH.domain.name ([178.160.241.68])
        by smtp.gmail.com with ESMTPSA id
 c26-20020a05600c0ada00b00400268671c6sm2274810wmr.13.2023.09.20.08.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:40:25 -0700 (PDT)
From: Ivan Orlov <ivan.orlov0322@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	corbet@lwn.net
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	alsa-devel@alsa-project.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3 1/2] ALSA: docs: Add MARIAN M2 driver documentation
Date: Wed, 20 Sep 2023 19:16:09 +0400
Message-Id: <20230920151610.113880-1-ivan.orlov0322@gmail.com>
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
Message-ID-Hash: KUYSJNHSW4SHPVEGUO7D67IOJ25WFCW7
X-Message-ID-Hash: KUYSJNHSW4SHPVEGUO7D67IOJ25WFCW7
X-Mailman-Approved-At: Thu, 21 Sep 2023 13:22:54 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KUYSJNHSW4SHPVEGUO7D67IOJ25WFCW7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add documentation for the new MARIAN Seraph M2 driver. MARIAN Seraph M2
is a fully digital PCI soundcard with 2 MADI inputs and outputs.

This patch introduces the documentation for the card driver. It covers
current development status, overview of the card, available controls and
information about the integrated loopback.

Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
---
V1 -> V2:
- Remove redundant documentation fix
V2 -> V3:
- Make the documentation to follow 80-column rule
- Use literal blocks for markup
- Update the documentation correspondingly with the latest driver
changes: remove mHz and detune controls descriptions, remove
'speedmode' control.
- Extend the documentation to cover the card overview.

 Documentation/sound/cards/index.rst     |   1 +
 Documentation/sound/cards/marian-m2.rst | 140 ++++++++++++++++++++++++
 2 files changed, 141 insertions(+)
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
index 000000000000..3c12fe024e37
--- /dev/null
+++ b/Documentation/sound/cards/marian-m2.rst
@@ -0,0 +1,140 @@
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
+This driver is based on the driver written by Florian Faber in 2012, which
+seemed to work fine. However, the initial code contained multiple issues, which
+had to be solved before sending the driver upstream.
+
+The vendor lost the full documentation, so what we have here was recovered from
+drafts and found after experiments with the card.
+
+What seems to be working fine:
+
+ * Playback and capture for all supported rates
+ * MADI output frame mode changing
+ * Input frequency/frame mode measurement
+ * Integrated loopback (with some exceptions, see below)
+
+CARD INFORMATION
+================
+
+The card is fully digital and contains two MADI Inputs and two MADI outputs.
+It has internal clocks, but could be synchronized with clocks on any of its
+inputs. Also it could be synchronized with other MARIAN M2 sound card via
+SyncBus cable.
+
+Outputs support two modes: 56 channel mode and 64 channel mode. The number of
+audio channels will be halved automatically to 28 or 32 depending on the
+sample rate.
+
+The driver currently supports 48 and 96 kHz MADI frame formats for output.
+
+MEMORY MODEL
+============
+
+The hardware requires one huge contiguous DMA space to be allocated. After
+allocation, the bus address of this buffer should be written to the hardware
+register.
+
+We can split this space into two parts: the first one contains samples for
+capture, another one contains play samples::
+
+   CAP_CH_0, CAP_CH_1, ..., CAP_CH_127 | PLAY_CH_0, PLAY_CH_1, ..., PLAY_CH_127
+
+The card supports the non-interleaved access mode only, so samples for each
+channel lay together::
+
+   C0, ..., C0, C1, ..., C1, ..., C127 | C0, ..., C0, C1, ..., C1, ..., C127
+
+The count of samples per each channel buffer needs to be set explicitly, so the
+address of the first byte of the playback data depends on this value.
+The playback buffer starts where the capture buffer ends. It makes the arbitrary
+period count/buffer size feature impossible to implement, and the driver
+supports only 2 periods per buffer.
+
+Controls
+========
+
+ * Input 1 Sync
+
+   - 0 - No signal, 1 - valid MADI signal found, 2 - Synced with MADI signal
+
+ * Input 2 Sync
+
+   - 0 - No signal, 1 - valid MADI signal found, 2 - Synced with MADI signal
+
+ * Input 1 Channel Mode
+
+   - 0 - 56 channels, 1 - 64 channels
+
+ * Input 2 Channel Mode
+
+   - 0 - 56 channels, 1 - 64 channels
+
+ * Input 1 Frame Mode
+
+   - 0 - 48 kHz, 1 - 96 kHz
+
+ * Input 2 Frame Mode
+
+   - 0 - 48 kHz, 1 - 96 kHz
+
+ * Input 1 Frequency
+
+   - Measured frequency on Input 1
+
+ * Input 2 Frequency
+
+   - Measured frequency on Input 2
+
+ * Output 1 Channel Mode
+
+   - 0 - 56 channels, 1 - 64 channels
+
+ * Output 2 Channel Mode
+
+   - 0 - 56 channels, 1 - 64 channels
+
+ * Output 1 Frame Mode
+
+   - 0 - 48 kHz, 1 - 96 kHz
+
+ * Output 2 Frame Mode
+
+   - 0 - 48 kHz, 1 - 96 kHz
+
+ * Clock Source
+
+   - Internal/Sync Bus, Input Port 1, Input Port 2
+
+ * DCO Frequency (Hz)
+
+ * Loopback
+
+   - Enable/Disable integrated loopback
+
+
+Loopback
+========
+
+The card contains integrated loopback. When it is enabled, it sets
+the hardware’s DAW-in memory pointer to the hardware’s DAW-out memory. So, what
+you play is what you record.
+
+You will not observe the effect of channel halving when using the integrated
+loopback, as the data bypasses all DSP functionality in such case.
+
+You can enable the integrated loopback using the corresponding control.
+
+The loopback seems to work well on lower rates (like 28000). However, when the
+rate goes higher, the count of mistakes in recorded byte ordering increases.
-- 
2.34.1

