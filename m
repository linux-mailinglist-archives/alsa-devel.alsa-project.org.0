Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F00924E03A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 21:00:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11520167D;
	Fri, 21 Aug 2020 20:59:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11520167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598036417;
	bh=CSwQY9xtfdBO0kmO+AhorKaBgHGwsB4SmwqC0Eze+XU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cJs2Ixmc7Jj6SU29sDlMKQcaK6NUGD1Df1/u6JhsXHAcfprkMgpHmQn6v6ozyS+46
	 cM3St+4fIUA3zATkAx8KSxEhLK4+rS4Hdd7K628wewaU2FxuwZchppoFbNAuX+N039
	 P1YBvA6c6n9YGrJV2uk1b+DF/6VQTu+NUU9vpspE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C17F7F80304;
	Fri, 21 Aug 2020 20:54:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D692F802F8; Fri, 21 Aug 2020 20:54:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1EA2F802DC
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 20:53:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1EA2F802DC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="IFdfuuJi"
Received: by mail-qk1-x741.google.com with SMTP id b14so2276282qkn.4
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 11:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+n5xbyce09VRJj0JvWKv/VRFU9SDNCSH8tjWfdDtKPQ=;
 b=IFdfuuJiba4ZxHVlxSlRTIOf6LScyXwDK+wZ1zIYYDM6yrCXgZWTiymHnI8tP9zr+J
 7CVrW6P7T49QyQDxXec2swWhLj6+3z0XiOxjSPQJzeR3KWfHCK3RJ4aTpSzKcZYsslFK
 lJvj+FVcYVzBQW0O1TvFDNCjLiPX/0rWaA5Sa4YftrJrGWUmcITkuNcRc9f17LfYZerB
 wYLB/M1uko1JIMguDMZaO4wBBMh+uqAZyqlEyT9ngoY4PfXEEPp7V8l5WHvV5Q/w8FZ+
 vkDnlBXhKlTNP5/6oN6Fr7KdGWY8oUC21RFh4HGw8eNa6G9v2s9XJd+3STeWOEOA4pMk
 icow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+n5xbyce09VRJj0JvWKv/VRFU9SDNCSH8tjWfdDtKPQ=;
 b=KoGjVN6PJoc8tL6lf9rijcceXEHqAL2mqwHWFJ5FMtlxcGkjwx0FN0+nwrmFaTlUe6
 SM6EykYbMgpRs9ObMlEWGX+YDJTktSo8HoctWXYte4hp1thln1LJmHhVZM45s3UeTGnl
 l13vqlCO8sEPhsJ4J514mGOOpUKpD/VQzcS1A8vdcro6DVg2h/ia0CIRVBxAzKioP0+D
 MTcsk03OSe+/7dbl3t3rLbXs1y6crrE6vtamcLnOu3JA4hXVIwi5NxCApCRZsoJxHIFu
 ww5A4WOtcsXKXhzuQngPAzkbtoJWmNYPjcYlZK/dPtubD/VwGcgDPKcKO7gWr//xo9gi
 xylg==
X-Gm-Message-State: AOAM533efwEoaQQI4QtGaTGnj6Aa+dWHG0xb7PmZubl3TVJwPawwoeR0
 kHFqkFt45bVu3qEF0OvUBmU=
X-Google-Smtp-Source: ABdhPJzX+6OuuPck8XoQr4Wv0G17haZHR1Bc7nx81WvUmtcMrvxqNNvSFerE4pR/U43BVA43sna4Uw==
X-Received: by 2002:ae9:e30f:: with SMTP id v15mr4133057qkf.331.1598036036062; 
 Fri, 21 Aug 2020 11:53:56 -0700 (PDT)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id o72sm2468426qka.113.2020.08.21.11.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:53:55 -0700 (PDT)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 08/20] ALSA: hda/ca0132 - Add quirk output selection
 structures.
Date: Fri, 21 Aug 2020 14:52:25 -0400
Message-Id: <20200821185239.26133-9-conmanx360@gmail.com>
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

Add structures containing the changes that need to happen on output
selection for each quirk. This should streamline the addition of new
quirks.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 336 +++++++++++++++++++++++++----------
 1 file changed, 241 insertions(+), 95 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index ee25265ab600..ac9dcaf69a2e 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1256,6 +1256,164 @@ static const struct snd_pci_quirk ca0132_quirks[] = {
 	{}
 };
 
