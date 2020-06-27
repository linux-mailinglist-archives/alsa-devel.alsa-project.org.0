Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A611620C1D7
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jun 2020 15:39:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AEA31679;
	Sat, 27 Jun 2020 15:38:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AEA31679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593265158;
	bh=p5ekzpzg3nHd9mf9w+CyUuHounLNBXCtxr4sK7EdDXQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YzZUi4cWEV+aR3WG+98DcD+A8EOoO2s8EgbBYwUSeGJTMFhEH1w4jwf47AqlcG8eu
	 Vt1pdNnq8hIXWycfu0Ej+fXhOVd1OjW+CnGKVzz5h8E4zYCnK3wIz0OgMevnpv9Mc2
	 +Cc7W+g6AmZmntyhahd7FLUgMTBxrH+Ym0elKpVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D46AF8023E;
	Sat, 27 Jun 2020 15:37:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E80B1F80234; Sat, 27 Jun 2020 15:37:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EB58F80148
 for <alsa-devel@alsa-project.org>; Sat, 27 Jun 2020 15:37:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EB58F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
 header.i=@mg.codeaurora.org header.b="vzeBmY1H"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1593265045; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ni3BJ474kch8TFSTELYpL+py28qnDTI1OMQGcY7Okg4=;
 b=vzeBmY1HjI1dgVoJXLP0+bEdBrjcKCgppZESECKNJ3Ko7DYI00T/UmR17WAFiPaAhTIRWrO7
 PGtQIythSG97wZ4nJg45ncwJeDyKKXU9ZIkH6rp2dWPgabes7aG+tyrvpTELRfiPpFOtoPdK
 +ZDhpqpP7aXIDe6B0Yyo9JePu/s=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZmE2ZSIsICJhbHNhLWRldmVsQGFsc2EtcHJvamVjdC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-east-1.postgun.com with SMTP id
 5ef74b92bfb34e631c825284 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 27 Jun 2020 13:37:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D7B9FC433CB; Sat, 27 Jun 2020 13:37:21 +0000 (UTC)
Received: from rohkumar-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: rohitkr)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 270FBC433C6;
 Sat, 27 Jun 2020 13:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 270FBC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=rohitkr@codeaurora.org
From: Rohit kumar <rohitkr@codeaurora.org>
To: plai@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] asoc: Update supported rate and format for dummy dai
Date: Sat, 27 Jun 2020 19:07:10 +0530
Message-Id: <1593265030-1451-1-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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

Add support for 384KHz sample rate and S24_3LE
bitwidth for dummy dai.

Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
---
 sound/soc/soc-utils.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-utils.c b/sound/soc/soc-utils.c
index 922eac9..364b248 100644
--- a/sound/soc/soc-utils.c
+++ b/sound/soc/soc-utils.c
@@ -86,12 +86,13 @@ static const struct snd_soc_component_driver dummy_codec = {
 	.non_legacy_dai_naming	= 1,
 };
 
-#define STUB_RATES	SNDRV_PCM_RATE_8000_192000
+#define STUB_RATES	SNDRV_PCM_RATE_8000_384000
 #define STUB_FORMATS	(SNDRV_PCM_FMTBIT_S8 | \
 			SNDRV_PCM_FMTBIT_U8 | \
 			SNDRV_PCM_FMTBIT_S16_LE | \
 			SNDRV_PCM_FMTBIT_U16_LE | \
 			SNDRV_PCM_FMTBIT_S24_LE | \
+			SNDRV_PCM_FMTBIT_S24_3LE | \
 			SNDRV_PCM_FMTBIT_U24_LE | \
 			SNDRV_PCM_FMTBIT_S32_LE | \
 			SNDRV_PCM_FMTBIT_U32_LE | \
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

