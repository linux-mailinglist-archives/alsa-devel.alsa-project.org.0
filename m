Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C333736D67E
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 13:31:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4653A16EB;
	Wed, 28 Apr 2021 13:30:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4653A16EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619609481;
	bh=GciMAt8uCj+wQcThny0mJ6MU4fP4PyVkHxTgc8yhdfo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hO+Br6K7MMDdztcQW6+/d7OWMPe1s2liGPHZ7wz75b4xRoy16F7TDuTs9jeauH2mk
	 sa+6ERV2xohUCofZIwO7hyy6csXIUUGga+VAH61LTpg9r0BdbSpHA1RjOMQSM/Fnyo
	 nAzsZo0TAQOmi45YGiDLUaoGGjEf0+3cpGKKkhbY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6219F80423;
	Wed, 28 Apr 2021 13:27:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD35BF8029B; Wed, 28 Apr 2021 13:27:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 UPPERCASE_50_75 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65C19F80171
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 13:27:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65C19F80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ADC08B15E
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 11:27:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/13] ALSA: hda/realtek: Re-order ALC269 HP quirk table
 entries
Date: Wed, 28 Apr 2021 13:26:55 +0200
Message-Id: <20210428112704.23967-5-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210428112704.23967-1-tiwai@suse.de>
References: <20210428112704.23967-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Just re-order the alc269_fixup_tbl[] entries for HP devices for
avoiding the oversight of the duplicated or unapplied item in future.
No functional changes.

Formerly, some entries were grouped for the actual codec, but this
doesn't seem reasonable to keep in that way.  So now we simply keep
the PCI SSID order for the whole.

Also Cc-to-stable for the further patch applications.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 44 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 23 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 5eee67d443c2..5c594b8b8723 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -8055,35 +8055,18 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x1586, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC2),
 	SND_PCI_QUIRK(0x103c, 0x18e6, "HP", ALC269_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x218b, "HP", ALC269_FIXUP_LIMIT_INT_MIC_BOOST_MUTE_LED),
-	SND_PCI_QUIRK(0x103c, 0x225f, "HP", ALC280_FIXUP_HP_GPIO2_MIC_HOTKEY),
-	/* ALC282 */
 	SND_PCI_QUIRK(0x103c, 0x21f9, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2210, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2214, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x221b, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x221c, "HP EliteBook 755 G2", ALC280_FIXUP_HP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x103c, 0x2221, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x2225, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2236, "HP", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2237, "HP", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2238, "HP", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2239, "HP", ALC269_FIXUP_HP_LINE1_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x224b, "HP", ALC269_FIXUP_HP_LINE1_MIC1_LED),
-	SND_PCI_QUIRK(0x103c, 0x2268, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x226a, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x226b, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x226e, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x2271, "HP", ALC286_FIXUP_HP_GPIO_LED),
-	SND_PCI_QUIRK(0x103c, 0x2272, "HP", ALC280_FIXUP_HP_DOCK_PINS),
-	SND_PCI_QUIRK(0x103c, 0x2273, "HP", ALC280_FIXUP_HP_DOCK_PINS),
-	SND_PCI_QUIRK(0x103c, 0x229e, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22b2, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22b7, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22bf, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22cf, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22db, "HP", ALC280_FIXUP_HP_9480M),
-	SND_PCI_QUIRK(0x103c, 0x22dc, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
-	SND_PCI_QUIRK(0x103c, 0x22fb, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
-	/* ALC290 */
-	SND_PCI_QUIRK(0x103c, 0x221b, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
-	SND_PCI_QUIRK(0x103c, 0x2221, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
-	SND_PCI_QUIRK(0x103c, 0x2225, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2253, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2254, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2255, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
@@ -8091,26 +8074,41 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x2257, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2259, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x225a, "HP", ALC269_FIXUP_HP_DOCK_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x225f, "HP", ALC280_FIXUP_HP_GPIO2_MIC_HOTKEY),
 	SND_PCI_QUIRK(0x103c, 0x2260, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2263, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2264, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2265, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x2268, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x226a, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x226b, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x226e, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x2271, "HP", ALC286_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x2272, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x2272, "HP", ALC280_FIXUP_HP_DOCK_PINS),
 	SND_PCI_QUIRK(0x103c, 0x2273, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x2273, "HP", ALC280_FIXUP_HP_DOCK_PINS),
 	SND_PCI_QUIRK(0x103c, 0x2278, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x227f, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2282, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x228b, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x228e, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x229e, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22b2, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22b7, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22bf, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22c4, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x22c5, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x22c7, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x22c8, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x22c4, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22cf, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
+	SND_PCI_QUIRK(0x103c, 0x22db, "HP", ALC280_FIXUP_HP_9480M),
+	SND_PCI_QUIRK(0x103c, 0x22dc, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
+	SND_PCI_QUIRK(0x103c, 0x22fb, "HP", ALC269_FIXUP_HP_GPIO_MIC1_LED),
 	SND_PCI_QUIRK(0x103c, 0x2334, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2335, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2336, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
 	SND_PCI_QUIRK(0x103c, 0x2337, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1),
-	SND_PCI_QUIRK(0x103c, 0x221c, "HP EliteBook 755 G2", ALC280_FIXUP_HP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x103c, 0x802e, "HP Z240 SFF", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x802f, "HP Z240", ALC221_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8077, "HP", ALC256_FIXUP_HP_HEADSET_MIC),
-- 
2.26.2

