Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D88658E43
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Dec 2022 16:19:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 731409CD3;
	Thu, 29 Dec 2022 16:18:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 731409CD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672327185;
	bh=eT3ABVCFvGesWuCHYEt5BJlwWRBnBg0zulRiJXRDfXw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cKda9bjpPoCTRMdONUUhhAA8ttPauo/DsclGaWVxaqS5YybO7ck7uJ1i+0iyxZnTa
	 oiu9Q5T16xEmbIJj0KfhcK/v25OIF23gtf5oBaIa1tx2eDH+sKqukfr7st4Rbbt53Y
	 u6sWlX2hmiyRrT5bF0ffEc0o4VESKtb76GsXjmGw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FAF4F804D0;
	Thu, 29 Dec 2022 16:18:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28FDAF804E7; Thu, 29 Dec 2022 16:18:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de
 [85.215.255.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 977CCF8023B
 for <alsa-devel@alsa-project.org>; Thu, 29 Dec 2022 16:17:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977CCF8023B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=F+eYRHNU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672327077;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
 From:Subject:Sender;
 bh=o9yw6kwnyVHqftafsTZRSK4tSSkPBL8db2BOCD1EwNk=;
 b=F+eYRHNUH3aMOrCmUY+iyyqyw39IdWu3vV7TBGa1gKcA8oju/dl4M/JQe/+WCDO2vF
 tQbOoK3dpIu8Jc+fuvrOoujcRCyKFZwjAYGgb38phMO20rIYTx0ybF7F46A9Ot1rvTN9
 9D4RLvkXonYr8UsLxN/9tmhFoCxbb03NBXT2EDzBWasSeqgoJ7fP4BakGJRb5yeomxYl
 v1DW9CNRQSDsAf1qFK0P0dfxdzRwrTtn9hUejHgW6hP39fDHuEKh6DV9CiuFOqHkqTWZ
 nAe7PKuu8MY/Yo7PMLNEUsBP6KcfVSuSforI1Koh7syclJHmSiu8iK0Ij6M5U4FbE+Xw
 vhRQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweF+KLA=="
X-RZG-CLASS-ID: mo02
Received: from droid.. by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349yBTFHuXT4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 29 Dec 2022 16:17:56 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>
Subject: [PATCH 2/2] soc: qcom: apr: Make qcom,
 protection-domain optional again
Date: Thu, 29 Dec 2022 16:16:48 +0100
Message-Id: <20221229151648.19839-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229151648.19839-1-stephan@gerhold.net>
References: <20221229151648.19839-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@quicinc.com>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Rob Herring <robh+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

APR should not fail if the service device tree node does not have
the qcom,protection-domain property, since this functionality does
not exist on older platforms such as MSM8916 and MSM8996.

Ignore -EINVAL (returned when the property does not exist) to fix
a regression on 6.2-rc1 that prevents audio from working:

  qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
    Failed to read second value of qcom,protection-domain
  qcom,apr remoteproc0:smd-edge.apr_audio_svc.-1.-1:
    Failed to add apr 3 svc

Fixes: 6d7860f5750d ("soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/soc/qcom/apr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index cd44f17dad3d..d51abb462ae5 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -461,9 +461,10 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		goto out;
 	}
 
+	/* Protection domain is optional, it does not exist on older platforms */
 	ret = of_property_read_string_index(np, "qcom,protection-domain",
 					    1, &adev->service_path);
-	if (ret < 0) {
+	if (ret < 0 && ret != -EINVAL) {
 		dev_err(dev, "Failed to read second value of qcom,protection-domain\n");
 		goto out;
 	}
-- 
2.39.0

