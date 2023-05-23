Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E6070D120
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 04:22:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53C1483A;
	Tue, 23 May 2023 04:21:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53C1483A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684808530;
	bh=xOQjP6Qa0yRKhXKKhuMlTzffb3s/Vqsjvhh6qZ3F7XI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rDY9jEP1QgGLI/NSjLMFgSpwqL9rXt30KJLrrvy8mkWhDR5+F+AgyipOftHSXcrWO
	 l8bhbxBih1LGqrdPAFPWgc68VirHFJ8jsWflKXwVTM8v2kRN6xl+xEBN6SATHkTmPN
	 5+qsSNN4VGF0ccJnsxFDlvUL0As/H09HKUUo6S8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 490AAF805A9; Tue, 23 May 2023 04:20:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 57CEBF8057A;
	Tue, 23 May 2023 04:20:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A95AF80580; Tue, 23 May 2023 04:20:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E5680F80249
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 04:19:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5680F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=TZbUdHeS
X-UUID: 42f253c4f91011edb20a276fd37b9834-20230523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=pPHtutEx41GaWaFfqzxpys52j/Z/gLc7/MJL2pJDlB4=;
	b=TZbUdHeSkkgc79Pik9H1NX+x38NYR7jWf0zCfx7Bj9UBLhQLVIfskEDKLvBgdjrDoL7z/QU/mwLa6GKKTfmvKM6Ob41jhvkI6y7VoTO+ZusnYnAb0OsEZ+HJocAdDoaC8oTfq0fTRqQT2v/TMNEPNNIbasErIH8qhnVuOjp0VJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:67d15df9-ebdd-41d6-a07c-4bd2410485b5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:9cc3063c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 42f253c4f91011edb20a276fd37b9834-20230523
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1682149150; Tue, 23 May 2023 10:19:35 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:19:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:19:35 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 5/7] ASoC: soc-dapm.c: clean up debugfs for freed widget
Date: Tue, 23 May 2023 10:19:30 +0800
Message-ID: <20230523021933.3422-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523021933.3422-1-trevor.wu@mediatek.com>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: CA2DTHAAL3BQ7WEZUIO7WSBOLYGXKIVT
X-Message-ID-Hash: CA2DTHAAL3BQ7WEZUIO7WSBOLYGXKIVT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CA2DTHAAL3BQ7WEZUIO7WSBOLYGXKIVT/>
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

