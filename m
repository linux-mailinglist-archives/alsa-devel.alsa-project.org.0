Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A82E754A01
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 18:09:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8572DEE;
	Sat, 15 Jul 2023 18:08:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8572DEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689437363;
	bh=kWfpO32roF7JEpiuP6zZy6QTEnFknk7ifhBTcLqSI5E=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JIGggLtc/2ZHtwGyMh/MyTe7ZaItCY+UMlZneLUJxPiXZb4aEbf5fnCxEj5a/R+sW
	 rWX9kDAqZt3AQdkh1LaaQLHISWjS5KVeFnv1oWvQJ9sAH8go2k3Q2mvwUebzvNzCop
	 Gm01XxrvNWNmwtRYpcCflkG4yNmkzeHnYBHu9WsU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABF9FF8055B; Sat, 15 Jul 2023 18:08:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 395FEF80236;
	Sat, 15 Jul 2023 18:08:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C583F80549; Sat, 15 Jul 2023 18:08:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DA3A4F80236
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 18:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA3A4F80236
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id F0D6023EE2;
	Sat, 15 Jul 2023 12:08:02 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qKhoQ-N2H-00; Sat, 15 Jul 2023 18:08:02 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v3] ALSA: emu10k1: set the "no filtering" bits on PCM voices
 on Audigy
Date: Sat, 15 Jul 2023 18:08:02 +0200
Message-Id: <20230715160802.326872-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SJD7TFUSC5MOXMWEVMB3S33BJPNNQIYZ
X-Message-ID-Hash: SJD7TFUSC5MOXMWEVMB3S33BJPNNQIYZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SJD7TFUSC5MOXMWEVMB3S33BJPNNQIYZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Given that the filter is already set to neutral for PCM voices, the
only observable effect is that the Z1/Z2/FXBUS registers don't have a
stray bit set for negative numbers anymore. The bit is below the ones
significant for output, but it would mess with 32-bit sample
recombination, which we intend to add.

kX-project does that, but I had to figure out myself why.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---
v3:
- simplify, as this is actually unrelated to the interpolator
---
 include/sound/emu10k1.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 43c097952c3c..ef948e45b4c6 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -902,6 +902,11 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 #define A_TTDA			0x7a		/* Tank Table DMA Address			*/
 #define A_TTDD			0x7b		/* Tank Table DMA Data				*/
 
+// In A_FXRT1 & A_FXRT2, the 0x80 bit of each byte completely disables the
+// filter (CVCF_CURRENTFILTER) for the corresponding channel. There is no
+// effect on the volume (CVCF_CURRENTVOLUME) or the interpolator's filter
+// (CCCA_INTERPROM_MASK).
+
 #define A_FXRT2			0x7c
 #define A_FXRT_CHANNELE		0x0000003f	/* Effects send bus number for channel's effects send E	*/
 #define A_FXRT_CHANNELF		0x00003f00	/* Effects send bus number for channel's effects send F	*/
@@ -914,8 +919,6 @@ SUB_REG_NC(A_EHC, A_I2S_CAPTURE_RATE, 0x00000e00)  /* This sets the capture PCM
 #define A_FXSENDAMOUNT_G_MASK	0x0000FF00
 #define A_FXSENDAMOUNT_H_MASK	0x000000FF
 
-/* 0x7c, 0x7e "high bit is used for filtering" */
- 
 /* The send amounts for this one are the same as used with the emu10k1 */
 #define A_FXRT1			0x7e
 #define A_FXRT_CHANNELA		0x0000003f
@@ -1523,10 +1526,10 @@ struct snd_emu10k1_pcm_mixer {
 ((route[0] | (route[1] << 4) | (route[2] << 8) | (route[3] << 12)) << 16)
 
 #define snd_emu10k1_compose_audigy_fxrt1(route) \
-((unsigned int)route[0] | ((unsigned int)route[1] << 8) | ((unsigned int)route[2] << 16) | ((unsigned int)route[3] << 24))
+((unsigned int)route[0] | ((unsigned int)route[1] << 8) | ((unsigned int)route[2] << 16) | ((unsigned int)route[3] << 24) | 0x80808080)
 
 #define snd_emu10k1_compose_audigy_fxrt2(route) \
-((unsigned int)route[4] | ((unsigned int)route[5] << 8) | ((unsigned int)route[6] << 16) | ((unsigned int)route[7] << 24))
+((unsigned int)route[4] | ((unsigned int)route[5] << 8) | ((unsigned int)route[6] << 16) | ((unsigned int)route[7] << 24) | 0x80808080)
 
 #define snd_emu10k1_compose_audigy_sendamounts(vol) \
 (((unsigned int)vol[4] << 24) | ((unsigned int)vol[5] << 16) | ((unsigned int)vol[6] << 8) | (unsigned int)vol[7])
-- 
2.40.0.152.g15d061e6df

