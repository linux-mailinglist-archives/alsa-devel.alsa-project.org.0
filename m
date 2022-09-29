Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134D5EEDB0
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:16:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B260C85D;
	Thu, 29 Sep 2022 08:15:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B260C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664432164;
	bh=HGKumZPxink66FMNn7ySqIM4HUscYIPVjJmiRMaGdQY=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=P9XIbN7bQH8gOOLvTP5dkYzcLxRLyXG4pEPrpkP3yrZpb+okr7bMo7omE0B2FUATi
	 1+fRX8b2Ob56KGQjRCRbE0PKoSn1niTr3l1XEp8NDp+AQ1MQFfAoLaN51298mXwP2y
	 eeCBBXqQQJyiDM6SyOAr3ULZ2ums8jPx2qlPZnOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 667E1F80109;
	Thu, 29 Sep 2022 08:15:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DE95F80109; Thu, 29 Sep 2022 08:15:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D192F80109
 for <alsa-devel@alsa-project.org>; Thu, 29 Sep 2022 08:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D192F80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="hFc0e+SH"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="oxg0qclq"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0379021E33;
 Thu, 29 Sep 2022 06:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664432099; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a28z3K/qgLye3OHHwb4Mz2Ovwl5VQgO9OuACwcaGtZU=;
 b=hFc0e+SHCKuSV0UFheA5fUYCqRMIWfZVC5z5hVHm5NDygSrCfgSRixTG28ZUAOI3SNcq8c
 Pxr7tGV5leeKXPOYKaT8u3gmlFKem5KDTQBq3rwe323Eg5Q5VOMO8hJeirdMzcAaVf08B+
 OrwMx4VZiLlEnmfestwYzEhvAEaey1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664432099;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a28z3K/qgLye3OHHwb4Mz2Ovwl5VQgO9OuACwcaGtZU=;
 b=oxg0qclq6P3EcPOSM8r8nSV0QXBvYGsAssqSfhUy1gnivkV+/90U//a2Lel0dMmtLkfvOY
 WmZEHD3UMn0pSbCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD8C413A71;
 Thu, 29 Sep 2022 06:14:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UFCMNeI3NWNVVwAAMHmgww
 (envelope-from <tiwai@suse.de>); Thu, 29 Sep 2022 06:14:58 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/realtek: Add quirk for HP Zbook Firefly 14 G9 model
Date: Thu, 29 Sep 2022 08:14:55 +0200
Message-Id: <20220929061455.13355-1-tiwai@suse.de>
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

HP Zbook Firefly 14 G9 model (103c:8abb) requires yet another binding
with CS35L41 codec, but with a slightly different configuration.  It's
over spi1 instead of spi0.  Create a new fixup entry for that.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index f9d46ae4c7b7..3dc19174670e 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6741,6 +6741,11 @@ static void cs35l41_fixup_spi_two(struct hda_codec *codec, const struct hda_fixu
 	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 2);
 }
 
+static void cs35l41_fixup_spi1_two(struct hda_codec *codec, const struct hda_fixup *fix, int action)
+{
+	cs35l41_generic_fixup(codec, action, "spi1", "CSC3551", 2);
+}
+
 static void cs35l41_fixup_spi_four(struct hda_codec *codec, const struct hda_fixup *fix, int action)
 {
 	cs35l41_generic_fixup(codec, action, "spi0", "CSC3551", 4);
@@ -7132,6 +7137,8 @@ enum {
 	ALC287_FIXUP_CS35L41_I2C_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_2,
 	ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED,
+	ALC245_FIXUP_CS35L41_SPI1_2,
+	ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED,
 	ALC245_FIXUP_CS35L41_SPI_4,
 	ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED,
 	ALC285_FIXUP_HP_SPEAKERS_MICMUTE_LED,
@@ -8979,6 +8986,16 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
 	},
+	[ALC245_FIXUP_CS35L41_SPI1_2] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_spi1_two,
+	},
+	[ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cs35l41_fixup_spi1_two,
+		.chained = true,
+		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
+	},
 	[ALC245_FIXUP_CS35L41_SPI_4] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cs35l41_fixup_spi_four,
@@ -9341,6 +9358,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8aa3, "HP ProBook 450 G9 (MB 8AA1)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aa8, "HP EliteBook 640 G9 (MB 8AA6)", ALC236_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8aab, "HP EliteBook 650 G9 (MB 8AA9)", ALC236_FIXUP_HP_GPIO_LED),
+	 SND_PCI_QUIRK(0x103c, 0x8abb, "HP ZBook Firefly 14 G9", ALC245_FIXUP_CS35L41_SPI1_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad1, "HP EliteBook 840 14 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8ad2, "HP EliteBook 860 16 inch G9 Notebook PC", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
-- 
2.35.3

