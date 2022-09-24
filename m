Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 806DA5E87FF
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Sep 2022 05:37:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E770382B;
	Sat, 24 Sep 2022 05:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E770382B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663990642;
	bh=dnZk0OtB/yHxdbzBtI8bc+6Nv06j+eAZ+/rWprlJWkw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lcIqdKcLBqzG4HXfwwyEzSMastrHP+osZiDOOALYo8ktHJikAkDwjN2SlC1fKCaPG
	 R17GqK9QVhAPC3hGwuNWz0UV/ttrZARG+LQ4QmsO82kVaJlqvbVDi/syAe6xrfnFt3
	 W7boDHY5IM6bFm/uKWbCrD+mfMt5ugwTMpBdmWrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D707F804E6;
	Sat, 24 Sep 2022 05:36:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DDD9DF8025D; Sat, 24 Sep 2022 05:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD8D8F80124;
 Sat, 24 Sep 2022 05:36:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD8D8F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="t9SaBDBg"
X-UUID: 3d933e4b162c48d3a58addce80cda0a2-20220924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yJdS0/iD611Z0qXT//tqsqB6YYs0XIBQmGDntx2ksWQ=; 
 b=t9SaBDBg6UcFpiVxMfPQimo0vhQoKcMaEHExFxR7sow8pcG7+5ixGce+pd9AVCGZtdHFFnB0Skwr+sOuYBAOMMZ1TKpKC4rALh938Yo0epM0JyBQCk1zt6VZPrpndOdXUEMHylgmuO4smztYNOucLTppldeXm7/dZKK84TpaYso=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:48a32dcf-d958-4167-8e54-77fc19c25841, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:95
X-CID-INFO: VERSION:1.1.11, REQID:48a32dcf-d958-4167-8e54-77fc19c25841, IP:0,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
 :quarantine,TS:95
X-CID-META: VersionHash:39a5ff1, CLOUDID:a46ee7a2-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:2209241136087SI94QT7,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|823|
 824,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,
 COL:0
X-UUID: 3d933e4b162c48d3a58addce80cda0a2-20220924
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1838660798; Sat, 24 Sep 2022 11:36:05 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 24 Sep 2022 11:36:04 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Sat, 24 Sep 2022 11:36:03 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
 <peter.ujfalusi@linux.intel.com>, <lgirdwood@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH 0/2] ASoC: SOF: mediatek: mt8195: Add dsp_ops callback
Date: Sat, 24 Sep 2022 11:35:57 +0800
Message-ID: <20220924033559.26599-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com,
 linux-mediatek@lists.infradead.org, yc.hung@mediatek.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

ASoC: SOF: mediatek: mt8195: Add pcm_{hw_params,pointer} callback

Chunxu Li (2):
  ASoC: SOF: mediatek: mt8195: Add pcm_hw_params callback
  ASoC: SOF: mediatek: mt8195: Add pcm_pointer callback

 sound/soc/sof/mediatek/mt8195/mt8195.c | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

-- 
2.25.1

