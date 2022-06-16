Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FC5552015
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 17:13:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B7811B53;
	Mon, 20 Jun 2022 17:13:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B7811B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655738030;
	bh=cMX8/36gQKsevsLMjzf8uyxJAn48hFfMFuteNtj6WIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SRbhdimWRICKChauaSE66yEgwoGaCmQCgR39KfgvU7GhSkFvARHxSO0T7SynLtZks
	 fATwS/2ROcTjT9wN7IwKgZnHjuNDBtirlbVneKl5NHkFzkrl6wDYbe198O6jpQl3Cr
	 89Wkkd+FJoTWwQB3R+7MpPWdvzyOWLNUcblxNNLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA351F805DA;
	Mon, 20 Jun 2022 17:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2A3EF805C4; Thu, 16 Jun 2022 16:34:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F38D6F8052D
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 16:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F38D6F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="SHgtCg4o"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07C9027888;
 Thu, 16 Jun 2022 09:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=8CQSKjmzsDlZ0wmGn5pCtMbuJN3c/eN6aYD6PAfwFwE=;
 b=SHgtCg4oeqAkoaOR++2dDwvRLTuDTz8UIaKOa7WN8w7cBZostOUJNnruFpEhYdjaic1k
 +7iOA34gBti/GPMCE5NnzcqZ+mGh9OmTFS0wIEmBFDjbN38LMS00Vzj+DNA0KIGpYmAM
 UKAbye1BmrNIvXn8l46G+1U3V+fML2A3eF0Gd21QDiRls9m8fO59DhGbMhgBpJ4Zrv73
 xcwFtc/T2bpP1KcckHUX5egskR/T7o5D9dUkru1ZUfEKbaYN5cGghRG+2Msny/4DJEAd
 UeUOB83yF5ZJMs0hNA3JPqY9GKZ/OcaSDIrMzhmYL7Olh1AKSRxrCJf0shzrgDPldh0A Dw== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-6
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:31 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id EBC7611D3;
 Thu, 16 Jun 2022 14:34:30 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 13/96] ASoC: xilinx: Migrate to new style legacy DAI naming
 flag
Date: Thu, 16 Jun 2022 15:33:06 +0100
Message-ID: <20220616143429.1324494-14-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
References: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: wzCxxBJRMOWUMt5liZTazDE8EHvkfRl4
X-Proofpoint-ORIG-GUID: wzCxxBJRMOWUMt5liZTazDE8EHvkfRl4
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
These drivers appear to be on the CPU side of the DAI link and
currently uses the legacy naming, so add the new flag.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/xilinx/xlnx_formatter_pcm.c | 16 ++++++++--------
 sound/soc/xilinx/xlnx_i2s.c           |  1 +
 sound/soc/xilinx/xlnx_spdif.c         |  1 +
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 5c4158069a5a8..f5ac0aa312d6e 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -575,14 +575,14 @@ static int xlnx_formatter_pcm_new(struct snd_soc_component *component,
 }
 
 static const struct snd_soc_component_driver xlnx_asoc_component = {
-	.name		= DRV_NAME,
-	.set_sysclk	= xlnx_formatter_set_sysclk,
-	.open		= xlnx_formatter_pcm_open,
-	.close		= xlnx_formatter_pcm_close,
-	.hw_params	= xlnx_formatter_pcm_hw_params,
-	.trigger	= xlnx_formatter_pcm_trigger,
-	.pointer	= xlnx_formatter_pcm_pointer,
-	.pcm_construct	= xlnx_formatter_pcm_new,
+	.name			= DRV_NAME,
+	.set_sysclk		= xlnx_formatter_set_sysclk,
+	.open			= xlnx_formatter_pcm_open,
+	.close			= xlnx_formatter_pcm_close,
+	.hw_params		= xlnx_formatter_pcm_hw_params,
+	.trigger		= xlnx_formatter_pcm_trigger,
+	.pointer		= xlnx_formatter_pcm_pointer,
+	.pcm_construct		= xlnx_formatter_pcm_new,
 };
 
 static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index 4cc6ee7c81a32..9de92d35e30ee 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -158,6 +158,7 @@ static const struct snd_soc_dai_ops xlnx_i2s_dai_ops = {
 
 static const struct snd_soc_component_driver xlnx_i2s_component = {
 	.name = DRV_NAME,
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_i2s_of_match[] = {
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index cba0e868a7d77..7342048e98751 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -226,6 +226,7 @@ static struct snd_soc_dai_driver xlnx_spdif_rx_dai = {
 
 static const struct snd_soc_component_driver xlnx_spdif_component = {
 	.name = "xlnx-spdif",
+	.legacy_dai_naming = 1,
 };
 
 static const struct of_device_id xlnx_spdif_of_match[] = {
-- 
2.30.2

