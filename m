Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2645931C9
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 17:30:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CFF815C3;
	Mon, 15 Aug 2022 17:29:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CFF815C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660577405;
	bh=sWj6vdtv4YI/ajd6K1HFoA/CZ7Kfb2DC3R+VFNm8+1s=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eg03n3P91KeOIcYmk6X7amqfLUOMAjViottnRoxlmGfFUABLEdVNAZq46Qd33cVt5
	 lL+vHIS5Y2NRGUIXmhS/rlWeI4GnqpMf3A7MUlRXM03Tf5d2Q87McIgZf1JiOpIp4s
	 q9EwxLUNF8YY2woUeKCKFq0NvsqDtOV/r3O+piz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A38CF80082;
	Mon, 15 Aug 2022 17:29:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61B9EF8025A; Mon, 15 Aug 2022 17:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C59D3F80095
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 17:28:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C59D3F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Z935sQFy"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27FBN0T3023234;
 Mon, 15 Aug 2022 10:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=PFUH9P7TYQY6V5hI/Q7v0wHt4DryK2p1UkfQTaLLTa0=;
 b=Z935sQFymRb6MU2n+6Wp0RgjqZNbmmEW+PoQbNYHPicFpGgYrEnmG1EOLlI01HGCl8/I
 mbPQIvbB6neI+WZhxDObkZ3sUHYdyWA98ZiEu3oF2mD+TDxCFmVdhUQw/9D1mgc1TGRt
 ZF+zN7hZw1VXFlyxEw0dkhm2NmnOsFbU8aJo6DYsWeN7LaPAUEi/avTGJa/yDa7q4aCh
 N0i9ijXHAarm9/zQ3LJ1AfTBgLdaBhmes/tU5i2g84DONHK5ImbIV5RPxedI7dDsU5GD
 +qzioml3pY9NgFmH3ZbbZ5/oRYRhaHwndVGdNZXfQu748FUAcpJnVOQiqCmaTdYhKkFl 0w== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1tcm8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Aug 2022 10:28:53 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Mon, 15 Aug
 2022 10:28:51 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Mon, 15 Aug 2022 10:28:51 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2E567B06;
 Mon, 15 Aug 2022 15:28:51 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Clarify support for CSC3551 without
 _DSD Properties
Date: Mon, 15 Aug 2022 16:28:44 +0100
Message-ID: <20220815152844.462229-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tJG7ppFwiCmZOZ_8CJJrMW_PTNs0s499
X-Proofpoint-GUID: tJG7ppFwiCmZOZ_8CJJrMW_PTNs0s499
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

For devices which use HID CSC3551, correct ACPI _DSD properties are
required to be able support those systems.
Add error message to clarify this.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 129bffb431c2..b9d94f3a5b99 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1163,6 +1163,11 @@ static int cs35l41_no_acpi_dsd(struct cs35l41_hda *cs35l41, struct device *physd
 		hw_cfg->gpio1.func = CS35l41_VSPK_SWITCH;
 		hw_cfg->gpio1.valid = true;
 	} else {
+		/*
+		 * Note: CLSA010(0/1) are special cases which use a slightly different design.
+		 * All other HIDs e.g. CSC3551 require valid ACPI _DSD properties to be supported.
+		 */
+		dev_err(cs35l41->dev, "Error: ACPI _DSD Properties are missing for HID %s.", hid);
 		hw_cfg->valid = false;
 		hw_cfg->gpio1.valid = false;
 		hw_cfg->gpio2.valid = false;
-- 
2.34.1

