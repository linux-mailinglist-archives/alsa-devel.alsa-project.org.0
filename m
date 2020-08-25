Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5F02521E8
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 22:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72EFF16E5;
	Tue, 25 Aug 2020 22:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72EFF16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598386960;
	bh=X/rsSBsrp1CyURzzcODb4xr5RTYCmdchBo9XMpHhySQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YDbQSUwxAncoNaWnSQnkV9kITaPHyRbJH9UgYr7Q0MYDKldOJymiUMhjlmrFO2jRf
	 tQbiUrHwBfkh2mqkrxsu6gydy8MTeqSxMMwunlkFCWj/t5VsxdWfczzCAjgvCX+MZ3
	 +5RkEd2gBvFdE+d9dnCGIG/V+3GjkbvEa3IVHAGM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8697DF8036B;
	Tue, 25 Aug 2020 22:11:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06AC8F80328; Tue, 25 Aug 2020 22:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E548F80328
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 22:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E548F80328
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uMUpTd8p"
Received: by mail-qk1-x744.google.com with SMTP id o64so6192945qkb.10
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 13:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k1da2fAV2EiQh7vVO93ek9apNvvMiSDZUgYoRcsPbOw=;
 b=uMUpTd8pIXKAsSyGriRx+OF2tXnJE4SsTtmcTL2ab7byJwIJ6/ecDegHY9Pl0hOLpC
 wzN1uqYrxzR1PRGExtXidxK5UHtORiW3sDl0hL6tP0HDeKMTN+y2A6XuTjOhY8/HWO8t
 7cQupL5K7IJJevAS5DMJn05ug6aWBhh7VGApTwWBXiTeWKqV3fk/y9RheSySmyUjZwhO
 mi3RXnhr0EF/m1Y4NcRt8S698eFyse8nFwhGxI7JA0SbRItEyafv0zVZAfuiiC4Oq/Du
 vy4Q04Kb6dkQHkdJuiPxDzmfFhYTg/UOVUJmzyc5Qs1YTFUDF6rID/qHdJobMyGgNAyr
 yl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k1da2fAV2EiQh7vVO93ek9apNvvMiSDZUgYoRcsPbOw=;
 b=qV+JjxkYjOWOlWPUVjAR/Aak7hbq/Hb+fdgZ/S4h8WqrqnnjDEpCevUaJWuj42UxZE
 ejP8VV3JnLLJpRqgyYITX3F18XZKmYWdOcPf3YhX93x6UW8+Jw+PueRqta0RzHw43GIH
 uB57Zzp/jm0larTGVZbmz9y+hg4W1b3eEeTdX1/Oev458/T2zvjzuUXNZd+KCw8Jzpin
 X/tkasZ70mNri9gBmHzufBlV6oy+RNU6WdPkLMhdXQD5+nnI4WRM8ew0vSllhuv0EvO1
 ZWoxN51ndy1k/dSywmvfyn6WmY31TT+w/AfeSI8BYxwZqjOz5f4+7LJZAT54zVVtXtRZ
 3Cfg==
X-Gm-Message-State: AOAM531/75NXzqRZpyYecUhyN3z+46ZKDTrIIlTvMF7ASH7jN6aBoqFE
 4ufFGTq9vOAoD6tFFNzI9RU=
X-Google-Smtp-Source: ABdhPJyKcp6cLMiFgvQ+YKy4tk4K8doRDATt69GDmP4uJ61BvaUEIrxKb+v4Ey7qixzGnWTmdsDuCA==
X-Received: by 2002:a37:4856:: with SMTP id v83mr11203807qka.213.1598386293007; 
 Tue, 25 Aug 2020 13:11:33 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223]) by smtp.googlemail.com with ESMTPSA id
 n23sm12453459qkk.105.2020.08.25.13.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 13:11:32 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH v2 17/20] ALSA: hda/ca0132 - Add output selection for
 SoundBlaster AE-7.
Date: Tue, 25 Aug 2020 16:10:36 -0400
Message-Id: <20200825201040.30339-18-conmanx360@gmail.com>
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

Add output selection quirk table information for SoundBlaster AE-7, and
slightly modify the AE-5's ca0113 command table to accommodate the AE-7.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 88 ++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 20 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 8519119ef7a6..dcc8d29d934c 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -727,22 +727,29 @@ static const struct ct_dsp_volume_ctl ca0132_alt_vol_ctls[] = {
 };
 
 /* Values for ca0113_mmio_command_set for selecting output. */
