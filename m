Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C41A7522
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 09:46:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F56A168E;
	Tue, 14 Apr 2020 09:45:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F56A168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586850395;
	bh=AvN4FzExJd9zICp/aCH1rvNohw7IztugmyOMYdS60qI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=B1VLycDU+DuVicDE37QSuqoN/jZHjOAOhRj5sf2ZMYCalqSAnPzRCQ693SgWr8yED
	 cqp017bRBHsP079ZWwyAIW3MMuupGu0g0yQAgGDifKf8a2VlCJN16fdWDxJYDjDdKi
	 cl1/BkygfXjrJ1xRjwTAZbXmpDzhdl8+ULYVnYwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4A1EF802A0;
	Tue, 14 Apr 2020 09:42:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DF12F801F9; Sat, 11 Apr 2020 10:04:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 028BDF800CB
 for <alsa-devel@alsa-project.org>; Sat, 11 Apr 2020 10:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 028BDF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="bj3KoFog"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1586592248; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zdeX1LsnbO4SjlCpOn7ig/JLc8buLB24sK6pqyrCNGI=;
 b=bj3KoFog5EwmoOvT7vO0+lhG4mB48zjnE8/KUzBqSp5RvlWLS4zzjV6129BT/kPNJRNwzRZ1
 Ip82oYHp9kXipE0NAhPVOS/wFxdnMdnSPkH3mauiix+ZppiM9o+BMhycHMF8+BdCcaSStEI1
 l/zPPjTBv6+VHHT2MwJNxxpnRVQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9179f8.7f6a628acf48-smtp-out-n05;
 Sat, 11 Apr 2020 08:04:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9E770C43636; Sat, 11 Apr 2020 08:04:07 +0000 (UTC)
Received: from c-ajitp-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: ajitp)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CAA7C433F2;
 Sat, 11 Apr 2020 08:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5CAA7C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=ajitp@codeaurora.org
From: Ajit Pandey <ajitp@codeaurora.org>
To: alsa-devel@alsa-project.org, broonie@kernel.org,
 devicetree@vger.kernel.org, plai@codeaurora.org, bgoswami@codeaurora.org,
 srinivas.kandagatla@linaro.org
Subject: [PATCH 04/11] ASoC: qcom: lpass-cpu: Make "ahbix-clk" an optional
 clock.
Date: Sat, 11 Apr 2020 13:32:44 +0530
Message-Id: <1586592171-31644-5-git-send-email-ajitp@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
References: <1586592171-31644-1-git-send-email-ajitp@codeaurora.org>
X-Mailman-Approved-At: Tue, 14 Apr 2020 09:41:46 +0200
Cc: Ajit Pandey <ajitp@codeaurora.org>, linux-kernel@vger.kernel.org,
 tiwai@suse.com
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

AHB-I/X bus clocks inside LPASS coreis not a mandatory clocks for
newer lpass variants, hence make it an optional one.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 492f27b..f177932 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -504,26 +504,31 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	drvdata->ahbix_clk = devm_clk_get(&pdev->dev, "ahbix-clk");
+	drvdata->ahbix_clk = devm_clk_get_optional(&pdev->dev, "ahbix-clk");
 	if (IS_ERR(drvdata->ahbix_clk)) {
 		dev_err(&pdev->dev, "error getting ahbix-clk: %ld\n",
 			PTR_ERR(drvdata->ahbix_clk));
 		return PTR_ERR(drvdata->ahbix_clk);
 	}
 
-	ret = clk_set_rate(drvdata->ahbix_clk, LPASS_AHBIX_CLOCK_FREQUENCY);
-	if (ret) {
-		dev_err(&pdev->dev, "error setting rate on ahbix_clk: %d\n",
-			ret);
-		return ret;
-	}
-	dev_dbg(&pdev->dev, "set ahbix_clk rate to %lu\n",
-		clk_get_rate(drvdata->ahbix_clk));
+	if (drvdata->ahbix_clk != NULL) {
+		ret = clk_set_rate(drvdata->ahbix_clk,
+				   LPASS_AHBIX_CLOCK_FREQUENCY);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"error setting rate on ahbix_clk: %d\n", ret);
+			return ret;
+		}
 
-	ret = clk_prepare_enable(drvdata->ahbix_clk);
-	if (ret) {
-		dev_err(&pdev->dev, "error enabling ahbix_clk: %d\n", ret);
-		return ret;
+		dev_dbg(&pdev->dev, "set ahbix_clk rate to %lu\n",
+			clk_get_rate(drvdata->ahbix_clk));
+
+		ret = clk_prepare_enable(drvdata->ahbix_clk);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"error enabling ahbix_clk: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
-- 
1.9.1
