Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 592633E9877
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 21:15:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECDFB1AA7;
	Wed, 11 Aug 2021 21:14:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECDFB1AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628709322;
	bh=s/oSXfo0ifvw9m1n2sWpoys1o9eVuAI7bWUA5yI49WI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iG4wvMUs772czoXl/fvRbLBMmc68D2L0uOsuIEeBstvRwzazh+R4Qh6VJ4DQv6PWd
	 1jHQpYYAN143wp1cnvsSlIV1n3IwTCjfHAjMeblXnPbTxinm3umu8bmtJw7++gpJUT
	 8I6BMHujCqhtbp1SzkOidDUeBcG49xRJ06IVgI0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C26BF804F2;
	Wed, 11 Aug 2021 21:12:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBC5FF804ED; Wed, 11 Aug 2021 21:12:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 59920F802D2
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 21:12:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59920F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="K3QU7Z3E"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17B9hd01013981; 
 Wed, 11 Aug 2021 14:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ohS8GrhqeoqIaFuWNRmyPCnMKH0g5P/XLRaQpWUSjsk=;
 b=K3QU7Z3E0lIelMCKzkCbmcdpv/fh8j3p/pWkJjsIaLaAjNQwm77hrdiEA6OrNjFmBxk0
 QtEq7ucyVcx3SGPa9gkY+Xt+KNHcfi2Ocpui7ESN2UlEDO90z8FEEXzj48Mi5kelkB+L
 v1QzvGJQtiYs9YwC3pT6o2HyxRe1zNHtXEDfmScMoEMToD4nsBYomrR8dcBI+Qu/RIf6
 dhEKUdCI04OnwU/JPgmkbCde6kjmZZixcl+erc2EKEeWpFj0/YwXd39SS3PrnzpqnP2R
 HwkdsNOS/Wue8Ht+elMv9W7v7uYW6oMSSXBVNQW7fKF0Mn067cezlryZqvNzHGuUxH8y xg== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3acc5ngpgw-5
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 11 Aug 2021 14:12:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Wed, 11 Aug
 2021 19:57:31 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Wed, 11 Aug 2021 19:57:31 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.180])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id DF74845D;
 Wed, 11 Aug 2021 18:57:30 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 19/27] ALSA: hda/cs8409: Support multiple sub_codecs for
 Suspend/Resume/Unsol events
Date: Wed, 11 Aug 2021 19:56:46 +0100
Message-ID: <20210811185654.6837-20-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
References: <20210811185654.6837-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: YRJr3VV8jhENIEzG0e0HPdQBQhXh-wtI
X-Proofpoint-GUID: YRJr3VV8jhENIEzG0e0HPdQBQhXh-wtI
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108110132
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

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

Changes in v4:
- No changes

 sound/pci/hda/patch_cs8409.c | 41 ++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 9d1a457c2696..5b3221ddc51b 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -388,16 +388,21 @@ static int cs8409_build_controls(struct hda_codec *codec)
 	return 0;
 }
 
-/* Enable/Disable Unsolicited Response for gpio(s) 3,4 */
+/* Enable/Disable Unsolicited Response */
 static void cs8409_enable_ur(struct hda_codec *codec, int flag)
 {
-	/* GPIO4 INT# and GPIO3 WAKE# */
+	struct cs8409_spec *spec = codec->spec;
+	unsigned int ur_gpios = 0;
+	int i;
+
+	for (i = 0; i < spec->num_scodecs; i++)
+		ur_gpios |= spec->scodecs[i]->irq_mask;
+
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_UNSOLICITED_RSP_MASK,
-			    flag ? CS8409_CS42L42_INT : 0);
+			    flag ? ur_gpios : 0);
 
 	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_UNSOLICITED_ENABLE,
 			    flag ? AC_UNSOL_ENABLED : 0);
-
 }
 
 static void cs8409_fix_caps(struct hda_codec *codec, unsigned int nid)
@@ -629,6 +634,8 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 
 static void cs42l42_resume(struct sub_codec *cs42l42)
 {
+	struct hda_codec *codec = cs42l42->codec;
+	unsigned int gpio_data;
 	struct cs8409_i2c_param irq_regs[] = {
 		{ 0x1308, 0x00 },
 		{ 0x1309, 0x00 },
@@ -636,6 +643,12 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 		{ 0x130F, 0x00 },
 	};
 
+	/* Bring CS42L42 out of Reset */
+	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
+	gpio_data |= cs42l42->reset_gpio;
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, gpio_data);
+	usleep_range(10000, 15000);
+
 	cs42l42->suspended = 0;
 
 	/* Initialize CS42L42 companion codec */
@@ -661,10 +674,18 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
 #ifdef CONFIG_PM
 static void cs42l42_suspend(struct sub_codec *cs42l42)
 {
+	struct hda_codec *codec = cs42l42->codec;
+	unsigned int gpio_data;
+
 	/* Power down CS42L42 ASP/EQ/MIX/HP */
 	cs8409_i2c_write(cs42l42, 0x1101, 0xfe);
 	cs42l42->suspended = 1;
 	cs42l42->last_page = 0;
+
+	/* Put CS42L42 into Reset */
+	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
+	gpio_data &= ~cs42l42->reset_gpio;
+	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, gpio_data);
 }
 #endif
 
@@ -726,13 +747,12 @@ static void cs8409_cs42l42_jack_unsol_event(struct hda_codec *codec, unsigned in
 static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 {
 	struct cs8409_spec *spec = codec->spec;
+	int i;
 
 	cs8409_enable_ur(codec, 0);
 
-	cs42l42_suspend(spec->scodecs[CS8409_CODEC0]);
-
-	/* Assert CS42L42 RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, 0);
+	for (i = 0; i < spec->num_scodecs; i++)
+		cs42l42_suspend(spec->scodecs[i]);
 
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
@@ -775,11 +795,6 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
 	if (codec->fixup_id == CS8409_WARLOCK || codec->fixup_id == CS8409_CYBORG)
 		cs8409_vendor_coef_set(codec, 0x09, 0x0003);
 
-	/* Release RTS# line */
-	snd_hda_codec_write(codec, CS8409_PIN_AFG, 0, AC_VERB_SET_GPIO_DATA, CS8409_CS42L42_RESET);
-	/* wait ~10ms */
-	usleep_range(10000, 15000);
-
 	cs42l42_resume(cs42l42);
 
 	/* Enable Unsolicited Response */
-- 
2.25.1