-#define AE5_CA0113_OUT_SET_COMMANDS 6
-struct ae5_ca0113_output_set {
-	unsigned int group[AE5_CA0113_OUT_SET_COMMANDS];
-	unsigned int target[AE5_CA0113_OUT_SET_COMMANDS];
-	unsigned int vals[AE5_CA0113_OUT_SET_COMMANDS];
+#define AE_CA0113_OUT_SET_COMMANDS 6
+struct ae_ca0113_output_set {
+	unsigned int group[AE_CA0113_OUT_SET_COMMANDS];
+	unsigned int target[AE_CA0113_OUT_SET_COMMANDS];
+	unsigned int vals[NUM_OF_OUTPUTS][AE_CA0113_OUT_SET_COMMANDS];
 };
 
-static const struct ae5_ca0113_output_set ae5_ca0113_output_presets[] = {
-	{ .group =  { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
-	  .target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
-	  .vals =   { 0x00, 0x00, 0x40, 0x00, 0x00, 0x3f }
-	},
-	{ .group =  { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
-	  .target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
-	  .vals =   { 0x3f, 0x3f, 0x00, 0x00, 0x00, 0x00 }
-	}
+static const struct ae_ca0113_output_set ae5_ca0113_output_presets = {
+	.group =  { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
+	.target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
+		    /* Speakers. */
+	.vals =   { { 0x00, 0x00, 0x40, 0x00, 0x00, 0x3f },
+		    /* Headphones. */
+		    { 0x3f, 0x3f, 0x00, 0x00, 0x00, 0x00 } },
+};
+
+static const struct ae_ca0113_output_set ae7_ca0113_output_presets = {
+	.group  = { 0x30, 0x30, 0x48, 0x48, 0x48, 0x30 },
+	.target = { 0x2e, 0x30, 0x0d, 0x17, 0x19, 0x32 },
+		    /* Speakers. */
+	.vals   = { { 0x00, 0x00, 0x40, 0x00, 0x00, 0x3f },
+		    /* Headphones. */
+		    { 0x3f, 0x3f, 0x00, 0x00, 0x02, 0x00 } },
 };
 
 /* ae5 ca0113 command sequences to set headphone gain levels. */
@@ -1427,6 +1434,41 @@ static const struct ca0132_alt_out_set_quirk_data quirk_out_set_data[] = {
 		  .chipio_write_addr = 0x0018b03c,
 		  .chipio_write_data = 0x00000012
 		} },
+	},
+	{ .quirk_id = QUIRK_AE7,
+	  .has_headphone_gain = true,
+	  .is_ae_series       = true,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port          = 0x58,
+		  .has_hda_gpio      = false,
+		  .mmio_gpio_count   = 1,
+		  .mmio_gpio_pin     = { 0 },
+		  .mmio_gpio_set     = { 1 },
+		  .scp_cmds_count    = 2,
+		  .scp_cmd_mid       = { 0x96, 0x96 },
+		  .scp_cmd_req       = { SPEAKER_TUNING_FRONT_LEFT_INVERT,
+					 SPEAKER_TUNING_FRONT_RIGHT_INVERT },
+		  .scp_cmd_val       = { FLOAT_ZERO, FLOAT_ZERO },
+		  .has_chipio_write  = true,
+		  .chipio_write_addr = 0x0018b03c,
+		  .chipio_write_data = 0x00000000
+		},
+		/* Headphones. */
+		{ .dac2port          = 0x58,
+		  .has_hda_gpio      = false,
+		  .mmio_gpio_count   = 1,
+		  .mmio_gpio_pin     = { 0 },
+		  .mmio_gpio_set     = { 1 },
+		  .scp_cmds_count    = 2,
+		  .scp_cmd_mid       = { 0x96, 0x96 },
+		  .scp_cmd_req       = { SPEAKER_TUNING_FRONT_LEFT_INVERT,
+					 SPEAKER_TUNING_FRONT_RIGHT_INVERT },
+		  .scp_cmd_val       = { FLOAT_ONE, FLOAT_ONE },
+		  .has_chipio_write  = true,
+		  .chipio_write_addr = 0x0018b03c,
+		  .chipio_write_data = 0x00000010
+		} },
 	}
 };
 
@@ -4383,18 +4425,24 @@ static int ca0132_effects_set(struct hda_codec *codec, hda_nid_t nid, long val);
 static void ae5_mmio_select_out(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
+	const struct ae_ca0113_output_set *out_cmds;
 	unsigned int i;
 
-	for (i = 0; i < AE5_CA0113_OUT_SET_COMMANDS; i++)
-		ca0113_mmio_command_set(codec,
-			ae5_ca0113_output_presets[spec->cur_out_type].group[i],
-			ae5_ca0113_output_presets[spec->cur_out_type].target[i],
-			ae5_ca0113_output_presets[spec->cur_out_type].vals[i]);
+	if (ca0132_quirk(spec) == QUIRK_AE5)
+		out_cmds = &ae5_ca0113_output_presets;
+	else
+		out_cmds = &ae7_ca0113_output_presets;
+
+	for (i = 0; i < AE_CA0113_OUT_SET_COMMANDS; i++)
+		ca0113_mmio_command_set(codec, out_cmds->group[i],
+				out_cmds->target[i],
+				out_cmds->vals[spec->cur_out_type][i]);
 }
 
 static int ca0132_alt_set_full_range_speaker(struct hda_codec *codec)
 {
 	struct ca0132_spec *spec = codec->spec;
+	int quirk = ca0132_quirk(spec);
 	unsigned int tmp;
 	int err;
 
@@ -4426,7 +4474,7 @@ static int ca0132_alt_set_full_range_speaker(struct hda_codec *codec)
 	 * Only the AE series cards set this value when setting full-range,
 	 * and it's always 1.0f.
 	 */
-	if (ca0132_quirk(spec) == QUIRK_AE5) {
+	if (quirk == QUIRK_AE5 || quirk == QUIRK_AE7) {
 		err = dspio_set_uint_param(codec, 0x96,
 				SPEAKER_FULL_RANGE_SURROUND_L_R, FLOAT_ONE);
 		if (err < 0)
-- 
2.20.1

