Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B06551FFD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBFF51A42;
	Mon, 20 Jun 2022 17:11:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBFF51A42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655737950;
	bh=vBXhLwIdDmkmlEotp+WTmQZAfuKcIS8nyrQfd5QbNl8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aT1D+s8VcAmxaxM7GW4H3NZHP0BfhqtAzpF3U0HMeixCpyp01aVnzuCsxLyVvjnw6
	 F8Krp9qZ6aeoiC8wBekXF5IT5cWEXxxBv8eB7Do09rwSXelmFVbGkGV29nNUFHxzvf
	 uil/wN67/GUG5O/1tdgUciuz68ljcAkLoSiOb6G8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1D83F805B6;
	Mon, 20 Jun 2022 17:06:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1EF6F80568; Thu, 16 Jun 2022 16:34:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 052CDF80527
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 052CDF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Z1i3jajK"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC0DJZ015765;
 Thu, 16 Jun 2022 09:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=zIGuzu3fpAlnl5bd1coi2//Uoa/1tfCTfrXbMTi0sBM=;
 b=Z1i3jajKci9xFywajXXBk9qo22ZTSzpnkBcSrDcnD72CX1onHVMKSOi+HdY72NhSa8wU
 1gMX7ODBxycSfAv4HVFmGMrvHv6vPoZuCmGnZWcqgxxtMDcv6JLyQdq8k8noGQ8jMU3e
 bugomdFo8sUGYWBpf0pZuVX3x49bzMMoqyENedeBBRC41EnjmLeZLdnlvJijTKL5AV0m
 JqNERqHrvXJg+PpO6Nq5G+P8UHjJ+1kiQVWSUXpOC8DuPv1HN0Y5wHUNih78HMsOEuPv
 v503wyp0BaVnNiJBfc/SgFpCN9wjSn+SCUQzBQm9tQqAg3J6+4106VcXSuV5HSGEdCIW Zg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3gmqfq5w3h-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D6D56478;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 12/96] ASoC: hisilicon: Migrate to new style legacy DAI naming
 flag
Date: Thu, 16 Jun 2022 15:33:05 +0100
Message-ID: <20220616143429.1324494-13-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: v-wfvYZVs1lc1WGujZ5Yj3HTU-77SJDw
X-Proofpoint-GUID: v-wfvYZVs1lc1WGujZ5Yj3HTU-77SJDw
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Mon, 20 Jun 2022 17:06:45 +0200
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, airlied@linux.ie,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, patches@opensource.cirrus.com, lgirdwood@gmail.com,
 vkoul@kernel.org, jarkko.nikula@bitmer.com, daniel@ffwll.ch,
 shawnguo@kernel.org, daniel@zonque.org
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

Change the legacy DAI naming flag from opting in to the new scheme
(non_legacy_dai_naming), to opting out of it (legacy_dai_naming).
This driver appears to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/hisilicon/hi6210-i2s.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 689ae13f34f5b..27219a9e7d0d8 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -539,6 +539,7 @@ static const struct snd_soc_dai_driver hi6210_i2s_dai_init = {
 
 static const struct snd_soc_component_driver hi6210_i2s_i2s_comp = {
 	.name = "hi6210_i2s-i2s",
+	.legacy_dai_naming = 1,
 };
 
 static int hi6210_i2s_probe(struct platform_device *pdev)
-- 
2.30.2

