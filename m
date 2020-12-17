Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692132DCD6C
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 09:11:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030FD17A1;
	Thu, 17 Dec 2020 09:10:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030FD17A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608192695;
	bh=/+Qdpq/9NPnnxwU8Vjci8m532i0/O3y8VaYZAeWiZo8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PTnsHoy/loMQtIGdIpJXbEsNoTOuYemnNTuiIZyZNLb3WUTBIRkA+of4HbQzHEnxT
	 OV+jvjngcV4miu1yW5DBGReZffEYwu73eEtn0b+4qfwQEc1p+cDTH5n7nxmTpzcW9U
	 YhVQ0EZXJc9ag0RD9KbWpCRD9F2ULZ6FcOiJIOMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0E50F804B0;
	Thu, 17 Dec 2020 09:09:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 664B3F804BD; Thu, 17 Dec 2020 09:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDD5AF80259
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 09:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDD5AF80259
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="iAf4ofmh"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608192553; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=uALA5vt69EvBKnM4mrxYaYLyNN2UbFTgCbFexKaLycU=;
 b=iAf4ofmh43zXYdUw4lPxmdxu4YxxN0oIhaeaG0Ys0he+7V0iZYrvyrTpx0QODcpPvmHxshLv
 QiDa/D4FFsZD90RkNu0K9GEO/NolrTp6abD2pG2oPF69EIcJXmMtDmNDqGeosrDStnz5Mssm
 YvXhA/dBZ6LD3nGJT9tFukMF7ls=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fdb1220944e4d24478f55d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 08:09:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E3061C433C6; Thu, 17 Dec 2020 08:09:03 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 984B8C433ED;
 Thu, 17 Dec 2020 08:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 984B8C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=srivasam@codeaurora.org
From: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] ASoC: qcom: Add support for playback recover after
 resume
Date: Thu, 17 Dec 2020 13:38:34 +0530
Message-Id: <1608192514-29695-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
References: <1608192514-29695-1-git-send-email-srivasam@codeaurora.org>
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
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

To support playback continuation after hard suspend(bypass powerd)
and resume do regcache sync with component driver pm ops.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 sound/soc/qcom/lpass-platform.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 232deee..d1c2485 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -823,6 +823,39 @@ static void lpass_platform_pcm_free(struct snd_soc_component *component,
 	}
 }
 
+static int lpass_platform_pcmops_suspend(struct snd_soc_component *component)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map;
+	unsigned int dai_id = component->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
+
+	regcache_cache_only(map, true);
+	regcache_mark_dirty(map);
+
+	return 0;
+}
+
+static int lpass_platform_pcmops_resume(struct snd_soc_component *component)
+{
+	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
+	struct regmap *map;
+	unsigned int dai_id = component->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
+
+	regcache_cache_only(map, false);
+	return regcache_sync(map);
+}
+
+
 static const struct snd_soc_component_driver lpass_component_driver = {
 	.name		= DRV_NAME,
 	.open		= lpass_platform_pcmops_open,
@@ -835,6 +868,8 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 	.mmap		= lpass_platform_pcmops_mmap,
 	.pcm_construct	= lpass_platform_pcm_new,
 	.pcm_destruct	= lpass_platform_pcm_free,
+	.suspend		= lpass_platform_pcmops_suspend,
+	.resume			= lpass_platform_pcmops_resume,
 
 };
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

