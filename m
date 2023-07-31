Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8B769D7A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:00:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFD3C6C0;
	Mon, 31 Jul 2023 18:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFD3C6C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822827;
	bh=bYzEbm5bPLL8j8Wf8WFHKWMSQUTjzMP3pvETvY/mp8s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rWK8jUMXBSbfxulkCl9VD8icU6LbHE8wSDJulB/uAigy5ljBmXJr9M3gONJUNEfIp
	 nOMoYVGkgosL4MBc2etp6FFDZQdxW6I18K0LjZNgWI3pp16PEgHc8JMvds0lTHUYsd
	 5NJv4VNjFZ4mt6CvBeV724rb2Px2LjnH8UJ55GEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9C4A0F805C0; Mon, 31 Jul 2023 18:58:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 645CEF805BD;
	Mon, 31 Jul 2023 18:58:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E74DF8057D; Mon, 31 Jul 2023 18:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B792FF80520
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B792FF80520
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZCja9J4L
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJP017071;
	Mon, 31 Jul 2023 11:57:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=kRJVBU+w59VixbMTEBoEeJzDYTKtrgAfvQuFksOXNx0=; b=
	ZCja9J4LUmngD4dKpu4UV4uTEGLSZPaw56mjm4odBmi7vOm1ioEEwiOynETFu+L+
	0SsehrOJmveWuyWa3ro9AyZ8Z1hpYmE5Vo+xjjAmaCuKHexCE7yxF2KPXbi17l2A
	roSDAvemQrBs26Gk8Z4+VizY/fydbkBP6WJ8d6SePhFCRAACPlaP2ZDsD1kTak3r
	x3/aBrfDLzJHmnPF6aazYANOsjyB56u3zJnWdM57mmtDXqOCc0OFYdilYTPra8xu
	FkCTztR/+5D2yr+nK+P+iEKbkdxN00uOnWvZlaT8IJ3VXyBgW3A6VkTdhy8EWcd5
	FqgZWrdXyUD0LME0rLBPhg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:37 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 17:57:32 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9976B11D3;
	Mon, 31 Jul 2023 16:57:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 8/9] ALSA: hda/cs35l56: Fail if .bin not found and firmware
 not patched
Date: Mon, 31 Jul 2023 17:57:25 +0100
Message-ID: <20230731165726.7940-9-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KD3mdf9fl-XadVx_X5Byy68JUQFon4mY
X-Proofpoint-ORIG-GUID: KD3mdf9fl-XadVx_X5Byy68JUQFon4mY
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: MCVILGKPMSBDFBAPQS5JECJETDA2WFVJ
X-Message-ID-Hash: MCVILGKPMSBDFBAPQS5JECJETDA2WFVJ
X-MailFrom: prvs=3576b45159=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MCVILGKPMSBDFBAPQS5JECJETDA2WFVJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

A tuning patch is always needed to enable the ASP audio port.
If the BIOS did not patch the firmware, then it is mandatory to
have a .bin file.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 8f1665d38c92..004740509dbd 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -555,6 +555,16 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 						   &coeff_firmware, &coeff_filename);
 	}
 
+	/*
+	 * If the BIOS didn't patch the firmware a bin file is mandatory to
+	 * enable the ASP·
+	 */
+	if (!coeff_firmware && firmware_missing) {
+		dev_err(cs35l56->base.dev, ".bin file required but not found\n");
+		ret = -ENOENT;
+		goto err_fw_release;
+	}
+
 	mutex_lock(&cs35l56->base.irq_lock);
 
 	/*
@@ -615,7 +625,7 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		cs_dsp_power_down(&cs35l56->cs_dsp);
 err:
 	mutex_unlock(&cs35l56->base.irq_lock);
-
+err_fw_release:
 	cs35l56_hda_release_firmware_files(wmfw_firmware, wmfw_filename,
 					   coeff_firmware, coeff_filename);
 err_pm_put:
-- 
2.30.2

