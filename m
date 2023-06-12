Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD972CF38
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 21:17:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D93B85D;
	Mon, 12 Jun 2023 21:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D93B85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686597436;
	bh=6ROM/0SV7r/vj00YR7rcPh+62aZFz/VdARGvk/Y/Jd0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j8kFWf66FOWqGLoZHQvlAHneWThJTnoaEVW5XHIwS3PO4CsM6UWkJwUYSTAT977tn
	 tZ1eydAScqifeRNcXVAvm0hpxtE5YK8zJsSAGTb5sClluP0L20z5/Ak5y/XvHfMPza
	 GU0phpg1DFk4gIGSReaUiIyDH9Z6VZRykCck3WN8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D870CF805D4; Mon, 12 Jun 2023 21:14:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 38B3DF8057B;
	Mon, 12 Jun 2023 21:14:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF0AF80132; Mon, 12 Jun 2023 21:14:47 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CF211F80155
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 21:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF211F80155
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id E728724260;
	Mon, 12 Jun 2023 15:13:25 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1q8myj-WKR-00; Mon, 12 Jun 2023 21:13:25 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 7/9] ALSA: emu10k1: fix timer for E-MU cards at 44.1 kHz word
 clock
Date: Mon, 12 Jun 2023 21:13:23 +0200
Message-Id: <20230612191325.1315854-8-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
References: <20230612191325.1315854-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W5HQUUWP7ML3A7UA4C5ZWF6RQ3JCUVR2
X-Message-ID-Hash: W5HQUUWP7ML3A7UA4C5ZWF6RQ3JCUVR2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W5HQUUWP7ML3A7UA4C5ZWF6RQ3JCUVR2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The timer was presuming a fixed 48 kHz word clock, like the rest of the
code.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/timer.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/pci/emu10k1/timer.c b/sound/pci/emu10k1/timer.c
index 993663fef885..f3c78adf3248 100644
--- a/sound/pci/emu10k1/timer.c
+++ b/sound/pci/emu10k1/timer.c
@@ -38,20 +38,36 @@ static int snd_emu10k1_timer_stop(struct snd_timer *timer)
 	return 0;
 }
 
+static unsigned long snd_emu10k1_timer_c_resolution(struct snd_timer *timer)
+{
+	struct snd_emu10k1 *emu = snd_timer_chip(timer);
+
+	if (emu->card_capabilities->emu_model &&
+	    emu->emu1010.word_clock == 44100)
+		return 22676;  // 1 sample @ 44.1 kHz = 22.675736...us
+	else
+		return 20833;  // 1 sample @ 48 kHz = 20.833...us
+}
+
 static int snd_emu10k1_timer_precise_resolution(struct snd_timer *timer,
 					       unsigned long *num, unsigned long *den)
 {
+	struct snd_emu10k1 *emu = snd_timer_chip(timer);
+
 	*num = 1;
-	*den = 48000;
+	if (emu->card_capabilities->emu_model)
+		*den = emu->emu1010.word_clock;
+	else
+		*den = 48000;
 	return 0;
 }
 
 static const struct snd_timer_hardware snd_emu10k1_timer_hw = {
 	.flags = SNDRV_TIMER_HW_AUTO,
-	.resolution = 20833, /* 1 sample @ 48KHZ = 20.833...us */
 	.ticks = 1024,
 	.start = snd_emu10k1_timer_start,
 	.stop = snd_emu10k1_timer_stop,
+	.c_resolution = snd_emu10k1_timer_c_resolution,
 	.precise_resolution = snd_emu10k1_timer_precise_resolution,
 };
 
-- 
2.40.0.152.g15d061e6df

