Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8625A36A19D
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Apr 2021 16:34:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F39CB1746;
	Sat, 24 Apr 2021 16:33:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F39CB1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619274886;
	bh=UMTf9hBu7pol94L5SswiVSNEaISEYeCNHEvkWwa0U6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IblysvUPi8D0HZ09/79YirBUBX29YR17ESJKk1TQyefC2JdJh6uOYhU11ZiNPS+Aw
	 POgE/1XHutOj3jE+bLLu0+JTQHHumrsZhgGq35tFoZWAg4BB+c4f32bXDDb3BUstB+
	 Udp0tqcs2+kubPs4zBZTLKpOTlufWYC0EfJ5t0pE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B03F80275;
	Sat, 24 Apr 2021 16:33:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 683BCF80273; Sat, 24 Apr 2021 16:32:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDA9FF80083
 for <alsa-devel@alsa-project.org>; Sat, 24 Apr 2021 16:32:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDA9FF80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="AGwDhc+7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13OESTDJ031824; Sat, 24 Apr 2021 09:32:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=iSDBMw7lUXC0nxbFWkgwKdryX2zBWk3FQAlbk4Vd6ME=;
 b=AGwDhc+7VkVEVi5OUQ+7m1w2MeCwJAmS1l+ssaFQ7bTc2bdqntKaEe1V21bGOCt0dHMe
 rp0YHrT2KeTZhN7w8qjqouCFvm39jotc7KHkoiG/pAQBUG5Eab6LxohbwAxl1KuyTyMa
 xOIFsH01tEhqd/Y+fwqFcIwZrNRFDY1Xccppu1ehShI+hqcGwCBPm+/r5LtX8c5hQPnw
 fIe6SMXhaY1zQiRZymcluKv7ee4T/xKROHSi6LJpSsFdIwHdPuFKCEvKpQQJ505fv+Rt
 Wlauok7umAgDOcnBs6gP+RLzgIvNuUDsiiF54gqtSZiDs+RWu/Xb2dMYu4uA12DDFaDG aA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 384frs094x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Sat, 24 Apr 2021 09:32:47 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Sat, 24 Apr
 2021 15:32:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Sat, 24 Apr 2021 15:32:45 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.200])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B680C11D6;
 Sat, 24 Apr 2021 14:32:45 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/2] ALSA: hda/cirrus: Use CS8409 Equalizer to fix abnormal
 sounds on Bullseye
Date: Sat, 24 Apr 2021 15:32:44 +0100
Message-ID: <20210424143244.639125-3-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424143244.639125-1-vitalyr@opensource.cirrus.com>
References: <20210424143244.639125-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xiwT5PQu4rn7s4ubWknFajiWxq315qrP
X-Proofpoint-GUID: xiwT5PQu4rn7s4ubWknFajiWxq315qrP
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104240107
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

Tested on DELL Inspiron-3505, DELL Inspiron-3501, DELL Inspiron-3500

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1924997
Reported-and-tested-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 sound/pci/hda/patch_cirrus.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
index d6cf93b7483c..82c5f0869684 100644
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

