Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E13953B7CD
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jun 2022 13:28:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 979271728;
	Thu,  2 Jun 2022 13:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 979271728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654169323;
	bh=x17wWK6lmGSGg+a3y01TgbzBx+tJpvXcQSrUDiQ4V5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ksFS4BMaQ9bT+z+wy/gcGfUBsyY6YqZGfj1lRQlxPP29OirFk2CYSwtecukoVfWUJ
	 BNbnBP+dv3DXvJFRf+UW/GvpJEdhniahMCwJcDI8IKCXSi0F5PB1CWJOT82wWvo3mK
	 YcUHMZuawZT1rbJISlubpURxcVBuhV5v8eEohVZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 958DAF804AB;
	Thu,  2 Jun 2022 13:27:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B84DEF80236; Thu,  2 Jun 2022 13:27:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43ABCF80236
 for <alsa-devel@alsa-project.org>; Thu,  2 Jun 2022 13:27:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43ABCF80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="ftP6cKbs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1654169235; x=1685705235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=8MU16Njd8BemfDVTLXmKbEJdGfUr5c2N70HY1VVgcto=;
 b=ftP6cKbs94SO3CWPLo9Ny8JRIpmlWG9aSyR7tDY6u2FAChgMYksPCKKe
 +apI0sjQ+mMczeROMiZrGRdhvq7OW9CmgXDKh+nFRp89iCL733xoJmnz5
 6FQ+O4J+qe19ZJ5j7ZFsXuzWBfPetumwpp8dyH/aWLqcM3nzFY9QVJP66 U=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 02 Jun 2022 04:27:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 04:27:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 04:27:10 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 2 Jun 2022 04:27:04 -0700
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@quicinc.com>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <quic_rohkumar@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
 <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: dt-bindings: lpass-cpu: Update external mclck0 name
Date: Thu, 2 Jun 2022 16:56:45 +0530
Message-ID: <1654169206-12255-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654169206-12255-1-git-send-email-quic_srivasam@quicinc.com>
References: <1654169206-12255-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
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

Update "audio_cc_ext_mclk0" name to "core_cc_ext_mclk0",
as MI2S mclk is being used is from lpass core cc.

Fixes: 98b7630a583f ("ASoC: dt-bindings: lpass-cpu: Update clocks and power domain names for sc7280 platform")
Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index e9a5330..8438ef77 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -195,7 +195,7 @@ allOf:
           oneOf:
             - items:   #for I2S
                 - const: aon_cc_audio_hm_h
-                - const: audio_cc_ext_mclk0
+                - const: core_cc_ext_mclk0
                 - const: core_cc_sysnoc_mport_core
                 - const: core_cc_ext_if0_ibit
                 - const: core_cc_ext_if1_ibit
-- 
2.7.4

