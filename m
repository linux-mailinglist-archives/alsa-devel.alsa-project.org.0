Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9F358407C
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jul 2022 16:01:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF3CD1631;
	Thu, 28 Jul 2022 16:00:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF3CD1631
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659016882;
	bh=ey1YSDdNNktsNxlTF4Xjdylu/zm0+S1cEWD7dcOi3Uo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=olzne45cY5TKG7Hz3xvoz18XiCJcJ98k398i7dPtySRKp4ZdxqGh96rlD/Na8Qe9V
	 CrYTl7WQpxltrm1MvJpvIEWUBL7ZzzRCJ4pZrjd2KvxonmVUF0Fxy7LxtYag9DXAbA
	 4MNRpotKqs3RqpFwbwXyeQZMkX0U5aJ7gHpmxeUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ECBFF80508;
	Thu, 28 Jul 2022 16:00:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 965C4F800FA; Thu, 28 Jul 2022 16:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19320F800FA
 for <alsa-devel@alsa-project.org>; Thu, 28 Jul 2022 16:00:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19320F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="Aq5fuRvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1659016815; x=1690552815;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=apUfx5uwPW9Z/IJHLl9owKM3iyON8mPNng7D40fPRRE=;
 b=Aq5fuRvCp9YwKN2CBifPIHCwa5B884utzPQr563GHyVhmsLlfFHshy1e
 PHr0YDQD0Mpu4Ze6B9n269Bf8/OZ3pXfOcCs9B4ywUmTcav3QJ8vE6X2J
 1Qn04TG8/2dIPa5bFQbJzYNW2ktymhfn2/vtThuWez6C/s4yLpANnowsJ c=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 28 Jul 2022 07:00:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 07:00:09 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 07:00:08 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 28 Jul 2022 07:00:02 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2] ASoC: qcom: SC7280: Add support for external DMIC bias
 supply
Date: Thu, 28 Jul 2022 19:29:49 +0530
Message-ID: <1659016789-9933-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update SC7280 machine driver for enabling external dmic bias supply,
which is required for villager evt boards.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
Changes since v1:
	-- Replace dapm widget SND_SOC_DAPM_MIC with SND_SOC_DAPM_REGULATOR_SUPPLY.
 sound/soc/qcom/sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index da7469a..4a60f34 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -356,6 +356,7 @@ static const struct snd_soc_ops sc7280_ops = {
 static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("DMICVDD", 0, 0),
 };
 
 static int sc7280_snd_platform_probe(struct platform_device *pdev)
-- 
2.7.4

