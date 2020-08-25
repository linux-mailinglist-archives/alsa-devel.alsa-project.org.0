Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2000F2521B6
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:13:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4C0016A5;
	Tue, 25 Aug 2020 22:12:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4C0016A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386424;
	bh=6S7xZd9u0D/5G9WUICALQxKPwNq3aga+/3IPlcovuC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ODJbQqxZPfVa6o3tz3pl43E+7/XZVrxh7kZHi+UeI9xmze4p9aR+9xFJ9qXr1ta/u
	 zYDsy2KwSZSAlZrS+JFDkO5E4vFlfQkSc1FJGlHSHsCfilbOgaVGbu3tpnGWxiR9vq
	 +7yEGAdWYaUN7V0zD9IcCuBgvcAQFyod7pTjkg7k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0900F802C3;
	Tue, 25 Aug 2020 22:11:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA845F802C3; Tue, 25 Aug 2020 22:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07E07F8026A
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07E07F8026A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YLcGY5Mx"
Received: by mail-qt1-x843.google.com with SMTP id y65so3599401qtd.2
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81C/lA6HY2KxQVDEZQTDvj+0VcawE4mM9Jq8wz/uYUA=;
 b=YLcGY5Mx7CJzSCKqS86IKhVeZI6lXWrdWhYqPATA4Q/3Ia3m9SfovL0wgvJ2U7MCS5
 wuR9C7ACB5L9sOLYYKmGqAfZm0OR5nIBYpBYXiaUNDOu6aBB+fj9rwe7HX7IPbYetqtd
 8Ek4SvDGpwuHi9rMDwv7hrNi5JSmWoQWfbbOE+kHQE9/atEqrIaXa4+dcWvvUc7QL1BT
 //IxusKhH9oKytppAid63HO8I8UXQIJMJbxMCRxIBPMYIPYWwGUMLz/h3dQPpGv7SP8X
 +hagxkxr8rpCKcEo8sAVz9nj0TVXD1LaLQVbqHySKt5GxE57Zwrde1iJf/unZQUCzTi4
 zAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=81C/lA6HY2KxQVDEZQTDvj+0VcawE4mM9Jq8wz/uYUA=;
 b=rfZrWrOCjgH0BGaQycAUwcHUjfGqVBf1r3P/Zyq4rkPUZWRRfMV+Msh4iis4PtbGxM
 UMPIG57jxV7fdZO3YPWwMtkCiCRl2bySOF2rQvdNJwQIAEuDl3c+B7Jbfvv/fsajIMuR
 sCnyBEN3D+JhY7hXvHZ8aZSlE1cqfoTGHwFQtMLy6PatK0m1KLkc97M2BzuWmA1RBjFy
 dHP96tMq0UBkaJVqcr4o2o6DOrH4E3TJ7D8CZvsGhzPX5W0SsiXWZv+yHJ8q9k2bvYzW
 6QZnOczm+fg63fT2SBgalk6xFyTLbuWHLOEg4hoq/Onh0HF7Tgfx/IQMhqVsLuAopY3b
 LDbg==
X-Gm-Message-State: AOAM533smQgtFFm3FYIljbszBUw4ZNMlCMjj/bo/lUCd0Sz1dxNNvl/f
 nYc4NXZ029/McRgxXoKA7NA=
X-Google-Smtp-Source: ABdhPJwuskvK6HPj7W2thApZVZNcdOdNW/RoIlcEBXUC8fe42Of980eEVd3b7I8iBLSfMMyatVsZAw==
X-Received: by 2002:aed:3e59:: with SMTP id m25mr11234505qtf.341.1598386262359; 
 Tue, 25 Aug 2020 13:11:02 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:01 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 02/20] ALSA: hda/ca0132 - Add speaker tuning initialization
 commands.
Date: Tue, 25 Aug 2020 16:10:21 -0400
Message-Id: <20200825201040.30339-3-conmanx360@gmail.com>
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

