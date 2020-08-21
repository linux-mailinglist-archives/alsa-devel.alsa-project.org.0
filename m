Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B25724E02D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B26F1675;
	Fri, 21 Aug 2020 20:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B26F1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036275;
	bh=lSD4197PM3o9Cm6ZaGPv8wRsEQXWwTWH5+DqdMg4IRo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JXU6Ox36UA67/xUoX8um00v0OUwPa4gF4L+fvCKM4yx4xi3j+Jveh21shvI7oqfuu
	 XGybmZzMoXjzEZZdLK40xSYnlaPSQQn3o0gc59G6yr1XZuRovmURYsQv4iC/CVhMrT
	 NEnXfdaukkqtgXnFFnfu+7Y+ah4mWicHHTnMEpaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39B6EF802E2;
	Fri, 21 Aug 2020 20:54:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1F78F802C4; Fri, 21 Aug 2020 20:53:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C35F800C0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C35F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="raP3mKr4"
Received: by mail-qk1-x741.google.com with SMTP id x69so2284946qkb.1
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uImsmBH23sPzP3vG0wZJKpZ9lS3yeqtfWSNpQPrME7M=;
 b=raP3mKr4A7lnhwddtOU+KsHFwBsUfU4DmOvFodZ+ZhAMifIa7LyDs/w3RVN7QwyTKz
 xHqYwgLYcZVk92DNa3a4MJWTDZjVpQcElsZqXw8d3o8F4wA1YAI2J7+BXS5jFkkHK5Z2
 WQHrbEYeVjcIcs6fKCHPUMoNguLMKvJ7grffrCMjN7BZlz0CKauNeSdortWL0+CpCTSQ
 DA6g4QFA4fYt2Cn8yTOIrakh9wFardQT5YqDuThT4O958X+TwTt/Tg1Smf/5SJtcWfoA
 e8Z4TpIGnGUu3GgsRpHaAVoE0wSjzIqucJ7oq8yWRrFW7UbfRQprt21A1G3vn4cO+fHR
 /nIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uImsmBH23sPzP3vG0wZJKpZ9lS3yeqtfWSNpQPrME7M=;
 b=c34hV0KCQ4o9YibMW/PbawoJLhQUNXOZ5RuA/KMep/O0fheQoFpeXw5TrxmqI4KCcJ
 AZoAkatqCl0DlTkf3FUOrh4GPoLnkGslNwm2EOjys6MTsq6HkMKxx8mTNdzrck6s07Wd
 hmPboxSAqeUyJfjmLU5npd4ttibMZW/hy1vz5Ue6vtU1qJin9mhlZm4yc6jvHUfq/X+n
 O4WmjSJn4V30iAXWfaF5N8rssnAAJOuoxa/bSZwkQd2i/kZzw/6uZkGpxfZewtIDB9HA
 odYX3UoHLz22K+LZn0/M9CHWmCPW2Xb6yTsQn3CFNsc7m/+jpxGWmMzrvZ+c7fog+a/Q
 6lqw==
X-Gm-Message-State: AOAM532pn1G7f2EDFMW6FG8KTskp2jJuxbCKt5e+W24UPzvESK2M3wQB
 lrB6ENduMPqAMGpx3d5sSnM=
X-Google-Smtp-Source: ABdhPJyr5jyoZ/GtZeTtX0UPtZQ/tbTvKysNEHQZjPE6u8dqrcTpgGdOzLcDqfn4X6wl7Z9eCKaAdg==
X-Received: by 2002:ae9:e30f:: with SMTP id v15mr4132536qkf.331.1598036026204; 
 Fri, 21 Aug 2020 11:53:46 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:45 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 03/20] ALSA: hda/ca0132 - Add surround channel config control.
Date: Fri, 21 Aug 2020 14:52:20 -0400
Message-Id: <20200821185239.26133-4-conmanx360@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200821185239.26133-1-conmanx360@gmail.com>
References: <20200821185239.26133-1-conmanx360@gmail.com>
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
index 2e664aeee1c4..dd580f4b741d 100644
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
+		HDA_CODEC_MUTE_MONO("Output: Channels",
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

