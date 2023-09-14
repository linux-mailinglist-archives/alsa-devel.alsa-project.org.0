Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 567317A038B
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 14:15:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 765BE93A;
	Thu, 14 Sep 2023 14:15:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 765BE93A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694693750;
	bh=ZFOKdNng6V1rR3eePumYKHOJSac5yS+KW5d3yhzLeRc=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t6EqRagKubi0gO2FZb9k81j94/dd5oHuUwWvxblRx2yYNBmsFDgKx2RCcS1kKbkel
	 UC60yeCc7/RO++iYr47ViJSbXcQdbHF2ai+oX94F+oAFKgW3OmNJcsggS/hduGqkrp
	 4PMBm+eaXDTd9fcg5kUtvZcbrS3k6dTHx7zEB0xM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CAB49F80549; Thu, 14 Sep 2023 14:14:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F0733F80246;
	Thu, 14 Sep 2023 14:14:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0B98F8047D; Thu, 14 Sep 2023 14:12:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE653F80425
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 14:11:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE653F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DRGqFmbl
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38E9lh9Z015602;
	Thu, 14 Sep 2023 07:11:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=A
	nv7LULgGpfntaEAW5v8GiBoJeIf6esI1Pwibsff3+0=; b=DRGqFmblwSlQIp2bK
	+nwh5CQNs5cRfK1zpRlx9k6MbvTLR+lnEFtkg/LiAF+5HH0WEPfMHZJpQWZlK0Cq
	bS/h35Q+Kk8i46qY91NriQj2UFfCwbbjGHbY19NXTan50jbZwevjKK5ValCGQi+G
	4TGePr64qQLA/fcPSVMNx3EzMLG7KYGVv4Q1HOI2J1i9hS3GC8uDfz7DmP31ERPc
	1Xo8vbt+QRHcSrj7L52JkpT7DsiD6zLy0zhkHyMUVIkEFI04v9hfsoom4h5RFpm1
	5ClpD0ejGvEkAUrr6V1mMTTlgMESXxy9KBOvo3Wb8FXcyHXmkQjTdKrJAS5WsfCh
	X+TiA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sj1sm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 07:11:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 13:11:25 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 14 Sep 2023 13:11:25 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C4DAB3563;
	Thu, 14 Sep 2023 12:11:24 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Fix missing RESET GPIO if _SUB is missing
Date: Thu, 14 Sep 2023 13:11:20 +0100
Message-ID: <20230914121120.6201-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: cZVWMLgfZc3ILgca3yz8QMRYONwXQDUB
X-Proofpoint-ORIG-GUID: cZVWMLgfZc3ILgca3yz8QMRYONwXQDUB
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GMQ43OUQEE55XWIAIBNTJHNX5IF5ECKJ
X-Message-ID-Hash: GMQ43OUQEE55XWIAIBNTJHNX5IF5ECKJ
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMQ43OUQEE55XWIAIBNTJHNX5IF5ECKJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In cs35l56_hda_read_acpi() do not return if ACPI _SUB is missing.

A missing _SUB means that the driver cannot load a system-specific
firmware, because the firmware is identified by the _SUB. But it can
fallback to a generic firmware. Unfortunately this was being handled
by immediately returning 0, which would skip the remaining ACPI
configuration in cs35l56_hda_read_acpi() and so it would not get the
RESET GPIO.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 9e4976bdb5e0..a9844336bdc9 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -864,15 +864,11 @@ static int cs35l56_hda_read_acpi(struct cs35l56_hda *cs35l56, int id)
 
 	sub = acpi_get_subsystem_id(ACPI_HANDLE(cs35l56->base.dev));
 
-	if (IS_ERR(sub)) {
-		/* If no ACPI SUB, return 0 and fallback to legacy firmware path, otherwise fail */
-		if (PTR_ERR(sub) == -ENODATA)
-			return 0;
-		else
-			return PTR_ERR(sub);
-	}
-
-	cs35l56->system_name = sub;
+	if (IS_ERR(sub))
+		dev_err_probe(cs35l56->base.dev, PTR_ERR(sub),
+			      "Read ACPI _SUB failed: fallback to generic firmware\n");
+	else
+		cs35l56->system_name = sub;
 
 	cs35l56->base.reset_gpio = devm_gpiod_get_index_optional(cs35l56->base.dev,
 								 "reset",
-- 
2.30.2

