Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E5B4D9E0A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 15:47:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2580E1898;
	Tue, 15 Mar 2022 15:46:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2580E1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647355638;
	bh=37/TTzgaQWjB111wQVxnJr0STpnP2zvBJtzMu+qR5BE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iCJS6NHbk6XN+5HJFjIcWmReQCaz2vAmDlV2MHpWu21TMpBevMX2FjcY3WAqH5NNR
	 0o1p6H3FIPHSRdmVxwIABUenPUryjYrGvlVlTV/o7ivtIsZ0RdA+SNgeb7bs1DiZr9
	 VQNB4/YtlMjkCQltcwlfpF5wA5k6vSM6dBy7m9/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85370F801F7;
	Tue, 15 Mar 2022 15:46:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C99E5F80162; Tue, 15 Mar 2022 15:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8045F80128
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 15:46:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8045F80128
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="R+IehLNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1647355565; x=1678891565;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=79o5gBeuclgkLLR0bESNlJlpxKJpRWFQRiAB8i6yArY=;
 b=R+IehLNWqFqQFlMYyHypcjV0qfCwACTXd655QgS7B6zccbnSNsFYkF4M
 RRDbrFk3pJDXFr/FxvOlkzwdMMdTZzKsjOoxPKjEFEHL1DvPRyhxT2yu5
 JwvOpTVH32KdPO2YAANXqR2xW4l66V6NZwqrhN0sZgekQ/dw7zNUgAPMr A=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Mar 2022 07:46:01 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 07:46:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Tue, 15 Mar 2022 07:45:53 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 15 Mar 2022 07:45:47 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH] ASoC: codecs: Fix misplaced lpass_macro_pds_exit call
Date: Tue, 15 Mar 2022 20:15:31 +0530
Message-ID: <1647355531-4150-1-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Update power domains exit function calling from runtime resume
to remove function which was wrongly placed and causing crash in
device suspend and resume.

Fixes: 9e3d83c52844 ("ASoC: codecs: Add power domains support in digital macro codecs")
Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 4 ++--
 sound/soc/codecs/lpass-va-macro.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index b492d598..714a411 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -1920,6 +1920,8 @@ static int tx_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(tx->npl);
 	clk_disable_unprepare(tx->fsgen);
 
+	lpass_macro_pds_exit(tx->pds);
+
 	return 0;
 }
 
@@ -1964,8 +1966,6 @@ static int __maybe_unused tx_macro_runtime_resume(struct device *dev)
 	regcache_sync(tx->regmap);
 	tx->reset_swr = true;
 
-	lpass_macro_pds_exit(tx->pds);
-
 	return 0;
 err_fsgen:
 	clk_disable_unprepare(tx->npl);
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 300f4f6..f3cb596 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1503,6 +1503,8 @@ static int va_macro_remove(struct platform_device *pdev)
 	clk_disable_unprepare(va->dcodec);
 	clk_disable_unprepare(va->macro);
 
+	lpass_macro_pds_exit(va->pds);
+
 	return 0;
 }
 
@@ -1532,8 +1534,6 @@ static int __maybe_unused va_macro_runtime_resume(struct device *dev)
 	regcache_cache_only(va->regmap, false);
 	regcache_sync(va->regmap);
 
-	lpass_macro_pds_exit(va->pds);
-
 	return 0;
 }
 
-- 
2.7.4

