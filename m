Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7AE3F987B
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Aug 2021 13:35:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1B2016FE;
	Fri, 27 Aug 2021 13:34:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1B2016FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630064100;
	bh=uECC2qyjg/bxRybz0UecQgCUmTnXIPDbnvhIy53EbQE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WtbvowdjL3iZFKdqyWhv07LwFIe4kkoGdGwYp8rLiLQaP3uyZkMezrgpr1T9bT8Iz
	 tYk2vdij3d1FFq3jEoCLyGlauMtEZEPxPqQUNyGl0FcFvVM29eXOhj00B6YiwTZS0E
	 TqGoCMOtu3cPPWQYJ3tVKy46nEvCmcOkXMYXywj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 08371F8020D;
	Fri, 27 Aug 2021 13:33:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1EB6EF80054; Fri, 27 Aug 2021 13:33:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51C38F80054
 for <alsa-devel@alsa-project.org>; Fri, 27 Aug 2021 13:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51C38F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="lp9H0Op8"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17R81B0B012251; 
 Fri, 27 Aug 2021 06:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=fgC7+0bMytPVb3Z8IsZAuaN8+WcXgaQVIeFmCMgmnaU=;
 b=lp9H0Op8oKZZ7B1t9PrcH85I+L69eIMazO9OF3NG5kvyJ//jzwqb7oIGkwf56fNFfjZ7
 TBI8um9cXaWpFGHjGSuQmcXVsU1ny4AIcvZ47kKnw46YrDNgvv50EongAfnOMDqczvsR
 tKoataG1+G3hyZ/fQuvPY0rrizmkFqlz56hp3xeH4DweJlFin+u14l6wpHil7fLfgBbv
 u+TyCZ+7VWaC2HI3g+JiU0IvZCJ4KlOvPL8F1AGCUsg8Eg4618Kj6ZgpzLSon64pZ2Ms
 EAKknzjvhLjSDeVR9wiptMnysTWbDQX9nt2ViqzcMeTFSi81Ds/fAGVgg1KTLWgJwP2P DA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3apv5sg7fa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 27 Aug 2021 06:33:07 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Fri, 27 Aug
 2021 12:03:01 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Fri, 27 Aug 2021 12:03:01 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.186])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 464E32A9;
 Fri, 27 Aug 2021 11:03:00 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ALSA: hda/cs8409: Ensure Type Detection is only run on
 startup when necessary
Date: Fri, 27 Aug 2021 12:02:51 +0100
Message-ID: <20210827110252.5361-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -41n5sueXKnydCdamrnkG6EbQmwZ7-TS
X-Proofpoint-GUID: -41n5sueXKnydCdamrnkG6EbQmwZ7-TS
X-Proofpoint-Spam-Reason: safe
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

Type Detection should only be run after init and when the controls have been
built. There is no need to run it multiple times.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409.c | 34 ++++++++++++++++++++++++++++------
 sound/pci/hda/patch_cs8409.h |  2 ++
 2 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 9db16b6292f4..805441b7bf86 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -784,6 +784,8 @@ static void cs42l42_suspend(struct sub_codec *cs42l42)
 	cs8409_i2c_write(cs42l42, 0x1102, 0x9C);
 	cs42l42->suspended = 1;
 	cs42l42->last_page = 0;
+	cs42l42->hp_jack_in = 0;
+	cs42l42->mic_jack_in = 0;
 
 	/* Put CS42L42 into Reset */
 	gpio_data = snd_hda_codec_read(codec, CS8409_PIN_AFG, 0, AC_VERB_GET_GPIO_DATA, 0);
@@ -852,6 +854,8 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 	struct cs8409_spec *spec = codec->spec;
 	int i;
 
+	spec->init_done = 0;
+
 	cs8409_enable_ur(codec, 0);
 
 	for (i = 0; i < spec->num_scodecs; i++)
@@ -1025,14 +1029,21 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 		break;
 	case HDA_FIXUP_ACT_INIT:
 		cs8409_cs42l42_hw_init(codec);
-		fallthrough;
+		spec->init_done = 1;
+		if (spec->init_done && spec->build_ctrl_done
+			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
+			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		break;
 	case HDA_FIXUP_ACT_BUILD:
+		spec->build_ctrl_done = 1;
 		/* Run jack auto detect first time on boot
 		 * after controls have been added, to check if jack has
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+		if (spec->init_done && spec->build_ctrl_done
+			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
+			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
 		break;
 	default:
 		break;
@@ -1223,16 +1234,27 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 		break;
 	case HDA_FIXUP_ACT_INIT:
 		dolphin_hw_init(codec);
-		fallthrough;
+		spec->init_done = 1;
+		if (spec->init_done && spec->build_ctrl_done) {
+			for (i = 0; i < spec->num_scodecs; i++) {
+				if (!spec->scodecs[i]->hp_jack_in)
+					cs42l42_run_jack_detect(spec->scodecs[i]);
+			}
+		}
+		break;
 	case HDA_FIXUP_ACT_BUILD:
+		spec->build_ctrl_done = 1;
 		/* Run jack auto detect first time on boot
 		 * after controls have been added, to check if jack has
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
-		for (i = 0; i < spec->num_scodecs; i++)
-			cs42l42_run_jack_detect(spec->scodecs[i]);
-
+		if (spec->init_done && spec->build_ctrl_done) {
+			for (i = 0; i < spec->num_scodecs; i++) {
+				if (!spec->scodecs[i]->hp_jack_in)
+					cs42l42_run_jack_detect(spec->scodecs[i]);
+			}
+		}
 		break;
 	default:
 		break;
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 207315ad5bf6..ade2b838590c 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -333,6 +333,8 @@ struct cs8409_spec {
 
 	unsigned int playback_started:1;
 	unsigned int capture_started:1;
+	unsigned int init_done:1;
+	unsigned int build_ctrl_done:1;
 
 	/* verb exec op override */
 	int (*exec_verb)(struct hdac_device *dev, unsigned int cmd, unsigned int flags,
-- 
2.25.1

