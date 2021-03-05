Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1461D32E299
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Mar 2021 07:56:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FDEC17A9;
	Fri,  5 Mar 2021 07:55:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FDEC17A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614927368;
	bh=fF1nozdViuj27h8Jb/mcM6WqZ88MukIJMXWbzqT8G9s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CRT/r7K+Ou9K2A7sPEbc0IFv7B4h5p7ytR/VKzjHp+59FPSDCazeaao3Imng/yQS9
	 tI6Ue3IAGU3AhpWxsY7nkGdWtV09E1zJJiQffvH2ygG/InB/bD4YvYBqNVbyjmVILo
	 m7VExWiSrTyd6q0rsyWGUUlUzTpVToTTxcSRyGTU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7D92F800F3;
	Fri,  5 Mar 2021 07:54:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1ACFAF8025E; Fri,  5 Mar 2021 07:54:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m42-2.mailgun.net (m42-2.mailgun.net [69.72.42.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27A84F80121
 for <alsa-devel@alsa-project.org>; Fri,  5 Mar 2021 07:54:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A84F80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="Z8G/QspZ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1614927264; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ldQPc9/+wzxWkV9+KehIYRq1/W79dUSqVgFXmJOPEdg=;
 b=Z8G/QspZ8F5LYL5wr1R0UEjup1qbkJw/F8R3+wTtU6any21R5f00Em2bTHIZHKw09r5Jq5zZ
 KrQI4uL8Qr2mqRuIAzcAApachsAsj1TkCSBC3zEbwWB4XIGKUMCp5gyDto7hEgFJrEKNFs2P
 y39Ml2FIfapeapbQR5OmUVYFhaA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 6041d59a64e0747df9ff4a23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Mar 2021 06:54:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4ADBDC433ED; Fri,  5 Mar 2021 06:54:17 +0000 (UTC)
Received: from codeaurora.org (unknown [202.46.22.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: b_lkasam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E75F6C433C6;
 Fri,  5 Mar 2021 06:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E75F6C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=lkasam@codeaurora.org
From: Laxminath Kasam <lkasam@codeaurora.org>
To: broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH V1] Add debug print in soc-dapm
Date: Fri,  5 Mar 2021 12:24:02 +0530
Message-Id: <1614927242-19251-1-git-send-email-lkasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Cc: Laxminath Kasam <lkasam@codeaurora.org>, alsa-devel@alsa-project.org,
 b_lkasam@codeaurora.org
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

Add debug print useful for issue analysis in soc-dapm.
This print for dapm widgets useful for debugging to find
widgets powering up and down.

Signed-off-by: Laxminath Kasam <lkasam@codeaurora.org>
---
 sound/soc/soc-dapm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b005f9e..09d35df 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1717,6 +1717,13 @@ static void dapm_seq_run(struct snd_soc_card *card,
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
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