+/* Output selection quirk info structures. */
+#define MAX_QUIRK_MMIO_GPIO_SET_VALS 3
+#define MAX_QUIRK_SCP_SET_VALS 2
+struct ca0132_alt_out_set_info {
+	unsigned int dac2port; /* ParamID 0x0d value. */
+
+	bool has_hda_gpio;
+	char hda_gpio_pin;
+	char hda_gpio_set;
+
+	unsigned int mmio_gpio_count;
+	char mmio_gpio_pin[MAX_QUIRK_MMIO_GPIO_SET_VALS];
+	char mmio_gpio_set[MAX_QUIRK_MMIO_GPIO_SET_VALS];
+
+	unsigned int scp_cmds_count;
+	unsigned int scp_cmd_mid[MAX_QUIRK_SCP_SET_VALS];
+	unsigned int scp_cmd_req[MAX_QUIRK_SCP_SET_VALS];
+	unsigned int scp_cmd_val[MAX_QUIRK_SCP_SET_VALS];
+
+	bool has_chipio_write;
+	unsigned int chipio_write_addr;
+	unsigned int chipio_write_data;
+};
+
+struct ca0132_alt_out_set_quirk_data {
+	int quirk_id;
+
+	bool has_headphone_gain;
+	bool is_ae_series;
+
+	struct ca0132_alt_out_set_info out_set_info[NUM_OF_OUTPUTS];
+};
+
+static const struct ca0132_alt_out_set_quirk_data quirk_out_set_data[] = {
+	{ .quirk_id = QUIRK_R3DI,
+	  .has_headphone_gain = false,
+	  .is_ae_series       = false,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port         = 0x24,
+		  .has_hda_gpio     = true,
+		  .hda_gpio_pin     = 2,
+		  .hda_gpio_set     = 1,
+		  .mmio_gpio_count  = 0,
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		},
+		/* Headphones. */
+		{ .dac2port         = 0x21,
+		  .has_hda_gpio     = true,
+		  .hda_gpio_pin     = 2,
+		  .hda_gpio_set     = 0,
+		  .mmio_gpio_count  = 0,
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		} },
+	},
+	{ .quirk_id = QUIRK_R3D,
+	  .has_headphone_gain = false,
+	  .is_ae_series       = false,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port         = 0x24,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 1,
+		  .mmio_gpio_pin    = { 1 },
+		  .mmio_gpio_set    = { 1 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		},
+		/* Headphones. */
+		{ .dac2port         = 0x21,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 1,
+		  .mmio_gpio_pin    = { 1 },
+		  .mmio_gpio_set    = { 0 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		} },
+	},
+	{ .quirk_id = QUIRK_SBZ,
+	  .has_headphone_gain = false,
+	  .is_ae_series       = false,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port         = 0x18,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 3,
+		  .mmio_gpio_pin    = { 7, 4, 1 },
+		  .mmio_gpio_set    = { 0, 1, 1 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false, },
+		/* Headphones. */
+		{ .dac2port         = 0x12,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 3,
+		  .mmio_gpio_pin    = { 7, 4, 1 },
+		  .mmio_gpio_set    = { 1, 1, 0 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		} },
+	},
+	{ .quirk_id = QUIRK_ZXR,
+	  .has_headphone_gain = true,
+	  .is_ae_series       = false,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port         = 0x24,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 3,
+		  .mmio_gpio_pin    = { 2, 3, 5 },
+		  .mmio_gpio_set    = { 1, 1, 0 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		},
+		/* Headphones. */
+		{ .dac2port         = 0x21,
+		  .has_hda_gpio     = false,
+		  .mmio_gpio_count  = 3,
+		  .mmio_gpio_pin    = { 2, 3, 5 },
+		  .mmio_gpio_set    = { 0, 1, 1 },
+		  .scp_cmds_count   = 0,
+		  .has_chipio_write = false,
+		} },
+	},
+	{ .quirk_id = QUIRK_AE5,
+	  .has_headphone_gain = true,
+	  .is_ae_series       = true,
+	  .out_set_info = {
+		/* Speakers. */
+		{ .dac2port          = 0xa4,
+		  .has_hda_gpio      = false,
+		  .mmio_gpio_count   = 0,
+		  .scp_cmds_count    = 2,
+		  .scp_cmd_mid       = { 0x96, 0x96 },
+		  .scp_cmd_req       = { SPEAKER_TUNING_FRONT_LEFT_INVERT,
+					 SPEAKER_TUNING_FRONT_RIGHT_INVERT },
+		  .scp_cmd_val       = { FLOAT_ZERO, FLOAT_ZERO },
+		  .has_chipio_write  = true,
+		  .chipio_write_addr = 0x0018b03c,
+		  .chipio_write_data = 0x00000012
+		},
+		/* Headphones. */
+		{ .dac2port          = 0xa1,
+		  .has_hda_gpio      = false,
+		  .mmio_gpio_count   = 0,
+		  .scp_cmds_count    = 2,
+		  .scp_cmd_mid       = { 0x96, 0x96 },
+		  .scp_cmd_req       = { SPEAKER_TUNING_FRONT_LEFT_INVERT,
+					 SPEAKER_TUNING_FRONT_RIGHT_INVERT },
+		  .scp_cmd_val       = { FLOAT_ONE, FLOAT_ONE },
+		  .has_chipio_write  = true,
+		  .chipio_write_addr = 0x0018b03c,
+		  .chipio_write_data = 0x00000012
+		} },
+	}
+};
+
 /*
  * CA0132 codec access
  */
