Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606F69B075
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Feb 2023 17:17:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04A6EF7C;
	Fri, 17 Feb 2023 17:17:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04A6EF7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676650673;
	bh=R5OFaqUkC1Y/n/+UB4mhVCDijfv1IGX6IkOJqt0SkL4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uijd+33lKridqfs9t6bWvJsVdeLfpFRVbym564skLxhq8wFMHgMfEQMTWCmaqeQmS
	 umHEvfxlMj6fQv5H5FFnr4CvqwOKM3Snj+Qsdaa24nb9C+20wmy81z5d8dgwlafRJv
	 WxEotYtI1yhsfE+CfIKe0RlDpDu0zQO92KmQHH1g=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 091BDF8057A;
	Fri, 17 Feb 2023 17:14:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51254F80544; Fri, 17 Feb 2023 17:14:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58A66F801C0
	for <alsa-devel@alsa-project.org>; Fri, 17 Feb 2023 17:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58A66F801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=EtjptNTW
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31HFh1JL028722;
	Fri, 17 Feb 2023 10:14:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pKF0uI7lm6EPpC6Qzi9YRJ+YwdwwOiOgrKlQyRUjDH0=;
 b=EtjptNTWAf+6a9VC8Cm4/r2pT0c/Q7NYVJuPVpsZUeja2gN2W50CG3v13C7Ndx+TDQqo
 f9W4sPEhpra+ZWj2CBlU7SfBCPdRlYRUY0qiqucSERb+Nn3OUjzOiZeyxgIoAMXFoz0i
 QFgm8XLR0GSLe/C7meM7xTJBmOY8qjkLpSbouoarzwH9QNh8LXF3SHuQ/s8/E0CjDd++
 /tCyl/x0+Y7T+ixwjoGYCy4PQ4bKKbd+kJesIVoigJfPUY/37naclQFGjLJBjJvtLW38
 u3O2sZ6QwJYqO8VnwChAoYQow5ws+xVzyyVZfKVEsdh3bmVwiSIe7ObzmeJhQ9pLSAlb zw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3nt1btgsph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Feb 2023 10:14:12 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.21; Fri, 17 Feb
 2023 10:14:10 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.21 via Frontend
 Transport; Fri, 17 Feb 2023 10:14:10 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 382F546B;
	Fri, 17 Feb 2023 16:14:10 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>,
        <cezary.rojewski@intel.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>
Subject: [PATCH 01/10] firmware: cs_dsp: Introduce no_core_startstop for
 self-booting DSPs
Date: Fri, 17 Feb 2023 16:14:01 +0000
Message-ID: <20230217161410.915202-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230217161410.915202-1-rf@opensource.cirrus.com>
References: <20230217161410.915202-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Yu1ZOUbJXhaCp1gzWL6MeDEnA7YeZeQ1
X-Proofpoint-GUID: Yu1ZOUbJXhaCp1gzWL6MeDEnA7YeZeQ1
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: AKVMQNZR4RGSEYGMLOT25HBNQQOCJQWC
X-Message-ID-Hash: AKVMQNZR4RGSEYGMLOT25HBNQQOCJQWC
X-MailFrom: prvs=74127981b7=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AKVMQNZR4RGSEYGMLOT25HBNQQOCJQWC/>
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