Add speaker tuning initialization DSP commands, and also define
previously unknown DSP command values.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 7491e2044638..2e664aeee1c4 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -589,6 +589,60 @@ static const struct ct_eq_preset ca0132_alt_eq_presets[] = {
 	}
 };
 
+/*
+ * Definitions for the DSP req's to handle speaker tuning. These all belong to
+ * module ID 0x96, the output effects module.
+ */
+enum speaker_tuning_reqs {
+	/*
+	 * Currently, this value is always set to 0.0f. However, on Windows,
+	 * when selecting certain headphone profiles on the new Sound Blaster
+	 * connect software, the QUERY_SPEAKER_EQ_ADDRESS req on mid 0x80 is
+	 * sent. This gets the speaker EQ address area, which is then used to
+	 * send over (presumably) an equalizer profile for the specific
+	 * headphone setup. It is sent using the same method the DSP
+	 * firmware is uploaded with, which I believe is why the 'ctspeq.bin'
+	 * file exists in linux firmware tree but goes unused. It would also
+	 * explain why the QUERY_SPEAKER_EQ_ADDRESS req is defined but unused.
+	 * Once this profile is sent over, SPEAKER_TUNING_USE_SPEAKER_EQ is
+	 * set to 1.0f.
+	 */
+	SPEAKER_TUNING_USE_SPEAKER_EQ           = 0x1f,
+	SPEAKER_TUNING_ENABLE_CENTER_EQ         = 0x20,
+	SPEAKER_TUNING_FRONT_LEFT_VOL_LEVEL     = 0x21,
+	SPEAKER_TUNING_FRONT_RIGHT_VOL_LEVEL    = 0x22,
+	SPEAKER_TUNING_CENTER_VOL_LEVEL         = 0x23,
+	SPEAKER_TUNING_LFE_VOL_LEVEL            = 0x24,
+	SPEAKER_TUNING_REAR_LEFT_VOL_LEVEL      = 0x25,
+	SPEAKER_TUNING_REAR_RIGHT_VOL_LEVEL     = 0x26,
+	SPEAKER_TUNING_SURROUND_LEFT_VOL_LEVEL  = 0x27,
+	SPEAKER_TUNING_SURROUND_RIGHT_VOL_LEVEL = 0x28,
+	/*
+	 * Inversion is used when setting headphone virtualization to line
+	 * out. Not sure why this is, but it's the only place it's ever used.
+	 */
+	SPEAKER_TUNING_FRONT_LEFT_INVERT        = 0x29,
+	SPEAKER_TUNING_FRONT_RIGHT_INVERT       = 0x2a,
+	SPEAKER_TUNING_CENTER_INVERT            = 0x2b,
+	SPEAKER_TUNING_LFE_INVERT               = 0x2c,
+	SPEAKER_TUNING_REAR_LEFT_INVERT         = 0x2d,
+	SPEAKER_TUNING_REAR_RIGHT_INVERT        = 0x2e,
+	SPEAKER_TUNING_SURROUND_LEFT_INVERT     = 0x2f,
+	SPEAKER_TUNING_SURROUND_RIGHT_INVERT    = 0x30,
+	/* Delay is used when setting surround speaker distance in Windows. */
+	SPEAKER_TUNING_FRONT_LEFT_DELAY         = 0x31,
+	SPEAKER_TUNING_FRONT_RIGHT_DELAY        = 0x32,
+	SPEAKER_TUNING_CENTER_DELAY             = 0x33,
+	SPEAKER_TUNING_LFE_DELAY                = 0x34,
+	SPEAKER_TUNING_REAR_LEFT_DELAY          = 0x35,
+	SPEAKER_TUNING_REAR_RIGHT_DELAY         = 0x36,
+	SPEAKER_TUNING_SURROUND_LEFT_DELAY      = 0x37,
+	SPEAKER_TUNING_SURROUND_RIGHT_DELAY     = 0x38,
+	/* Of these two, only mute seems to ever be used. */
+	SPEAKER_TUNING_MAIN_VOLUME              = 0x39,
+	SPEAKER_TUNING_MUTE                     = 0x3a,
+};
+
 /* DSP command sequences for ca0132_alt_select_out */
 #define ALT_OUT_SET_MAX_COMMANDS 9 /* Max number of commands in sequence */
 struct ca0132_alt_out_set {
@@ -6874,6 +6928,67 @@ static void ca0132_refresh_widget_caps(struct hda_codec *codec)
 	}
 }
 
