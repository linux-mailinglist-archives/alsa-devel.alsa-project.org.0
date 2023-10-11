Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF197C5943
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Oct 2023 18:35:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B4A1709;
	Wed, 11 Oct 2023 18:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B4A1709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697042111;
	bh=0ukNua8ATcr87S7Mj/tfUq8qS5fWkkUOik0pOHeRlEQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BBzbo8kKSRllMlv5PuKtZ0zs2YfBLQi5yCqpxNFAausGry4AfodL3qyP3ienrlfS8
	 gPp73EZeEPKD0WCAxypSctvZZ25i8PJPYudxMS+YdDlNbP0QSX/MJWLtCcuSiWfw5t
	 r4pcEgF+CiQgP+XlsBqAssXppHOjbRZJqoWj7tIs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CFC7F80552; Wed, 11 Oct 2023 18:34:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C33E4F80166;
	Wed, 11 Oct 2023 18:34:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12C47F802BE; Wed, 11 Oct 2023 18:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0B35F80166
	for <alsa-devel@alsa-project.org>; Wed, 11 Oct 2023 18:34:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B35F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=izsJ6koh
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39B69HGL028515;
	Wed, 11 Oct 2023 11:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=b
	77U65NzPhkgOKHWlwkTamYPj/TOXrDCPIuZPvkXAr8=; b=izsJ6koh2FMzwGjfe
	N22ZfK1++M6CsJuWJk2wX1XK066MkOCCZzBpTOo235TU6a81Ux9pPlN4z19jAIq1
	6BwshNm6vPyqjXk5Isd2LASyuGmPsOBRDpRrKAJHluQi6VZDyyc6n3Mm6dAU9cKy
	JbhaWtZRSBuiSa0UU43B9a984OP0cnzn52blgigBe/iqk6gOYa8aFzfQvQyXGdrs
	CgjdEjGVZMCOz7K8NHUGwbJ0814cys6I0sEXapd9DX3vUatk2M1u0biHjKuNolal
	2x2o+CRzYgF83g2N6vlALp1n6VcVB7yHugaD87I5WwB+4RRn29CfPBF4IlDk7lMX
	7Zayw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tnp64gvmh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 11:34:00 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 11 Oct
 2023 17:33:58 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 11 Oct 2023 17:33:58 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.230])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id ED81B11AA;
	Wed, 11 Oct 2023 16:33:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Enable low-power hibernation mode on i2c
Date: Wed, 11 Oct 2023 17:33:55 +0100
Message-ID: <20231011163355.18183-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QG4T2Kyo7OWCR0NkwwwzoTUhlAOXlLTw
X-Proofpoint-ORIG-GUID: QG4T2Kyo7OWCR0NkwwwzoTUhlAOXlLTw
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D6GS2C7QAJ4UIZ4QP2O6IMJTHIDDGXWQ
X-Message-ID-Hash: D6GS2C7QAJ4UIZ4QP2O6IMJTHIDDGXWQ
X-MailFrom: prvs=56482167b5=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6GS2C7QAJ4UIZ4QP2O6IMJTHIDDGXWQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

This can now be re-enabled as the sequence to reliably wake the device
has been implemented in the shared ASoC code.

This has a functional dependency on commit 3df761bdbc8b
("ASoC: cs35l56: Wake transactions need to be issued twice")

To protect against this, enabling hibernation is conditional on
CS35L56_WAKE_HOLD_TIME_US being defined, which indicates that the new
hibernation sequences are available.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda_i2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 757a4d193e0f..a9ef6d86de83 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -21,6 +21,10 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 		return -ENOMEM;
 
 	cs35l56->base.dev = &clt->dev;
+
+#ifdef CS35L56_WAKE_HOLD_TIME_US
+	cs35l56->base.can_hibernate = true;
+#endif
 	cs35l56->base.regmap = devm_regmap_init_i2c(clt, &cs35l56_regmap_i2c);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
-- 
2.30.2

