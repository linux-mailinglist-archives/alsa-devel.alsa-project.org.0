Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 587C96FE359
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 19:41:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC1F103D;
	Wed, 10 May 2023 19:40:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC1F103D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683740469;
	bh=Raq1MzEee0aN0pTcn8K9yPRq7zhwSW6IbRJeN934U3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XBKX1NERcMxbwtoxPfomufbF+QvNU9Byj1RrNGS1ThgSPvu1PW1m87uzk15u7M/N+
	 ssO008kAaZZG2MezJBNkLc5o++5oLMCaDKHIA9u8rN+VgFXeg9a+u+fQdJlBdspM2d
	 Gt7Hl/pBLa/5tRuZMxgR1L3pEqXIbwkW/1WkxhmA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59544F80558;
	Wed, 10 May 2023 19:39:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 322CBF80553; Wed, 10 May 2023 19:39:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28D08F8032D
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 19:39:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28D08F8032D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 4469B24257;
	Wed, 10 May 2023 13:39:18 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pwnmX-tTm-00; Wed, 10 May 2023 19:39:17 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 12/14] ALSA: emu10k1: skip mic capture PCM for cards without
 AC97 codec
Date: Wed, 10 May 2023 19:39:15 +0200
Message-Id: <20230510173917.3073107-13-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
References: <20230510173917.3073107-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4WW5YBLRW6W5MOOPXDHX3AW5MHWWEAFA
X-Message-ID-Hash: 4WW5YBLRW6W5MOOPXDHX3AW5MHWWEAFA
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4WW5YBLRW6W5MOOPXDHX3AW5MHWWEAFA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The microphone capture device is a feature of the AC97 codec, so its
availability should be coupled to the presence of that codec.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

This patch needs to be applied on top of the patch titled "ALSA:
emu10k1: omit non-applicable mixer controls for E-MU cards".
---
 sound/pci/emu10k1/emu10k1.c |  8 +++++---
 sound/pci/emu10k1/emufx.c   | 26 ++++++++++++++------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1.c b/sound/pci/emu10k1/emu10k1.c
index b8163f26004a..0c97237af922 100644
--- a/sound/pci/emu10k1/emu10k1.c
+++ b/sound/pci/emu10k1/emu10k1.c
@@ -107,9 +107,11 @@ static int snd_card_emu10k1_probe(struct pci_dev *pci,
 	err = snd_emu10k1_pcm(emu, 0);
 	if (err < 0)
 		return err;
-	err = snd_emu10k1_pcm_mic(emu, 1);
-	if (err < 0)
-		return err;
+	if (emu->card_capabilities->ac97_chip) {
+		err = snd_emu10k1_pcm_mic(emu, 1);
+		if (err < 0)
+			return err;
+	}
 	err = snd_emu10k1_pcm_efx(emu, 2);
 	if (err < 0)
 		return err;
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index cdce8475bd99..63e233130858 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1380,19 +1380,21 @@ A_OP(icode, &ptr, iMAC0, A_GPR(var), A_GPR(var), A_GPR(vol), A_EXTIN(input))
 		gpr_map[gpr + 2] = 0x00000000;
 		gpr += 3;
 	} else {
-		/* AC'97 Playback Volume - used only for mic (renamed later) */
-		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AC97_L);
-		A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AC97_R);
-		snd_emu10k1_init_stereo_control(&controls[nctl++], "AMic Playback Volume", gpr, 0);
-		gpr += 2;
-		/* AC'97 Capture Volume - used only for mic */
-		A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AC97_L);
-		A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AC97_R);
-		snd_emu10k1_init_stereo_control(&controls[nctl++], "Mic Capture Volume", gpr, 0);
-		gpr += 2;
+		if (emu->card_capabilities->ac97_chip) {
+			/* AC'97 Playback Volume - used only for mic (renamed later) */
+			A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_AC97_L);
+			A_ADD_VOLUME_IN(stereo_mix+1, gpr+1, A_EXTIN_AC97_R);
+			snd_emu10k1_init_stereo_control(&controls[nctl++], "AMic Playback Volume", gpr, 0);
+			gpr += 2;
+			/* AC'97 Capture Volume - used only for mic */
+			A_ADD_VOLUME_IN(capture, gpr, A_EXTIN_AC97_L);
+			A_ADD_VOLUME_IN(capture+1, gpr+1, A_EXTIN_AC97_R);
+			snd_emu10k1_init_stereo_control(&controls[nctl++], "Mic Capture Volume", gpr, 0);
+			gpr += 2;
 
-		/* mic capture buffer */
-		A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), A_C_40000000, A_EXTIN(A_EXTIN_AC97_R));
+			/* mic capture buffer */
+			A_OP(icode, &ptr, iINTERP, A_EXTOUT(A_EXTOUT_MIC_CAP), A_EXTIN(A_EXTIN_AC97_L), A_C_40000000, A_EXTIN(A_EXTIN_AC97_R));
+		}
 
 		/* Audigy CD Playback Volume */
 		A_ADD_VOLUME_IN(stereo_mix, gpr, A_EXTIN_SPDIF_CD_L);
-- 
2.40.0.152.g15d061e6df

