Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D31C35F06D8
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Sep 2022 10:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A822167A;
	Fri, 30 Sep 2022 10:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A822167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664527759;
	bh=354kFqjm7qn6OIm8iprmtsvlWIKdXp5LatGOZ7MvIro=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iC57caTzYWWxACcyWbsFnovdgfC15lLYJpvcEffrNF1JfKS8mnTwqAerkZo1gfaL9
	 i1wQBMwL3BqdDf3Ui9CmHwVZkQC2n4fSjYoHnih0Qcnwd00gJ//jAFu6gvAxiofjmg
	 q/B8GwzZUNCg4HOxr86Nc2TN5tct1DnZwyUf8CTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D305F801D5;
	Fri, 30 Sep 2022 10:48:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D146AF80155; Fri, 30 Sep 2022 10:48:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CADB9F800AA
 for <alsa-devel@alsa-project.org>; Fri, 30 Sep 2022 10:48:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CADB9F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="N1bOwCss"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="KavYA/IR"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CA3C218F6;
 Fri, 30 Sep 2022 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664527694; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MAamE4M0n2D7ekB4gj34LRVL5cppwT72u6TjGXtC8uQ=;
 b=N1bOwCss4T5YQnnv6vIsQqETi8q5rDUOqhzyo0ENpNccsYiBIDHCQ2VWfOCVd9gBo1L7lH
 ToZw3l+28atWiCaHjUMq7BOdHQ6NqjErjGWXWlOrzEAGmfeK1VyO7RPRjblQgyintArmnO
 rnE8/W4DgpCSgiEplIV8TLJzMPZVABo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664527694;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=MAamE4M0n2D7ekB4gj34LRVL5cppwT72u6TjGXtC8uQ=;
 b=KavYA/IRBbz75d5PwngpdQ3q+fEOyZg/aaoY2stTcIjvBHqOs9KaSWfdzy9YBmCTKRGRZ1
 N0BTZWhs5FavxuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1689213776;
 Fri, 30 Sep 2022 08:48:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id S+e8BE6tNmNBTAAAMHmgww
 (envelope-from <tiwai@suse.de>); Fri, 30 Sep 2022 08:48:14 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: More robust component matching for
 CS35L41
Date: Fri, 30 Sep 2022 10:48:10 +0200
Message-Id: <20220930084810.10435-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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

As the previous commit implies, a system may have a different SPI bus
number that is embedded in the device string.  And, assuming the fixed
bus number is rather fragile; it may be assigned differently depending
on the configuration or on the boot environment.  Once when a bus
number change happens, the binding fails, resulting in the silence.

This patch tries to make the matching a bit more relaxed, allowing to
bind with a different bus number (or without it).  So the previous
fix, the introduction of ALC245_FIXUP_CS35L41_SPI1_2 fixup became
superfluous, and this is unified to ALC245_FIXUP_CS35L41_SPI_2.

Fixes: 225f6e1bc151 ("ALSA: hda/realtek: Add quirk for HP Zbook Firefly 14 G9 model")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

v1->v2: Add missing linux/ctype.h inclusion

 sound/pci/hda/patch_realtek.c | 62 +++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 3dc19174670e..bce82b834cec 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/leds.h>
+#include <linux/ctype.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
@@ -6704,23 +6705,51 @@ static void comp_generic_playback_hook(struct hda_pcm_stream *hinfo, struct hda_
 	}
 }
 
+struct cs35l41_dev_name {
+	const char *bus;
+	const char *hid;
+	int index;
+};
+
+/* match the device name in a slightly relaxed manner */
+static int comp_match_cs35l41_dev_name(struct device *dev, void *data)
+{
+	struct cs35l41_dev_name *p = data;
+	const char *d = dev_name(dev);
+	int n = strlen(p->bus);
+	char tmp[32];
+
+	/* check the bus name */
+	if (strncmp(d, p->bus, n))
+		return 0;
+	/* skip the bus number */
+	if (isdigit(d[n]))
+		n++;
+	/* the rest must be exact matching */
+	snprintf(tmp, sizeof(tmp), "-%s:00-cs35l41-hda.%d", p->hid, p->index);
+	return !strcmp(d + n, tmp);
+}
+
 static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char *bus,
 				  const char *hid, int count)
 {
 	struct device *dev = hda_codec_dev(cdc);
 	struct alc_spec *spec = cdc->spec;
-	char *name;
+	struct cs35l41_dev_name *rec;
 	int ret, i;
 
 	switch (action) {
 	case HDA_FIXUP_ACT_PRE_PROBE:
 		for (i = 0; i < count; i++) {
-			name = devm_kasprintf(dev, GFP_KERNEL,
-					      "%s-%s:00-cs35l41-hda.%d", bus, hid, i);
-			if (!name)
+			rec = devm_kmalloc(dev, sizeof(*rec), GFP_KERNEL);
+			if (!rec)
 				return;
+			rec->bus = bus;
+			rec->hid = hid;
+			rec->index = i;
 			spec->comps[i].codec = cdc;
-			component_match_add(dev, &spec->match, component_compare_dev_name, name);
+			component_match_add(dev, &spec->match,
+					    comp_match_cs35l41_dev_name, rec);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
 		if (ret)
@@ -6738,17 +6767,12 @@ static void cs35l41_fixup_i2c_two(struct hda_codec *cdc, const struct hda_fixup
 
 static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 2);
-}
-
-static void cs35l41_fixup_spi1_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
-{
-	cs35l41_generic_fixup(codec, action, "spi1", "CSC3551", 2);
+	cs35l41_generic_fixup(codec, action, "spi", "CSC3551", 2);
 }
 
 static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
-	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 4);
+	cs35l41_generic_fixup(codec, action, "spi", "CSC3551", 4);
 }
 
 static void alc287_fixup_legion_16achg6_speakers(struct hda_codec *cdc, const struct hda_fixup *fix,
@@ -7137,8 +7161,6 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_2,
 	ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED,
-	ALC245_FIXUP_CS35L41_SPI1_2,
-	ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_4,
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
@@ -8986,16 +9008,6 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
-	[ALC245_FIXUP_CS35L41_SPI1_2] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cs35l41_fixup_spi1_two,
-	},
-	[ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED] = {
-		.type = HDA_FIXUP_FUNC,
-		.v.func = cs35l41_fixup_spi1_two,
-		.chained = true,
-		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
-	},
 	[ALC245_FIXUP_CS35L41_SPI_4] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_four,
@@ -9358,7 +9370,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aab, "HP EliteBook 650 G9 (MB 8AA9)", ALC236_FIXUP_HP_GPIO_LED),
-	 SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED),
+	 SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.35.3

