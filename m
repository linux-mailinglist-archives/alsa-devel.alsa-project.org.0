Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA427D4AD3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Oct 2023 10:49:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FB8DDF0;
	Tue, 24 Oct 2023 10:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FB8DDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698137359;
	bh=mwMfBtcV/pJ7zmHmZA12r8/1GgBefmysIDlJKK/dSPY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IXBiqHjvqHLhjjw4rWOKqDGO2ccO1BQQUetnH9kFXreZAhLQPzNIoaNMs3qr04JkX
	 RuUNi0ZH7gadA931tqcv/djGhIYfvCWdLxxh7g71crd7hXI0j7AIhv+LJ+Qd36OnUp
	 J71a8mC1+aAQGK4jZsuuHHEAMiNth4uq73tD2lAE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 376FCF805AC; Tue, 24 Oct 2023 10:47:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C94FF8059F;
	Tue, 24 Oct 2023 10:47:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15B08F80165; Tue, 24 Oct 2023 05:51:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F440F8012B
	for <alsa-devel@alsa-project.org>; Tue, 24 Oct 2023 05:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F440F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=e1HhZCOP
X-UUID: 834a1522722011ee8051498923ad61e6-20231024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QfVVtZBb9l5MkYex/BrRtzyJ2IeY7PLkE34QeN8pkSQ=;
	b=e1HhZCOPG2VBJGY1NG3BVi4+f/XIDerEVOlus5kHYJw3afd5UTMkjk6gz+UmjnpJOqtCCIMH6TRr/KvMSlSQHSYMA3zVFTPMGDwMOlWTyaHPQSLfpTKX8AF/Y2JsO9meenhBi2hwBRE3ik884FbneCWeCdIDk48geQ00uq0iwfQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6ecd9648-9318-448e-95bf-75ea406d78ff,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:94a58d94-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 834a1522722011ee8051498923ad61e6-20231024
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw02.mediatek.com
	(envelope-from <maso.huang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 977540919; Tue, 24 Oct 2023 11:50:46 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 24 Oct 2023 11:50:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 24 Oct 2023 11:50:45 +0800
From: Maso Huang <maso.huang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <alsa-devel@alsa-project.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Maso Huang <maso.huang@mediatek.com>
Subject: [PATCH v2 1/3] ASoC: mediatek: mt7986: drop the remove callback of
 mt7986_wm8960
Date: Tue, 24 Oct 2023 11:50:17 +0800
Message-ID: <20231024035019.11732-2-maso.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231024035019.11732-1-maso.huang@mediatek.com>
References: <20231024035019.11732-1-maso.huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MailFrom: maso.huang@mediatek.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 4KL62GL7ZSEESARJJUL6Q22OU334AGB3
X-Message-ID-Hash: 4KL62GL7ZSEESARJJUL6Q22OU334AGB3
X-Mailman-Approved-At: Tue, 24 Oct 2023 08:47:22 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4KL62GL7ZSEESARJJUL6Q22OU334AGB3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Drop the remove callback of mt7986_wm8960.

Signed-off-by: Maso Huang <maso.huang@mediatek.com>
---
 sound/soc/mediatek/mt7986/mt7986-wm8960.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-wm8960.c b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
index 364d13b1c426..f6b9794b7229 100644
--- a/sound/soc/mediatek/mt7986/mt7986-wm8960.c
+++ b/sound/soc/mediatek/mt7986/mt7986-wm8960.c
@@ -163,15 +163,6 @@ static int mt7986_wm8960_machine_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void mt7986_wm8960_machine_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-	struct mt7986_wm8960_priv *priv = snd_soc_card_get_drvdata(card);
-
-	of_node_put(priv->codec_node);
-	of_node_put(priv->platform_node);
-}
-
 static const struct of_device_id mt7986_wm8960_machine_dt_match[] = {
 	{.compatible = "mediatek,mt7986-wm8960-sound"},
 	{ /* sentinel */ }
@@ -184,7 +175,6 @@ static struct platform_driver mt7986_wm8960_machine = {
 		.of_match_table = mt7986_wm8960_machine_dt_match,
 	},
 	.probe = mt7986_wm8960_machine_probe,
-	.remove_new = mt7986_wm8960_machine_remove,
 };
 
 module_platform_driver(mt7986_wm8960_machine);
-- 
2.18.0

