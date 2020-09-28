Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3E427AB52
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 11:55:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4EE0B1EF8;
	Mon, 28 Sep 2020 11:55:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4EE0B1EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601286950;
	bh=cFW+4K5dLqTyM9tNHDFRZUAzZB1VnpkTe7WMc2D/m1Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FhBNpJhWZnoYDQuaoUOOzGWHUZDtgN0V+M3QWCQi/lW705y92EbsrlJu/3787HzsN
	 2vNhlWPWG74+GF+MJbEFwvAqH57hanJp2CSOraVgnDCKsx/06+otOeEgCpVqNtEayC
	 CVlO2DXxrr8OT6IL/wUm56CKPvMkcBCVHAUFNEjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 655FBF8023F;
	Mon, 28 Sep 2020 11:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C774F8023F; Mon, 28 Sep 2020 11:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49074F80115
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 11:53:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49074F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="EXbuDKoR"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601286835; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=RqfrRxKpkrtVQBtgn+L05T+7SLq89CY3P+E0L2BzK7A=;
 b=EXbuDKoRYS+5D/RRqVbw4yL1lTFqvYIBk7XE/icocoEflgSv0BUrl4SdneuiF9YvDOt7nyOI
 FdfnEBRmdmCBJDu3egSK2jaxrtspnXnXLBMx4RY96QveTTZgEI69IltD8yqzPQUWFmDLHt9w
 1sY2lbdSYLyHgUpdaLXP+Alxf9c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f71b2b2a965393f18aff2c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 09:53:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C5843C433CA; Mon, 28 Sep 2020 09:53:53 +0000 (UTC)
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: srivasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A6F73C43382;
 Mon, 28 Sep 2020 09:53:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6F73C43382
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
Subject: [PATCH v7 1/6] ASoC: Add sc7180-lpass binding header hdmi define
Date: Mon, 28 Sep 2020 15:23:26 +0530
Message-Id: <1601286811-25962-2-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
References: <1601286811-25962-1-git-send-email-srivasam@codeaurora.org>
Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
 Srinivasa Rao <srivasam@codeaurora.org>
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

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Add header defining hdmi dai-id for SC7180 lpass soc
in dt bindings.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 include/dt-bindings/sound/sc7180-lpass.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/sound/sc7180-lpass.h b/include/dt-bindings/sound/sc7180-lpass.h
index 7d988f6..56ecaaf 100644
--- a/include/dt-bindings/sound/sc7180-lpass.h
+++ b/include/dt-bindings/sound/sc7180-lpass.h
@@ -4,6 +4,7 @@
 
 #define MI2S_PRIMARY	0
 #define MI2S_SECONDARY	1
+#define LPASS_DP_RX	2
 
 #define LPASS_MCLK0	0
 
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

