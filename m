Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02C34C783
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Mar 2021 10:16:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9779F1678;
	Mon, 29 Mar 2021 10:15:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9779F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617005796;
	bh=XHuLLzgMH2XywHipoowbtEysmNcVa0tRTnbikRAfY5g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WOEkTU7yojnFmMc4iAXBGxyoxvJlpdp7GqgrK4nflxViUBCCZbB0RqAe6WIqeLx5X
	 dpNn4d9knPgUjb/S5lHLUszykRXxst4iPvgePU+W0pyw4BNlaaZGKUE8vRxk47Gc40
	 4dCCCXoI52mJXLmAHNvADQlO2T4jE4IkPmvQz57M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0407DF8015A;
	Mon, 29 Mar 2021 10:15:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F80CF8015A; Mon, 29 Mar 2021 10:15:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45966F80141
 for <alsa-devel@alsa-project.org>; Mon, 29 Mar 2021 10:14:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45966F80141
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F850y21LZz9sGd;
 Mon, 29 Mar 2021 16:12:50 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.179.202) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Mon, 29 Mar 2021 16:14:47 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 "Rob Herring" <robh+dt@kernel.org>, alsa-devel <alsa-devel@alsa-project.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] ASoC: intel, keembay-i2s: Fix a dt_binding_check warning
Date: Mon, 29 Mar 2021 16:14:35 +0800
Message-ID: <20210329081435.2200-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.179.202]
X-CFilter-Loop: Reflected
Cc: Zhen Lei <thunder.leizhen@huawei.com>
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

The property "dmas" contains two items: DMA "TX" and "RX" channel,
Therefore, its value also needs to be written in two parts.

Otherwise, below YAML check warning is reported:
Documentation/devicetree/bindings/sound/intel,keembay-i2s.example.dt.yaml:\
i2s@20140000: dmas: [[4294967295, 29, 4294967295, 33]] is too short

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
index 6f71294909a5fb4..803627e984f6089 100644
--- a/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
+++ b/Documentation/devicetree/bindings/sound/intel,keembay-i2s.yaml
@@ -81,6 +81,6 @@ examples:
          interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
          clock-names = "osc", "apb_clk";
          clocks = <&scmi_clk KEEM_BAY_PSS_AUX_I2S3>, <&scmi_clk KEEM_BAY_PSS_I2S3>;
-         dmas = <&axi_dma0 29 &axi_dma0 33>;
+         dmas = <&axi_dma0 29>, <&axi_dma0 33>;
          dma-names = "tx", "rx";
      };
-- 
1.8.3


