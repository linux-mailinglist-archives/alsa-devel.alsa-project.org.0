Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A704CFE3B
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:24:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB9BC1703;
	Mon,  7 Mar 2022 13:23:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB9BC1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646655864;
	bh=gzw1D/JK60kkQYznO1thNdtqez4K8mTIcbsKDe1Y0kg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWytGxQMkzkNJWLRgnUbE+Vo/t9xDKJ1ebMZdij4LaZ+Yrf9REhWBgYpwZ5BmV/L7
	 a1a8S8/dHUnTUlUAR1qmoGe0LJpmCY/xkAt1Ueu3I4k7/RSMftvpg/kn+kwRF+Ww51
	 z1R8L6sxPwG112FDKZ07hsdXUgN0P5ZAjok3xJ+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C20FF80132;
	Mon,  7 Mar 2022 13:22:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 175EBF80517; Mon,  7 Mar 2022 13:22:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8B450F80132
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:22:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B450F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="hGamDT+w"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646655769; x=1678191769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gzw1D/JK60kkQYznO1thNdtqez4K8mTIcbsKDe1Y0kg=;
 b=hGamDT+wfv/mMJftBZ/kLT5sw3ue9rGYrdk5Bx7bXgBe1GKPghjuU5fS
 AwtTCDt/GsMsQWWhlkWLacBu0cO3SFpiqdgfFeUx80I+HOXeuYGbdcydc
 eDq9Vwv6XCr7mLGM3KiiJ2LnDiPyyK7KCnGuTH04sSK4s9qAZ/kDoG23U
 gh+zNACmOB0A/UyfDAJBNm/OM78loXeB/8MyRI8kN/zHgNGadLa1REj05
 REMDtmiaVtFIKfYepkQZHrdNLO5h0kE1M0YWJyxoEYR8K1vapY+ySSwC4
 szSRv1p9IGl4mOp+97K5jLi7gdeq4PR2UhW+xPFa6bQD/aepb6fOwUjLH w==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="155942216"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 05:22:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 05:22:44 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 05:22:42 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/6] ASoC: dmaengine: do not use a NULL
 prepare_slave_config() callback
Date: Mon, 7 Mar 2022 14:21:57 +0200
Message-ID: <20220307122202.2251639-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
References: <20220307122202.2251639-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, nicolas.ferre@microchip.com, robh+dt@kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
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

Even if struct snd_dmaengine_pcm_config is used, prepare_slave_config()
callback might not be set. Check if this callback is set before using it.

Fixes: fa654e085300 ("ASoC: dmaengine-pcm: Provide default config")
Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2,v3:
 - none

 sound/soc/soc-generic-dmaengine-pcm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index 285441d6aeed..2ab2ddc1294d 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -86,10 +86,10 @@ static int dmaengine_pcm_hw_params(struct snd_soc_component *component,
 
 	memset(&slave_config, 0, sizeof(slave_config));
 
-	if (!pcm->config)
-		prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
-	else
+	if (pcm->config && pcm->config->prepare_slave_config)
 		prepare_slave_config = pcm->config->prepare_slave_config;
+	else
+		prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config;
 
 	if (prepare_slave_config) {
 		int ret = prepare_slave_config(substream, params, &slave_config);
-- 
2.32.0

