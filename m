Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB804CF9A1
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:08:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59EA316E7;
	Mon,  7 Mar 2022 11:08:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59EA316E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646647731;
	bh=Kq5xDzu5rUqchBeOZqlyFeo3FlKSAv+x/053mDkH74c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lnRc0C7e2GURuXZY20S7gnRHV21TM9KqBMddxzo/myVq6MO1FMf9yGGLGRniTygCn
	 ogmoKfMFNVgFyOdqL3oECE/mqjyW5ueTRfxUyplgxMbZ/Pa1pK2BakFP5N1LJFgoHe
	 47MdJVEAv5HBnRI5As52quJXIVMiZrRr5UIQHBUA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D60A7F80535;
	Mon,  7 Mar 2022 11:06:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2133F8052E; Mon,  7 Mar 2022 11:06:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA459F80518
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:06:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA459F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="lkvynvs2"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1646647580; x=1678183580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kq5xDzu5rUqchBeOZqlyFeo3FlKSAv+x/053mDkH74c=;
 b=lkvynvs2LjTZb3Bno2I2Aia5HlphbC+0+8cmVO/HUjvRLkzpjvru4KEc
 exbRR4ctOTHM2u/U/2mc27HjUom3KJSrjL8aMnAc/1E2brAZ5WawpBqJ6
 Waa9wIGwZfsnILxg+RbrqhWFj8S8I5ZWvLEZKkfJLDtnm/dsVog1pm4kN
 Pe28SfK/hoysJTVUYvPW2aObAXPDyHrW0Nz6Six25cRWpkB+nHcxpAaUt
 KGiy14MxES7aMSSG1gIQVPdy55ZXscRmtcND4Q3xYiopSak9vCAZqm6D0
 vuEp/wvZJAu1pJQfWmTH3261L/nbInG3d9I0laO780FKIEO+AgQibwfF7 A==;
X-IronPort-AV: E=Sophos;i="5.90,161,1643698800"; d="scan'208";a="155475226"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Mar 2022 03:06:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 03:06:15 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Mon, 7 Mar 2022 03:06:12 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 6/6] ARM: configs: at91: sama7_defconfig: add MCHP PDMC and
 DMIC drivers
Date: Mon, 7 Mar 2022 12:04:28 +0200
Message-ID: <20220307100428.2227511-7-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
References: <20220307100428.2227511-1-codrin.ciubotariu@microchip.com>
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

Changes in v2:
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

