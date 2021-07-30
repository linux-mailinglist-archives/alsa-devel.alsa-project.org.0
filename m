Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27D3DBC4D
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 17:28:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 212F1208E;
	Fri, 30 Jul 2021 17:27:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 212F1208E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627658890;
	bh=Iyr9fBqOF4H9OkYDfx2OccsU+CEhyJDiYd4AJoSXpLA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZkG29NgKmBi60BIuofgrPaxvyRYDDVjTLH87rZ31QBH7/fUl+rI+EqT4ClP52BLhh
	 HfHL0gOBL6CLOL/1GUqaJRal/UFEZ+Mf8Qjwnh1iyBwg9PyVXWh1ZJybkhxxnEcyZh
	 g72NB5DbxlYAeALlmkYroFqQGKaeuMzmOdsqCuDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D0C9F805AC;
	Fri, 30 Jul 2021 17:20:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0ECE2F80563; Fri, 30 Jul 2021 17:20:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC117F804FA
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 17:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC117F804FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TddyXOOQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16UEL0dl003614; 
 Fri, 30 Jul 2021 10:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kPMnYciWtAXu6NQ2BEZKqviuN9LILh+HOgCkEAJPCIs=;
 b=TddyXOOQjLCbYRYYIRcqr9UnBbpC0V8EkO2jE/G8KpmaT5IM/nmnUKehiuDmIyzsbAkh
 DBdvsmBe6t8EsrgyIqyjzhSvv96ucVl93LjTBE/j1wr2PGhNDLBzlYlKPtHUhj8pbu2x
 /V0hn980zONmXNG0LpJyMkHfhlbp7b3zFK2f9G//hfMoLztj6SV8/fkSExy3kzZ7quMz
 FeNdKO7KEo5JTZnNLUw7KisEFU7YIqDz1+vtMcbh7bKdpSz/H11j9NDKx1nOUNrg6+W1
 ZQWBZvgSL4V1X9EAy/cRFw5j8z8dvtOEQOHsNVmQovo7U3whdB7JSMbRqz2Djp7URShg tw== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 3a41wd181n-12
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 30 Jul 2021 10:19:22 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 30 Jul
 2021 16:19:12 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 30 Jul 2021 16:19:12 +0100
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.32])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 48E832BA;
 Fri, 30 Jul 2021 15:19:12 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 23/27] ALSA: hda/cs8409: Set fixed sample rate of 48kHz for
 CS42L42
Date: Fri, 30 Jul 2021 16:18:40 +0100
Message-ID: <20210730151844.7873-24-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
References: <20210730151844.7873-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MljEXSRakZH9DWizqavwXNM8GidBFrjh
X-Proofpoint-ORIG-GUID: MljEXSRakZH9DWizqavwXNM8GidBFrjh
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

CS42L42 is configured to use a fixed sample rate of 48kHz.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---

Changes in v2:
- No changes

Changes in v3:
- No changes

 sound/pci/hda/patch_cs8409-tables.c | 8 ++++++++
 sound/pci/hda/patch_cs8409.c        | 6 ++++++
 sound/pci/hda/patch_cs8409.h        | 2 ++
 3 files changed, 16 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index a39b2c20f61c..a9a0b8e3b2a9 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -45,6 +45,14 @@ const struct snd_kcontrol_new cs42l42_adc_volume_mixer = {
 			 HDA_INPUT, CS42L42_VOL_ADC) | HDA_AMP_VAL_MIN_MUTE
 };
 
+const struct hda_pcm_stream cs42l42_48k_pcm_analog_playback = {
+	.rates = SNDRV_PCM_RATE_48000, /* fixed rate */
+};
+
+const struct hda_pcm_stream cs42l42_48k_pcm_analog_capture = {
+	.rates = SNDRV_PCM_RATE_48000, /* fixed rate */
+};
+
 /******************************************************************************
  *                   BULLSEYE / WARLOCK / CYBORG Specific Arrays
  *                               CS8409/CS42L42
diff --git a/sound/pci/hda/patch_cs8409.c b/sound/pci/hda/patch_cs8409.c
index 42192d83b361..08e991a33344 100644
--- a/sound/pci/hda/patch_cs8409.c
+++ b/sound/pci/hda/patch_cs8409.c
@@ -892,6 +892,9 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 
 		break;
 	case HDA_FIXUP_ACT_PROBE:
+		/* Fix Sample Rate to 48kHz */
+		spec->gen.stream_analog_playback = &cs42l42_48k_pcm_analog_playback;
+		spec->gen.stream_analog_capture = &cs42l42_48k_pcm_analog_capture;
 		/* Set initial DMIC volume to -26 dB */
 		snd_hda_codec_amp_init_stereo(codec, CS8409_CS42L42_DMIC_ADC_PIN_NID,
 					      HDA_INPUT, 0, 0xff, 0x19);
@@ -1085,6 +1088,9 @@ void dolphin_fixups(struct hda_codec *codec, const struct hda_fixup *fix, int ac
 
 		break;
 	case HDA_FIXUP_ACT_PROBE:
+		/* Fix Sample Rate to 48kHz */
+		spec->gen.stream_analog_playback = &cs42l42_48k_pcm_analog_playback;
+		spec->gen.stream_analog_capture = &cs42l42_48k_pcm_analog_capture;
 		snd_hda_gen_add_kctl(&spec->gen, "Headphone Playback Volume",
 				     &cs42l42_dac_volume_mixer);
 		snd_hda_gen_add_kctl(&spec->gen, "Mic Capture Volume", &cs42l42_adc_volume_mixer);
diff --git a/sound/pci/hda/patch_cs8409.h b/sound/pci/hda/patch_cs8409.h
index 1b5a8d04ba0f..2208be2ffad1 100644
--- a/sound/pci/hda/patch_cs8409.h
+++ b/sound/pci/hda/patch_cs8409.h
@@ -335,6 +335,8 @@ int cs42l42_volume_info(struct snd_kcontrol *kctrl, struct snd_ctl_elem_info *ui
 int cs42l42_volume_get(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
 int cs42l42_volume_put(struct snd_kcontrol *kctrl, struct snd_ctl_elem_value *uctrl);
 
+extern const struct hda_pcm_stream cs42l42_48k_pcm_analog_playback;
+extern const struct hda_pcm_stream cs42l42_48k_pcm_analog_capture;
 extern const struct snd_pci_quirk cs8409_fixup_tbl[];
 extern const struct hda_model_fixup cs8409_models[];
 extern const struct hda_fixup cs8409_fixups[];
-- 
2.25.1

