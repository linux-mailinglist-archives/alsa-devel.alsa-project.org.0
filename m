Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF2D769D84
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 19:01:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B365A4D;
	Mon, 31 Jul 2023 19:00:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B365A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690822899;
	bh=u87Pr1O7Hl4rKiv7kc2px8tp6+12lmYBZXtNJK/4A1A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Fkih9aw5lUWmJSHwmBAKXAeH6QWLfOqMTGd7ZdyFw51ODrxctg3JHp4XZuPt4nLVW
	 IIgGa+lOR9UOvchl+PoPJYmHNy0wTpQkOxl+9LLhSj43DVJTmvwe4NOIhmtUgVTaRC
	 ZM5DTHcl5xT+Rm1Q6lR0AYV/z8Reb+ObQbLZwugI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4121F805ED; Mon, 31 Jul 2023 18:58:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DF4CF80549;
	Mon, 31 Jul 2023 18:58:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F7BCF80553; Mon, 31 Jul 2023 18:58:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 31CFFF801D5
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 18:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31CFFF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=oLjutGfm
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36V5lNJN017071;
	Mon, 31 Jul 2023 11:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=R7ZjjUfa6yJOj++gCN2+TabvdRaWxzaSedPyz17+U0k=; b=
	oLjutGfmin0E7RLlySjbfdbDa+44PhaRSXLZYdAAMUmSF/GvUGRRZHgdsOCafOCl
	Ejgrk3ZW+tSrGQtFR58CvV4+cRNPxDInLVviCiSoxB1yS0RaAikpyq6nrjnpChj9
	l0DWmBOPSRd3QZGBxkEbeYtjICZRznrlzTtnwiVLUzendX95Mdrkm7eVrOcLUI3N
	2nrSFdKBzm5MjPIbPoLkw+AOaGYkUPz+dvZSI8fOgcPUQCuzH9gOuhASUcLLlCte
	kUJQ5+LnjPaIz/UPrCiA3ODrfYWJ637+Qsbl97SEFUZNf07e0ftbazJDSeEoXYkt
	keMuQKhUl435GnYzWxW9MQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3s5gk1sg45-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Jul 2023 11:57:35 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 31 Jul
 2023 17:57:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.30 via Frontend
 Transport; Mon, 31 Jul 2023 17:57:32 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.107])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEA4E45D;
	Mon, 31 Jul 2023 16:57:31 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Richard
 Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 6/9] ALSA: hda/cs35l56: cs_dsp_power_down() on
 cs35l56_hda_fw_load() error path
Date: Mon, 31 Jul 2023 17:57:23 +0100
Message-ID: <20230731165726.7940-7-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230731165726.7940-1-rf@opensource.cirrus.com>
References: <20230731165726.7940-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: bB_xhwoyVLFnhBvAfJRqahOqp3F2rvgI
X-Proofpoint-ORIG-GUID: bB_xhwoyVLFnhBvAfJRqahOqp3F2rvgI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: YGRZMQ3UPIWXQPA54GVZ53Z5OH4SOOGO
X-Message-ID-Hash: YGRZMQ3UPIWXQPA54GVZ53Z5OH4SOOGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGRZMQ3UPIWXQPA54GVZ53Z5OH4SOOGO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If cs35l56_hda_fw_load() successfully called cs_dsp_power_up() the error
path must balance that with a call to cs_dsp_power_down().

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index e8c41a4a0c40..803fa2da9ea4 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -567,20 +567,20 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (cs35l56->base.secured) {
 		ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
 		if (ret)
-			goto err;
+			goto err_powered_up;
 	} else if (wmfw_firmware || coeff_firmware) {
 		/* If we downloaded firmware, reset the device and wait for it to boot */
 		cs35l56_system_reset(&cs35l56->base, false);
 		regcache_mark_dirty(cs35l56->base.regmap);
 		ret = cs35l56_wait_for_firmware_boot(&cs35l56->base);
 		if (ret)
-			goto err;
+			goto err_powered_up;
 	}
 
 	/* Disable auto-hibernate so that runtime_pm has control */
 	ret = cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
 	if (ret)
-		goto err;
+		goto err_powered_up;
 
 	regcache_sync(cs35l56->base.regmap);
 
@@ -592,6 +592,9 @@ static int cs35l56_hda_fw_load(struct cs35l56_hda *cs35l56)
 	if (ret)
 		dev_dbg(cs35l56->base.dev, "%s: cs_dsp_run ret %d\n", __func__, ret);
 
+err_powered_up:
+	if (!cs35l56->base.fw_patched)
+		cs_dsp_power_down(&cs35l56->cs_dsp);
 err:
 	pm_runtime_put(cs35l56->base.dev);
 	mutex_unlock(&cs35l56->base.irq_lock);
-- 
2.30.2

