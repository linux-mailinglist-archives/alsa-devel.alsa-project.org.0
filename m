Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9D03D6683
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:09:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1365018D7;
	Mon, 26 Jul 2021 20:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1365018D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322949;
	bh=6ytRPiiTejSz5Co0adtXsTz5LB749r/+eOJDWItKhR4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KYGQDvKBWQCAuMLW8mrB+EgOAve1eeq0NWw9mzzRy9b1k9lmw+M2kRJmJskn/XGJL
	 Ai1YFQfRWVHg/ZKIkr+10XgqH8JhWnF1VapVJJXXtg11EZ19SwNhIC1ROnkMg1UUEk
	 mjK0zzh+Y5p+0aR0M+l+8t7TpvHB2ncUYC16Sx3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 99A67F80552;
	Mon, 26 Jul 2021 20:03:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69DBFF8053B; Mon, 26 Jul 2021 20:03:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 977E6F80525
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 977E6F80525
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AOHoyuuz"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYd9012545; 
 Mon, 26 Jul 2021 13:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=F80RpzeJeS7KPtF4JW66rFbC/r+Vn/lgQDSKYOpYAy8=;
 b=AOHoyuuzVExKn69AO24Wh7T1mjwj0TI7z2uh23KJuCK7pH8XXtPX4gHEveHUXvLfIdWa
 +6cva2uDvYdcjGhqILXxAFamfxY4LVMTzOFssGiRlNdBRtdbWgCQ5fdliov7vJCcfrm6
 r0HdCgwmZIeeGkV5exMmzA3xOetWjezEPw1KtT0IJhUdosX6LqmtHlkqBPy8oObUrbOL
 YfEXQ3AwcNLWky1kJEE1KHGsLSkJFAVclj4D/+PbFJgnNfUHhVAn2oy7prJQiJbSNfKP
 etc7WiFQdPTR07PStKktG2v4dczGsEVPVwI83EayETO6ghTNCbospppFqcHDzdnhQxTs qA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhau-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:10 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:07 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:07 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A401C2BA;
 Mon, 26 Jul 2021 17:47:07 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 14/27] ALSA: hda/cs8409: Avoid setting the same I2C address
 for every access
Date: Mon, 26 Jul 2021 18:46:27 +0100
Message-ID: <20210726174640.6390-15-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: keJGBBqOOWKzrkn2D2qf6z9XajuVgR-f
X-Proofpoint-ORIG-GUID: keJGBBqOOWKzrkn2D2qf6z9XajuVgR-f
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=994
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>
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

From: Lucas Tanure <tanureal@opensource.cirrus.com>

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 19 +++++++++++++++++--
 sound/pci/hda/patch_cs8409.h |  1 +
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 335bcdc69106..474b6750e9b4 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -128,6 +128,21 @@ static int cs8409_i2c_wait_complete(struct hda_codec *codec)
 	return -1;
 }
 
+/**
+ * cs8409_set_i2c_dev_addr - Set i2c address for transaction
+ * @codec: the codec instance
+ * @addr: I2C Address
+ */
+static void cs8409_set_i2c_dev_addr(struct hda_codec *codec, unsigned int addr)
+{
+	struct cs8409_spec *spec = codec->spec;
+
+	if (spec->dev_addr != addr) {
+		cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, addr);
+		spec->dev_addr = addr;
+	}
+}
+
 /**
  * cs8409_i2c_read - CS8409 I2C Read.
  * @codec: the codec instance
@@ -149,7 +164,7 @@ static int cs8409_i2c_read(struct hda_codec *codec, unsigned int i2c_address, un
 		return -EPERM;
 
 	cs8409_enable_i2c_clock(codec);
-	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
 	if (paged) {
 		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
@@ -195,7 +210,7 @@ static int cs8409_i2c_write(struct hda_codec *codec, unsigned int i2c_address, u
 		return -EPERM;
 
 	cs8409_enable_i2c_clock(codec);
-	cs8409_vendor_coef_set(codec, CS8409_I2C_ADDR, i2c_address);
+	cs8409_set_i2c_dev_addr(codec, i2c_address);
 
 	if (paged) {
 		cs8409_vendor_coef_set(codec, CS8409_I2C_QWRITE, i2c_reg >> 8);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 542582c213d2..c2c208218e34 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -281,6 +281,7 @@ struct cs8409_spec {
 
 	struct mutex cs8409_i2c_mux;
 	unsigned int i2c_clck_enabled;
+	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
 
 	/* verb exec op override */
-- 
2.25.1

