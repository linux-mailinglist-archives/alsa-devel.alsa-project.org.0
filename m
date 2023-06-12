Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A70572CF2D
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:16:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1179183B;
	Mon, 12 Jun 2023 21:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1179183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597383;
	bh=1k1AEHXWb6CzEBHxUdHLl+md6PaPhruwdMMNaQh7WC4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=emHRHXTo/AAuzocnF4tev1WNyJKf8TOMVv8IwvmFJDRydMAWD1J/uIB42NXK4GMZq
	 AL9mcarGTxQIpUTOgVpcb8K+DJlS38qesMjrLGlCbyDnL4WoO1+7S2KoQ96xLQIq6U
	 9zl7sLL6Dhpwgbg2PhRrmrJ7PIfjxf47Kjb663JM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98C8EF805C7; Mon, 12 Jun 2023 21:14:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 046B8F805C1;
	Mon, 12 Jun 2023 21:14:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BF0DF8055C; Mon, 12 Jun 2023 21:13:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADBE0F8052E
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBE0F8052E
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E9F4F2426F;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WKX-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 8/9] ALSA: emu10k1: add support for 12 kHz capture on Audigy
Date: Mon, 12 Jun 2023 21:13:24 +0200
Message-Id: <20230612191325.1315854-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QKYAPDBJ3AVAEURHDGVGHLUFJLJTDNH3
X-Message-ID-Hash: QKYAPDBJ3AVAEURHDGVGHLUFJLJTDNH3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QKYAPDBJ3AVAEURHDGVGHLUFJLJTDNH3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fixes a tentative FIXME. Because we can.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emupcm.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 3ef9130a9577..387288d623d7 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -177,12 +177,22 @@ static unsigned int snd_emu10k1_capture_rate_reg(unsigned int rate)
 	}
 }
 
+static const unsigned int audigy_capture_rates[9] = {
+	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
+};
+
+static const struct snd_pcm_hw_constraint_list hw_constraints_audigy_capture_rates = {
+	.count = 9,
+	.list = audigy_capture_rates,
+	.mask = 0
+};
+
 static unsigned int snd_emu10k1_audigy_capture_rate_reg(unsigned int rate)
 {
 	switch (rate) {
 	case 8000:	return A_ADCCR_SAMPLERATE_8;
 	case 11025:	return A_ADCCR_SAMPLERATE_11;
-	case 12000:	return A_ADCCR_SAMPLERATE_12; /* really supported? */
+	case 12000:	return A_ADCCR_SAMPLERATE_12;
 	case 16000:	return ADCCR_SAMPLERATE_16;
 	case 22050:	return ADCCR_SAMPLERATE_22;
 	case 24000:	return ADCCR_SAMPLERATE_24;
@@ -209,7 +219,8 @@ static void snd_emu10k1_constrain_capture_rates(struct snd_emu10k1 *emu,
 		return;
 	}
 	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				   &hw_constraints_capture_rates);
+				   emu->audigy ? &hw_constraints_audigy_capture_rates :
+						 &hw_constraints_capture_rates);
 }
 
 static void snd_emu1010_constrain_efx_rate(struct snd_emu10k1 *emu,
-- 
2.40.0.152.g15d061e6df

