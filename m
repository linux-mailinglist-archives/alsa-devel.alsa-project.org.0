Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C0D6EBA3F
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Apr 2023 18:14:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AFBAF01;
	Sat, 22 Apr 2023 18:13:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AFBAF01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682180060;
	bh=t8gKhjeFnLBw5+iSsLdW2lrZBLxmMZdIhCgC9YYE1WY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=SUP0gM7dVAx71v5aCEkrEo7o0BHppNGXC4D7hQ1CNOlJ1WJaleB/8okjw10kzmAi3
	 OIl8Nod8FkfIUJR8nBYgiS2QWF7pm/4VMlcLmSO23TW/t9UH++bdug7GDKUhSdvEDk
	 iDcuCCm//1R5x286Rcr2Yn99aV/pstTJB1llEfJg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 889A9F805A8;
	Sat, 22 Apr 2023 18:11:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4521DF8052E; Sat, 22 Apr 2023 18:10:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 190FDF80534
	for <alsa-devel@alsa-project.org>; Sat, 22 Apr 2023 18:10:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 190FDF80534
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 199962422E;
	Sat, 22 Apr 2023 12:10:22 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pqFob-ncB-00; Sat, 22 Apr 2023 18:10:21 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: fix error handling in
 snd_audigy_i2c_volume_put()
Date: Sat, 22 Apr 2023 18:10:21 +0200
Message-Id: <20230422161021.1144026-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BWOFJC6XPBPMMFRFTRDCSCQDCF5GLMXC
X-Message-ID-Hash: BWOFJC6XPBPMMFRFTRDCSCQDCF5GLMXC
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWOFJC6XPBPMMFRFTRDCSCQDCF5GLMXC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Check all inputs before changing anything, and return the right error
code in case of failure.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emumixer.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index 754d91050af2..2b1afbef92c7 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1005,33 +1005,33 @@ static int snd_audigy_i2c_volume_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_emu10k1 *emu = snd_kcontrol_chip(kcontrol);
 	unsigned int ogain;
-	unsigned int ngain;
+	unsigned int ngain0, ngain1;
 	unsigned int source_id;
 	int change = 0;
 
 	source_id = kcontrol->private_value;
 	/* Limit: emu->i2c_capture_volume */
         /*        capture_source: uinfo->value.enumerated.items = 2 */
 	if (source_id >= 2)
 		return -EINVAL;
+	ngain0 = ucontrol->value.integer.value[0];
+	ngain1 = ucontrol->value.integer.value[1];
+	if (ngain0 > 0xff)
+		return -EINVAL;
+	if (ngain1 > 0xff)
+		return -EINVAL;
 	ogain = emu->i2c_capture_volume[source_id][0]; /* Left */
-	ngain = ucontrol->value.integer.value[0];
-	if (ngain > 0xff)
-		return 0;
-	if (ogain != ngain) {
+	if (ogain != ngain0) {
 		if (emu->i2c_capture_source == source_id)
-			snd_emu10k1_i2c_write(emu, ADC_ATTEN_ADCL, ((ngain) & 0xff) );
-		emu->i2c_capture_volume[source_id][0] = ngain;
+			snd_emu10k1_i2c_write(emu, ADC_ATTEN_ADCL, ngain0);
+		emu->i2c_capture_volume[source_id][0] = ngain0;
 		change = 1;
 	}
 	ogain = emu->i2c_capture_volume[source_id][1]; /* Right */
-	ngain = ucontrol->value.integer.value[1];
-	if (ngain > 0xff)
-		return 0;
-	if (ogain != ngain) {
+	if (ogain != ngain1) {
 		if (emu->i2c_capture_source == source_id)
-			snd_emu10k1_i2c_write(emu, ADC_ATTEN_ADCR, ((ngain) & 0xff));
-		emu->i2c_capture_volume[source_id][1] = ngain;
+			snd_emu10k1_i2c_write(emu, ADC_ATTEN_ADCR, ngain1);
+		emu->i2c_capture_volume[source_id][1] = ngain1;
 		change = 1;
 	}
 
-- 
2.40.0.152.g15d061e6df

