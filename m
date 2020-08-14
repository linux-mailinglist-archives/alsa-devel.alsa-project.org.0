Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B03424488F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Aug 2020 13:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D55FB84B;
	Fri, 14 Aug 2020 13:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D55FB84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597402853;
	bh=mHpNMqppHyFpeMHAvQQqJnz0UeYFGMTSIGafk1qJH4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HCKvKDQx+vnEaBqQZS83qFy/Ot5+n6hBG4M20X8wr9eXVJ+sgP5WvrZ4rQEa3H8Wf
	 SLzfv4fF3fSt7VHN5G9FAZzZqxnraox9pRAp/UK90xR5jfqyN4s96kZ1LyRifw1PZ4
	 hKaOsG26Qh8XqcjZ//BHu6C8VGAbA/sEwejZR4Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C62F80331;
	Fri, 14 Aug 2020 12:55:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E968F80328; Fri, 14 Aug 2020 12:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5CA95F80316
 for <alsa-devel@alsa-project.org>; Fri, 14 Aug 2020 12:55:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CA95F80316
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Q207Q9Vw"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597402504; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=S7zheq1n7EI3udkRcEaoipzr8x9FoEETQZ65DvRKyzM=;
 b=Q207Q9VwSdRQTpeiu7HpQU47xKSKzeYJQsO92Pi5zSWqBiug7tb6WNcjdu3uPA3Rj+gBjH2P
 AFxbvCN4w0XJAJohDo/xLU2YhhjUFn5yc3oM1yxqtNNJurfasRH9GpXF35wM70BPeJs+9lNM
 GqX0ypBPx0TRrKEFJBvXM9M+HFQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-east-1.postgun.com with SMTP id
 5f366d758567201751e7824c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 14 Aug 2020 10:54:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E3C0C433C6; Fri, 14 Aug 2020 10:54:44 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AFF40C433A0;
 Fri, 14 Aug 2020 10:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AFF40C433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
 bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/12] ASoC: qcom: lpass-cpu: Use platform_get_resource
Date: Fri, 14 Aug 2020 16:23:06 +0530
Message-Id: <1597402388-14112-11-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
References: <1597402388-14112-1-git-send-email-rohitkr@codeaurora.org>
Cc: Rohit kumar <rohitkr@codeaurora.org>
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

platform_get_resource_byname() is used when there
is list of reg entries. As lpass-cpu node has only
one reg entry, use platform_get_resource() instead.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 5d84f63..1ee6d8b 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -575,7 +575,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	of_lpass_cpu_parse_dai_data(dev, drvdata);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-lpaif");
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	drvdata->lpaif = devm_ioremap_resource(dev, res);
 	if (IS_ERR((void const __force *)drvdata->lpaif)) {
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

