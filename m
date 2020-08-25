Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3C02521B9
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:15:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B51FE16B0;
	Tue, 25 Aug 2020 22:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B51FE16B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386514;
	bh=yfCHXL3CM15iwn3t/O25ZudgRiYiLOcb4VgELjjYbys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfYoSwoO2JNRlfC/DNxmN6iZT35lYs6qieCMDffG+6k0H5F+ZY+bx9Lha9wgsHIrZ
	 yDQeiafsGiEjYAjwtUeqncpcV5nSLm5unTB5mpLYUYJY0AE1Ty3UcTgjwJmg+t37Xo
	 8GBxsL78tlWXWSwAKPTZjUxZiqVBJm4zP4eFRjkU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 206BEF802F7;
	Tue, 25 Aug 2020 22:11:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4000F802E2; Tue, 25 Aug 2020 22:11:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 023ADF800D1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 023ADF800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mK1eEnbF"
Received: by mail-qt1-x842.google.com with SMTP id x12so10043777qtp.1
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y3YVryPXklllfdxGU+w/IQCrc9AF7mpnZ0z2qTujuJ8=;
 b=mK1eEnbFMbuEq6vr/5IuRN3tRmdLpPEIrymOmhWmNDmV9j+qxrPh9B6L+vZo9ugmXm
 8PGysjggH+SLwzfc4ws25Efk3GgNFwXgk2hcBXVrh2kpNlbSLoLp/Nt6oehqvr6dXdqa
 j0/zzwxMezWQ73DBewBagBo0s0cZ1CiyNolsIRHQL7qZpFFodvSDGd/sAe1od/5DCieB
 zO7ONjxYxBVesuDOurKt0R/wLyUIxAk8oQ947L0zwK7bBIIJj/MuhP41xH0UqyXiMckT
 d8uUeGQcpsMqGANG8jm5DQ7JarsUi5m0OVzOdCQAe08OVdQ+NRF7yrB2AyrCtdXDybsE
 X1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y3YVryPXklllfdxGU+w/IQCrc9AF7mpnZ0z2qTujuJ8=;
 b=fJrMH+1OGbrKKdKnu73cN/XWXzWmRtc5FAN5zyuHEnHQS31iBKo3FvetBoVvlStZoZ
 6wTXSJXFbK8lfjboi0DGN/oX7/xncSsDLuqoB0C0XFtO19Ph8TOh2KqIbW86q0U6tl+R
 sc91Mm96owLvee6+JKrY3U58j/4OJP4jWdrtIxWejZtfXBv7l0wsuSrCc5XdAMNWWC/+
 9iaVVrNTCS68ZIaghIrj34QG0ev4t8BsfCbj8o91f6bkSvk45lprn4t8os0S0g00AfpX
 VqkY7lfNgGiDcIpxKt4PSE55zSB+blzV/gDYcS6K5Fp2V1yhfAN/lyxU+c9ePWsDKsn7
 e9aQ==
X-Gm-Message-State: AOAM530A0Ob+s/jffqwUFk8KcqCgExX0Z2aw1q6hH7pymgDR7cZssV+w
 oCIJeY4FGH4RWjU5xpouDJo=
X-Google-Smtp-Source: ABdhPJxYZEOOmucmMIGwT/JzQtTHt89dm1h1u72DCk2DdcaKfpm6PDuSIA49Q+8WPXU52vqxCOlo1w==
X-Received: by 2002:ac8:6141:: with SMTP id d1mr3025288qtm.170.1598386264388; 
 Tue, 25 Aug 2020 13:11:04 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:04 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 03/20] ALSA: hda/ca0132 - Add surround channel config
 control.
Date: Tue, 25 Aug 2020 16:10:22 -0400
Message-Id: <20200825201040.30339-4-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200825201040.30339-1-conmanx360@gmail.com>
References: <20200825201040.30339-1-conmanx360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, conmanx360@gmail.com,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
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

Add a surround channel configuration enumeration control. Setting up
different channel configurations allows the DSP to upmix stereo audio
into multi-channel audio, and allows for redirection of bass to a
subwoofer.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 110 ++++++++++++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 2e664aeee1c4..1a5fb30b69ab 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -38,6 +38,8 @@
 #define FLOAT_ONE	0x3f800000
 #define FLOAT_TWO	0x40000000
 #define FLOAT_THREE     0x40400000
+#define FLOAT_FIVE	0x40a00000
+#define FLOAT_SIX       0x40c00000
 #define FLOAT_EIGHT     0x41000000
 #define FLOAT_MINUS_5	0xc0a00000
 
@@ -143,7 +145,8 @@ enum {
 	MIC_BOOST_ENUM,
 	AE5_HEADPHONE_GAIN_ENUM,
 	AE5_SOUND_FILTER_ENUM,
-	ZXR_HEADPHONE_GAIN
+	ZXR_HEADPHONE_GAIN,
+	SPEAKER_CHANNEL_CFG_ENUM,
 #define EFFECTS_COUNT  (EFFECT_END_NID - EFFECT_START_NID)
 };
 
@@ -686,6 +689,39 @@ static const struct ca0132_alt_out_set alt_out_presets[] = {
 	}
 };
 