+/*
+ * Default speaker tuning values setup for alternative codecs.
+ */
+static const unsigned int sbz_default_delay_values[] = {
+	/* Non-zero values are floating point 0.000198. */
+	0x394f9e38, 0x394f9e38, 0x00000000, 0x00000000, 0x00000000, 0x00000000
+};
+
+static const unsigned int zxr_default_delay_values[] = {
+	/* Non-zero values are floating point 0.000220. */
+	0x00000000, 0x00000000, 0x3966afcd, 0x3966afcd, 0x3966afcd, 0x3966afcd
+};
+
+static const unsigned int ae5_default_delay_values[] = {
+	/* Non-zero values are floating point 0.000100. */
+	0x00000000, 0x00000000, 0x38d1b717, 0x38d1b717, 0x38d1b717, 0x38d1b717
+};
+
+/*
+ * If we never change these, probably only need them on initialization.
+ */
+static void ca0132_alt_init_speaker_tuning(struct hda_codec *codec)
+{
+	struct ca0132_spec *spec = codec->spec;
+	unsigned int i, tmp, start_req, end_req;
+	const unsigned int *values;
+
+	switch (ca0132_quirk(spec)) {
+	case QUIRK_SBZ:
+		values = sbz_default_delay_values;
+		break;
+	case QUIRK_ZXR:
+		values = zxr_default_delay_values;
+		break;
+	case QUIRK_AE5:
+		values = ae5_default_delay_values;
+		break;
+	default:
+		values = sbz_default_delay_values;
+		break;
+	}
+
+	tmp = FLOAT_ZERO;
+	dspio_set_uint_param(codec, 0x96, SPEAKER_TUNING_ENABLE_CENTER_EQ, tmp);
+
+	start_req = SPEAKER_TUNING_FRONT_LEFT_VOL_LEVEL;
+	end_req = SPEAKER_TUNING_REAR_RIGHT_VOL_LEVEL;
+	for (i = start_req; i < end_req + 1; i++)
+		dspio_set_uint_param(codec, 0x96, i, tmp);
+
+	start_req = SPEAKER_TUNING_FRONT_LEFT_INVERT;
+	end_req = SPEAKER_TUNING_REAR_RIGHT_INVERT;
+	for (i = start_req; i < end_req + 1; i++)
+		dspio_set_uint_param(codec, 0x96, i, tmp);
+
+
+	for (i = 0; i < 6; i++)
+		dspio_set_uint_param(codec, 0x96,
+				SPEAKER_TUNING_FRONT_LEFT_DELAY + i, values[i]);
+}
+
 /*
  * Creates a dummy stream to bind the output to. This seems to have to be done
  * after changing the main outputs source and destination streams.
@@ -7373,6 +7488,8 @@ static void sbz_setup_defaults(struct hda_codec *codec)
 		}
 	}
 
+	ca0132_alt_init_speaker_tuning(codec);
+
 	ca0132_alt_create_dummy_stream(codec);
 }
 
@@ -7440,6 +7557,8 @@ static void ae5_setup_defaults(struct hda_codec *codec)
 		}
 	}
 
+	ca0132_alt_init_speaker_tuning(codec);
+
 	ca0132_alt_create_dummy_stream(codec);
 }
 
-- 
2.20.1

