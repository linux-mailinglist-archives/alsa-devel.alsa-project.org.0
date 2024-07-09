Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD3992BD89
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jul 2024 16:55:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83F5B950;
	Tue,  9 Jul 2024 16:55:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83F5B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720536943;
	bh=tmoNt8lach5F6zb9655OIEWPDXlhgi1uPzdrFNMZQ30=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jX2LVAzz4iI3I9gP8SP0axH+ikAXXwDaeR2SWdfC9QXfV0n0fDwYZunZC1P/TOKF4
	 oWt151w7lfEJxhNYgK+vcwPGng5SyvJ7OJG6WHUmJdGHiIVR9IMNQCXoXHKsr4ighO
	 43tm3rgxZEbGHS+WtWIEV85/LwWsQg7J8nMu8sZg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83911F80589; Tue,  9 Jul 2024 16:55:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C1DE1F805B0;
	Tue,  9 Jul 2024 16:55:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A75DF8019B; Tue,  9 Jul 2024 16:52:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71586F8020D
	for <alsa-devel@alsa-project.org>; Tue,  9 Jul 2024 16:52:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71586F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=dZ7IMZhu
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 4699TeIb016166;
	Tue, 9 Jul 2024 09:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=b0qMF/w47wG0eNUeosr0AcPTRrVfH6R7v97UI4wqM2o=; b=
	dZ7IMZhuwY15O2DvSnvEzW9QA2xhsXCpOSHwR+YlZPylnVKBZNmzpGQubqVTMxJz
	IGIgQM/LgtZc1BXlTSy89iuKMVsgTjXdZZQ8Sr985cBkoT4V7XJQuVxxwIfByEvV
	AOrPwbze36+soaoE5rC8JD2/eYUyr0Tp6dMYSdrvHWEYYIe5cvzNPkL0lJVvJl+u
	BkDz8CSqECFrDTtwEQ6AvQJlgO5COr6oAIJeyn0dTzIDcu1Ypo/PB1cck3hlHfRW
	41Anv2TvwTrFCBdt/pGdk98Gok1uOGCacZUEr4T55l0jBl19Ysw6m3TGFUe84xkZ
	wsDu4O4yLXbdKcg8Non2RQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4073axtqje-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 09:52:00 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 15:51:57 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Tue, 9 Jul 2024 15:51:57 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 0B9C6820257;
	Tue,  9 Jul 2024 14:51:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH 2/4] firmware: cs_dsp: Make wmfw and bin filename arguments
 const char *
Date: Tue, 9 Jul 2024 15:51:54 +0100
Message-ID: <20240709145156.268074-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240709145156.268074-1-rf@opensource.cirrus.com>
References: <20240709145156.268074-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: icj7LZgcHbbRVzl8W7yuhZETv5xS6Vdl
X-Proofpoint-GUID: icj7LZgcHbbRVzl8W7yuhZETv5xS6Vdl
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 77BH3FK727CPOSVAQONREE6YWWPTSYUA
X-Message-ID-Hash: 77BH3FK727CPOSVAQONREE6YWWPTSYUA
X-MailFrom: prvs=4920b5cb13=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/77BH3FK727CPOSVAQONREE6YWWPTSYUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The wmfw_filename and bin_filename strings passed into cs_dsp_power_up()
and cs_dsp_adsp1_power_up() should be const char *.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 8 ++++----
 include/linux/firmware/cirrus/cs_dsp.h | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index bf25107a98ee..1bc2e0b6d40b 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -2413,8 +2413,8 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_init, FW_CS_DSP);
  * Return: Zero for success, a negative number on error.
  */
 int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
-			  const struct firmware *wmfw_firmware, char *wmfw_filename,
-			  const struct firmware *coeff_firmware, char *coeff_filename,
+			  const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			  const struct firmware *coeff_firmware, const char *coeff_filename,
 			  const char *fw_name)
 {
 	unsigned int val;
@@ -2707,8 +2707,8 @@ static void cs_dsp_halo_stop_watchdog(struct cs_dsp *dsp)
  * Return: Zero for success, a negative number on error.
  */
 int cs_dsp_power_up(struct cs_dsp *dsp,
-		    const struct firmware *wmfw_firmware, char *wmfw_filename,
-		    const struct firmware *coeff_firmware, char *coeff_filename,
+		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
+		    const struct firmware *coeff_firmware, const char *coeff_filename,
 		    const char *fw_name)
 {
 	int ret;
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index 82687e07a7c2..8078dc377948 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -213,13 +213,13 @@ int cs_dsp_adsp2_init(struct cs_dsp *dsp);
 int cs_dsp_halo_init(struct cs_dsp *dsp);
 
 int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
-			  const struct firmware *wmfw_firmware, char *wmfw_filename,
-			  const struct firmware *coeff_firmware, char *coeff_filename,
+			  const struct firmware *wmfw_firmware, const char *wmfw_filename,
+			  const struct firmware *coeff_firmware, const char *coeff_filename,
 			  const char *fw_name);
 void cs_dsp_adsp1_power_down(struct cs_dsp *dsp);
 int cs_dsp_power_up(struct cs_dsp *dsp,
-		    const struct firmware *wmfw_firmware, char *wmfw_filename,
-		    const struct firmware *coeff_firmware, char *coeff_filename,
+		    const struct firmware *wmfw_firmware, const char *wmfw_filename,
+		    const struct firmware *coeff_firmware, const char *coeff_filename,
 		    const char *fw_name);
 void cs_dsp_power_down(struct cs_dsp *dsp);
 int cs_dsp_run(struct cs_dsp *dsp);
-- 
2.39.2

