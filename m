Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 893C1840B81
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 17:31:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F61D9F6;
	Mon, 29 Jan 2024 17:31:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F61D9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706545913;
	bh=WMa+E/IsJJh0xMAdW5rdDO4TW2hkjRiEiK+MOHP5ggk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KBbEWd8QEKI8E4esr97xN7D7r+R276V7y4l4uwFR+78OY9oR8CRf4G2wMV1PLFdcU
	 BMgUCS9efJd4Bh/uNUCwEEDnqVLqefZ49JOJrh7qxHz+8vaKpOKumy1Ib4IP50qyeN
	 eJgbOX+HZJfSsAl/Fw4dqppfX8B6nqeRrX9O4Nto=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6CE1F80768; Mon, 29 Jan 2024 17:28:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6A1AF8076C;
	Mon, 29 Jan 2024 17:28:57 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05005F8068C; Mon, 29 Jan 2024 17:28:29 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB52F80563
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 17:27:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB52F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=PVklpkRx
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40T5fM0M006968;
	Mon, 29 Jan 2024 10:27:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=vihQFlaLo0Ij7ZEe+g2FSTJscOtY5rr5pKJ4XAH0JCQ=; b=
	PVklpkRxDTh3yGR7YMlXPOk4A8IFPVQq5VIOmM8WT9athbXVZxai1sleFKtpIk/0
	mZXgBI6OdaSDRP27LB7QwqPIOHQl4Sqmr1GtrsQEvRqePyPKt6p/vv53AZtd0w4L
	3dhJADG9h5V0K0ehKJ0swkuHkx8Cj1IES0tiSZxgpXo9RLltiGdR1w/opNmW5BB8
	H9zKKVz2h46XtblBhUj1DkPPX4gBYWLnyZUblGn474nTjUGgDs76SlpinbnUzzSz
	FPFq6Xy6xhYzhG4wYfnZlR9uIjWHS2CYUU9JYfp1W3EAtYUugeNTaT9LhWp/OZLJ
	cZsFcP8dxJH/Nr8k3t9gIg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vvy4nta8n-8
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:27:56 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 29 Jan
 2024 16:27:47 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Mon, 29 Jan 2024 16:27:47 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.204])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E4894820270;
	Mon, 29 Jan 2024 16:27:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Richard
 Fitzgerald" <rf@opensource.cirrus.com>
Subject: [PATCH 16/18] ALSA: hda: cs35l56: Fix filename string field layout
Date: Mon, 29 Jan 2024 16:27:35 +0000
Message-ID: <20240129162737.497-17-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129162737.497-1-rf@opensource.cirrus.com>
References: <20240129162737.497-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: XVN8exbvxqmaOu5Io8r8DbmpZkHf9mda
X-Proofpoint-GUID: XVN8exbvxqmaOu5Io8r8DbmpZkHf9mda
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GC5V3ICWM5WW4XEUPEUDXMMDEK4ICLQF
X-Message-ID-Hash: GC5V3ICWM5WW4XEUPEUDXMMDEK4ICLQF
X-MailFrom: prvs=97580788b4=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GC5V3ICWM5WW4XEUPEUDXMMDEK4ICLQF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Change the filename field layout to:
  cs35l56-rev[-s]-dsp1-misc[-sub].[wmfw|bin]

This is to keep the same firmware file naming scheme as the
CS35L56 ASoC driver.

This is not a compatibility break because no firmware files have
been published.

The original field layout matched the ASoC driver, but the way the
ASoC driver used the wm_adsp driver config to form this filename
was bugged. Fixing the ASoC driver to use the correct wm_adsp config
strings means that the 's' flag (to indicate a secured part) has to
move to somewhere after the first '-'.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 73cfbfa9caea ("ALSA: hda/cs35l56: Add driver for Cirrus Logic CS35L56 amplifier")
---
 sound/pci/hda/cs35l56_hda.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index 7ba7234d8d9c..081479f65fe7 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -405,16 +405,19 @@ static int cs35l56_hda_request_firmware_file(struct cs35l56_hda *cs35l56,
 	int ret = 0;
 
 	if (system_name && amp_name)
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc-%s-%s.%s", dir,
-				      cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
+		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc-%s-%s.%s", dir,
+				      cs35l56->base.rev,
+				      cs35l56->base.secured ? "-s" : "",
 				      system_name, amp_name, filetype);
 	else if (system_name)
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc-%s.%s", dir,
-				      cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
+		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc-%s.%s", dir,
+				      cs35l56->base.rev,
+				      cs35l56->base.secured ? "-s" : "",
 				      system_name, filetype);
 	else
-		*filename = kasprintf(GFP_KERNEL, "%scs35l56%s-%02x-dsp1-misc.%s", dir,
-				      cs35l56->base.secured ? "s" : "", cs35l56->base.rev,
+		*filename = kasprintf(GFP_KERNEL, "%scs35l56-%02x%s-dsp1-misc.%s", dir,
+				      cs35l56->base.rev,
+				      cs35l56->base.secured ? "-s" : "",
 				      filetype);
 
 	if (!*filename)
-- 
2.39.2

