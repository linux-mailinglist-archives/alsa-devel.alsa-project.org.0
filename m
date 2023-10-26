Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E97D859E
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 17:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E57384B;
	Thu, 26 Oct 2023 17:09:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E57384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698332990;
	bh=25P9ZswVWSp9vE9ClIUpg82xKKnjD3qgHjGNVhvspP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ljxl6rlOhu2WrCtdYCJHvuBeu6+gTVN/01cCLg6CIveajN/DhFgD52CBmNOjy8BrM
	 9hSk93XhaM9qP3Oo2v3/x3KYJTmaHseWhOjADHsz5onV0c7CHII2knqQiwdOjslISt
	 5FHqA7KP+CljJ/ejcPZPLeKk58drckJ9Eb2PlFDQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01357F80570; Thu, 26 Oct 2023 17:08:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0135EF8055A;
	Thu, 26 Oct 2023 17:08:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29005F8055A; Thu, 26 Oct 2023 17:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8C663F8024E
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 17:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C663F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FgjtMwvK
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 39Q5GUrl011654;
	Thu, 26 Oct 2023 10:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=/q3Kw4t4VTC4/a9Bku2lCi/sAJC9uB56KwypnrOkogk=; b=
	FgjtMwvK7nk6mBpvrTLCcNfGZaWDFby7l95BNA5dY94YI2kYhLF7HuISpswtpBys
	4jYov1hS7r+BXf1u3nvPwqKB6hec9hbmyXOYKKWkixwYRmpXociv/VemVrwifii+
	AOE8nLLBxTDR5S1MoouemGf2jnGjGuVB72vVG5rWLiSWoMQDy4hWI4i4Ab7nIYTr
	Y5oCwXegDJhBSjeS55nLGTPxobqorZ5hDb1NOyGXUkZ9VZZnIDwir3ZnY5FXAIwn
	KqKBQc/Z4dyrZ2vpJKLpIAMs4HHgLfoenpZaA0ePAIO+aaC3m4MwBP9a+Qcpnnha
	WzG57rCP2a4zRBMZ1MfbSg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3tvc1x94k9-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Oct 2023 10:06:18 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 26 Oct
 2023 16:06:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 26 Oct 2023 16:06:09 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.177])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21CB0357E;
	Thu, 26 Oct 2023 15:06:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        "Mark
 Brown" <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-sound@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 7/8] ALSA: hda: cs35l41: Check CSPL state after loading
 firmware
Date: Thu, 26 Oct 2023 16:05:57 +0100
Message-ID: <20231026150558.2105827-8-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
References: <20231026150558.2105827-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: W4rZ6uY09kr0d8aBBrA7k6d90D77BfBy
X-Proofpoint-ORIG-GUID: W4rZ6uY09kr0d8aBBrA7k6d90D77BfBy
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZFVZKJP54XOURY547C3ESYJSRC6KYVVX
X-Message-ID-Hash: ZFVZKJP54XOURY547C3ESYJSRC6KYVVX
X-MailFrom: prvs=56633e4941=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFVZKJP54XOURY547C3ESYJSRC6KYVVX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CSPL firmware should be in RUNNING or PAUSED state after loading.
If not, the firmware has not been loaded correctly, and we can unload
it and pass the error up.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 69303888be1a..496ff6a9d300 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -994,6 +994,7 @@ static int cs35l41_runtime_resume(struct device *dev)
 
 static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 {
+	unsigned int fw_status;
 	__be32 halo_sts;
 	int ret;
 
@@ -1027,6 +1028,23 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 		goto clean_dsp;
 	}
 
+	ret = regmap_read(cs35l41->regmap, CS35L41_DSP_MBOX_2, &fw_status);
+	if (ret < 0) {
+		dev_err(cs35l41->dev,
+			"Failed to read firmware status: %d\n", ret);
+		goto clean_dsp;
+	}
+
+	switch (fw_status) {
+	case CSPL_MBOX_STS_RUNNING:
+	case CSPL_MBOX_STS_PAUSED:
+		break;
+	default:
+		dev_err(cs35l41->dev, "Firmware status is invalid: %u\n",
+			fw_status);
+		goto clean_dsp;
+	}
+
 	ret = cs35l41_set_cspl_mbox_cmd(cs35l41->dev, cs35l41->regmap, CSPL_MBOX_CMD_PAUSE);
 	if (ret) {
 		dev_err(cs35l41->dev, "Error waiting for DSP to pause: %u\n", ret);
-- 
2.34.1

