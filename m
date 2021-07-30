Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8AB3DBC44
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:26:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4319E1FB6;
	Fri, 30 Jul 2021 17:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4319E1FB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658766;
	bh=o3O3U1g+jLBWkzHk6nReWolAChi8nucrv+F3JLzI5AA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EqxkaI0syIxuT+yJydCQZmWsupF8KUGpQKBMzR/zvALhINyQW4/HqFO4By9X7cSx3
	 3d4Qoo0NBvrCs1TAR5OLQyQK8q9SAIsZ9ooeqK5CArNmkAHws1d+V2YZuQ94O83q2n
	 yfKAXVQLEzHhctXj1ucdxaJJdc3F+EQgw9geK0Os=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56473F804FB;
	Fri, 30 Jul 2021 17:20:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D669F804E5; Fri, 30 Jul 2021 17:19:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 97E8EF804E2
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97E8EF804E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="cC7nR0O4"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UELBKc004490; 
 Fri, 30 Jul 2021 10:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=GyuBDKCyV1SaoYri8Dc97gkB/CeJ6cBI4M+5dF98PXM=;
 b=cC7nR0O41CDT9JX3QVu9FpLpodBgYCqkfV2T/SfJYB3zMWTpV7PWg9/rFTv93Ou9O31X
 KShqcZYmTeqSer6B7DjJQbZJmf0qHlN/mCgx1wCWYywVrlLEShgp2f6F0DkWqahBLGnF
 o3aPmqfsISnkq54AJx9PCsYNxMJHGa9uKbYNsdFkWuFXRgYvpra3AsF3Mo3xjpKJ9uPf
 RGfEuB3l/oKlE87rgjL7Pll8EP9s0+6Nb2b9jB+Si+kfAVaTdq8ADh2jut5oZYKHZ5LB
 R3vlpKNBL4hSjWzQps/4H/YsmBMNQ+/hZFZqhoIK5RTRAFYXowS3ks5W8LDg3Ofr1K7l hw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181m-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:17 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:08 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:08 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 3509245D;
 Fri, 30 Jul 2021 15:19:08 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 07/27] ALSA: hda/cs8409: Disable unsolicited responses
 during suspend
Date: Fri, 30 Jul 2021 16:18:24 +0100
Message-ID: <20210730151844.7873-8-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: zFd4Bgtw-Iwn67I9jovgG-GMJAn_fMlw
X-Proofpoint-ORIG-GUID: zFd4Bgtw-Iwn67I9jovgG-GMJAn_fMlw
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107300102
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

Ensure unsolicited responses cannot occur whilst the sub codecs are
being disabled.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

 sound/pci/hda/patch_cs8409.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 1745f8b188c6..4906d2913603 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -563,12 +563,26 @@ static void cs8409_jack_unsol_event(struct hda_codec *codec, unsigned int res)
 	}
 }
 
+/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
+static void cs8409_enable_ur(struct hda_codec *codec, int flag)
+{
+	/* GPIO4 INT# and GPIO3 WAKE# */
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
+			    flag ? CS8409_CS42L42_INT : 0);
+
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_UNSOLICITED_ENABLE,
+			    flag ? AC_UNSOL_ENABLED : 0);
+
+}
+
 #ifdef CONFIG_PM
 /* Manage PDREF, when transition to D3hot */
 static int cs8409_suspend(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
 
+	cs8409_enable_ur(codec, 0);
+
 	mutex_lock(&spec->cs8409_i2c_mux);
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
 	cs8409_i2c_write(codec, CS42L42_I2C_ADDR, 0x1101, 0xfe, 1);
@@ -582,18 +596,6 @@ static int cs8409_suspend(struct hda_codec *codec)
 }
 #endif
 
-/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
-static void cs8409_enable_ur(struct hda_codec *codec, int flag)
-{
-	/* GPIO4 INT# and GPIO3 WAKE# */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
-			    flag ? CS8409_CS42L42_INT : 0);
-
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_UNSOLICITED_ENABLE,
-			    flag ? AC_UNSOL_ENABLED : 0);
-
-}
-
 /* Vendor specific HW configuration
  * PLL, ASP, I2C, SPI, GPIOs, DMIC etc...
  */
-- 
2.25.1

