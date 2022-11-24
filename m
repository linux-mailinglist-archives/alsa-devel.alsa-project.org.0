Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CEC637492
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 09:56:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ACF816E8;
	Thu, 24 Nov 2022 09:55:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ACF816E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669280179;
	bh=2VlFuDW23SS5ob+H1VEVVHEWRXGpV5PK8Wd/ASar2to=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MSO8/89m76w1/c3iEhY2tvKd/YKGHjVlOIrDUSna/nuwKMcrJnGSponz35rIMz3j8
	 AUuLFj7UPdQP2Gcp0QD9umM1k9M/gHLXiJ/BTT84SJorWIOlex4txtRF/BjMqYBdSO
	 TSrPdf/ET4jBuVv4nmZS9ihkVKA7I+77AsxbnKas=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8431AF804E7;
	Thu, 24 Nov 2022 09:55:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 145EFF804E7; Thu, 24 Nov 2022 09:55:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H2,RCVD_IN_ZEN_BLOCKED_OPENDNS,RDNS_NONE,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 109EFF80448
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 09:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 109EFF80448
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="kB4Qv7ib"
X-UUID: e1b7fc8b92984f0fa217638546b67cf1-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=81wfVrFGa0F5KGBMwUe92UrzpoG4Khjj+9dv7Pe3cgc=; 
 b=kB4Qv7ibiO9k/frbhoqa7DgVCF89awdOxRkSP2zROwQ2WicpCMu7e7TUfqHthkWqjsM+Kxw8awRbNs7YKMbS4UQpsI10ArRoJmotb+HXn+Z5kEp8f2HoBxLy/wwFVRF/fZuRl6+KKtn5EnLmrNl2UOnQLSAe2vcL4sSGeVxC5tU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14, REQID:1fedf52b-3988-48a4-9aba-8a4b487942be, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:dcaaed0, CLOUDID:4df031f9-3a34-4838-abcf-dfedf9dd068e,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: e1b7fc8b92984f0fa217638546b67cf1-20221124
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 12059189; Thu, 24 Nov 2022 16:54:40 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 24 Nov 2022 16:54:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 24 Nov 2022 16:54:37 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <kuninori.morimoto.gx@renesas.com>,
 <angelogioacchino.delregno@collabora.com>, <nfraprado@collabora.com>
Subject: [PATCH 0/3] ASoC: mediatek:mt8186: fix both the speaker and hdmi
Date: Thu, 24 Nov 2022 16:54:33 +0800
Message-ID: <20221124085436.24900-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: alsa-devel@alsa-project.org, chunxu.li@mediatek.com,
 allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 ajye_huang@compal.corp-partner.google.com,
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

The speaker and hdmi of mt8186 platform are shared the same port of I2S,
when connect the external display, use build-in speakers to play audio,
they both playback at the same time. So we want to manage the playback
device through DAPM events.

Jiaxin Yu (3):
  drm: bridge: it6505: bridge to hdmi-codec
  ASoC: hdmi-codec: Add event handler for hdmi TX
  ASoC: mediatek: mt8186: correct the HDMI widgets

 drivers/gpu/drm/bridge/ite-it6505.c           | 36 +++++++++++++++---
 include/sound/hdmi-codec.h                    |  6 +++
 sound/soc/codecs/hdmi-codec.c                 | 37 +++++++++++++++++--
 .../mt8186/mt8186-mt6366-da7219-max98357.c    |  2 +-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     |  2 +-
 5 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.18.0

