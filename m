Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5453236B706
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 18:40:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C009916E6;
	Mon, 26 Apr 2021 18:39:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C009916E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619455229;
	bh=VwRJqVEY7oim+h+fnwZdq1VfEz2FaI8/6c4Br/ZE0yY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oCIr6hDmU+ZvevGRUGcL9pizNepUDK7YayHPNVQC4Ga7nSX+0uC74sDPEgT9LmpoJ
	 OXdq/tKvkLFhmG8sYUBE/ZR62UlxqPTE76yKlNGzf1ZTculMuf5YbSEDbCI1ZbO6kH
	 JW7ZUkB2tEl67EhtAjv7L9rSyDaIqzcegJuxiiAA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16ED5F8032D;
	Mon, 26 Apr 2021 18:38:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE9AF8012A; Mon, 26 Apr 2021 18:38:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F269F80171
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 18:37:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F269F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MZsplVOU"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13QGbpT7021529; Mon, 26 Apr 2021 11:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=oyRaYxN1c8YxoZUWjRQBZgEHAwWWJS79PtLFeoo0jMo=;
 b=MZsplVOUUHQegjlxZ8E/QFuLKMpeLmjHjXIAQhvFWNniD5OcTM/QUXa2qgOcE/nz9R75
 rABdYz+b0+zK/+/bZPlI1U+Ahx0GAfCEqWhtN4HStUBhBKYZw63w5ZAeLBIrOciRrXnH
 ZBVjpgpp5AzbgZRCm0BZj148Ak10aj+LDAna91BlrjZNji1gOXfEYk+kWSIsytrtpbBt
 B6PKRmv8ZTtw9iUmTm1w0pddMy2jZBs1JYICu/tM5v44B1TZ5+/EoiiOZs2Ac8x9IF7p
 wyCrAS2z72h2q2s2wRA+hRHnBS2RiywQ6DJExfQ3+nnboEMkQ/PdKFnNjwfMmK3tMSSV xg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 385wdbrayb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Apr 2021 11:37:51 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Apr
 2021 17:37:50 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Apr 2021 17:37:50 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.203])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B5D6A11D1;
 Mon, 26 Apr 2021 16:37:50 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 2/2] ALSA: hda/cirrus: Use CS8409 filter to fix abnormal
 sounds on Bullseye
Date: Mon, 26 Apr 2021 17:37:49 +0100
Message-ID: <20210426163749.196153-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426163749.196153-1-vitalyr@opensource.cirrus.com>
References: <20210426163749.196153-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: S1dTruTpsKlMW0fh8bcWYZiow1Fe-T_D
X-Proofpoint-GUID: S1dTruTpsKlMW0fh8bcWYZiow1Fe-T_D
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104260127
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 You-Sheng Yang <vicamo.yang@canonical.com>, linux-kernel@vger.kernel.org,
 Stefan Binding <sbinding@opensource.cirrus.com>
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Cracking noises have been reported on the built-in speaker for certain
Bullseye platforms, when volume is > 80%.

This issue is caused by the specific combination of Codec and AMP in
this platform, and cannot be fixed by the AMP, so indead must be fixed
at codec level, by adding attenuation to the volume.

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1924997
Reported-and-tested-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 sound/pci/hda/patch_cirrus.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index a4f82f147ff3..726507d0b04c 100644
--- a/sound/pci/hda/patch_cirrus.c
+++ b/sound/pci/hda/patch_cirrus.c
@@ -1481,6 +1481,34 @@ static const struct cs8409_cir_param cs8409_cs42l42_hw_cfg[] = {
 	{} /* Terminator */
 };
 
+static const struct cs8409_cir_param cs8409_cs42l42_bullseye_atn[] = {
+	{ 0x47, 0x65, 0x4000 }, /* EQ_SEL=1, EQ1/2_EN=0 */
+	{ 0x47, 0x64, 0x4000 }, /* +EQ_ACC */
+	{ 0x47, 0x65, 0x4010 }, /* +EQ2_EN */
+	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
+	{ 0x47, 0x64, 0xc0c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=0, EQ_DATA_LO=0x67 */
+	{ 0x47, 0x63, 0x0647 }, /* EQ_DATA_HI=0x0647 */
+	{ 0x47, 0x64, 0xc1c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=1, EQ_DATA_LO=0x67 */
+	{ 0x47, 0x63, 0xf370 }, /* EQ_DATA_HI=0xf370 */
+	{ 0x47, 0x64, 0xc271 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=2, EQ_DATA_LO=0x71 */
+	{ 0x47, 0x63, 0x1ef8 }, /* EQ_DATA_HI=0x1ef8 */
+	{ 0x47, 0x64, 0xc348 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=3, EQ_DATA_LO=0x48 */
+	{ 0x47, 0x63, 0xc110 }, /* EQ_DATA_HI=0xc110 */
+	{ 0x47, 0x64, 0xc45a }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=4, EQ_DATA_LO=0x5a */
+	{ 0x47, 0x63, 0x1f29 }, /* EQ_DATA_HI=0x1f29 */
+	{ 0x47, 0x64, 0xc574 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=5, EQ_DATA_LO=0x74 */
+	{ 0x47, 0x63, 0x1d7a }, /* EQ_DATA_HI=0x1d7a */
+	{ 0x47, 0x64, 0xc653 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=6, EQ_DATA_LO=0x53 */
+	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
+	{ 0x47, 0x64, 0xc714 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=7, EQ_DATA_LO=0x14 */
+	{ 0x47, 0x63, 0x1ca3 }, /* EQ_DATA_HI=0x1ca3 */
+	{ 0x47, 0x64, 0xc8c7 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=8, EQ_DATA_LO=0xc7 */
+	{ 0x47, 0x63, 0xc38c }, /* EQ_DATA_HI=0xc38c */
+	{ 0x47, 0x64, 0xc914 }, /* +EQ_WRT, +EQ_ACC, EQ_ADR=9, EQ_DATA_LO=0x14 */
+	{ 0x47, 0x64, 0x0000 }, /* -EQ_ACC, -EQ_WRT */
+	{} /* Terminator */
+};
+
 /**
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
@@ -2029,6 +2057,7 @@ static void cs8409_enable_ur(struct hda_codec *codec, int flag)
 static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 {
 	const struct cs8409_cir_param *seq = cs8409_cs42l42_hw_cfg;
+	const struct cs8409_cir_param *seq_bullseye = cs8409_cs42l42_bullseye_atn;
 	struct cs_spec *spec = codec->spec;
 
 	if (spec->gpio_mask) {
@@ -2043,6 +2072,10 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	for (; seq->nid; seq++)
 		cs_vendor_coef_set(codec, seq->cir, seq->coeff);
 
+	if (codec->fixup_id == CS8409_BULLSEYE)
+		for (; seq_bullseye->nid; seq_bullseye++)
+			cs_vendor_coef_set(codec, seq_bullseye->cir, seq_bullseye->coeff);
+
 	/* Disable Unsolicited Response during boot */
 	cs8409_enable_ur(codec, 0);
 
-- 
2.25.1

