Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538029221
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 09:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EDCD16A8;
	Fri, 24 May 2019 09:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EDCD16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558684582;
	bh=KV3SwI/XcOHyc1P5CeLn6u6eVqYIZ5oqHAKZZPROZuA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DwXNtLqwhofQWL9Ovi/eN7HsOyULeEgHu0grmw1ZIQ5MBcfDXSQKBHl1v1FKWF4d2
	 vC3mX3Ps0C+ipVfAWXzRDpI2i/ONDrNZt3yFG4gdQz4gRryQZXvhSv8rNEnvaVMxXb
	 bRiGoobq1NrfrfyukGDFyCDi5f2EnKMNvf9ZFE4A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0980F89630;
	Fri, 24 May 2019 09:54:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CBB8F89630; Fri, 24 May 2019 09:54:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E30AF89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 09:54:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E30AF89625
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="LZcgOiK9"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="LZcgOiK9"
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 8FE086087D; Fri, 24 May 2019 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558684469;
 bh=2RSSfdstUJ3AwUHcDKMGkqkK7AkhatckMh9jeufxkRU=;
 h=From:To:Cc:Subject:Date:From;
 b=LZcgOiK90T5oLjs+IXmW53CJ/NMt/NwKiuux1Y04x5b/v2qnzEaySkv5Qj1rwxkOr
 W842DT5EKjm4oa6PRsoRu3anxoRdLEEXST2g209Bx3LybF8f6LlR3gU8IDYgkUl3fE
 1VvtQB0ifF1j1cWPmJvjckI4ueKLATvK3DESbaoA=
Received: from localhost (i-global254.qualcomm.com [199.106.103.254])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: bgoswami@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 19CB3607B9;
 Fri, 24 May 2019 07:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1558684469;
 bh=2RSSfdstUJ3AwUHcDKMGkqkK7AkhatckMh9jeufxkRU=;
 h=From:To:Cc:Subject:Date:From;
 b=LZcgOiK90T5oLjs+IXmW53CJ/NMt/NwKiuux1Y04x5b/v2qnzEaySkv5Qj1rwxkOr
 W842DT5EKjm4oa6PRsoRu3anxoRdLEEXST2g209Bx3LybF8f6LlR3gU8IDYgkUl3fE
 1VvtQB0ifF1j1cWPmJvjckI4ueKLATvK3DESbaoA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 19CB3607B9
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=bgoswami@codeaurora.org
From: bgoswami@codeaurora.org
To: broonie@kernel.org
Date: Fri, 24 May 2019 00:54:27 -0700
Message-Id: <1558684467-11333-1-git-send-email-bgoswami@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 srinivas.kandagatla@linaro.org, plai@codeaurora.org
Subject: [alsa-devel] [PATCH] ASoC: Add a debug log to track DAPM widget
	power up/down
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Banajit Goswami <bgoswami@codeaurora.org>

Add a debug log to help track widgets being powered-up and powered-down
by DAPM.

Signed-off-by: Banajit Goswami <bgoswami@codeaurora.org>
---
 sound/soc/soc-dapm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 29cdfbf4c888..9bab90410de5 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1665,6 +1665,13 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			break;
 		}
 
+		/*
+		 * Add this debug log to keep track of widgets being
+		 * powered-up and powered-down.
+		 */
+		dev_dbg(w->dapm->dev, "dapm: powering %s widget %s\n",
+			power_up ? "up" : "down", w->name);
+
 		if (ret < 0)
 			dev_err(w->dapm->dev,
 				"ASoC: Failed to apply widget power: %d\n", ret);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
