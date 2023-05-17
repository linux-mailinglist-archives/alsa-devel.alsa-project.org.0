Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054B1706E86
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 18:49:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC16E1F6;
	Wed, 17 May 2023 18:48:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC16E1F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684342142;
	bh=3mw4TOHRsHNVhB+SpDswWQLglIolQXbk0/2M/kawfdc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZULDj23XI+VOH7XWrNIMlKgGm3m8bcZJGiEuSHLOP3YWrH9zqkEUNaquZk+uw4BFh
	 yZw/OjPyMmR/Z5qW1ZpLQtCPqpGyHi0f/gOKVZ++ODS1ArHGjpwbJLRYlXYP530Yn5
	 Bd5oslWCWREPjZCjJ7ngrHgpIH2kHgOKAOh1SWeA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D44EF8053D; Wed, 17 May 2023 18:48:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6725F8025A;
	Wed, 17 May 2023 18:48:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DB6A1F80272; Wed, 17 May 2023 18:48:07 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AD666F8016A
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 18:48:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD666F8016A
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 9382723E25;
	Wed, 17 May 2023 12:48:00 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pzKJk-JiO-00; Wed, 17 May 2023 18:48:00 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: [PATCH] ALSA: emu10k1: remove runtime 64-bit divisions
Date: Wed, 17 May 2023 18:48:00 +0200
Message-Id: <20230517164800.3650699-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: J3HQL7GVKVYLURLQRU7TVGGNWX63VZ6H
X-Message-ID-Hash: J3HQL7GVKVYLURLQRU7TVGGNWX63VZ6H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/J3HQL7GVKVYLURLQRU7TVGGNWX63VZ6H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

32-bit platforms don't like these. As we're actually dealing with
constants, factor out the calculations and pass them in as additional
arguments. To keep the call sites clean, wrap the actual functions in
macros which generate the arguments.

Fixes: bb5ceb43b7bf ("ALSA: emu10k1: fix non-zero mixer control defaults in highres mode")
Fixes: 1298bc978afb ("ALSA: emu10k1: enable bit-exact playback, part 1: DSP attenuation")
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>

---

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
---
 sound/pci/emu10k1/emufx.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index f64b2b4eb348..e9855d37fa5c 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -1144,50 +1144,56 @@ static int snd_emu10k1_ipcm_peek(struct snd_emu10k1 *emu,
 #define SND_EMU10K1_PLAYBACK_CHANNELS	8
 #define SND_EMU10K1_CAPTURE_CHANNELS	4
 
+#define HR_VAL(v) ((v) * 0x80000000LL / 100 - 1)
+
 static void
-snd_emu10k1_init_mono_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
-			       const char *name, int gpr, int defval)
+snd_emu10k1_init_mono_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
+			       const char *name, int gpr, int defval, int defval_hr)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 1;
 	if (high_res_gpr_volume) {
 		ctl->min = -1;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
-		defval = defval * 0x80000000LL / 100 - 1;
+		defval = defval_hr;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEG_TABLE100;
 	}
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 }
+#define snd_emu10k1_init_mono_control(ctl, name, gpr, defval) \
+	snd_emu10k1_init_mono_control2(ctl, name, gpr, defval, HR_VAL(defval))
 
 static void
-snd_emu10k1_init_stereo_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
-				 const char *name, int gpr, int defval)
+snd_emu10k1_init_stereo_control2(struct snd_emu10k1_fx8010_control_gpr *ctl,
+				 const char *name, int gpr, int defval, int defval_hr)
 {
 	ctl->id.iface = (__force int)SNDRV_CTL_ELEM_IFACE_MIXER;
 	strcpy(ctl->id.name, name);
 	ctl->vcount = ctl->count = 2;
 	if (high_res_gpr_volume) {
 		ctl->min = -1;
 		ctl->max = 0x7fffffff;
 		ctl->tlv = snd_emu10k1_db_linear;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEGATE;
-		defval = defval * 0x80000000LL / 100 - 1;
+		defval = defval_hr;
 	} else {
 		ctl->min = 0;
 		ctl->max = 100;
 		ctl->tlv = snd_emu10k1_db_scale1;
 		ctl->translation = EMU10K1_GPR_TRANSLATION_NEG_TABLE100;
 	}
 	ctl->gpr[0] = gpr + 0; ctl->value[0] = defval;
 	ctl->gpr[1] = gpr + 1; ctl->value[1] = defval;
 }
+#define snd_emu10k1_init_stereo_control(ctl, name, gpr, defval) \
+	snd_emu10k1_init_stereo_control2(ctl, name, gpr, defval, HR_VAL(defval))
 
 static void
 snd_emu10k1_init_mono_onoff_control(struct snd_emu10k1_fx8010_control_gpr *ctl,
-- 
2.40.0.152.g15d061e6df

