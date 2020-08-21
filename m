Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303524E01D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 20:56:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 27D63167D;
	Fri, 21 Aug 2020 20:55:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 27D63167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036188;
	bh=6S7xZd9u0D/5G9WUICALQxKPwNq3aga+/3IPlcovuC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oY1qM2po+vJCWK31KLrgKCEMKA+dKMjL0fnFaE0yXtqH2LNNENrYIeZuL72YEWypC
	 ir6bmxs8nasU/vrnDDxZrZMI7Stc56FpRKdA4taKJhSckoIwYH7ogtFVsVvq1fcq2O
	 ZUHXUKYbNOM6Gz6dga2zXGmh5TVqpQfH/ko9NRRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B44FBF802C4;
	Fri, 21 Aug 2020 20:53:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5284F8025A; Fri, 21 Aug 2020 20:53:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 687E9F80216
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 687E9F80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NnKLCKzE"
Received: by mail-qk1-x744.google.com with SMTP id p4so2280335qkf.0
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=81C/lA6HY2KxQVDEZQTDvj+0VcawE4mM9Jq8wz/uYUA=;
 b=NnKLCKzEJ3zwmiT37Y5mS4iv3LlWs1mTA41hrC63wKqeWwUGwQ4nr6kNqxefEGcfyW
 oiz8o+vvud516bvDli4cACNy0Iiuywb0l4slFkiIeN+/mA2mXHaJTQzY0Tm0JjyCZ5W5
 KP2/hCSuu4V3qBxwm9242yKP07LAumnRy7bLMFZRpguEisqnztmmziTv+LO2zsDvT3+k
 XG3+mSBN17RW1c92WQDbiBcHygs4ZNmckPkzlngmmyPRpJPCqh24axcI3YRJocpso51G
 gPHqe6DzZhTh/ik2LKaBnYXnd+wjwO+t6JltRxFxwX6YUY7JRkvr2WgfYkgCn1dttehU
 457Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=81C/lA6HY2KxQVDEZQTDvj+0VcawE4mM9Jq8wz/uYUA=;
 b=msbIY9e5ZXTnFAE8PfJPZYeQg2TNnBNv5rKU9BJOefA0+/dMa2sXbaQa3fhM9xYdk0
 kAmmL1cLQXFv60yQjtDDL7RQbso+h6vATa1KluhP0mbETVI5LxgNvJRZb67SmlSyruuY
 ffR/wOAjaj/Yb5lOrava/i+Kh1I8sd2SQ8vqSc1IALIOVhILXF+EihCBD58FCqU70WDY
 1Qalude4FWCGIZcZDDHIo19o3mD9FNbU609pBTydzcBwL5rC5NB6y10R5S0LAcfhbKxS
 FKyLVmsasSOi6uXFaQIYlGmzuIL7BHVssdiDe+amINCO66VnYsr4bmu2FWBG21hWm/0K
 /Pqw==
X-Gm-Message-State: AOAM533sojKKgDDz7RRmqeO56v7OOT5YOZfMXp4APtYjftNezEinweVc
 3ViK0L33WlgAbFxch/h1OKg=
X-Google-Smtp-Source: ABdhPJzb3j9QpbKeWpAL0wKAbMHNJ2M8X+QORSRyjC+q+J6cZmR3z8ZnCfaGmbgtVfdjUTiUnoxmJw==
X-Received: by 2002:a05:620a:1188:: with SMTP id
 b8mr4142269qkk.440.1598036024163; 
 Fri, 21 Aug 2020 11:53:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:43 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 02/20] ALSA: hda/ca0132 - Add speaker tuning initialization
 commands.
Date: Fri, 21 Aug 2020 14:52:19 -0400
Message-Id: <20200821185239.26133-3-conmanx360@gmail.com>
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

