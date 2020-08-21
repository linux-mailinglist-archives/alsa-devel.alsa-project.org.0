Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F8D24E06D
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D4CBF167E;
	Fri, 21 Aug 2020 21:04:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D4CBF167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036697;
	bh=ISBQFiY+P6WA5owrkHPQnu+pq7VFGDPjSgLopoJpghM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uQtknUYUhot1vQnteWxLUog+9HAuI79hfYOEiglcwxoeeJOm7yipnklZ3QrNMeRA0
	 0PPrZ1LVqoEWCVp5gktqmOdrgxH8PfIGZ59jeKdInhfPrv6EJgmWL1Yp5+Ksr82Fez
	 bcJd1Eja7YAvVUtpc1N5KEIAbMCTiEAhbybRrZqE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED715F8035F;
	Fri, 21 Aug 2020 20:54:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6F7CF80317; Fri, 21 Aug 2020 20:54:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C27E4F80304
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C27E4F80304
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qJyCxedG"
Received: by mail-qv1-xf43.google.com with SMTP id l13so1074202qvt.10
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8oxfznRuxrb0aNVbLz/oSH4iUfl8mxNBqknvHByn30A=;
 b=qJyCxedGgqPbgUhudbJC1fhdciQkZwbrZWG5L05yORpgM78RVuYXTyFmiK+yWF5VPJ
 mbEkCIwEB0CK/ZWwM7xc34vPZWDwNjrYMDxhSbMpxJRXBqxwrUZwZ5vsTSMhkMY98wvn
 BTncLGrnBIVnJ4iANimGVmRtuqEjhk92FVoCy1eMH4DvD5jIn5I2lvy3sb4qkIgIYXsx
 yAIYkhl/vtz48AmPKLKcT5DWEVZ+9W2XBjep9G/aCvBAhzsdiz9zh/Mex3m2QnFLAXSS
 cZT2Ktm06xLrzlH4EZHUCK3Wot1VSUaXcSypblwmYmMW5DRjCglVhQTl0+GIrp58GK1S
 ysgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oxfznRuxrb0aNVbLz/oSH4iUfl8mxNBqknvHByn30A=;
 b=N4LcbrJ/gmSNuWZn/guJgBeEnuMQdFNMaEu7b67+y5YqjDwAIlN/+cePxzVEJWVbqn
 lAzv0J0T8OdrX2dyA7SH2JQ+C9FAUbbxSyshWt7ITVq80Iisi5UFS75WYwh66LbRmnX9
 qGZpxT98UDlmBJoRcu2/mIqEn18GB8ZSppd95JP2I/sUs72OyZPeQ6SaE2UFFkSEex9N
 AiygnZcjAoBqWoJ5fCTtGu3mDlNd6LRv/T4KrooH9aYhquJdK0GxUHs7scAvTeFALc7g
 KdvE+Drxy+AGcJeisD7yBPCpS+TKjCxrOm9NVvjZcy32tFcQN15I7GHbrR7F9AGKx6N9
 GGFQ==
X-Gm-Message-State: AOAM533J/GxV5gJEBCn9LEeh54mlxP76nimlTpQOfUj89aLQAuKdg8O/
 owe03nrCUH6lb8ZKR8Tnyqk=
X-Google-Smtp-Source: ABdhPJwyIoGjnn/b6livni1+fFSQ4C7Ne/IqJ8Hey2qSQ/j1ruP1iGJohD1MnFyfdtopPjKPY6SMgw==
X-Received: by 2002:ad4:51c8:: with SMTP id p8mr3614397qvq.31.1598036053138;
 Fri, 21 Aug 2020 11:54:13 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.54.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:54:12 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 17/20] ALSA: hda/ca0132 - Add output selection for
 SoundBlaster AE-7.
Date: Fri, 21 Aug 2020 14:52:34 -0400
Message-Id: <20200821185239.26133-18-conmanx360@gmail.com>
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

Add output selection quirk table information for SoundBlaster AE-7, and
slightly modify the AE-5's ca0113 command table to accommodate the AE-7.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 88 ++++++++++++++++++++++++++++--------
 1 file changed, 68 insertions(+), 20 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 040233b33074..ad594c2d47ec 100644
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

