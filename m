Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8A7597BAE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 04:53:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E759D1669;
	Thu, 18 Aug 2022 04:52:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E759D1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660791187;
	bh=GmZbfLoyMol4P6HwEzloLPXdHqR81GPqviT0pXFncMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OpEQmo5rpqr0j0wPjchug5f7Bu1I0VwfFRk+WGDmzre4Ig6BBdKqF1A98lqpyet1C
	 IhdvA9k/gziuRG2nlm1denfUckYsRYBVXtwy4rmwBwd1nqYuHjD0L2XbqGapfQT5Xr
	 M5xIVoyyUc/zk7AA9DfQxYQln2iPZG1/1niEqfM8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E1488F804CB;
	Thu, 18 Aug 2022 04:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6AD5F8049E; Thu, 18 Aug 2022 04:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD37BF800B5
 for <alsa-devel@alsa-project.org>; Thu, 18 Aug 2022 04:51:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD37BF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="KfwRz8PY"
X-UUID: 9e0fb6ed1a6b4ea7961ec8516d1adb1c-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eN3EiMbJZjkPNxTTGOCbQsV4Q3ZOvBjbel13AFC2Bqk=; 
 b=KfwRz8PYYHdLGntVEtBo4VVvYp9VgejSlMmNrNDl1fRcw/ZB3tOhrxNrZMqnWG4KYz0UkJCq7SW+aiUrVm2pHUsZs0SVj4e2/UlzTbVZ9trL21tNVP82dblfEsoHHOfTV3e002l33CZY1cVeac94/Su9+0Fx7J8YARpTXDb1Y84=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:f57991ba-38af-4301-b872-b075cfa2edd8, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:95
X-CID-INFO: VERSION:1.1.10, REQID:f57991ba-38af-4301-b872-b075cfa2edd8, OB:0,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS98
 1B3D,ACTION:quarantine,TS:95
X-CID-META: VersionHash:84eae18, CLOUDID:cef6fd9c-da39-4e3b-a854-56c7d2111b46,
 C
 OID:bbe66b6bf442,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9e0fb6ed1a6b4ea7961ec8516d1adb1c-20220818
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 220536561; Thu, 18 Aug 2022 10:51:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 18 Aug 2022 10:51:19 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 18 Aug 2022 10:51:18 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND 0/3] ASoC: mediatek: support SOF for mt8186
Date: Thu, 18 Aug 2022 10:51:10 +0800
Message-ID: <20220818025113.17144-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, "chunxu.li" <chunxu.li@mediatek.com>,
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

From: "chunxu.li" <chunxu.li@mediatek.com>

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
2.25.1

