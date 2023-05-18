Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BB70837E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 16:05:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A761823;
	Thu, 18 May 2023 16:04:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A761823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684418732;
	bh=Bg1DH9uB1KwTt4gjlS+xm2s+caVuhdtVLKFKGsdfmWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VQEAXityIRw0N6GvTsEivWjSEzKs2lLCftH7TEnY1TZ0S3HzifGiqx9PHmOHi0t97
	 J/Cip00ZcJT/RzhrR6leOf+tD4AWyjZRRHlwkx/GDkfRoF7m8HcPs3YEBWVdkZNmDQ
	 mXTpt/gK/VxqlbcdGOkJ2A9waFU0QoXTBsRmN5KY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3707DF80570; Thu, 18 May 2023 16:03:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84B5DF80570;
	Thu, 18 May 2023 16:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DFE5F8055C; Thu, 18 May 2023 16:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 34652F8025A
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 16:03:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34652F8025A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 85C5D24051;
	Thu, 18 May 2023 10:03:39 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzeEF-cL8-00; Thu, 18 May 2023 16:03:39 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/2] ALSA: emu10k1: enable bit-exact playback,
 part 4: send amounts
Date: Thu, 18 May 2023 16:03:39 +0200
Message-Id: <20230518140339.3722279-3-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230518140339.3722279-1-oswald.buddenhagen@gmx.de>
References: <20230518140339.3722279-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZTCMO5YWG2BNKMPA2NL3AX4TXACGYU2
X-Message-ID-Hash: EZTCMO5YWG2BNKMPA2NL3AX4TXACGYU2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZTCMO5YWG2BNKMPA2NL3AX4TXACGYU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Audigy, the send amounts are merely targets, presumably to avoid
sound distortion due to sudden changes, which the EMU8K docu explicitly
warns about.

However, that "soft-start" would prevent bit-for-bit reproduction, so
we now force the current send amounts to their final values at PCM
playback init.

One might want to do that for the MIDI synthesizer as well, though it
seems mostly pointless due to the attack phase each note has anyway.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h    |  2 ++
 sound/pci/emu10k1/emupcm.c | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 9c5de1f45566..583fabef0b99 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -709,6 +709,8 @@ SUB_REG(PEFE, FILTERAMOUNT,	0x000000ff)	/* Filter envlope amount				*/
 #define ADCBS_BUFSIZE_57344	0x0000001e
 #define ADCBS_BUFSIZE_65536	0x0000001f
 
+// On Audigy, the FX send amounts are not applied instantly, but determine
+// targets towards which the following registers swerve gradually.
 #define A_CSBA			0x4c		/* FX send B & A current amounts			*/
 #define A_CSDC			0x4d		/* FX send D & C current amounts			*/
 #define A_CSFE			0x4e		/* FX send F & E current amounts			*/
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 0b23ff8d9c3b..903a68a4d396 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -236,6 +236,18 @@ static unsigned int emu10k1_select_interprom(unsigned int pitch_target)
 		return CCCA_INTERPROM_2;
 }
 
+static u16 emu10k1_send_target_from_amount(u8 amount)
+{
+	static const u8 shifts[8] = { 4, 4, 5, 6, 7, 8, 9, 10 };
+	static const u16 offsets[8] = { 0, 0x200, 0x400, 0x800, 0x1000, 0x2000, 0x4000, 0x8000 };
+	u8 exp;
+
+	if (amount == 0xff)
+		return 0xffff;
+	exp = amount >> 5;
+	return ((amount & 0x1f) << shifts[exp]) + offsets[exp];
+}
+
 static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 				       int master, int extra,
 				       struct snd_emu10k1_voice *evoice,
@@ -301,6 +313,11 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 			A_FXRT2, snd_emu10k1_compose_audigy_fxrt2(send_routing),
 			A_SENDAMOUNTS, snd_emu10k1_compose_audigy_sendamounts(send_amount),
 			REGLIST_END);
+		for (int i = 0; i < 4; i++) {
+			u32 aml = emu10k1_send_target_from_amount(send_amount[2 * i]);
+			u32 amh = emu10k1_send_target_from_amount(send_amount[2 * i + 1]);
+			snd_emu10k1_ptr_write(emu, A_CSBA + i, voice, (amh << 16) | aml);
+		}
 	} else {
 		snd_emu10k1_ptr_write(emu, FXRT, voice,
 				      snd_emu10k1_compose_send_routing(send_routing));
-- 
2.40.0.152.g15d061e6df

