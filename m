Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6505C6B7CA9
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 16:52:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68EA21474;
	Mon, 13 Mar 2023 16:51:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68EA21474
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678722742;
	bh=VAtOLpuO/uHHoD3B+EKpK1SRgqy11RmkUlM4/k1EhPU=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=IZ0idprb+6bMsoNe+lr4dmZShTkB3Po9SYxVwaksM6KjSTCgQ3NxF75tQfGxPXS/g
	 gbcjGds9wF6TrX0ICvv9H0Mi2wfemniUigJcC5e4dXQC9tqatRyKuWfbcecByD5hQ4
	 BresOn/O1FQh3hGkmozkRC6jOw2tq22fBXGjqerM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 82EBAF80542;
	Mon, 13 Mar 2023 16:50:26 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 1/8] firmware: cs_dsp: Introduce no_core_startstop for
 self-booting DSPs
Date: Mon, 13 Mar 2023 15:49:48 +0000
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZO5QOYYFIXFQERO4F7RC45H6QSCCIS44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167872262553.26.13229639913975767299@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 65283F8053B; Mon, 13 Mar 2023 16:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20C68F80425
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 16:50:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20C68F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=CMlL9WxR
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32DEPFBm004637;
	Mon, 13 Mar 2023 10:50:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pKF0uI7lm6EPpC6Qzi9YRJ+YwdwwOiOgrKlQyRUjDH0=;
 b=CMlL9WxR3pyR8kzKB7OUXZpUCiuQpv8In93xtSQsTJJPai3cA8Us1sfIE3Ren0wlYgEt
 /8zKGZHCj+hMp7fksWtGjFYJ4HQFR9JmNzG/uIJWDa9aP8cqJxm0aYc5wcc4IDzIuSqk
 YrkhbIEc0KfPt7YcrCpRQV1U1/DpQv/yD31JwFV3JnEm83E+ymJQk6B9R2GEqv+tE+/e
 Ufr7ksZA9RHAFNlG6N8ZLTzGXLLU0f4OCBFHzrf2XNIni5BY6t3RRvapvY9gQEBJD3Ap
 AbMlnA9jM4UV2MFs9YLtvXhKKpHLT1RF60lfhGYo0fBKdRmO0Qcm23DNOcn4X2y1vueD /g==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p8qx7b4rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Mar 2023 10:50:06 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 13 Mar
 2023 10:50:04 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 13 Mar 2023 10:50:04 -0500
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.64.92])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 60FC211D4;
	Mon, 13 Mar 2023 15:50:04 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v2 1/8] firmware: cs_dsp: Introduce no_core_startstop for
 self-booting DSPs
Date: Mon, 13 Mar 2023 15:49:48 +0000
Message-ID: <20230313154955.4268-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230313154955.4268-1-rf@opensource.cirrus.com>
References: <20230313154955.4268-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4iV5sr7HVVva8JLmjRPw3SKDIvJ_LpKx
X-Proofpoint-GUID: 4iV5sr7HVVva8JLmjRPw3SKDIvJ_LpKx
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: ZO5QOYYFIXFQERO4F7RC45H6QSCCIS44
X-Message-ID-Hash: ZO5QOYYFIXFQERO4F7RC45H6QSCCIS44
X-MailFrom: prvs=843636b565=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZO5QOYYFIXFQERO4F7RC45H6QSCCIS44/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

There are devices containing Halo Core DSPs that self-boot, cs_dsp is
used to manage the running firmware but the host does not have direct
control over starting and stopping the DSP and so cs_dsp should consider
the DSP to be always running.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/cs_dsp.c       | 14 +++++++++++++-
 include/linux/firmware/cirrus/cs_dsp.h |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index f558b390fbfe..97b73a254380 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -301,6 +301,7 @@ struct cs_dsp_ops {
 static const struct cs_dsp_ops cs_dsp_adsp1_ops;
 static const struct cs_dsp_ops cs_dsp_adsp2_ops[];
 static const struct cs_dsp_ops cs_dsp_halo_ops;
+static const struct cs_dsp_ops cs_dsp_halo_ao_ops;
 
 struct cs_dsp_buf {
 	struct list_head list;
@@ -2821,7 +2822,10 @@ EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp2_init, FW_CS_DSP);
  */
 int cs_dsp_halo_init(struct cs_dsp *dsp)
 {
-	dsp->ops = &cs_dsp_halo_ops;
+	if (dsp->no_core_startstop)
+		dsp->ops = &cs_dsp_halo_ao_ops;
+	else
+		dsp->ops = &cs_dsp_halo_ops;
 
 	return cs_dsp_common_init(dsp);
 }
@@ -3187,6 +3191,14 @@ static const struct cs_dsp_ops cs_dsp_halo_ops = {
 	.stop_core = cs_dsp_halo_stop_core,
 };
 
+static const struct cs_dsp_ops cs_dsp_halo_ao_ops = {
+	.parse_sizes = cs_dsp_adsp2_parse_sizes,
+	.validate_version = cs_dsp_halo_validate_version,
+	.setup_algs = cs_dsp_halo_setup_algs,
+	.region_to_reg = cs_dsp_halo_region_to_reg,
+	.show_fw_status = cs_dsp_halo_show_fw_status,
+};
+
 /**
  * cs_dsp_chunk_write() - Format data to a DSP memory chunk
  * @ch: Pointer to the chunk structure
diff --git a/include/linux/firmware/cirrus/cs_dsp.h b/include/linux/firmware/cirrus/cs_dsp.h
index cad828e21c72..29cd11d5a3cf 100644
--- a/include/linux/firmware/cirrus/cs_dsp.h
+++ b/include/linux/firmware/cirrus/cs_dsp.h
@@ -156,6 +156,7 @@ struct cs_dsp {
 	unsigned int sysclk_reg;
 	unsigned int sysclk_mask;
 	unsigned int sysclk_shift;
+	bool no_core_startstop;
 
 	struct list_head alg_regions;
 
-- 
2.30.2

