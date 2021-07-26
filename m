Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 101393D665A
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jul 2021 20:06:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8891817EE;
	Mon, 26 Jul 2021 20:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8891817EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627322777;
	bh=/j4YL8jOKlavmTbVWm+5bb0fSWc05Cw/WZkJIyMz7UU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jD7IAw0mM/499+Ee3D1A8QecQMWo3LTql3DCqi6V5oxmp5W39R9Ba4W/ACbUJE3dA
	 MqWlV0vnyJG9nRPjgj8B2yEKoyg/wfJXTMZdCt8XPuy2NkqKPjbo3cNSJh76OsWnhR
	 UrYVWLfrGzsQn3dSG77xXb4PblQ1EF3q/WmI32TU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FF49F804E2;
	Mon, 26 Jul 2021 20:03:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C8CDF80528; Mon, 26 Jul 2021 20:03:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF448F802A9
 for <alsa-devel@alsa-project.org>; Mon, 26 Jul 2021 20:03:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF448F802A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ep2byc1L"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16Q2DYd3012545; 
 Mon, 26 Jul 2021 13:03:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=7uxELiRj0vSzoeh0nh4naiKwY8l14XF1YIbCyCAT5YQ=;
 b=ep2byc1LO4xn6fk6b2RKcOYo8N0ghNyJUkPa2ukzUy3JOnEe4M5UqEKLeF9txDqIIb+s
 pxcvWvngjOOdhhtU2mYMfHOdBnmkdM49rIJz6Ab0qVYFdTO6hzFhbmBI0F1SSNlq0UBz
 aWUWNENo//1IPc64cEZHYtAAoUFcFA0VCQV3gAwdxT/xPOcQhfwF3HaJhYNtcmP/TX+C
 BbAY4DKEAyxY9+GFwILKWx0I9hR6s+3UtBG3EB0wHD79Qz6jz9ITzBL9MHiV6hlC3pyI
 YEBEtwWvHNQhpAho0WI0PLVhnWDUr1YdKEtWPznLdCJ5++PUruyJMeqqB9fonN7SSOmY HA== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a17cvhhau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 26 Jul 2021 13:03:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 26 Jul
 2021 18:47:02 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Mon, 26 Jul 2021 18:47:02 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 251B02BA;
 Mon, 26 Jul 2021 17:47:01 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 07/27] ALSA: hda/cs8409: Disable unsolicited responses during
 suspend
Date: Mon, 26 Jul 2021 18:46:20 +0100
Message-ID: <20210726174640.6390-8-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
References: <20210726174640.6390-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: yzWnhJj5hKzUYs0wxNUShzNkZwA0X59K
X-Proofpoint-ORIG-GUID: yzWnhJj5hKzUYs0wxNUShzNkZwA0X59K
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107260105
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

