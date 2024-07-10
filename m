Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C61FE92CF64
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 12:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D3769F6;
	Wed, 10 Jul 2024 12:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D3769F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720607943;
	bh=QHGT4+ppYO45q0achce4/jGU1ih4Zv0+l/JdKKksWI0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EM+VMh3sfXeUQbRpCF3vdyIb04Zz8u0Kel+4zFGHb1j9xXvDng5wF+ZMYFwzfNWFG
	 YqMJo1pDij2/zWarbvwJNIxqUDVJOIFeG+fda4RY9UVmsaBI5a3CEI03CA0sv1qEQN
	 jvhJlXeJjpErpVWWwF3xPUBmWM5A0VT/j+9iLXcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC181F805D7; Wed, 10 Jul 2024 12:38:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C29F0F805D7;
	Wed, 10 Jul 2024 12:38:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D30D4F804FC; Wed, 10 Jul 2024 12:36:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43446F801F5
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 12:36:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43446F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=MD1nD/08
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id
 46A4s4Go006601;
	Wed, 10 Jul 2024 05:36:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=RbnIyx9NYEEds9ispHpQLOcYGwAry0EZT8xR+scgMwU=; b=
	MD1nD/08tqerfYbVwCwO/cinbrToQnyCcMGKaJinpriJHgd7OCO+GwGnVKr55Sq7
	QG7eAUXNJPqjgSN3AlWpL6dsSouZoRHfK4cd6lMicW4cKO9bvExHmXXaunwdH5Mr
	Y3ydNznlOhQvih5fUPgwKLMfzL+tZ/d7iuEhGrMkkd0NpFBf5RIWvGZRB6vrVSim
	OU5xkYHmWGk1TMo2cm81pltdMb1yBVgZT323XGoeE6lDxRgYbYHRDEJzvtb9bewa
	pjfrMXxpzX0aYYR5qKGSirvyxOGpJB7v37sSTaqvOr9qOROSYmfGzw2vTNnJbCD1
	RGHs6KODtar572dYx45lwg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 409c9a8h0p-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 05:36:45 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 10 Jul
 2024 11:36:40 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 10 Jul 2024 11:36:40 +0100
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com
 [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 6CCB6820257;
	Wed, 10 Jul 2024 10:36:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
Subject: [PATCH v2 2/4] firmware: cs_dsp: Make wmfw and bin filename arguments
 const char *
Date: Wed, 10 Jul 2024 11:36:38 +0100
Message-ID: <20240710103640.78197-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240710103640.78197-1-rf@opensource.cirrus.com>
References: <20240710103640.78197-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: uECqc4ON5OqZnS7C_BoMiIgSE4KE2b-J
X-Proofpoint-GUID: uECqc4ON5OqZnS7C_BoMiIgSE4KE2b-J
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: OQ6PC3YXM2SKJ72YFENNZL7X7HLJDUE4
X-Message-ID-Hash: OQ6PC3YXM2SKJ72YFENNZL7X7HLJDUE4
X-MailFrom: prvs=4921fba11f=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OQ6PC3YXM2SKJ72YFENNZL7X7HLJDUE4/>
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
No changes since V1
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

