Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E318759AC59
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Aug 2022 09:55:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42BAB168B;
	Sat, 20 Aug 2022 09:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42BAB168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660982105;
	bh=S8UI7jP3y8/l2CPU0uSqa+PYC49fJp3Z0IcgQ+Ut1Ug=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Vcoec1cLKIH4jYtmaHQ7LJOra5+IDoUjdM+lzCJtc/qnEfOc1m53dDfNW2jGBvGE8
	 Rl/C/qWtb3b20WIWS9o/Gq/wHd1a7Nqn3lV+u47wYl80qzL+sk3g8ESVHxaWi16NNx
	 sRRZxVuXpxFxFklfqdU5+VIYfaOKKvl7JRkAZPGc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B16EF802E3;
	Sat, 20 Aug 2022 09:54:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DE1DF802E3; Sat, 20 Aug 2022 09:54:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BB84F80121
 for <alsa-devel@alsa-project.org>; Sat, 20 Aug 2022 09:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BB84F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="nbEExJ7U"
X-UUID: 9aedf8152256455083fbd531d4f5c69c-20220820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PUarByM2j1FNLpVpanhoJ3I2PsMoMzMbXYJwfEpiVIc=; 
 b=nbEExJ7UJBQRUYs7V21SEK62lfrowYhaphfFhMdVIfmThPx/H8T77HwrWLJd2QBRuHoY9su3nRVnK1Dc3MYaaj5Q/V4cLldu19OTt0TXTIMu6cBF3ukGcPAqlqYDTct6ya/geg9r9vtqKVsKFtgjGH9Ce5VevPmU3eS3oxk2fhs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:901abedf-de1e-475a-a1ab-e8441e26f3df, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:242842c9-6b09-4f60-bf82-12f039f5d530,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9aedf8152256455083fbd531d4f5c69c-20220820
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1753557380; Sat, 20 Aug 2022 15:53:49 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 20 Aug 2022 15:53:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Aug 2022 15:53:46 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <nfraprado@collabora.com>, <broonie@kernel.org>
Subject: [PATCH 0/2] dt-bindings: sound: Add SOF field for mt8186
Date: Sat, 20 Aug 2022 15:53:41 +0800
Message-ID: <20220820075343.13993-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 "chunxu.li" <chunxu.li@mediatek.com>, lgirdwood@gmail.com,
 jiaxin.yu@mediatek.com, linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
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

From: "chunxu.li" <chunxu.li@mediatek.com>

These patches add SOF field for mt8186 machine driver

chunxu.li (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF

 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.25.1

