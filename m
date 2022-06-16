Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE754DBB7
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 09:33:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52CC11AAD;
	Thu, 16 Jun 2022 09:32:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52CC11AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655364799;
	bh=HoZXKMH3DUURw9AjU6dpE5Tar2Riq4L19/BDv6bc92c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R9MQeoxrzyJU+XNGccGCGUiRs5quq3PDq4WUnXD87+MVnSKBpVIz/sAcSueh8zwHH
	 TGzqmm+HD77g5WPuuxiEj5vxg9b4tSrGDmCMIdilf6AxjshKYSIUyaXn8YAyVVrL1y
	 A1b/LO0MMlg7oz0nxH6ylnmPIUUWngtc/vyQsl0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A46F80310;
	Thu, 16 Jun 2022 09:31:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5637F80536; Thu, 16 Jun 2022 09:31:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF1BAF800F0;
 Thu, 16 Jun 2022 09:30:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF1BAF800F0
X-UUID: e5f7cf937dca42f7b7132750aa1936f6-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:210e8bef-6bcf-4dec-a17a-571662fb9dd9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:95
X-CID-INFO: VERSION:1.1.6, REQID:210e8bef-6bcf-4dec-a17a-571662fb9dd9, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:95
X-CID-META: VersionHash:b14ad71, CLOUDID:2391b748-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:a9cbaf6056d7,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: e5f7cf937dca42f7b7132750aa1936f6-20220616
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 377725245; Thu, 16 Jun 2022 15:30:47 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 16 Jun 2022 15:30:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 16 Jun 2022 15:30:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, "Mark
 Brown" <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Tinghan Shen <tinghan.shen@mediatek.com>, YC Hung
 <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 "Allen-KH Cheng" <allen-kh.cheng@mediatek.com>
Subject: [PATCH v3 1/4] dt-bindings: dsp: mediatek: Use meaningful names for
 mbox
Date: Thu, 16 Jun 2022 15:30:39 +0800
Message-ID: <20220616073042.13229-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220616073042.13229-1-tinghan.shen@mediatek.com>
References: <20220616073042.13229-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
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

Rename mbox according to actions instead of 'mbox0' and 'mbox1'.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index b7e68b0dfa13..ca8d8661f872 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -50,13 +50,13 @@ properties:
 
   mboxes:
     items:
-      - description: ipc reply between host and audio DSP.
-      - description: ipc request between host and audio DSP.
+      - description: mailbox for receiving audio DSP requests.
+      - description: mailbox for transmitting requests to audio DSP.
 
   mbox-names:
     items:
-      - const: mbox0
-      - const: mbox1
+      - const: rx
+      - const: tx
 
   memory-region:
     items:
@@ -100,6 +100,6 @@ examples:
        memory-region = <&adsp_dma_mem_reserved>,
                        <&adsp_mem_reserved>;
        power-domains = <&spm 6>; //MT8195_POWER_DOMAIN_ADSP
-       mbox-names = "mbox0", "mbox1";
+       mbox-names = "rx", "tx";
        mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
     };
-- 
2.18.0

