Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C16E54CFE46
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 13:25:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54D801730;
	Mon,  7 Mar 2022 13:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54D801730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646655946;
	bh=yhcV1xA/GCoaV0qxID8U5MSYsK0/vgW50L/YM9WNuBw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tL0U1sbsECHvTeMBDjKEjLqbJeJbvC+lRxie/t43sX5glbIaOTyzyBsc9mZXayiyV
	 lKsJHF73XmEcD/suT9bszfc4efEcH8NoObuFUDrufTJq5bjSIFGUlBLY12H3EJfg2G
	 Q3MqsCD59APZjH45XbO/6K6/KkoKPy+pbLdFs1Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E084F80539;
	Mon,  7 Mar 2022 13:23:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5156AF8052E; Mon,  7 Mar 2022 13:23:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93764F80527
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 13:23:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93764F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="PasPracI"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646655785; x=1678191785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yhcV1xA/GCoaV0qxID8U5MSYsK0/vgW50L/YM9WNuBw=;
 b=PasPracIXRjGXAZzDY60Cp6rkHp0VUeJLtJrjxx8cceFppyDQAN8meui
 W+2xRSjPRzT+uh7XYePvvM+B11RgZkW8flh8Rv3sANGYxbFXzwmi0Ss3F
 efnNbcgYbbsvaMHOXayPNFqWHOziNmT3hHvQkH2+jWda05xqBLuzsN9wm
 H0YPJJecY4uQ71yoGTtHroluYOIEj7pnPvf6022Lf0FkwdWey3m8MggSs
 B+7mFxH5gaMi82iYcpWofSn/WeIiO4amuELVh5sSAeLWtJFFiSxnLzsyt
 hBAF5h+XpY700iynU3z8+wHeJ/vVc8sAUFgcW2EzScz+ZKcs4Xski+97F g==;
X-IronPort-AV: E=Sophos;i="5.90,162,1643698800"; d="scan'208";a="155487952"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 05:23:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 05:23:00 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 05:22:58 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 6/6] ARM: configs: at91: sama7_defconfig: add MCHP PDMC and
 DMIC drivers
Date: Mon, 7 Mar 2022 14:22:02 +0200
Message-ID: <20220307122202.2251639-7-codrin.ciubotariu@microchip.com>
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

Enable drivers needed for Microchip's PDMC and PDM microphones.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---

Changes in v2,v3:
 - none;

 arch/arm/configs/sama7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/sama7_defconfig b/arch/arm/configs/sama7_defconfig
index 0368068e04d9..bc29badab890 100644
--- a/arch/arm/configs/sama7_defconfig
+++ b/arch/arm/configs/sama7_defconfig
@@ -138,6 +138,8 @@ CONFIG_SND_SOC_MIKROE_PROTO=m
 CONFIG_SND_MCHP_SOC_I2S_MCC=y
 CONFIG_SND_MCHP_SOC_SPDIFTX=y
 CONFIG_SND_MCHP_SOC_SPDIFRX=y
+CONFIG_SND_MCHP_SOC_PDMC=y
+CONFIG_SND_SOC_DMIC=y
 CONFIG_SND_SOC_PCM5102A=y
 CONFIG_SND_SOC_SPDIF=y
 CONFIG_SND_SIMPLE_CARD=y
-- 
2.32.0

