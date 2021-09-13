Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDD409869
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 18:08:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E752517A0;
	Mon, 13 Sep 2021 18:08:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E752517A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631549331;
	bh=fXf+ywGS/cTyvlRPLN7R/+CI7HPu+fmRHuB11+JHXRQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CH91zvHyRWN4eoWvVKhh8P3+HouY8tK8kfHVn+me73cIrW1tLsW0v+xCrFN5UFxn4
	 pXJqnZZ8PKF+9XpHt8NOvuYA9CDe1jali8rQzLy5kgPsEKz1r3eIGb54p1/a02DZHB
	 I6RE8rqSntTxjWZnPSS/1bNXtuBanf4xdiWdMA+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 06FC3F805B3;
	Mon, 13 Sep 2021 18:02:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3259F8049E; Mon, 13 Sep 2021 18:02:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58319F8049E
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 18:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58319F8049E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="awM3qDCX"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18DAEA6P014550; 
 Mon, 13 Sep 2021 11:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=+1NyDGIefTKtV7GKKWali3tAZDM5tSn5uBEq25JwtI4=;
 b=awM3qDCXc8SunP4jyt4uh8t4tvduuOtIhg8h/C3x+8IXJgcx+QtDOcvtoSbHZwx0r9Fe
 DlfrmSd0ysdTIuNuhhbeSFKKx/Qt6gSkcKKLyJTxULdx5LCGxyJpmm7/y2vE3gNylfbS
 8TVf9exQ8q3Z4oGGxDnEjGUMkQp9NquXNRmZ1XrPAcveBLojOYZfeAvmYwwqoDWlBlHJ
 WA0Nugw7JTw80RGdSZRoGLEVPAOE5XhytLj8o5JQMNcAbngVYD4Yft0jLnvoJ8DoPlFp
 XHYl8AbIsmu7ulBGHGGAes3DKuALmDvhf+3CQwx1Bz1Nhv/CiQBN2uV9V1SzUCxEBwQu Gw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3b1n5drxkd-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 13 Sep 2021 11:01:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 13 Sep
 2021 17:01:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Mon, 13 Sep 2021 17:01:20 +0100
Received: from simont-vb.lan?044ad.cirrus.com (unknown [198.90.238.152])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 87FD22A9;
 Mon, 13 Sep 2021 16:01:20 +0000 (UTC)
From: Simon Trimmer <simont@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 09/16] ASoC: wm_adsp: Move sys_config_size to wm_adsp
Date: Mon, 13 Sep 2021 17:00:50 +0100
Message-ID: <20210913160057.103842-10-simont@opensource.cirrus.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210913160057.103842-1-simont@opensource.cirrus.com>
References: <20210913160057.103842-1-simont@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IlkRT3F61XeeoV7lno96EhsdbC4IFea5
X-Proofpoint-ORIG-GUID: IlkRT3F61XeeoV7lno96EhsdbC4IFea5
X-Proofpoint-Spam-Reason: safe
Cc: Simon Trimmer <simont@opensource.cirrus.com>, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Charles Keepax <ckeepax@opensource.cirrus.com>

sys_config_size is part of the compressed stream support, move it from
what will become generic DSP code so that it remains in ASoC.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 10 +++++-----
 sound/soc/codecs/wm_adsp.h |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 1bca3922a6b8..82038cac4286 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -3467,6 +3467,8 @@ int wm_adsp2_init(struct wm_adsp *dsp)
 {
 	INIT_WORK(&dsp->boot_work, wm_adsp_boot_work);
 
+	dsp->sys_config_size = sizeof(struct wm_adsp_system_config_xm_hdr);
+
 	wm_adsp_common_init(dsp);
 
 	return cs_dsp_adsp2_init(dsp);
@@ -3484,6 +3486,8 @@ int wm_halo_init(struct wm_adsp *dsp)
 {
 	INIT_WORK(&dsp->boot_work, wm_adsp_boot_work);
 
+	dsp->sys_config_size = sizeof(struct wm_halo_system_config_xm_hdr);
+
 	wm_adsp_common_init(dsp);
 
 	return cs_dsp_halo_init(dsp);
@@ -3895,7 +3899,7 @@ static int wm_adsp_buffer_parse_legacy(struct wm_adsp *dsp)
 	if (!buf)
 		return -ENOMEM;
 
-	xmalg = dsp->ops->sys_config_size / sizeof(__be32);
+	xmalg = dsp->sys_config_size / sizeof(__be32);
 
 	addr = alg_region->base + xmalg + ALG_XM_FIELD(magic);
 	ret = cs_dsp_read_data_word(dsp, WMFW_ADSP2_XM, addr, &magic);
@@ -4588,7 +4592,6 @@ static const struct cs_dsp_ops cs_dsp_adsp1_ops = {
 
 static const struct cs_dsp_ops cs_dsp_adsp2_ops[] = {
 	{
-		.sys_config_size = sizeof(struct wm_adsp_system_config_xm_hdr),
 		.parse_sizes = cs_dsp_adsp2_parse_sizes,
 		.validate_version = cs_dsp_validate_version,
 		.setup_algs = cs_dsp_adsp2_setup_algs,
@@ -4607,7 +4610,6 @@ static const struct cs_dsp_ops cs_dsp_adsp2_ops[] = {
 
 	},
 	{
-		.sys_config_size = sizeof(struct wm_adsp_system_config_xm_hdr),
 		.parse_sizes = cs_dsp_adsp2_parse_sizes,
 		.validate_version = cs_dsp_validate_version,
 		.setup_algs = cs_dsp_adsp2_setup_algs,
@@ -4626,7 +4628,6 @@ static const struct cs_dsp_ops cs_dsp_adsp2_ops[] = {
 		.stop_core = cs_dsp_adsp2_stop_core,
 	},
 	{
-		.sys_config_size = sizeof(struct wm_adsp_system_config_xm_hdr),
 		.parse_sizes = cs_dsp_adsp2_parse_sizes,
 		.validate_version = cs_dsp_validate_version,
 		.setup_algs = cs_dsp_adsp2_setup_algs,
@@ -4648,7 +4649,6 @@ static const struct cs_dsp_ops cs_dsp_adsp2_ops[] = {
 };
 
 static const struct cs_dsp_ops cs_dsp_halo_ops = {
-	.sys_config_size = sizeof(struct wm_halo_system_config_xm_hdr),
 	.parse_sizes = cs_dsp_adsp2_parse_sizes,
 	.validate_version = cs_dsp_halo_validate_version,
 	.setup_algs = cs_dsp_halo_setup_algs,
diff --git a/sound/soc/codecs/wm_adsp.h b/sound/soc/codecs/wm_adsp.h
index 114bc41981ef..98b12b485916 100644
--- a/sound/soc/codecs/wm_adsp.h
+++ b/sound/soc/codecs/wm_adsp.h
@@ -81,6 +81,8 @@ struct wm_adsp {
 	const struct cs_dsp_region *mem;
 	int num_mems;
 
+	unsigned int sys_config_size;
+
 	int fw;
 	int fw_ver;
 
@@ -109,8 +111,6 @@ struct wm_adsp {
 };
 
 struct cs_dsp_ops {
-	unsigned int sys_config_size;
-
 	bool (*validate_version)(struct wm_adsp *dsp, unsigned int version);
 	unsigned int (*parse_sizes)(struct wm_adsp *dsp,
 				    const char * const file,
-- 
2.33.0

