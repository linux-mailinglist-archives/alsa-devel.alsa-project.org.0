Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B316EC18C
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Apr 2023 20:11:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7121BE76;
	Sun, 23 Apr 2023 20:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7121BE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682273466;
	bh=gYCtTShPEDSAW/ELj3doqkVt24yJe3rNWxFYw6rbZmQ=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SQDEJFaFVTIQ8/1SzczjK8Me0wIgCUjb4Rx0b7hwCgtaxZTKHcG8D2U/plAdFwQiA
	 tfFZuaxaeD3HjMunYq9iqKGE6ivc0K7IFgo80x3Q9dZOJAiFMQ8+2Nr1RZCaqGs5oX
	 Jo3XBKwkGMHQFC9B8wLtdkFeJc9obnmvhYFf631I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0D3BF8018A;
	Sun, 23 Apr 2023 20:10:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 359F2F8025F; Sun, 23 Apr 2023 20:10:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EE289F800AC
	for <alsa-devel@alsa-project.org>; Sun, 23 Apr 2023 20:10:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE289F800AC
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id D716124251;
	Sun, 23 Apr 2023 14:10:02 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqe9y-ELp-00; Sun, 23 Apr 2023 20:10:02 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: emu10k1: use high-level I/O in set_filterQ()
Date: Sun, 23 Apr 2023 20:10:02 +0200
Message-Id: <20230423181002.1246793-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230423181002.1246793-1-oswald.buddenhagen@gmx.de>
References: <20230423181002.1246793-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BX5ZD3RRV2ITMOQLXZOIU262ZON4UW7K
X-Message-ID-Hash: BX5ZD3RRV2ITMOQLXZOIU262ZON4UW7K
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This makes the code shorter and more legible.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h              | 3 ++-
 sound/pci/emu10k1/emu10k1_callback.c | 5 +----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 05a09826eef0..8fe80dcee71b 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -429,7 +429,8 @@
 #define DSL_LOOPENDADDR		0x18000007
 
 #define CCCA			0x08		/* Filter Q, interp. ROM, byte size, cur. addr register */
-#define CCCA_RESONANCE		0xf0000000	/* Lowpass filter resonance (Q) height			*/
+#define CCCA_RESONANCE_MASK	0xf0000000	/* Lowpass filter resonance (Q) height			*/
+#define CCCA_RESONANCE		0x041c0008
 #define CCCA_INTERPROM_MASK	0x0e000000	/* Selects passband of interpolation ROM		*/
 						/* 1 == full band, 7 == lowpass				*/
 						/* ROM 0 is used when pitch shifting downward or less	*/
diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index 44f2a61c6be8..9455df18f7b2 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -532,8 +532,5 @@ set_fm2frq2(struct snd_emu10k1 *hw, struct snd_emux_voice *vp)
 static void
 set_filterQ(struct snd_emu10k1 *hw, struct snd_emux_voice *vp)
 {
-	unsigned int val;
-	val = snd_emu10k1_ptr_read(hw, CCCA, vp->ch) & ~CCCA_RESONANCE;
-	val |= (vp->reg.parm.filterQ << 28);
-	snd_emu10k1_ptr_write(hw, CCCA, vp->ch, val);
+	snd_emu10k1_ptr_write(hw, CCCA_RESONANCE, vp->ch, vp->reg.parm.filterQ);
 }
-- 
2.40.0.152.g15d061e6df

