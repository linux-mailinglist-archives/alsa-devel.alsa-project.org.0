Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E5363F5B
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 12:11:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C805167B;
	Mon, 19 Apr 2021 12:10:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C805167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618827108;
	bh=bX0zzzkyQH2wy8+Ykr1+pSSHtldntT7EDhnfDiq46qI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rqwy0cyxZlpqVNERRsrnJPE1He5YooUtGEHV4C1cAOtk1brGWPmqAi1bFzSghTsPW
	 v8IqhLMe5Fj0S7E0KEikSKhhOqo9D5GZ9e4OqM2RHZpQhxuSWbPg+Q7EfwHUa93i7x
	 0kMA3C3cZj/y7JzS8nV8Pwt/iHfpnRq/yumUXFN0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F84F8014D;
	Mon, 19 Apr 2021 12:10:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F4BCF80227; Mon, 19 Apr 2021 12:10:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41608F800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 12:10:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41608F800C5
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5CD981A26EC;
 Mon, 19 Apr 2021 12:10:05 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9DDB91A26E7;
 Mon, 19 Apr 2021 12:10:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 8657A4031F;
 Mon, 19 Apr 2021 12:09:36 +0200 (CEST)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: ak4458: check reset control status
Date: Mon, 19 Apr 2021 17:54:32 +0800
Message-Id: <1618826072-29344-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

From: Viorel Suman <viorel.suman@nxp.com>

check the return value of ak4458_rstn_control.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
changes in v2:
- fix "use of undeclared identifier 'ret'" reported by kernel test robot

 sound/soc/codecs/ak4458.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 85a1d00894a9..3088128816bb 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -334,7 +334,7 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
 	int pcm_width = max(params_physical_width(params), ak4458->slot_width);
 	u8 format, dsdsel0, dsdsel1;
-	int nfs1, dsd_bclk;
+	int nfs1, dsd_bclk, ret;
 
 	nfs1 = params_rate(params);
 	ak4458->fs = nfs1;
@@ -419,8 +419,13 @@ static int ak4458_hw_params(struct snd_pcm_substream *substream,
 	snd_soc_component_update_bits(component, AK4458_00_CONTROL1,
 			    AK4458_DIF_MASK, format);
 
-	ak4458_rstn_control(component, 0);
-	ak4458_rstn_control(component, 1);
+	ret = ak4458_rstn_control(component, 0);
+	if (ret)
+		return ret;
+
+	ret = ak4458_rstn_control(component, 1);
+	if (ret)
+		return ret;
 
 	return 0;
 }
@@ -429,6 +434,7 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
 	struct ak4458_priv *ak4458 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
 	case SND_SOC_DAIFMT_CBS_CFS: /* Slave Mode */
@@ -461,8 +467,13 @@ static int ak4458_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 				      ak4458->fmt == SND_SOC_DAIFMT_PDM ?
 				      AK4458_DP_MASK : 0);
 
-	ak4458_rstn_control(component, 0);
-	ak4458_rstn_control(component, 1);
+	ret = ak4458_rstn_control(component, 0);
+	if (ret)
+		return ret;
+
+	ret = ak4458_rstn_control(component, 1);
+	if (ret)
+		return ret;
 
 	return 0;
 }
-- 
2.27.0

