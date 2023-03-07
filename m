Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 590B06AD5FF
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 05:12:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 305791320;
	Tue,  7 Mar 2023 05:11:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 305791320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678162333;
	bh=9w+UDHfn5T8YznXMvwEeLxr2txle+48TJu+6zQg3Ztg=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=X+hlrDVjmnt04Ozxq/3utyIE/vPT/s61izeaC/QmNuqOfUoD2Gxw9q7mvndKJcsVN
	 5XRQZrnt8Gll24Yicuc/JMk8ELKyUIzoOj9wytEzYw8FUhm7yypyBCsrRb6lqRq8AO
	 gEJIfoZMUhRXkV2q3TjBTNgd/1yrgQ2hO6YYKa5I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54D39F80544;
	Tue,  7 Mar 2023 05:10:19 +0100 (CET)
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt6358: fix UNINIT problem
Date: Tue, 7 Mar 2023 12:09:37 +0800
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CPZO7VWLR4XNJSWLPTMQIISR5K2AVMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167816221839.26.4600710524407532007@mailman-core.alsa-project.org>
From: Trevor Wu via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Trevor Wu <trevor.wu@mediatek.com>
Cc: trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30DDDF8051B; Tue,  7 Mar 2023 05:10:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,RDNS_NONE,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A4635F80093
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 05:10:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4635F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=ROFlP43y
X-UUID: e38108e4bc9d11ed945fc101203acc17-20230307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jRNnZrN6xFwN19GVWEkePB6Ng03IX8gMpvzlN1+Rj/4=;
	b=ROFlP43yU6H/Gi0ljdmb7sk3Xm2Z5C162ql+hP/2xved6bE2pI8Il2oCQGhYajFts2/l3M1OVLIsszzkJiypZ0aLrAEcaQseVwlus5z9QcUe8qvKjXjLwQ/spwfcwCStzDNg/uLrITXCLx9FhUr1PDY24Q+Q6dGbxWpZ7KdmN3M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:524be16c-f72f-47ea-8af2-39f0d6403061,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:40c56cb2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: e38108e4bc9d11ed945fc101203acc17-20230307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 93485341; Tue, 07 Mar 2023 12:09:43 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 12:09:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 12:09:42 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/4] ASoC: mediatek: mt6358: fix UNINIT problem
Date: Tue, 7 Mar 2023 12:09:37 +0800
Message-ID: <20230307040938.7484-4-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230307040938.7484-1-trevor.wu@mediatek.com>
References: <20230307040938.7484-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Message-ID-Hash: 7CPZO7VWLR4XNJSWLPTMQIISR5K2AVMM
X-Message-ID-Hash: 7CPZO7VWLR4XNJSWLPTMQIISR5K2AVMM
X-MailFrom: trevor.wu@mediatek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: trevor.wu@mediatek.com, jiaxin.yu@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CPZO7VWLR4XNJSWLPTMQIISR5K2AVMM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Coverity shows decaring variable reg without initializer. When
regmap_read returns an error, reg keeps the value left from earlier
computation. To prevent from the unexpected result in the case, assign
0 to reg.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6358.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index b54610b27906..d7b157ddc9a8 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -429,7 +429,7 @@ static int mt6358_put_volsw(struct snd_kcontrol *kcontrol,
 	struct mt6358_priv *priv = snd_soc_component_get_drvdata(component);
 	struct soc_mixer_control *mc =
 			(struct soc_mixer_control *)kcontrol->private_value;
-	unsigned int reg;
+	unsigned int reg = 0;
 	int ret;
 
 	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-- 
2.18.0

