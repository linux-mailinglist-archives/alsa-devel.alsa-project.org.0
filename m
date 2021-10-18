Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A24F4310AB
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 08:38:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8CF718BC;
	Mon, 18 Oct 2021 08:37:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8CF718BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634539125;
	bh=YsA6mVNXudg6SBpFAWUC/M+39NMMuzdeghVuGJFYCdE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GGj9nkNTKxhwaYSMSnfYAGCjvqUUm0W680v20wXbj5ucBdB2ZBfFWviD1ZyBzC9LR
	 GSxD/ZrztQiTIu29XQ18xliwMYC3vqpo84inn5k3VrSFqvxAynxtr9rzAugALuY+hf
	 cvOlXaBlPPx8eXHsKZugubgDvNnbsegAi0MLnr8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 933B2F80253;
	Mon, 18 Oct 2021 08:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ADB65F80224; Mon, 18 Oct 2021 08:37:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB63F801DB
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 08:37:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB63F801DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="G1in2rQN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="i17mdPTg"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 8EB2921A6B;
 Mon, 18 Oct 2021 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634539029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=axkVwMCJWGOjTC2SPYws1bBoVFyPgvGOg+EGo3bGeEc=;
 b=G1in2rQNCWV3Zq4oJ6CRFZnWQxNt2qNX6fSByLuILS+S1XH0lH9uKsnraRDjnJfuCe5qeY
 B4927tstZNkRhXvhI5kWRaR0rK+mbMjs4ut3vXNgZvfUG8IN4yfVs/FtaGAmiXinjC71n4
 FOZRkd9jKV9aVgykAFoGjX+7HZE6r7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634539029;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=axkVwMCJWGOjTC2SPYws1bBoVFyPgvGOg+EGo3bGeEc=;
 b=i17mdPTgwkhGgZKMOWKjtKWlcS4xFcE0jm0FwMDn+/5p9aFKlig5xgLY4lhRrQAOdKE7DZ
 /LyMi5GKmMIlrtBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 7AB09A3B84;
 Mon, 18 Oct 2021 06:37:09 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: firewire: Fix C++ style comments in uapi header
Date: Mon, 18 Oct 2021 08:37:00 +0200
Message-Id: <20211018063700.30834-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

UAPI headers are built with -std=c90 and C++ style comments are
explicitly prohibited.  The recent commit overlooked the rule and
caused the error at header installation.  This patch corrects those.

Fixes: bea36afa102e ("ALSA: firewire-motu: add message parser to gather meter information in register DSP model")
Fixes: 90b28f3bb85c ("ALSA: firewire-motu: add message parser for meter information in command DSP model")
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20211018113812.0a16efb0@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/firewire.h | 70 ++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 76190a0cb069..e52a97b3ceaa 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -68,8 +68,8 @@ struct snd_firewire_event_tascam_control {
 
 struct snd_firewire_event_motu_register_dsp_change {
 	unsigned int type;
-	__u32 count;		// The number of changes.
-	__u32 changes[];	// Encoded event for change of register DSP.
+	__u32 count;		/* The number of changes. */
+	__u32 changes[];	/* Encoded event for change of register DSP. */
 };
 
 union snd_firewire_event {
@@ -119,25 +119,27 @@ struct snd_firewire_tascam_state {
 	__be32 data[SNDRV_FIREWIRE_TASCAM_STATE_COUNT];
 };
 
-// In below MOTU models, software is allowed to control their DSP by accessing to registers.
-//  - 828mk2
-//  - 896hd
-//  - Traveler
-//  - 8 pre
-//  - Ultralite
-//  - 4 pre
-//  - Audio Express
-//
-// On the other hand, the status of DSP is split into specific messages included in the sequence of
-// isochronous packet. ALSA firewire-motu driver gathers the messages and allow userspace applications
-// to read it via ioctl. In 828mk2, 896hd, and Traveler, hardware meter for all of physical inputs
-// are put into the message, while one pair of physical outputs is selected. The selection is done by
-// LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
-//
-// I note that V3HD/V4HD uses asynchronous transaction for the purpose. The destination address is
-// registered to 0x'ffff'f000'0b38 and '0b3c by asynchronous write quadlet request. The size of
-// message differs between 23 and 51 quadlets. For the case, the number of mixer bus can be extended
-// up to 12.
+/*
+ * In below MOTU models, software is allowed to control their DSP by accessing to registers.
+ *  - 828mk2
+ *  - 896hd
+ *  - Traveler
+ *  - 8 pre
+ *  - Ultralite
+ *  - 4 pre
+ *  - Audio Express
+ *
+ * On the other hand, the status of DSP is split into specific messages included in the sequence of
+ * isochronous packet. ALSA firewire-motu driver gathers the messages and allow userspace applications
+ * to read it via ioctl. In 828mk2, 896hd, and Traveler, hardware meter for all of physical inputs
+ * are put into the message, while one pair of physical outputs is selected. The selection is done by
+ * LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
+ *
+ * I note that V3HD/V4HD uses asynchronous transaction for the purpose. The destination address is
+ * registered to 0x'ffff'f000'0b38 and '0b3c by asynchronous write quadlet request. The size of
+ * message differs between 23 and 51 quadlets. For the case, the number of mixer bus can be extended
+ * up to 12.
+ */
 
 #define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT	40
 
@@ -219,18 +221,20 @@ struct snd_firewire_motu_register_dsp_parameter {
 	__u8 reserved[64];
 };
 
-// In below MOTU models, software is allowed to control their DSP by command in frame of
-// asynchronous transaction to 0x'ffff'0001'0000:
-//
-//  - 828 mk3 (FireWire only and Hybrid)
-//  - 896 mk3 (FireWire only and Hybrid)
-//  - Ultralite mk3 (FireWire only and Hybrid)
-//  - Traveler mk3
-//  - Track 16
-//
-// On the other hand, the states of hardware meter is split into specific messages included in the
-// sequence of isochronous packet. ALSA firewire-motu driver gathers the message and allow userspace
-// application to read it via ioctl.
+/*
+ * In below MOTU models, software is allowed to control their DSP by command in frame of
+ * asynchronous transaction to 0x'ffff'0001'0000:
+ *
+ *  - 828 mk3 (FireWire only and Hybrid)
+ *  - 896 mk3 (FireWire only and Hybrid)
+ *  - Ultralite mk3 (FireWire only and Hybrid)
+ *  - Traveler mk3
+ *  - Track 16
+ *
+ * On the other hand, the states of hardware meter is split into specific messages included in the
+ * sequence of isochronous packet. ALSA firewire-motu driver gathers the message and allow userspace
+ * application to read it via ioctl.
+ */
 
 #define SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT	400
 
-- 
2.26.2

