Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F362D353F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Dec 2020 22:29:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCEB116E8;
	Tue,  8 Dec 2020 22:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCEB116E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607462984;
	bh=njPpmLKLi1qCRRkOrqjLGRfJ2Le+6xeYHRNRN5crUQA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uzZ1StcEZT/Fvlcw0UXEXf9WhTIJFTkLXuEt//7JyGbUakSP3oCIDqdzE/S1OHLEw
	 qfQnzh54yU3RTa7kyzLNUgnVuIAidT572h6XcuksBiGBcFM2C62H53PXaorvxiDc1K
	 DVXsQlCT2TDBPgya8RYPzjRfasKq02Z3Bunl323c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80468F804E4;
	Tue,  8 Dec 2020 22:26:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EE20F804CB; Tue,  8 Dec 2020 22:26:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,PRX_BODYSUB_1,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C22A4F800E1
 for <alsa-devel@alsa-project.org>; Tue,  8 Dec 2020 22:26:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C22A4F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="afjC1iOz"
Received: by mail-qk1-x742.google.com with SMTP id y18so39849qki.11
 for <alsa-devel@alsa-project.org>; Tue, 08 Dec 2020 13:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PCbjvvYW/oUAsYYOiPy2B4hqPD9ZQRXM+oW07hVjwA=;
 b=afjC1iOzovubWp/4GQ6Js/bxDK26SXI/xXVR0oRDqr0Mo2EDWPCYZvIlMEllYppM4l
 ItJSZTeHzQ93wH+bIMciFnB3UoLkr96n8e4JPiFWzVx7vcdpmt/asHFBpyHB031JVsi5
 dEcLvak53J65PXE64Nsi6bxQ8jzcw8LVrhsjzzByUV2XNp6qo0im4Buwv64BrPZUECWK
 L0x45vEV60JJVknIAZVIZPg361t4kxl7vO1TWnOIMAJ6zy/J5KFJjlfrzybmTN8VMwwM
 1iiQyEC2pXpn9evqDtJVYRtMY+zNWNIaPA2bVIyzp3T60aU97UEYM5UBn32HJGc77CB+
 jRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PCbjvvYW/oUAsYYOiPy2B4hqPD9ZQRXM+oW07hVjwA=;
 b=YbvprB6U7PIYAjjVEYQjeTIciw/npOc8dMdd6H0jjG1PkwvhXAdB0Hsb7BnXI8e9c8
 vB2PWsbBQC6sdsbYiPdpI6+LM+h/d268mZY5FtbGlwIrMjPDD51cEPT6BZnzyy9wYEJY
 uI3a8PlJHiqx7MlrnjPxy3jEfTu9EqM6sveXeujYlMmUUTS/li26vi1tmk8uQCWEWAq5
 S2ZFp7D/NWBJ3eRjphdx+mbIAfhw/PfCM05btzzz1Zqp+pl4GT5UmDQ88Vp21jDYF8fY
 qlKn72lnwCgiBLgt478GKc3T/PHpOylbqijDeQ+v77ZYtEKmt+aCifWu3cNmU2rHcvrI
 24sQ==
X-Gm-Message-State: AOAM533Aldk/tmdZHI9LegpS207sKfH6FJYw16NAt8snxS//bwyi7ohr
 UTYaQxwlVCqG7u5bp/t+lUE=
X-Google-Smtp-Source: ABdhPJyjVSHmpo5gLI6FJWP4ooNOPOrImuORRUjA4iuULRciIA1urWMySFLMMWYv6if89rwkIkrGHg==
X-Received: by 2002:a37:8341:: with SMTP id f62mr16278527qkd.93.1607462787590; 
 Tue, 08 Dec 2020 13:26:27 -0800 (PST)
Received: from localhost.localdomain (cpe-71-65-111-223.cinci.res.rr.com.
 [71.65.111.223])
 by smtp.googlemail.com with ESMTPSA id l1sm16018572qkj.101.2020.12.08.13.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 13:26:27 -0800 (PST)