+/* Surround output channel count configuration structures. */
+#define SPEAKER_CHANNEL_CFG_COUNT 5
+enum {
+	SPEAKER_CHANNELS_2_0,
+	SPEAKER_CHANNELS_2_1,
+	SPEAKER_CHANNELS_4_0,
+	SPEAKER_CHANNELS_4_1,
+	SPEAKER_CHANNELS_5_1,
+};
+
+struct ca0132_alt_speaker_channel_cfg {
+	char *name;
+	unsigned int val;
+};
+
+static const struct ca0132_alt_speaker_channel_cfg speaker_channel_cfgs[] = {
+	{ .name = "2.0",
+	  .val = FLOAT_ONE
+	},
+	{ .name = "2.1",
+	  .val = FLOAT_TWO
+	},
+	{ .name = "4.0",
+	  .val = FLOAT_FIVE
+	},
+	{ .name = "4.1",
+	  .val = FLOAT_SIX
+	},
+	{ .name = "5.1",
+	  .val = FLOAT_EIGHT
+	}
+};
+
 /*
  * DSP volume setting structs. Req 1 is left volume, req 2 is right volume,
  * and I don't know what the third req is, but it's always zero. I assume it's
@@ -1063,6 +1099,7 @@ struct ca0132_spec {
 	/* ca0132_alt control related values */
 	unsigned char in_enum_val;
 	unsigned char out_enum_val;
+	unsigned char channel_cfg_val;
 	unsigned char mic_boost_enum_val;
 	unsigned char smart_volume_setting;
 	long fx_ctl_val[EFFECT_LEVEL_SLIDERS];
@@ -4476,7 +4513,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 		snd_hda_set_pin_ctl(codec, spec->out_pins[3],
 				    pin_ctl | PIN_OUT);
 
-		dspio_set_uint_param(codec, 0x80, 0x04, FLOAT_EIGHT);
+		tmp = speaker_channel_cfgs[spec->channel_cfg_val].val;
+		dspio_set_uint_param(codec, 0x80, 0x04, tmp);
 		break;
 	}
 	/*
@@ -5582,6 +5620,54 @@ static int ca0132_alt_output_select_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
+/* Select surround output type: 2.1, 4.0, 4.1, or 5.1. */
+static int ca0132_alt_speaker_channel_cfg_get_info(struct snd_kcontrol *kcontrol,
+				 struct snd_ctl_elem_info *uinfo)
+{
+	unsigned int items = SPEAKER_CHANNEL_CFG_COUNT;
+
+	uinfo->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
+	uinfo->count = 1;
+	uinfo->value.enumerated.items = items;
+	if (uinfo->value.enumerated.item >= items)
+		uinfo->value.enumerated.item = items - 1;
+	strcpy(uinfo->value.enumerated.name,
+			speaker_channel_cfgs[uinfo->value.enumerated.item].name);
+	return 0;
+}
+
+static int ca0132_alt_speaker_channel_cfg_get(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct ca0132_spec *spec = codec->spec;
+
+	ucontrol->value.enumerated.item[0] = spec->channel_cfg_val;
+	return 0;
+}
+
+static int ca0132_alt_speaker_channel_cfg_put(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct ca0132_spec *spec = codec->spec;
+	int sel = ucontrol->value.enumerated.item[0];
+	unsigned int items = SPEAKER_CHANNEL_CFG_COUNT;
+
+	if (sel >= items)
+		return 0;
+
+	codec_dbg(codec, "ca0132_alt_speaker_channels: sel=%d, channels=%s\n",
+		    sel, speaker_channel_cfgs[sel].name);
+
+	spec->channel_cfg_val = sel;
+
+	if (spec->out_enum_val == SURROUND_OUT)
+		ca0132_alt_select_out(codec);
+
+	return 1;
+}
+
 /*
  * Smart Volume output setting control. Three different settings, Normal,
  * which takes the value from the smart volume slider. The two others, loud
@@ -6226,6 +6312,23 @@ static int ca0132_alt_add_output_enum(struct hda_codec *codec)
 				snd_ctl_new1(&knew, codec));
 }
 
+/*
+ * Add a control for selecting channel count on speaker output. Setting this
+ * allows the DSP to do bass redirection and channel upmixing on surround
+ * configurations.
+ */
+static int ca0132_alt_add_speaker_channel_cfg_enum(struct hda_codec *codec)
+{
+	struct snd_kcontrol_new knew =
+		HDA_CODEC_MUTE_MONO("Surround Channel Config",
+				    SPEAKER_CHANNEL_CFG_ENUM, 1, 0, HDA_OUTPUT);
+	knew.info = ca0132_alt_speaker_channel_cfg_get_info;
+	knew.get = ca0132_alt_speaker_channel_cfg_get;
+	knew.put = ca0132_alt_speaker_channel_cfg_put;
+	return snd_hda_ctl_add(codec, SPEAKER_CHANNEL_CFG_ENUM,
+				snd_ctl_new1(&knew, codec));
+}
+
 /*
  * Create an Input Source enumerated control for the alternate ca0132 codecs
  * because the front microphone has no auto-detect, and Line-in has to be set
@@ -6530,6 +6633,9 @@ static int ca0132_build_controls(struct hda_codec *codec)
 	 */
 	if (ca0132_use_alt_functions(spec)) {
 		err = ca0132_alt_add_output_enum(codec);
+		if (err < 0)
+			return err;
+		err = ca0132_alt_add_speaker_channel_cfg_enum(codec);
 		if (err < 0)
 			return err;
 		err = ca0132_alt_add_mic_boost_enum(codec);
-- 
2.20.1

