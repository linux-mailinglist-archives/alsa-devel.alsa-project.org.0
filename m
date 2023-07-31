Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AD769D81
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:01:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B79101E3;
	Mon, 31 Jul 2023 19:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B79101E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822878;
	bh=+6/F9BvjOsZKrvTIMEr/XFkR0SJRrjtLMPXlNYyvXgs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=s058PU/DCqylxiw0wVv8kW9a7IEe7/f+wbTg8QDm/i5dZthM4pdQP1KdwukTtllvu
	 E2QbYpxHDiAauC+zPUCt0P9a5a9asp47fupCId814zjqiNZP+R0W9cYAxTYcsoSOha
	 9HERlUC1/rLn9ZbcBMU9wn6er3M+6gdwQ3dR+kBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 908DEF805E1; Mon, 31 Jul 2023 18:58:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BEBF805DA;
	Mon, 31 Jul 2023 18:58:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83A66F805D3; Mon, 31 Jul 2023 18:58:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 203EAF80425
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 203EAF80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=mpl4OXY9
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJM017071;
	Mon, 31 Jul 2023 11:57:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=B1C4dVatnD+uffpp5pD3N1ldXPScWgM6kyZfR+HGa+s=; b=
	mpl4OXY9B0oU0cjBazfalZ/A8CoYebXC1RbxoQ98HdDRxW5Oti2AyHxabXZzgYz4
	gHrMP33fud0BN+gDsiTBq0XsNQ4Ci3osTqWPOQzbsVGI60xaKQ8fZ6HApWxTVqhl
	xZwbUPDZ0Ouv+iZu73zCYrxtiDUrHi0yhcf21rLX+IOqTE8afTIjQGFlA9/s2mVv
	Xfx6/bD7IoD5J35d5arsGqwHHpMHuAwqFiEX/W+TAVeraaCJDsBwrlgbULhVKUkC
	iTmuCg/NXYRNJk2jrlhJ5fMm3RZi857a7B/C7ZW/8ZJMKGPB/Ie/yO1owDl5S9OP
	bqsCkGaAv64jmitNjRlmXA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:35 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Mon, 31 Jul 2023 17:57:31 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 145CB475;
	Mon, 31 Jul 2023 16:57:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 4/9] ALSA: hda/cs35l56: Always power-up and start cs_dsp
Date: Mon, 31 Jul 2023 17:57:21 +0100
Message-ID: <20230731165726.7940-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: WNdFe9nyl-Xi5Oa92oRKJiEztYsxl5-p
X-Proofpoint-ORIG-GUID: WNdFe9nyl-Xi5Oa92oRKJiEztYsxl5-p
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LKZR34M4S4N325JMPK4BKECSAZ73OO7U
X-Message-ID-Hash: LKZR34M4S4N325JMPK4BKECSAZ73OO7U
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKZR34M4S4N325JMPK4BKECSAZ73OO7U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Always call cs_dsp_power_up() and cs_dsp_run() in
cs35l56_hda_fw_load() even if there aren't any firmware files
to download. Also, if there aren't any firmware files to
download there is no need to do cs35l56_firmware_shutdown() and
cs35l56_system_reset().

If there aren't any firmware files there's no need to write
anything to the CS35L56 registers to make it work - it will
already be running the ROM firmware. So it's not strictly
necessary to start cs_dsp.

But it's perfectly ok to call cs_dsp_power_up() and
cs_dsp_run() without downloading any firmware. This avoids
having to support a state where audio is playing but cs_dsp
is not running.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index b6b8cb21da75..2870f82bfa45 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -536,10 +536,6 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	cs35l56_hda_request_firmware_files(cs35l56, &wmfw_firmware, &wmfw_filename,
 					   &coeff_firmware, &coeff_filename);
 
-	/* Nothing to do - no firmware files were found to download */
-	if (!wmfw_filename && !coeff_filename)
-		return 0;
-
 	mutex_lock(&cs35l56->base.irq_lock);
 	pm_runtime_get_sync(cs35l56->base.dev);
 
@@ -549,7 +545,7 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	 * shutdown the firmware to apply them and can use the lower cost
 	 * reinit sequence instead.
 	 */
-	if (!cs35l56->base.secured) {
+	if (!cs35l56->base.secured && (wmfw_firmware || coeff_firmware)) {
 		ret = cs35l56_firmware_shutdown(&cs35l56->base);
 		if (ret)
 			goto err;
@@ -572,8 +568,8 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
 		if (ret)
 			goto err;
-	} else {
-		/* Reset the device and wait for it to boot */
+	} else if (wmfw_firmware || coeff_firmware) {
+		/* If we downloaded firmware, reset the device and wait for it to boot */
 		cs35l56_system_reset(&cs35l56->base, false);
 		regcache_mark_dirty(cs35l56->base.regmap);
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
-- 
2.30.2

