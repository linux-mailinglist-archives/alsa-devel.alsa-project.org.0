Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2143D584DEF
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 11:15:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A68C91674;
	Fri, 29 Jul 2022 11:14:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A68C91674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659086130;
	bh=D3nENoXaabKK33pTdq/u2+bRRb0sPFxARuiqO/KInAc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GdROqRW7Q6NyXXxgqWMDDWbyPs8qs6SZ3P3giMYF6oMnrmE7Fibdy8uIkYPypuM+t
	 +uOT+ENh+C9AEZB1TokA3RpsWUVVHtq9c+z8ffnNy2xv7zhKdZ49zzPt6T3dvkqBHU
	 zVKrerbF3Wcj4Y4iFJ6NTSGIy4s6sMKpLO83retY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 142A5F804FB;
	Fri, 29 Jul 2022 11:14:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60B47F80224; Fri, 29 Jul 2022 11:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE, T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E61B6F80224
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 11:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E61B6F80224
X-UUID: 0e13a8ba34ce4f8bb343410adde7a9df-20220729
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:df15acc0-e73b-4b09-af16-5d862d645184, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:100
X-CID-INFO: VERSION:1.1.8, REQID:df15acc0-e73b-4b09-af16-5d862d645184, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D,AC
 TION:quarantine,TS:100
X-CID-META: VersionHash:0f94e32, CLOUDID:2e8ab824-a982-4824-82d2-9da3b6056c2a,
 C
 OID:058a361201d4,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0e13a8ba34ce4f8bb343410adde7a9df-20220729
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 456777970; Fri, 29 Jul 2022 17:14:15 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Jul 2022 17:14:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Fri, 29 Jul 2022 17:14:11 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/3] support SOF for mt8186
Date: Fri, 29 Jul 2022 17:14:01 +0800
Message-ID: <20220729091404.7799-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com, tzungbi@google.com,
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

In these patches, we add SOF support for mt8186 which have HiFi5 DSP
inside.

Chunxu Li (3):
  ASoC: mediatek: mt8186: support DSP downlink
  ASoC: mediatek: mt8186: add SOF support on
    mt8186-mt6366-rt1019-rt5682s
  ASoC: mediatek: mt8186: add SOF support on
    mt8186-mt6366-da7219-max98357

 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    |   3 +
 sound/soc/mediatek/mt8186/mt8186-dai-i2s.c    |  12 ++
 .../mt8186/mt8186-mt6366-da7219-max98357.c    | 168 ++++++++++++++++--
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 168 ++++++++++++++++--
 4 files changed, 325 insertions(+), 26 deletions(-)

-- 
2.18.0