@@ -3513,26 +3671,6 @@ static void r3di_gpio_mic_set(struct hda_codec *codec,
 			    AC_VERB_SET_GPIO_DATA, cur_gpio);
 }
 
-static void r3di_gpio_out_set(struct hda_codec *codec,
-		enum r3di_out_select cur_out)
-{
-	unsigned int cur_gpio;
-
-	/* Get the current GPIO Data setup */
-	cur_gpio = snd_hda_codec_read(codec, 0x01, 0, AC_VERB_GET_GPIO_DATA, 0);
-
-	switch (cur_out) {
-	case R3DI_HEADPHONE_OUT:
-		cur_gpio &= ~(1 << R3DI_OUT_SELECT_BIT);
-		break;
-	case R3DI_LINE_OUT:
-		cur_gpio |= (1 << R3DI_OUT_SELECT_BIT);
-		break;
-	}
-	snd_hda_codec_write(codec, codec->core.afg, 0,
-			    AC_VERB_SET_GPIO_DATA, cur_gpio);
-}
-
 static void r3di_gpio_dsp_status_set(struct hda_codec *codec,
 		enum r3di_dsp_status dsp_status)
 {
@@ -4314,86 +4452,93 @@ static int ca0132_alt_surround_set_bass_redirection(struct hda_codec *codec,
  * These are the commands needed to setup output on each of the different card
  * types.
  */
-static void ca0132_alt_select_out_quirk_handler(struct hda_codec *codec)
+static void ca0132_alt_select_out_get_quirk_data(struct hda_codec *codec,
+		const struct ca0132_alt_out_set_quirk_data **quirk_data)
 {
 	struct ca0132_spec *spec = codec->spec;
-	unsigned int tmp;
+	int quirk = ca0132_quirk(spec);
+	unsigned int i;
 
-	switch (spec->cur_out_type) {
-	case SPEAKER_OUT:
-		switch (ca0132_quirk(spec)) {
-		case QUIRK_SBZ:
-			ca0113_mmio_gpio_set(codec, 7, false);
-			ca0113_mmio_gpio_set(codec, 4, true);
-			ca0113_mmio_gpio_set(codec, 1, true);
-			chipio_set_control_param(codec, 0x0d, 0x18);
-			break;
-		case QUIRK_ZXR:
-			ca0113_mmio_gpio_set(codec, 2, true);
-			ca0113_mmio_gpio_set(codec, 3, true);
-			ca0113_mmio_gpio_set(codec, 5, false);
-			zxr_headphone_gain_set(codec, 0);
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			break;
-		case QUIRK_R3DI:
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			r3di_gpio_out_set(codec, R3DI_LINE_OUT);
-			break;
-		case QUIRK_R3D:
-			chipio_set_control_param(codec, 0x0d, 0x24);
-			ca0113_mmio_gpio_set(codec, 1, true);
-			break;
-		case QUIRK_AE5:
-			ae5_mmio_select_out(codec);
-			ae5_headphone_gain_set(codec, 2);
-			tmp = FLOAT_ZERO;
-			dspio_set_uint_param(codec, 0x96, 0x29, tmp);
-			dspio_set_uint_param(codec, 0x96, 0x2a, tmp);
-			chipio_set_control_param(codec, 0x0d, 0xa4);
-			chipio_write(codec, 0x18b03c, 0x00000012);
-			break;
-		default:
-			break;
+	*quirk_data = NULL;
+	for (i = 0; i < ARRAY_SIZE(quirk_out_set_data); i++) {
+		if (quirk_out_set_data[i].quirk_id == quirk) {
+			*quirk_data = &quirk_out_set_data[i];
+			return;
 		}
-		break;
-	case HEADPHONE_OUT:
-		switch (ca0132_quirk(spec)) {
-		case QUIRK_SBZ:
-			ca0113_mmio_gpio_set(codec, 7, true);
-			ca0113_mmio_gpio_set(codec, 4, true);
-			ca0113_mmio_gpio_set(codec, 1, false);
-			chipio_set_control_param(codec, 0x0d, 0x12);
-			break;
-		case QUIRK_ZXR:
-			ca0113_mmio_gpio_set(codec, 2, false);
-			ca0113_mmio_gpio_set(codec, 3, false);
-			ca0113_mmio_gpio_set(codec, 5, true);
-			zxr_headphone_gain_set(codec, spec->zxr_gain_set);
-			chipio_set_control_param(codec, 0x0d, 0x21);
-			break;
-		case QUIRK_R3DI:
-			chipio_set_control_param(codec, 0x0d, 0x21);
-			r3di_gpio_out_set(codec, R3DI_HEADPHONE_OUT);
-			break;
-		case QUIRK_R3D:
-			chipio_set_control_param(codec, 0x0d, 0x21);
-			ca0113_mmio_gpio_set(codec, 0x1, false);
-			break;
-		case QUIRK_AE5:
-			ae5_mmio_select_out(codec);
-			ae5_headphone_gain_set(codec,
-					spec->ae5_headphone_gain_val);
-			tmp = FLOAT_ONE;
-			dspio_set_uint_param(codec, 0x96, 0x29, tmp);
-			dspio_set_uint_param(codec, 0x96, 0x2a, tmp);
-			chipio_set_control_param(codec, 0x0d, 0xa1);
-			chipio_write(codec, 0x18b03c, 0x00000012);
-			break;
-		default:
-			break;
+	}
+}
+
+static int ca0132_alt_select_out_quirk_set(struct hda_codec *codec)
+{
+	const struct ca0132_alt_out_set_quirk_data *quirk_data;
+	const struct ca0132_alt_out_set_info *out_info;
+	struct ca0132_spec *spec = codec->spec;
+	unsigned int i, gpio_data;
+	int err;
+
+	ca0132_alt_select_out_get_quirk_data(codec, &quirk_data);
+	if (!quirk_data)
+		return 0;
+
+	out_info = &quirk_data->out_set_info[spec->cur_out_type];
+	if (quirk_data->is_ae_series)
+		ae5_mmio_select_out(codec);
+
+	if (out_info->has_hda_gpio) {
+		gpio_data = snd_hda_codec_read(codec, codec->core.afg, 0,
+				AC_VERB_GET_GPIO_DATA, 0);
+
+		if (out_info->hda_gpio_set)
+			gpio_data |= (1 << out_info->hda_gpio_pin);
+		else
+			gpio_data &= ~(1 << out_info->hda_gpio_pin);
+
+		snd_hda_codec_write(codec, codec->core.afg, 0,
+				    AC_VERB_SET_GPIO_DATA, gpio_data);
+	}
+
+	if (out_info->mmio_gpio_count) {
+		for (i = 0; i < out_info->mmio_gpio_count; i++) {
+			ca0113_mmio_gpio_set(codec, out_info->mmio_gpio_pin[i],
+					out_info->mmio_gpio_set[i]);
 		}
-		break;
 	}
+
+	if (out_info->scp_cmds_count) {
+		for (i = 0; i < out_info->scp_cmds_count; i++) {
+			err = dspio_set_uint_param(codec,
+					out_info->scp_cmd_mid[i],
+					out_info->scp_cmd_req[i],
+					out_info->scp_cmd_val[i]);
+			if (err < 0)
+				return err;
+		}
+	}
+
+	chipio_set_control_param(codec, 0x0d, out_info->dac2port);
+
+	if (out_info->has_chipio_write) {
+		chipio_write(codec, out_info->chipio_write_addr,
+				out_info->chipio_write_data);
+	}
+
+	if (quirk_data->has_headphone_gain) {
+		if (spec->cur_out_type != HEADPHONE_OUT) {
+			if (quirk_data->is_ae_series)
+				ae5_headphone_gain_set(codec, 2);
+			else
+				zxr_headphone_gain_set(codec, 0);
+		} else {
+			if (quirk_data->is_ae_series)
+				ae5_headphone_gain_set(codec,
+						spec->ae5_headphone_gain_val);
+			else
+				zxr_headphone_gain_set(codec,
+						spec->zxr_gain_set);
+		}
+	}
+
+	return 0;
 }
 
 static void ca0132_set_out_node_pincfg(struct hda_codec *codec, hda_nid_t nid,
@@ -4456,7 +4601,8 @@ static int ca0132_alt_select_out(struct hda_codec *codec)
 	if (err < 0)
 		goto exit;
 
-	ca0132_alt_select_out_quirk_handler(codec);
+	if (ca0132_alt_select_out_quirk_set(codec) < 0)
+		goto exit;
 
 	switch (spec->cur_out_type) {
 	case SPEAKER_OUT:
-- 
2.20.1

