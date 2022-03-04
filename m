Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D94CDC47
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 19:21:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA08E1F64;
	Fri,  4 Mar 2022 19:20:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA08E1F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646418087;
	bh=LnGVi4wQp+RSBULtW1beO+C3G4Ky2NJaGYf1CEN4/BU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ol77XVVMt3mZuzokSxKGEzBVVPgjJhVYYqj7XwweidMVc6pN1F6JVKAnKB7ByYjNl
	 WHaqjsXPhFY1iniEXi1niPpjeAvN+ZyKNhLTR4NPA7kieP22x29IG5at3Y8aJHuqqp
	 h6e3vb1piMelZ/XHD57DrFrZRgQ9hx/KwB2fcbqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6547AF80539;
	Fri,  4 Mar 2022 19:18:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4F948F80538; Fri,  4 Mar 2022 19:18:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6634F8052D
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 19:18:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6634F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="c1W25HQg"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646417920; x=1677953920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LnGVi4wQp+RSBULtW1beO+C3G4Ky2NJaGYf1CEN4/BU=;
 b=c1W25HQg13K26YDw26qEF6xlJmobasv+uNWLotQbqSiGHQLKnfhvmwYi
 iOpSEAn4AnYJHnTGmA3/jlt1IbwvmhtB/SFwawExJUpnM8veEGMRfi3ra
 bJYSEMkJKD6C9x5VkBCq1ajSChLv+DufFgPMOtcA+nuSgPuOb8tNyvsNl
 zIUh47TfbtEhUybFAYiWsRbDqP1XitW4V3eNzbNR27Ft1F0p77pm4OEVi
 Aiuscej4JAhjp2KxP5HorCJUpG88VyA/mz/nBTGdhgb2oDDMnGxxGQ1zb
 4fssFNj+h7iJqv6kxypYBeCI6wnzqj/PmihWRw5OhGZfgOqXK8A/nCq0W g==;
X-IronPort-AV: E=Sophos;i="5.90,155,1643698800"; d="scan'208";a="150898174"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Mar 2022 11:18:36 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 4 Mar 2022 11:18:35 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 4 Mar 2022 11:18:32 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 6/6] ARM: configs: at91: sama7_defconfig: add MCHP PDMC and
 DMIC drivers
Date: Fri, 4 Mar 2022 20:17:56 +0200
Message-ID: <20220304181756.1894561-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
References: <20220304181756.1894561-1-codrin.ciubotariu@microchip.com>
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

