Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4538C889D09
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Mar 2024 12:34:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB59114FD;
	Mon, 25 Mar 2024 12:34:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB59114FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711366498;
	bh=8wIa6nW1ERiw4t1Ybn1tnOi5l/VyBjBAJ/xBmZH1cd4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GxWWc/V9e46eJsv0LE0qlHpp9+bK4/mad8kCBbma/LXS8XH9eyviy9vUxH/USplve
	 Xd7DwgZAGSnBXidYT53i8YNwnlI87K7Msm2nSe2Skxs6s6TYbPvtzVHWXrzmYBp/Ly
	 3hwbzuUz9uEmp++Qnl+0Le1xCmt991awJ3hAfRK4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36CD2F805C6; Mon, 25 Mar 2024 12:34:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E73EF805BB;
	Mon, 25 Mar 2024 12:34:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD7DF8055C; Mon, 25 Mar 2024 12:31:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9B80F80236
	for <alsa-devel@alsa-project.org>; Mon, 25 Mar 2024 12:31:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9B80F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=c/cQZre1
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42P4qkf4007553;
	Mon, 25 Mar 2024 06:31:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Ve6q53KNEyaHYsEeYneEssGZ6Wrn16sSu1b7bPPggrU=; b=
	c/cQZre1an3oq7WNRPOSd+tbcrU3woSndVth5uiXREO/unhZ67BkwsC7nUkoWDVn
	FkjLlg6HYnSw6CHI9AGZtBO4e8PUfV9Q6kWBG+CUnWpLrePIw9dGN5IP0NHXbLIh
	oL0RGNzh+KbWLzo4/smOX5PsJr/4J7Rb3ms5vrPVFfpdLgMbHdo06uP8qpv0A5ui
	OlBRjSdJxEozbRq0RRWpzSyvTAhhwgeancq0I0klLrWlCWHgdtWZOvNv1OqpoSUd
	u0Bki4VCnetoHTqhaSoe8PeXc3k9M8xISLS7m6GjTo4vrKerGvHZgtOcsFyRaf+K
	DyPXoNwywMD35K2eigiX/Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3x1vfyb6v0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 06:31:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 25 Mar
 2024 11:31:27 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4
 via Frontend Transport; Mon, 25 Mar 2024 11:31:27 +0000
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 3C764820246;
	Mon, 25 Mar 2024 11:31:27 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Simon
 Trimmer" <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH 1/5] firmware: cs_dsp: Add locked wrappers for coeff read and
 write
Date: Mon, 25 Mar 2024 11:31:23 +0000
Message-ID: <20240325113127.112783-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325113127.112783-1-rf@opensource.cirrus.com>
References: <20240325113127.112783-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: W_mGFw0jCLpfl27Iq92J29FYCUk_XLhO
X-Proofpoint-GUID: W_mGFw0jCLpfl27Iq92J29FYCUk_XLhO
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: KEWN5GTKUZAROQKA2NMH6YQS3FGCJUIW
X-Message-ID-Hash: KEWN5GTKUZAROQKA2NMH6YQS3FGCJUIW
X-MailFrom: prvs=081491209a=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KEWN5GTKUZAROQKA2NMH6YQS3FGCJUIW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

It is a common pattern for functions to take and release the DSP
pwr_lock over the cs_dsp calls to read and write firmware controls.
Add wrapper functions to do this sequence so that the calling code can
be simplified to a single function call..

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 54 ++++++++++++++++++++++++++
 include/linux/firmware/cirrus/cs_dsp.h |  4 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 9f3d665cfdcf..0d139e4de37c 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -819,6 +819,33 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_write_ctrl, FW_CS_DSP);
 
+/**
+ * cs_dsp_coeff_lock_and_write_ctrl() - Writes the given buffer to the given coefficient control
+ * @ctl: pointer to coefficient control
+ * @off: word offset at which data should be written
+ * @buf: the buffer to write to the given control
+ * @len: the length of the buffer in bytes
+ *
+ * Same as cs_dsp_coeff_write_ctrl() but takes pwr_lock.
+ *
+ * Return: A negative number on error, 1 when the control value changed and 0 when it has not.
+ */
+int cs_dsp_coeff_lock_and_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
+				     unsigned int off, const void *buf, size_t len)
+{
+	struct cs_dsp *dsp = ctl->dsp;
+	int ret;
+
+	lockdep_assert_not_held(&dsp->pwr_lock);
+
+	mutex_lock(&dsp->pwr_lock);
+	ret = cs_dsp_coeff_write_ctrl(ctl, off, buf, len);
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs_dsp_coeff_lock_and_write_ctrl);
+
 static int cs_dsp_coeff_read_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 				      unsigned int off, void *buf, size_t len)
 {
@@ -891,6 +918,33 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
 }
 EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_read_ctrl, FW_CS_DSP);
 
+/**
+ * cs_dsp_coeff_lock_and_read_ctrl() - Reads the given coefficient control into the given buffer
+ * @ctl: pointer to coefficient control
+ * @off: word offset at which data should be read
+ * @buf: the buffer to store to the given control
+ * @len: the length of the buffer in bytes
+ *
+ * Same as cs_dsp_coeff_read_ctrl() but takes pwr_lock.
+ *
+ * Return: Zero for success, a negative number on error.
+ */
+int cs_dsp_coeff_lock_and_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
+				    unsigned int off, void *buf, size_t len)
+{
+	struct cs_dsp *dsp = ctl->dsp;
+	int ret;
+
+	lockdep_assert_not_held(&dsp->pwr_lock);
+
+	mutex_lock(&dsp->pwr_lock);
+	ret = cs_dsp_coeff_read_ctrl(ctl, off, buf, len);
+	mutex_unlock(&dsp->pwr_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cs_dsp_coeff_lock_and_read_ctrl);
+
 static int cs_dsp_coeff_init_control_caches(struct cs_dsp *dsp)
 {
 	struct cs_dsp_coeff_ctl *ctl;
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 23384a54d575..82687e07a7c2 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -238,8 +238,12 @@ void cs_dsp_cleanup_debugfs(struct cs_dsp *dsp);
 int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int event_id);
 int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
 			    const void *buf, size_t len);
+int cs_dsp_coeff_lock_and_write_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
+				     const void *buf, size_t len);
 int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
 			   void *buf, size_t len);
+int cs_dsp_coeff_lock_and_read_ctrl(struct cs_dsp_coeff_ctl *ctl, unsigned int off,
+				    void *buf, size_t len);
 struct cs_dsp_coeff_ctl *cs_dsp_get_ctl(struct cs_dsp *dsp, const char *name, int type,
 					unsigned int alg);
 
-- 
2.39.2