From: Connor McAdams <conmanx360@gmail.com>
To: 
Subject: [PATCH 4/5] ALSA: hda/ca0132 - Ensure DSP is properly setup
 post-firmware download.
Date: Tue,  8 Dec 2020 16:25:44 -0500
Message-Id: <20201208212546.428392-5-conmanx360@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208212546.428392-1-conmanx360@gmail.com>
References: <20201208212546.428392-1-conmanx360@gmail.com>
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

Make sure that the DSP has no DMA channels allocated once the firmware
is downloaded, and that the default audio streams in use by the DSP are
setup in the correct order.

Signed-off-by: Connor McAdams <conmanx360@gmail.com>
---
 sound/pci/hda/patch_ca0132.c | 127 +++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index cb725586d38b..12fee1146fc2 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -1863,6 +1863,27 @@ static void chipio_set_stream_control(struct hda_codec *codec,
 			CONTROL_PARAM_STREAM_CONTROL, enable);
 }
 
+/*
+ * Get ChipIO audio stream's status.
+ */
+static void chipio_get_stream_control(struct hda_codec *codec,
+				int streamid, unsigned int *enable,
+				bool use_mutex)
+{
+	struct ca0132_spec *spec = codec->spec;
+
+	if (use_mutex)
+		mutex_lock(&spec->chipio_mutex);
+
+	chipio_set_control_param_no_mutex(codec,
+			CONTROL_PARAM_STREAM_ID, streamid);
+	*enable = snd_hda_codec_read(codec, WIDGET_CHIP_CTRL, 0,
+			   VENDOR_CHIPIO_PARAM_GET,
+			   CONTROL_PARAM_STREAM_CONTROL);
+
+	if (use_mutex)
+		mutex_unlock(&spec->chipio_mutex);
+}
 
 /*
  * Set sampling rate of the connection point. NO MUTEX.
@@ -7514,6 +7535,108 @@ static void ca0132_refresh_widget_caps(struct hda_codec *codec)
 	}
 }
 
+
+/* If there is an active channel for some reason, find it and free it. */
+static void ca0132_alt_free_active_dma_channels(struct hda_codec *codec)
+{
+	unsigned int i, tmp;
+	int status;
+
+	/* Read active DSPDMAC channel register. */
+	status = chipio_read(codec, DSPDMAC_CHNLSTART_MODULE_OFFSET, &tmp);
+	if (status >= 0) {
+		/* AND against 0xfff to get the active channel bits. */
+		tmp = tmp & 0xfff;
+
+		/* If there are no active channels, nothing to free. */
+		if (!tmp)
+			return;
+	} else {
+		codec_dbg(codec, "%s: Failed to read active DSP DMA channel register.\n",
+				__func__);
+		return;
+	}
+
+	/*
+	 * Check each DSP DMA channel for activity, and if the channel is
+	 * active, free it.
+	 */
+	for (i = 0; i < DSPDMAC_DMA_CFG_CHANNEL_COUNT; i++) {
+		if (dsp_is_dma_active(codec, i)) {
+			status = dspio_free_dma_chan(codec, i);
+			if (status < 0)
+				codec_dbg(codec, "%s: Failed to free active DSP DMA channel %d.\n",
+						__func__, i);
+		}
+	}
+}
+
+/*
+ * In the case of CT_EXTENSIONS_ENABLE being set to 1, and the DSP being in
+ * use, audio is no longer routed directly to the DAC/ADC from the HDA stream.
+ * Instead, audio is now routed through the DSP's DMA controllers, which
+ * the DSP is tasked with setting up itself. Through debugging, it seems the
+ * cause of most of the no-audio on startup issues were due to improperly
+ * configured DSP DMA channels.
+ *
+ * Normally, the DSP configures these the first time an HDA audio stream is
+ * started post DSP firmware download. That is why creating a 'dummy' stream
+ * worked in fixing the audio in some cases. This works most of the time, but
+ * sometimes if a stream is started/stopped before the DSP can setup the DMA
+ * configuration registers, it ends up in a broken state. Issues can also
+ * arise if streams are started in an unusual order, i.e the audio output dma
+ * channel being sandwiched between the mic1 and mic2 dma channels.
+ *
+ * The solution to this is to make sure that the DSP has no DMA channels
+ * in use post DSP firmware download, and then to manually start each default
+ * DSP stream that uses the DMA channels. These are 0x0c, the audio output
+ * stream, 0x03, analog mic 1, and 0x04, analog mic 2.
+ */
+static void ca0132_alt_start_dsp_audio_streams(struct hda_codec *codec)
+{
+	const unsigned int dsp_dma_stream_ids[] = { 0x0c, 0x03, 0x04 };
+	struct ca0132_spec *spec = codec->spec;
+	unsigned int i, tmp;
+
+	/*
+	 * Check if any of the default streams are active, and if they are,
+	 * stop them.
+	 */
+	for (i = 0; i < ARRAY_SIZE(dsp_dma_stream_ids); i++) {
+		chipio_get_stream_control(codec, dsp_dma_stream_ids[i], &tmp,
+				true);
+
+		if (tmp) {
+			mutex_lock(&spec->chipio_mutex);
+			chipio_set_stream_control(codec,
+					dsp_dma_stream_ids[i], 0);
+			mutex_unlock(&spec->chipio_mutex);
+		}
+	}
+
+	/*
+	 * If all DSP streams are inactive, there should be no active DSP DMA
+	 * channels. Check and make sure this is the case, and if it isn't,
+	 * free any active channels.
+	 */
+	ca0132_alt_free_active_dma_channels(codec);
+
+	mutex_lock(&spec->chipio_mutex);
+
+	/* Make sure stream 0x0c is six channels. */
+	chipio_set_stream_channels(codec, 0x0c, 6);
+
+	for (i = 0; i < ARRAY_SIZE(dsp_dma_stream_ids); i++) {
+		chipio_set_stream_control(codec,
+				dsp_dma_stream_ids[i], 1);
+
+		/* Give the DSP some time to setup the DMA channel. */
+		msleep(75);
+	}
+
+	mutex_unlock(&spec->chipio_mutex);
+}
+
 /*
  * The region of ChipIO memory from 0x190000-0x1903fc is a sort of 'audio
  * router', where each entry represents a 48khz audio channel, with a format
@@ -8251,6 +8374,7 @@ static void r3d_setup_defaults(struct hda_codec *codec)
 
 	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
+	ca0132_alt_start_dsp_audio_streams(codec);
 
 	/*remove DSP headroom*/
 	tmp = FLOAT_ZERO;
@@ -8301,6 +8425,7 @@ static void sbz_setup_defaults(struct hda_codec *codec)
 
 	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
+	ca0132_alt_start_dsp_audio_streams(codec);
 	sbz_connect_streams(codec);
 	sbz_chipio_startup_data(codec);
 
@@ -8360,6 +8485,7 @@ static void ae5_setup_defaults(struct hda_codec *codec)
 
 	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
+	ca0132_alt_start_dsp_audio_streams(codec);
 	chipio_set_stream_control(codec, 0x03, 1);
 	chipio_set_stream_control(codec, 0x04, 1);
 
@@ -8429,6 +8555,7 @@ static void ae7_setup_defaults(struct hda_codec *codec)
 
 	ca0132_alt_dsp_scp_startup(codec);
 	ca0132_alt_init_analog_mics(codec);
+	ca0132_alt_start_dsp_audio_streams(codec);
 	ae7_post_dsp_setup_ports(codec);
 
 	tmp = FLOAT_ZERO;
-- 
2.25.1

