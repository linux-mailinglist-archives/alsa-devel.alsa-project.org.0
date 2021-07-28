Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE733D8FC9
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Jul 2021 15:55:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F07B81F9C;
	Wed, 28 Jul 2021 15:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F07B81F9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627480524;
	bh=+tCVyoWtkeiliUC3S6ZH+4u1Kds86Wy29VjmdZJP3ME=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HKaOt83QzoKhtndf0ykL6iSR7NzKVHFQsE5YsnWrBDcI/ypiWQ/P8qluePdJCl/mz
	 bmDkPo+71hfnVGjET2XJlwFNyc2KHv3pzzsZY2yJcrKod5ln6G12IJrC8495qiFuhe
	 FZTBy0/3DM0DSqfroOIPgmgg9Ljy1biRGAYrwC+o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5E1F805CA;
	Wed, 28 Jul 2021 15:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35380F805A1; Wed, 28 Jul 2021 15:45:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF014F804E4
 for <alsa-devel@alsa-project.org>; Wed, 28 Jul 2021 15:44:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF014F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ima5V2sX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16S5XUr0014335; 
 Wed, 28 Jul 2021 08:44:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PNdg/iTwvrhGZ8Mzw2a+J04qei/z4cW0yJCNNtld2Oc=;
 b=ima5V2sXyyaDuEAYzNd2zC09gcguHWf5UMxNic6Q85LtiGPMopDm4rJCY1hPo5N1t27T
 ire+HROor63myCe50ywKzZ9RGYDxJgMKCEoWZvPMNjEaaGzb52zZdY5xmuUTgNSloR7Y
 2JFr/pCLXbvdWrftKDrVwUspGYFSPlhEJ4ZYopMy7ae+UqjvgG7JBM3Z5AVt6KvrP817
 pez+3rxvwur80EzUHWa7BmRy9sHfpJlk3BQkkAOuVMNPSTXGk6Ncv1ftZBoYnyCkEVA6
 JpxzgEdPxHzYAU4kJ7+sm7XWvcs+TmmiM0grQv7YeljGNDCK4rDNnaqdEmAbAoSL2+3U lQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3a30q20fx9-14
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 28 Jul 2021 08:44:42 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 28 Jul
 2021 14:44:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Wed, 28 Jul 2021 14:44:36 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D38D0478;
 Wed, 28 Jul 2021 13:44:35 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 19/27] ALSA: hda/cs8409: Support multiple sub_codecs for
 Suspend/Resume/Unsol events
Date: Wed, 28 Jul 2021 14:44:00 +0100
Message-ID: <20210728134408.369396-20-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
References: <20210728134408.369396-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 59ei803UaRgttdQpLIToxYryrn8o8Tse
X-Proofpoint-GUID: 59ei803UaRgttdQpLIToxYryrn8o8Tse
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280077
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

Changes in v2:
- No changes

---
 sound/pci/hda/patch_cs8409.c | 41 ++++++++++++++++++++++++------------
 1 file changed, 28 insertions(+), 13 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 9d10eaa5d486..d5001f46224f 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -367,16 +367,21 @@ static int cs8409_build_controls(struct hda_codec *codec)
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
@@ -608,6 +613,8 @@ static int cs42l42_jack_unsol_event(struct sub_codec *cs42l42)
 
 static void cs42l42_resume(struct sub_codec *cs42l42)
 {
+	struct hda_codec *codec = cs42l42->codec;
+	unsigned int gpio_data;
 	struct cs8409_i2c_param irq_regs[] = {
 		{ 0x1308, 0x00 },
 		{ 0x1309, 0x00 },
@@ -615,6 +622,12 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
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
@@ -640,10 +653,18 @@ static void cs42l42_resume(struct sub_codec *cs42l42)
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
 
@@ -702,13 +723,12 @@ static void cs8409_cs42l42_jack_unsol_event(struct hda_codec *codec, unsigned in
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
 
 	snd_hda_shutup_pins(codec);
 
@@ -747,11 +767,6 @@ static void cs8409_cs42l42_hw_init(struct hda_codec *codec)
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

