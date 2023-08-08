Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F9773F8A
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Aug 2023 18:49:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB08383A;
	Tue,  8 Aug 2023 18:48:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB08383A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691513375;
	bh=lvKDcEoRWQ6YKf4a107xBqeM8eXRf4rJpfiunZBNgEo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rYmM1CHV7u1KsEDSAcS0fgK9gaMMzetD3HmvOMsQTeaEFhOjowtIK+jr/yn5K4IOc
	 J63UTHaiUpxNxxGq88jOAG/UgEhTptpM1e8P7Rh340b0OmUop6roa92WmTq2WkitCt
	 ahggcEat6J3UGSITaqNL85g7cDbHAoafgESAz1gA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F52AF805AA; Tue,  8 Aug 2023 18:47:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E16F805AA;
	Tue,  8 Aug 2023 18:47:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC53F8057F; Tue,  8 Aug 2023 18:47:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 89230F80538
	for <alsa-devel@alsa-project.org>; Tue,  8 Aug 2023 18:47:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89230F80538
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=O/pVAMLE
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 378GfYwG012826;
	Tue, 8 Aug 2023 11:47:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=7RZLhRQ+381XYUDrqoqfoe0OVQjJKugGtd0GWZHvb+4=; b=
	O/pVAMLEaRntg+Ct3WXnVTbK6hmMBeSwKpZPzyWrb+VqZjQd2GLEul+R7gUkuUFx
	2NiOZEbPJNiwuEqWvbeM1mtSX0ZiQrckGtX7LANoOEZT0hP75Ts6tKOtz+sBHhfq
	3uafn4i2w/ij1Cjcco0BRkkQStBS/+7G2kEGkjPCLcYZkjtvMf9CaWgLnY43R3ZM
	qZ08SVK8+6I9YHXmNleskA1zVS8AZI+W1SqY72D7zGReY17KT84/Su9AMOLW5vLn
	QQoWaV//qC0vgb8KNdKOFxrsNCmGDRyRa6HyRSCpjiqyU+BJvsyCwKe5qsOL2Ys7
	0SgMTt6a5ddVEahHGwFMnQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3s9juhtucr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 11:47:07 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 8 Aug
 2023 17:47:05 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Tue, 8 Aug 2023 17:47:05 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.220])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4E8963575;
	Tue,  8 Aug 2023 16:47:05 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 3/5] ASoC: cs35l56: Wait for control port ready during
 system-resume
Date: Tue, 8 Aug 2023 17:47:00 +0100
Message-ID: <20230808164702.21272-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230808164702.21272-1-rf@opensource.cirrus.com>
References: <20230808164702.21272-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XHuMFLKBPZboRX8wriv0npaa4Urk6y63
X-Proofpoint-ORIG-GUID: XHuMFLKBPZboRX8wriv0npaa4Urk6y63
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M4YTRS4KJH6LIEBCOHA65YO3QZBVPADW
X-Message-ID-Hash: M4YTRS4KJH6LIEBCOHA65YO3QZBVPADW
X-MailFrom: prvs=3584a5a98c=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4YTRS4KJH6LIEBCOHA65YO3QZBVPADW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The CS35L56 could be hard-reset during a system suspend-resume cycle,
either by the codec driver, in cs35l56_system_resume_early(), or by ACPI.
After a hard reset the driver must wait for the control port to be ready
(datasheet tIRS time) before attempting to access the CS35L56.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 9560059c867b..094bcbd0a174 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -952,6 +952,12 @@ int cs35l56_system_resume(struct device *dev)
 
 	dev_dbg(dev, "system_resume\n");
 
+	/*
+	 * We might have done a hard reset or the CS35L56 was power-cycled
+	 * so wait for control port to be ready.
+	 */
+	cs35l56_wait_control_port_ready();
+
 	/* Undo pm_runtime_force_suspend() before re-enabling the irq */
 	ret = pm_runtime_force_resume(dev);
 	if (cs35l56->base.irq)
-- 
2.30.2

