Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DF58A666
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 09:06:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DAAD1621;
	Fri,  5 Aug 2022 09:06:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DAAD1621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659683213;
	bh=/el9gWcXGcQJQTz6Fp4Zrai+IEt0qowU9uFN7bTkWh0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WIPw0De1QY/5k9XnQs2u6N4ZsTwqmOg7F5xo5UaPPLz/eL6uEkYEMPmNwm8ds1l3h
	 qEb9d/YsGzevrZkINsnlWoz9krCuNS9nwVw4I0X9CA2Nz17AQYBVB/MEOET/s9TeWd
	 JT+Q5sqsOlj/ML7EwHwWl933fJOFr3U0FxwwVrF4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCD80F8054A;
	Fri,  5 Aug 2022 09:05:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C950F80271; Fri,  5 Aug 2022 09:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,RDNS_NONE,T_SCC_BODY_TEXT_LINE,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FCA1F8025A;
 Fri,  5 Aug 2022 09:05:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FCA1F8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com
 header.b="gyzpiIkb"
X-UUID: 7006c50aecf840d9b17421e2a64bd0f2-20220805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ge4Ztams+8hhb5ZSxfDb3R2/Fe5D9TrfIwPQGMjH3pM=; 
 b=gyzpiIkbiVGsM2W2owslhjcpLsYaLFHQRNpe2Tu3O75sPxzCaCtiwQI0HPif+cu4nYU0070mxP/k6wctT0pFWfT6mdz1ICR78oc5G79oK4kh1b0TtegrlMD0dKDrP+l9atzKTbsEpO1yIUhX1AHt8BbeURVdY6jEz/Wy024IQzQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:25f398e7-406d-48b7-a0a8-1d4e151a5f4e, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:100
X-CID-INFO: VERSION:1.1.8, REQID:25f398e7-406d-48b7-a0a8-1d4e151a5f4e, OB:0,
 LOB:
 0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:100
X-CID-META: VersionHash:0f94e32, CLOUDID:c89601ae-9535-44a6-aa9b-7f62b79b6ff6,
 C
 OID:c728ee04f773,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7006c50aecf840d9b17421e2a64bd0f2-20220805
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <chunxu.li@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1371280604; Fri, 05 Aug 2022 15:04:59 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 5 Aug 2022 15:04:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Aug 2022 15:04:57 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>, 
 <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <angelogioacchino.delregno@collabora.com>, <daniel.baluta@nxp.com>
Subject: [PATCH v2 2/2] ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
Date: Fri, 5 Aug 2022 15:04:49 +0800
Message-ID: <20220805070449.6611-3-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805070449.6611-1-chunxu.li@mediatek.com>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: alsa-devel@alsa-project.org, Chunxu Li <chunxu.li@mediatek.com>,
 tinghan.shen@mediatek.com, linux-kernel@vger.kernel.org,
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

Add .of_machines field sof_mt8186_machs for mt8186

Signed-off-by: Chunxu Li <chunxu.li@mediatek.com>
---
 sound/soc/sof/mediatek/mt8186/mt8186.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c
 b/sound/soc/sof/mediatek/mt8186/mt8186.c
index e006532caf2f..014afe33b3d9 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -515,7 +515,16 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
 
+static struct snd_sof_of_mach sof_mt8186_machs[] = {
+	{
+		.compatible = "mediatek,mt8186",
+		.sof_tplg_filename = "sof-mt8186.tplg",
+	},
+	{}
+};
+
 static const struct sof_dev_desc sof_of_mt8186_desc = {
+	.of_machines = sof_mt8186_machs,
 	.ipc_supported_mask	= BIT(SOF_IPC),
 	.ipc_default		= SOF_IPC,
 	.default_fw_path = {
-- 
2.25.1

