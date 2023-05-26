Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28B7123C8
	for <lists+alsa-devel@lfdr.de>; Fri, 26 May 2023 11:36:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB4D4825;
	Fri, 26 May 2023 11:35:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB4D4825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685093803;
	bh=fwS5JBGsFHZrQValAokpSsk8MqogS/yMc8plkcMGbLA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QvQs35tCt3bXEP1oW1ZlWg94ac8qg6LEvIPC4E7riDbc4FugwPJdP+JXJ5COfb7yB
	 TI6pN13hJO1bAZWy0+XDJrR+4ZhBfiAJqIQJaRgXS5NQ+pgln44vOeFHeEOEFJ1reB
	 pIUw094mRka5mr5/4zQC4RFwuvil88K/RsoAEb3Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C291FF805BE; Fri, 26 May 2023 11:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0914F805B5;
	Fri, 26 May 2023 11:34:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0422EF8016A; Fri, 26 May 2023 11:32:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	RDNS_NONE,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8FE7EF8053D
	for <alsa-devel@alsa-project.org>; Fri, 26 May 2023 11:32:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8FE7EF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=LeWDVB5V
X-UUID: 262b3a22fba811edb20a276fd37b9834-20230526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VLn1nwa0TPSZxy0/Uqf/fSCYjrakDuOkiQdrMrFOV3c=;
	b=LeWDVB5Vk6iBYSnb9TttkV6cPrH89kV6/SUP0kywQGz2tGUGhZnc6v9Y23B4AcdttSgewp0hvkDyIoOqNZCSFXsaYgN2WjOA4pvKnA5U2adVpf2oKkC749JOxGrVzjtSIlJyavEYjIk0QG1kRRPUL1dNKX/T/H3SVwg/apFpYnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:a917842d-f9a4-4869-8b5d-380b4b6d680a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:390e1a6d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 262b3a22fba811edb20a276fd37b9834-20230526
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 31816285; Fri, 26 May 2023 17:31:53 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 May 2023 17:31:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 17:31:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <amergnat@baylibre.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 5/7] ASoC: soc-dapm.c: clean up debugfs for freed widget
Date: Fri, 26 May 2023 17:31:48 +0800
Message-ID: <20230526093150.22923-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: BWD4FUJRLRXFZRHR2X6YLQI3HFDHIIKH
X-Message-ID-Hash: BWD4FUJRLRXFZRHR2X6YLQI3HFDHIIKH
X-MailFrom: trevor.wu@mediatek.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BWD4FUJRLRXFZRHR2X6YLQI3HFDHIIKH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When a widget is added to dapm via snd_soc_dapm_new_widgets,
dapm_debugfs_add_widget is also called to create a corresponding debugfs
file. However, when a widget is freed by snd_soc_dapm_free_widget, the
corresponding debugfs is not cleared. As a result, the freed widget is
still seen in the dapm directory.

This patch adds dapm_debugfs_free_widget to free the debugfs of a
specified widget, and it's called at snd_soc_dapm_free_widget to clean
up the debugfs for freed widget.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/soc-dapm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f2f04ce693a1..c65cc374bb3f 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2216,6 +2216,16 @@ static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 			    &dapm_widget_power_fops);
 }
 
+static void dapm_debugfs_free_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+
+	if (!dapm->debugfs_dapm || !w->name)
+		return;
+
+	debugfs_lookup_and_remove(w->name, dapm->debugfs_dapm);
+}
+
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
 	debugfs_remove_recursive(dapm->debugfs_dapm);
@@ -2232,6 +2242,10 @@ static inline void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 {
 }
 
+static inline void dapm_debugfs_free_widget(struct snd_soc_dapm_widget *w)
+{
+}
+
 static inline void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
 }
@@ -2495,6 +2509,8 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 			dapm_free_path(p);
 	}
 
+	dapm_debugfs_free_widget(w);
+
 	kfree(w->kcontrols);
 	kfree_const(w->name);
 	kfree_const(w->sname);
-- 
2.18.0

