Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 141D12E7B8B
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 18:26:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 976D11842;
	Wed, 30 Dec 2020 18:25:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 976D11842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609349180;
	bh=veuQ6Dl+EErZlo+90ZmT2r5VRJ7k+4Rbw9egAUyq0c0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZtP+0KTyDEaNbXpwS2ftd3iE+W6H4vko2Q2eRZV1v50d/3zg2/CD7HMQTRtKWR51
	 mHtTd7Rjbn2+urAo/wziUTvT0gcG0HsGUE2wuJd+UtEyqR0X1t/UQ++0tpEut76Y7C
	 z/w8MTff4iMbhzGxrp66o4r6CJ1gxI3rI5e1cisc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 029A5F801F9;
	Wed, 30 Dec 2020 18:24:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B28B9F801F9; Wed, 30 Dec 2020 18:24:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56ADFF80141
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 18:24:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56ADFF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TCKm14mm"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BUHHJbb022267; Wed, 30 Dec 2020 11:24:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Bdh4mzSs1oTc3kIhJNbwM+rKg4yZ64YLCtzSvA9YfaE=;
 b=TCKm14mmJ7btn6NmNfx3cnOx/xvAYh9uTqPEQByrr+Z9tR9UMpc20LggV35Sl/SSeDHR
 La2+YsJwbl8gMP1h5QXRJuSjFubn831ogl3mwPUJb7r34f3HEHTkqELQ6yehOeD3bez0
 iY+8vNgwXfxb3VckmnNoFPBf0cpN/YWgiXwD0XtLMVdkbMOlwoUfWo5S22DNuxchjmIg
 LNKe5o/NK9nGyM8LzXpal4DqjqO3ZN2bZSUr/eOsfc4JqQoERk660UJ8sB2mL9B1MQWY
 +n6v61aZqH8qylclyADgZ3Jx9TtxgVGvE9XVxk/PPPFWCDVNWCBXLG+GyCPimvdgvJdB KQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35p2fs3gmx-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Dec 2020 11:24:34 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 30 Dec
 2020 17:24:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 30 Dec 2020 17:24:32 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.77])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 22DFD11CC;
 Wed, 30 Dec 2020 17:24:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: wm_adsp: Use snd_ctl_elem_type_t for control types
Date: Wed, 30 Dec 2020 17:24:27 +0000
Message-ID: <20201230172427.13865-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201230172427.13865-1-rf@opensource.cirrus.com>
References: <20201230172427.13865-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 impostorscore=0 mlxscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 mlxlogscore=912 spamscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012300108
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Sparse will complain about trying to convert between values declared
as snd_ctl_elem_type_t and other types. This patch converts to
consistently use snd_ctl_elem_type_t for control type values. A __force
cast is needed in a couple of cases where the control type value is
parsed out of a DSP data block.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm_adsp.c | 12 +++++++-----
 sound/soc/codecs/wmfw.h    |  6 +++---
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 8cfa8ac1b8c4..f8ad768364c2 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -619,7 +619,7 @@ struct wm_coeff_ctl {
 	unsigned int set:1;
 	struct soc_bytes_ext bytes_ext;
 	unsigned int flags;
-	unsigned int type;
+	snd_ctl_elem_type_t type;
 };
 
 static const char *wm_adsp_mem_region_name(unsigned int type)
@@ -1420,7 +1420,7 @@ static int wm_adsp_create_control(struct wm_adsp *dsp,
 				  const struct wm_adsp_alg_region *alg_region,
 				  unsigned int offset, unsigned int len,
 				  const char *subname, unsigned int subname_len,
-				  unsigned int flags, unsigned int type)
+				  unsigned int flags, snd_ctl_elem_type_t type)
 {
 	struct wm_coeff_ctl *ctl;
 	struct wmfw_ctl_work *ctl_work;
@@ -1554,7 +1554,7 @@ struct wm_coeff_parsed_coeff {
 	int mem_type;
 	const u8 *name;
 	int name_len;
-	int ctl_type;
+	snd_ctl_elem_type_t ctl_type;
 	int flags;
 	int len;
 };
@@ -1649,7 +1649,7 @@ static inline void wm_coeff_parse_coeff(struct wm_adsp *dsp, const u8 **data,
 		blk->mem_type = le16_to_cpu(raw->hdr.type);
 		blk->name = raw->name;
 		blk->name_len = strlen(raw->name);
-		blk->ctl_type = le16_to_cpu(raw->ctl_type);
+		blk->ctl_type = (__force snd_ctl_elem_type_t)le16_to_cpu(raw->ctl_type);
 		blk->flags = le16_to_cpu(raw->flags);
 		blk->len = le32_to_cpu(raw->len);
 		break;
@@ -1662,7 +1662,9 @@ static inline void wm_coeff_parse_coeff(struct wm_adsp *dsp, const u8 **data,
 						      &blk->name);
 		wm_coeff_parse_string(sizeof(u8), &tmp, NULL);
 		wm_coeff_parse_string(sizeof(u16), &tmp, NULL);
-		blk->ctl_type = wm_coeff_parse_int(sizeof(raw->ctl_type), &tmp);
+		blk->ctl_type =
+			(__force snd_ctl_elem_type_t)wm_coeff_parse_int(sizeof(raw->ctl_type),
+									&tmp);
 		blk->flags = wm_coeff_parse_int(sizeof(raw->flags), &tmp);
 		blk->len = wm_coeff_parse_int(sizeof(raw->len), &tmp);
 
diff --git a/sound/soc/codecs/wmfw.h b/sound/soc/codecs/wmfw.h
index 7423272c30e9..f3d51602f85c 100644
--- a/sound/soc/codecs/wmfw.h
+++ b/sound/soc/codecs/wmfw.h
@@ -24,9 +24,9 @@
 #define WMFW_CTL_FLAG_READABLE    0x0001
 
 /* Non-ALSA coefficient types start at 0x1000 */
-#define WMFW_CTL_TYPE_ACKED       0x1000 /* acked control */
-#define WMFW_CTL_TYPE_HOSTEVENT   0x1001 /* event control */
-#define WMFW_CTL_TYPE_HOST_BUFFER 0x1002 /* host buffer pointer */
+#define WMFW_CTL_TYPE_ACKED       ((__force snd_ctl_elem_type_t)0x1000) /* acked control */
+#define WMFW_CTL_TYPE_HOSTEVENT   ((__force snd_ctl_elem_type_t)0x1001) /* event control */
+#define WMFW_CTL_TYPE_HOST_BUFFER ((__force snd_ctl_elem_type_t)0x1002) /* host buffer pointer */
 
 struct wmfw_header {
 	char magic[4];
-- 
2.20.1

