Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF018FAF7
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2019 08:29:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4AF851;
	Fri, 16 Aug 2019 08:29:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4AF851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565936992;
	bh=2bjIrAQr9tL3bxQsWRRLU6I8nEMSS//DY/ue1w9f85k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sNO8TJMhk1Mjgj6SFCOTJ+btXfZ1rXNf00cOPhmlYPts1R2PYw3Eo7LlkJSIzKEHt
	 Gc1lq5o8/hoAYe4F3aRI9D4HDPA2ktaFDfvHnr3udPg4zWRNc7CIaCny7KBL6ZVAAK
	 ltlqGyqUV1Dq8eoGEvoHWhkVsJJyXxhDw8+a3nd0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BC32F8048D;
	Fri, 16 Aug 2019 08:28:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED69CF80110; Fri, 16 Aug 2019 08:28:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03FDBF803F4
 for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2019 08:28:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03FDBF803F4
Received: from [114.252.209.139] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.76) (envelope-from <hui.wang@canonical.com>)
 id 1hyViW-0001eO-Cc; Fri, 16 Aug 2019 06:28:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri, 16 Aug 2019 14:27:40 +0800
Message-Id: <20190816062740.5059-2-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190816062740.5059-1-hui.wang@canonical.com>
References: <20190816062740.5059-1-hui.wang@canonical.com>
Subject: [alsa-devel] [PATCH v3 2/2] ALSA: hda - Define a
	fallback_pin_fixup_tbl for alc269 family
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We have another Dell laptop which needs the DELL4_MIC_NO_PRESENCE,
and this laptop has different pincfg definitions from existing
ones in the pintbl, rather adding a new entry, let us define
a tbl in the fallback_pin_fixup_tbl and this tbl will match
all dell machines with alc289 codec and the pins of 0x19 and 0x1b
are undef by default.

Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 2fa03fb6bd9e..e62672877597 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -7648,10 +7648,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 		{0x12, 0x90a60120},
 		{0x14, 0x90170110},
 		{0x21, 0x0321101f}),
-	SND_HDA_PIN_QUIRK(0x10ec0289, 0x1028, "Dell", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
-		{0x12, 0xb7a60130},
-		{0x14, 0x90170110},
-		{0x21, 0x04211020}),
 	SND_HDA_PIN_QUIRK(0x10ec0290, 0x103c, "HP", ALC269_FIXUP_HP_MUTE_LED_MIC1,
 		ALC290_STANDARD_PINS,
 		{0x15, 0x04211040},
@@ -7761,6 +7757,19 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
 	{}
 };
 
+/* This is the fallback pin_fixup_tbl for alc269 family, to make the tbl match
+ * more machines, don't need to match all valid pins, just need to match
+ * all the pins defined in the tbl. Just because of this reason, it is possible
+ * that a single machine matches multiple tbls, so there is one limitation:
+ *   at most one tbl is allowed to define for the same vendor and same codec
+ */
+static const struct snd_hda_pin_quirk alc269_fallback_pin_fixup_tbl[] = {
+	SND_HDA_PIN_QUIRK(0x10ec0289, 0x1028, "Dell", ALC269_FIXUP_DELL4_MIC_NO_PRESENCE,
+		{0x19, 0x40000000},
+		{0x1b, 0x40000000}),
+	{}
+};
+
 static void alc269_fill_coef(struct hda_codec *codec)
 {
 	struct alc_spec *spec = codec->spec;
@@ -7951,6 +7960,7 @@ static int patch_alc269(struct hda_codec *codec)
 	snd_hda_pick_fixup(codec, alc269_fixup_models,
 		       alc269_fixup_tbl, alc269_fixups);
 	snd_hda_pick_pin_fixup(codec, alc269_pin_fixup_tbl, alc269_fixups, true);
+	snd_hda_pick_pin_fixup(codec, alc269_fallback_pin_fixup_tbl, alc269_fixups, false);
 	snd_hda_pick_fixup(codec, NULL,	alc269_fixup_vendor_tbl,
 			   alc269_fixups);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_PRE_PROBE);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
