Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AACEB874CC4
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 11:55:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6EBA6846;
	Thu,  7 Mar 2024 11:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6EBA6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709808917;
	bh=wInu/EODGuk8xeB66BsBeqyzmB26nqNNQ26oD0r3iN8=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jRiqeNiYwyUDR8r+Mu0cbi4zKV3NqLwubjJt8+LzdQEtM0hq05EHgKUJQSc9/4F7s
	 WQ12Icu548swaWHARhXZuXlbbUe9kgzYwJfLET9vfUqjKNUChqXAA/bsaF7IglkFYj
	 uJtx/vl2TOziqE82EgfVl10tnsvjx6bDNvDc5jy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8FBFF80580; Thu,  7 Mar 2024 11:54:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6E3CF805A0;
	Thu,  7 Mar 2024 11:54:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DDD0F8024E; Thu,  7 Mar 2024 11:54:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DA52F80087
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 11:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DA52F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k2ToVRtN
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4276U3No025228;
	Thu, 7 Mar 2024 04:53:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=3
	7+wHMDBsacM91GxnPaOu65ZAzpZ3qOzCgwvREEJ1O8=; b=k2ToVRtNuZBkXzhmn
	itygr2QmDRrQmHu6B8NNabyD1FTNUKVG6nB2CXDUMUQ5bwfC5wVxz1VwlpAEVb0Z
	IWQx0tLB91hCWiKjv4m/zQ/eSpPBPJ2hN0pRnfNt2aSNJAwCPntu3I/SYCqFyTzp
	zj3KqurVeDYimYnvZ7eE6v2/RFloP15XbbNI09w2MXMlpfCGiloZguw3rFsnISZ1
	1XMfemtkE6bplC8eCtBajakGiXoawK7M6C58/3h9k6TwJhLiwIn6Ga2ue3FeokD2
	8HummvLZBKIAXnrf/dRiitlfT9GwBBoT0zl3PFBp5nqg84MB3j3XXZfCUOB3MNx5
	T7odQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wpn931gsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Mar 2024 04:53:55 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 7 Mar 2024
 10:53:53 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.4 via Frontend Transport; Thu, 7 Mar 2024 10:53:53 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 95E4382024B;
	Thu,  7 Mar 2024 10:53:53 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH] firmware: cirrus: cs_dsp: Initialize debugfs_root to invalid
Date: Thu, 7 Mar 2024 10:53:53 +0000
Message-ID: <20240307105353.40067-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IHeQw5BgtaqdO9UauUPo3yllBRgkwiZo
X-Proofpoint-ORIG-GUID: IHeQw5BgtaqdO9UauUPo3yllBRgkwiZo
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: UNL26PHJVQP4WC2QPTDOIQY74HK2PRE3
X-Message-ID-Hash: UNL26PHJVQP4WC2QPTDOIQY74HK2PRE3
X-MailFrom: prvs=07964fdf23=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNL26PHJVQP4WC2QPTDOIQY74HK2PRE3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initialize debugfs_root to -ENODEV so that if the client never sets a
valid debugfs root the debugfs files will not be created.

A NULL pointer passed to any of the debugfs_create_*() functions means
"create in the root of debugfs". It doesn't mean "ignore".

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 79d4254d1f9b..9f3d665cfdcf 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -522,7 +522,7 @@ void cs_dsp_cleanup_debugfs(struct cs_dsp *dsp)
 {
 	cs_dsp_debugfs_clear(dsp);
 	debugfs_remove_recursive(dsp->debugfs_root);
-	dsp->debugfs_root = NULL;
+	dsp->debugfs_root = ERR_PTR(-ENODEV);
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_cleanup_debugfs, FW_CS_DSP);
 #else
@@ -2246,6 +2246,11 @@ static int cs_dsp_common_init(struct cs_dsp *dsp)
 
 	mutex_init(&dsp->pwr_lock);
 
+#ifdef CONFIG_DEBUG_FS
+	/* Ensure this is invalid if client never provides a debugfs root */
+	dsp->debugfs_root = ERR_PTR(-ENODEV);
+#endif
+
 	return 0;
 }
 
-- 
2.30.2

