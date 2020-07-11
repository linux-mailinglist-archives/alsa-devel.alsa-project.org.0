Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DF221C39C
	for <lists+alsa-devel@lfdr.de>; Sat, 11 Jul 2020 12:13:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D210C1661;
	Sat, 11 Jul 2020 12:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D210C1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594462396;
	bh=/PDvrRdhTyfAIZtAAtEMa/d3igvFl9kNHl3hf/6DRZo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fIwbTkZgoX1g+J+ZaUowe6Wp5tZ8FHk6NI25GpMavGmdq/LI+wPH5lz1DAY1STm9K
	 rpeFhDrKdQT/OeF2jmdNzrzGk6okeKDC0v9/Q/DUni5DHnutD95ZxF2ZNMSjgjhLuO
	 sEProUGcrmNlXNJNrd1esjZHbvCDRuRfQrAm9dNw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E353F80255;
	Sat, 11 Jul 2020 12:11:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E7FBF80216; Sat, 11 Jul 2020 12:11:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23A36F80084
 for <alsa-devel@alsa-project.org>; Sat, 11 Jul 2020 12:11:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A36F80084
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="jfhK16As"; 
 dkim=pass (2048-bit key) header.d=retarded.farm header.i=@retarded.farm
 header.b="jfhK16As"
Received: from localhost (localhost [127.0.0.1])
 by mail.bin-co.de (Postfix) with ESMTP id C3D024443DAB;
 Sat, 11 Jul 2020 12:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594462285;
 bh=/PDvrRdhTyfAIZtAAtEMa/d3igvFl9kNHl3hf/6DRZo=;
 h=From:To:Cc:Subject:Date:From;
 b=jfhK16AsijMpRPLH1+bULO11Ht7PCp2bU4U0HLZrXfVHnY3KlxWYHT3WynX0SvcQn
 edw+YQu8U5KE88rlNMG4KA+oaSqdn7IkHI8PIt+QvNGSEFOYq5fwBiSQxVeiJ6m9Wp
 k+hiDRQN7aICgSD85igCl/KBudvBoHbbTUIW3QRNP3NOsuT1U5Rj8x/7jQXczM92LR
 CPynV0F1MTLjrHX/BXQ8WUQehqUXCQMLGoXrBR5lyNhr98THcr48e9oeKNKWuqezRu
 0tiZVQvtMdWW6KIqh8EY2B8j6xO23Rhm4AnGIxzYMyseFq45Rv9N6cUPYpi5MKPfOD
 56IfJzChq0GXQ==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
 by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHpLA4MIEJ6j; Sat, 11 Jul 2020 12:11:25 +0200 (CEST)
Received: from DeepBlue.zlan.intra (unknown [90.187.13.225])
 (Authenticated sender: zappel@retarded.farm)
 by mail.bin-co.de (Postfix) with ESMTPSA id 31FF24442DBA;
 Sat, 11 Jul 2020 12:11:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
 s=201801; t=1594462285;
 bh=/PDvrRdhTyfAIZtAAtEMa/d3igvFl9kNHl3hf/6DRZo=;
 h=From:To:Cc:Subject:Date:From;
 b=jfhK16AsijMpRPLH1+bULO11Ht7PCp2bU4U0HLZrXfVHnY3KlxWYHT3WynX0SvcQn
 edw+YQu8U5KE88rlNMG4KA+oaSqdn7IkHI8PIt+QvNGSEFOYq5fwBiSQxVeiJ6m9Wp
 k+hiDRQN7aICgSD85igCl/KBudvBoHbbTUIW3QRNP3NOsuT1U5Rj8x/7jQXczM92LR
 CPynV0F1MTLjrHX/BXQ8WUQehqUXCQMLGoXrBR5lyNhr98THcr48e9oeKNKWuqezRu
 0tiZVQvtMdWW6KIqh8EY2B8j6xO23Rhm4AnGIxzYMyseFq45Rv9N6cUPYpi5MKPfOD
 56IfJzChq0GXQ==
From: Armas Spann <zappel@retarded.farm>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: hda/realtek: enable headset mic of ASUS ROG Zephyrus
 G14(G401) series with ALC289
Date: Sat, 11 Jul 2020 12:11:11 +0200
Message-Id: <20200711101111.13983-1-zappel@retarded.farm>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Armas Spann <zappel@retarded.farm>, tiwai@suse.com
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

Signed-off-by: Armas Spann <zappel@retarded.farm>
---
 sound/pci/hda/patch_realtek.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 194ffa8c66ce..ff4f3eeedfd0 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6152,6 +6152,7 @@ enum {
 	ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS,
 	ALC269VC_FIXUP_ACER_HEADSET_MIC,
 	ALC269VC_FIXUP_ACER_MIC_NO_PRESENCE,
+	ALC289_FIXUP_ASUS_G401,
 };
 
 static const struct hda_fixup alc269_fixups[] = {
@@ -7359,6 +7360,13 @@ static const struct hda_fixup alc269_fixups[] = {
 		.chained = true,
 		.chain_id = ALC269_FIXUP_HEADSET_MIC
 	},
+	[ALC289_FIXUP_ASUS_G401] = {
+		.type = HDA_FIXUP_PINS,
+		.v.pins = (const struct hda_pintbl[]) {
+			{ 0x19, 0x03a11020 }, /* headset mic with jack detect */
+			{ }
+		},
+	},
 };
 
 static const struct snd_pci_quirk alc269_fixup_tbl[] = {
@@ -7539,6 +7547,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1bbd, "ASUS Z550MA", ALC255_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1c23, "Asus X55U", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x1043, 0x1ccd, "ASUS X555UB", ALC256_FIXUP_ASUS_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1f11, "ASUS Zephyrus G14", ALC289_FIXUP_ASUS_G401),
 	SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
 	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
 	SND_PCI_QUIRK(0x1043, 0x834a, "ASUS S101", ALC269_FIXUP_STEREO_DMIC),
-- 
2.27.0

