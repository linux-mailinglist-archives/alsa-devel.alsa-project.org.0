Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77170837D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:05:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48AF21FE;
	Thu, 18 May 2023 16:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48AF21FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418721;
	bh=UY98RjFlCllpkG2pYiXNAgwJdrssYFE0NR8YzpaZb/0=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gz11yLdYTdmPwKxetIQtSCQnZl3UJ+6tybwXXdF0Avu9EefO1WdyLDWhoVX+BEusl
	 FN/uwSOstf9tkRBc4pLHoxqFh1faEl75vEp2MILn/8iAdUlVTSQGPK10yL8Zr5640I
	 GO4lR0O154TtQUhSdR+BsebVwA7XJkQQnSAfNe1w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85A38F8025A; Thu, 18 May 2023 16:03:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6F41F8025A;
	Thu, 18 May 2023 16:03:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 027F2F80552; Thu, 18 May 2023 16:03:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BC10F80272
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BC10F80272
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A6B34240DB;
	Thu, 18 May 2023 10:03:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeEF-cLO-00; Thu, 18 May 2023 16:03:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 1/2] ALSA: emu10k1: fix synthesizer sample playback position
 and caching
Date: Thu, 18 May 2023 16:03:38 +0200
Message-Id: <20230518140339.3722308-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IBN62KQLY72NH3FZ4NBPFMFQ6KHJEULX
X-Message-ID-Hash: IBN62KQLY72NH3FZ4NBPFMFQ6KHJEULX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBN62KQLY72NH3FZ4NBPFMFQ6KHJEULX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Compensate for the cache delay, and actually populate the cache.
Without these, the playback would start with garbage (which would be
(mostly?) masqueraded by the attack phase).

Unlike for the PCM voices, this doesn't try to compensate for the
interpolator read-ahead, because it's pointless to be super-exact here.

Note that this code is probably still broken for particularly short
samples, because we ignore the loop-related parts of CCR. But I'm not
going to reverse-engineer that now ...

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c | 36 ++++------------------------
 1 file changed, 5 insertions(+), 31 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index 06440b97b5d7..aab8d64fd708 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -253,7 +253,7 @@ lookup_voices(struct snd_emux *emu, struct snd_emu10k1 *hw,
 		/* check if sample is finished playing (non-looping only) */
 		if (bp != best + V_OFF && bp != best + V_FREE &&
 		    (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_SINGLESHOT)) {
-			val = snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch);
+			val = snd_emu10k1_ptr_read(hw, CCCA_CURRADDR, vp->ch) - 64;
 			if (val >= vp->reg.loopstart)
 				bp = best + V_OFF;
 		}
@@ -360,7 +360,7 @@ start_voice(struct snd_emux_voice *vp)
 
 	map = (hw->silent_page.addr << hw->address_mode) | (hw->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
 
-	addr = vp->reg.start;
+	addr = vp->reg.start + 64;
 	temp = vp->reg.parm.filterQ;
 	ccca = (temp << 28) | addr;
 	if (vp->apitch < 0xe400)
@@ -428,40 +428,14 @@ start_voice(struct snd_emux_voice *vp)
 		/* Q & current address (Q 4bit value, MSB) */
 		CCCA, ccca,
 
+		/* cache */
+		CCR, REG_VAL_PUT(CCR_CACHEINVALIDSIZE, 64),
+
 		/* reset volume */
 		VTFT, vtarget | vp->ftarget,
 		CVCF, vtarget | CVCF_CURRENTFILTER_MASK,
 
 		REGLIST_END);
-#if 0
-	/* cache */
-	{
-		unsigned int val, sample;
-		val = 32;
-		if (vp->reg.sample_mode & SNDRV_SFNT_SAMPLE_8BITS)
-			sample = 0x80808080;
-		else {
-			sample = 0;
-			val *= 2;
-		}
-
-		/* cache */
-		snd_emu10k1_ptr_write(hw, CCR, ch, 0x1c << 16);
-		snd_emu10k1_ptr_write(hw, CDE, ch, sample);
-		snd_emu10k1_ptr_write(hw, CDF, ch, sample);
-
-		/* invalidate maps */
-		temp = ((unsigned int)hw->silent_page.addr << hw_address_mode) | (hw->address_mode ? MAP_PTI_MASK1 : MAP_PTI_MASK0);
-		snd_emu10k1_ptr_write(hw, MAPA, ch, temp);
-		snd_emu10k1_ptr_write(hw, MAPB, ch, temp);
-		
-		/* fill cache */
-		val -= 4;
-		val <<= 25;
-		val |= 0x1c << 16;
-		snd_emu10k1_ptr_write(hw, CCR, ch, val);
-	}
-#endif
 
 	return 0;
 }
-- 
2.40.0.152.g15d061e6df

