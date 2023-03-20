Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4E6C10BD
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Mar 2023 12:24:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3041E9;
	Mon, 20 Mar 2023 12:23:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3041E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679311445;
	bh=+yUmQh4m7BCOdLRS16dFXQmw6BdnqZfFTSwdB4z7rYA=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=JCftBWPTIZlysnws3jTNxEaY4EW+v6odlXzq0R2j/ocsRWpl41qPggbd4nbyxxASe
	 YTBMP/bHfh28kXtlRhuHicyloaPxyqk2ea1MhNjNk5QR0nsOc3W5GP88JC2581IwL2
	 jpUOi/08sWi5zrKoaJ2h7QSfCu/jvuF9QGrNzAJA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DD6B1F80254;
	Mon, 20 Mar 2023 12:23:13 +0100 (CET)
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 1/8] firmware: cs_dsp: Introduce no_core_startstop for
 self-booting DSPs
Date: Mon, 20 Mar 2023 11:22:38 +0000
In-Reply-To: <20230320112245.115720-1-rf@opensource.cirrus.com>
References: <20230320112245.115720-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIG2C47TGJXX22HCPAOU3AKOXXJBU7J7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167931139242.26.10799898013209983287@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Simon Trimmer <simont@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25EA0F80529; Mon, 20 Mar 2023 12:22:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A3D3F800C9
	for <alsa-devel@alsa-project.org>; Mon, 20 Mar 2023 12:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A3D3F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aJq0d7eO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32K6xMZf028388;
	Mon, 20 Mar 2023 06:22:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pKF0uI7lm6EPpC6Qzi9YRJ+YwdwwOiOgrKlQyRUjDH0=;
 b=aJq0d7eOqPh3fDY/cEVN4n+vmmJ7tbE3EBDhnvKqAPy8ZPmoWcfwFONMVUUP+CqZy+C4
 aTPiZDh+2PIyRWGNlws3a7oGuObxEYo0Ny5sLEB3utrxVFYeaPs4p3RdrnXI7PrtKCdD
 n4ddhN5gbByTXCKRoZDClAY7HBukl9Tdgt4evfzGxQ+BC6UjH4tp8zpr6/92Q0iGcT3W
 YpUhWbJAKvj/Lz8/dj92kQ4PSCpeZMnGrBcLe0z2sEUO5uwJazy2W3vUdenUmiwTmwht
 Eo7ShnxfRQWHPkJyf/2Wp5ksl4UDT5Zlq1VD5zJhU1x26pzsJZGwJlGxJdFtDgD+ismK kw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pd9qptc80-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 06:22:47 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Mon, 20 Mar
 2023 06:22:45 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Mon, 20 Mar 2023 06:22:45 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8F386B0E;
	Mon, 20 Mar 2023 11:22:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH v3 1/8] firmware: cs_dsp: Introduce no_core_startstop for
 self-booting DSPs
Date: Mon, 20 Mar 2023 11:22:38 +0000
Message-ID: <20230320112245.115720-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230320112245.115720-1-rf@opensource.cirrus.com>
References: <20230320112245.115720-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 87Vl-qHZjsYT_z7Y3PqBjik6yzXav5o9
X-Proofpoint-ORIG-GUID: 87Vl-qHZjsYT_z7Y3PqBjik6yzXav5o9
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TIG2C47TGJXX22HCPAOU3AKOXXJBU7J7
X-Message-ID-Hash: TIG2C47TGJXX22HCPAOU3AKOXXJBU7J7
X-MailFrom: prvs=8443a53618=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TIG2C47TGJXX22HCPAOU3AKOXXJBU7J7/>
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

