Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF4139B885
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Jun 2021 13:55:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B34F11733;
	Fri,  4 Jun 2021 13:54:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B34F11733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622807705;
	bh=44NdcQ+rsFdNFLWEaI9oTddTAvIuNtFAjQvY+xtWv+g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OKUs3jG5/w6jPW9KdheVvBlcwg9S9lkjEEPNQQRBFjjTOxiNtoHYvwAXShz+xOdl9
	 xoWcI5dndvD5A4cmCrZHChAe4zQz9RjkeiDHRpf5DjuQUAoYPCnkNObXoWIQXtgyyg
	 nRB3ZnAu/SSkf+ax5zA1jDDUVyAEPHmAhj8pnqq4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B64BCF804BD;
	Fri,  4 Jun 2021 13:52:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CC89F804C1; Fri,  4 Jun 2021 13:52:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B20FF800CC
 for <alsa-devel@alsa-project.org>; Fri,  4 Jun 2021 13:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B20FF800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="OdIj4B+J"
Received: by mail-ej1-x62e.google.com with SMTP id l1so14063539ejb.6
 for <alsa-devel@alsa-project.org>; Fri, 04 Jun 2021 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SpWpsLvGoiSkhTVHG6YIAJYzTaHR5IbBmirZ4UmP4Lo=;
 b=OdIj4B+JQfGmG5mpYfXqBdfq/L5kSWheL6l+HQG/+Zy2JJtgR+SS6WcLNeNCI0e2aT
 JcuwK2MoxKnmbgpZWTQiPTuhz1cFQ43dQ7juzV1MxrUa5wcz6oci243QatJ+Yb9T1+kl
 /70ngLfl0aXUlLGDmV5DxWJd1DUzNKoUnIPnn7lo6o7aa49msV1MYb1B10FslXpacSKT
 b16XgMq23nj1rof5OeuUnYVgtUx/CONZ6UJInnuVVLkpXykf/jYLCqDWlIeQwLxw56mG
 CzLRsjB09GfRKgYjmXYZ6yjVrnYfyX+s0ctvlwxMADs6SCParbSbsDYW0U/IlnF8sVd7
 qISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SpWpsLvGoiSkhTVHG6YIAJYzTaHR5IbBmirZ4UmP4Lo=;
 b=lKDlBaI2LjKGzCeDfqp3Vr4VYbYkIn7dxnTbCFQvct43Z20O0j6cQ8sHJfg0J/Fm9P
 KZxXjlm766d3l+C2iMKEh1ZmeV0TKBFZ5ZhM1kazWieu5IHB00Xdiye1uW4j2N5L2fAT
 hiRcyoTkNDOMqjCkZtjYNo34uOuP5PAckIwm1iLY846w2pxmTx/rXPimdIaJkBzfn721
 PoiEKHxEMxy6Ujnl1IdQearAFN7EV+m77S4fVwEmqImf2LlH2Wprabo/C6pCXG4kULnq
 ykZjb3nKks/iX6Bi/8snuiUEd6h2MGLfz9e70+1zIhk+/pqnvcScgqj7wmuTjEyFgEYW
 OVrQ==
X-Gm-Message-State: AOAM530SdHd9+PQkqtoY/AGB+5G1Iznc0LZ/Tqmo+bf+gHbC9kqyWHEJ
 sJa9PxlYV9HWChCwMePT8Amr9eK4W1IlKw==
X-Google-Smtp-Source: ABdhPJxbXkizlx/3yAf5NSBXKpkwBadSeQYMRJ65UKzT5P744wv4jJGF2JBu3ZguntfCvQp0vwH7RQ==
X-Received: by 2002:a17:907:2057:: with SMTP id
 pg23mr3710607ejb.113.1622807559043; 
 Fri, 04 Jun 2021 04:52:39 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x9sm2805527eje.64.2021.06.04.04.52.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 04:52:38 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 2/4] ASoC: codecs: wcd: add multi button Headset detection
 support
Date: Fri,  4 Jun 2021 12:52:28 +0100
Message-Id: <20210604115230.23259-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210604115230.23259-1-srinivas.kandagatla@linaro.org>
References: <20210604115230.23259-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com
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

Most new Qualcomm WCD codecs support MBHC(Multi Button Headset Control) via ADC.

This patchset adds support to Common parts of this MBHC support so that
WCD codecs need not duplicate them. To do that codec exposes set of
register fields and callbacks to this common driver to control it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/Kconfig       |    3 +
 sound/soc/codecs/Makefile      |    2 +
 sound/soc/codecs/wcd-mbhc-v2.c | 1475 ++++++++++++++++++++++++++++++++
 sound/soc/codecs/wcd-mbhc-v2.h |  340 ++++++++
 4 files changed, 1820 insertions(+)
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.c
 create mode 100644 sound/soc/codecs/wcd-mbhc-v2.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 196919bc27ab..71a1ef9063cc 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1536,6 +1536,9 @@ config SND_SOC_WCD9335
 	  Qualcomm Technologies, Inc. (QTI) multimedia solutions,
 	  including the MSM8996, MSM8976, and MSM8956 chipsets.
 
+config SND_SOC_WCD_MBHC
+	tristate
+
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index 8c7257035e4c..415ba8236b7f 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -251,6 +251,7 @@ snd-soc-twl6040-objs := twl6040.o
 snd-soc-uda1334-objs := uda1334.o
 snd-soc-uda134x-objs := uda134x.o
 snd-soc-uda1380-objs := uda1380.o
+snd-soc-wcd-mbhc-objs := wcd-mbhc-v2.o
 snd-soc-wcd9335-objs := wcd-clsh-v2.o wcd9335.o
 snd-soc-wcd934x-objs := wcd-clsh-v2.o wcd934x.o
 snd-soc-wl1273-objs := wl1273.o
@@ -574,6 +575,7 @@ obj-$(CONFIG_SND_SOC_TWL6040)	+= snd-soc-twl6040.o
 obj-$(CONFIG_SND_SOC_UDA1334)	+= snd-soc-uda1334.o
 obj-$(CONFIG_SND_SOC_UDA134X)	+= snd-soc-uda134x.o
 obj-$(CONFIG_SND_SOC_UDA1380)	+= snd-soc-uda1380.o
+obj-$(CONFIG_SND_SOC_WCD_MBHC)	+= snd-soc-wcd-mbhc.o
 obj-$(CONFIG_SND_SOC_WCD9335)	+= snd-soc-wcd9335.o
 obj-$(CONFIG_SND_SOC_WCD934X)	+= snd-soc-wcd934x.o
 obj-$(CONFIG_SND_SOC_WL1273)	+= snd-soc-wl1273.o
diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
new file mode 100644
index 000000000000..dee9410650d7
--- /dev/null
+++ b/sound/soc/codecs/wcd-mbhc-v2.c
@@ -0,0 +1,1475 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <linux/printk.h>
+#include <linux/delay.h>
+#include <linux/kernel.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include "wcd-mbhc-v2.h"
+
+#define HS_DETECT_PLUG_TIME_MS		(3 * 1000)
+#define MBHC_BUTTON_PRESS_THRESHOLD_MIN	250
+#define GND_MIC_SWAP_THRESHOLD		4
+#define WCD_FAKE_REMOVAL_MIN_PERIOD_MS	100
+#define HPHL_CROSS_CONN_THRESHOLD	100
+#define HS_VREF_MIN_VAL			1400
+#define FAKE_REM_RETRY_ATTEMPTS		3
+#define WCD_MBHC_ADC_HS_THRESHOLD_MV	1700
+#define WCD_MBHC_ADC_HPH_THRESHOLD_MV	75
+#define WCD_MBHC_ADC_MICBIAS_MV		1800
+#define WCD_MBHC_FAKE_INS_RETRY		4
+
+#define WCD_MBHC_JACK_MASK (SND_JACK_HEADSET | SND_JACK_LINEOUT | \
+			   SND_JACK_MECHANICAL)
+
+#define WCD_MBHC_JACK_BUTTON_MASK (SND_JACK_BTN_0 | SND_JACK_BTN_1 | \
+				  SND_JACK_BTN_2 | SND_JACK_BTN_3 | \
+				  SND_JACK_BTN_4 | SND_JACK_BTN_5)
+
+enum wcd_mbhc_adc_mux_ctl {
+	MUX_CTL_AUTO = 0,
+	MUX_CTL_IN2P,
+	MUX_CTL_IN3P,
+	MUX_CTL_IN4P,
+	MUX_CTL_HPH_L,
+	MUX_CTL_HPH_R,
+	MUX_CTL_NONE,
+};
+
+struct wcd_mbhc {
+	struct device *dev;
+	struct snd_soc_component *component;
+	struct snd_soc_jack *jack;
+	struct wcd_mbhc_config *cfg;
+	const struct wcd_mbhc_cb *mbhc_cb;
+	const struct wcd_mbhc_intr *intr_ids;
+	struct wcd_mbhc_field *fields;
+	/* Delayed work to report long button press */
+	struct delayed_work mbhc_btn_dwork;
+	/* Work to correct accessory type */
+	struct work_struct correct_plug_swch;
+	struct mutex lock;
+	int buttons_pressed;
+	u32 hph_status; /* track headhpone status */
+	u8 current_plug;
+	bool is_btn_press;
+	bool in_swch_irq_handler;
+	bool hs_detect_work_stop;
+	bool is_hs_recording;
+	bool extn_cable_hph_rem;
+	bool force_linein;
+	bool impedance_detect;
+	unsigned long event_state;
+	unsigned long jiffies_atreport;
+	/* impedance of hphl and hphr */
+	uint32_t zl, zr;
+	/* Holds type of Headset - Mono/Stereo */
+	enum wcd_mbhc_hph_type hph_type;
+	/* Holds mbhc detection method - ADC/Legacy */
+	int mbhc_detection_logic;
+};
+
+static inline int wcd_mbhc_write_field(const struct wcd_mbhc *mbhc,
+				       int field, int val)
+{
+	if (!mbhc->fields[field].reg)
+		return 0;
+
+	return snd_soc_component_write_field(mbhc->component,
+					     mbhc->fields[field].reg,
+					     mbhc->fields[field].mask, val);
+}
+
+static inline int wcd_mbhc_read_field(const struct wcd_mbhc *mbhc, int field)
+{
+	if (!mbhc->fields[field].reg)
+		return 0;
+
+	return snd_soc_component_read_field(mbhc->component,
+					    mbhc->fields[field].reg,
+					    mbhc->fields[field].mask);
+}
+
+static void wcd_program_hs_vref(struct wcd_mbhc *mbhc)
+{
+	u32 reg_val = ((mbhc->cfg->v_hs_max - HS_VREF_MIN_VAL) / 100);
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_VREF, reg_val);
+}
+
+static void wcd_program_btn_threshold(const struct wcd_mbhc *mbhc, bool micbias)
+{
+	struct snd_soc_component *component = mbhc->component;
+
+	mbhc->mbhc_cb->set_btn_thr(component, mbhc->cfg->btn_low,
+				   mbhc->cfg->btn_high,
+				   mbhc->cfg->num_btn, micbias);
+}
+
+static void wcd_mbhc_curr_micbias_control(const struct wcd_mbhc *mbhc,
+					  const enum wcd_mbhc_cs_mb_en_flag cs_mb_en)
+{
+
+	/*
+	 * Some codecs handle micbias/pullup enablement in codec
+	 * drivers itself and micbias is not needed for regular
+	 * plug type detection. So if micbias_control callback function
+	 * is defined, just return.
+	 */
+	if (mbhc->mbhc_cb->mbhc_micbias_control)
+		return;
+
+	switch (cs_mb_en) {
+	case WCD_MBHC_EN_CS:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MICB_CTRL, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 3);
+		/* Program Button threshold registers as per CS */
+		wcd_program_btn_threshold(mbhc, false);
+		break;
+	case WCD_MBHC_EN_MB:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+		/* Disable PULL_UP_EN & enable MICBIAS */
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MICB_CTRL, 2);
+		/* Program Button threshold registers as per MICBIAS */
+		wcd_program_btn_threshold(mbhc, true);
+		break;
+	case WCD_MBHC_EN_PULLUP:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 3);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MICB_CTRL, 1);
+		/* Program Button threshold registers as per MICBIAS */
+		wcd_program_btn_threshold(mbhc, true);
+		break;
+	case WCD_MBHC_EN_NONE:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MICB_CTRL, 0);
+		break;
+	default:
+		dev_err(mbhc->dev, "%s: Invalid parameter", __func__);
+		break;
+	}
+}
+
+int wcd_mbhc_event_notify(struct wcd_mbhc *mbhc, unsigned long event)
+{
+
+	struct snd_soc_component *component;
+	bool micbias2 = false;
+
+	if (!mbhc)
+		return 0;
+
+	component = mbhc->component;
+
+	if (mbhc->mbhc_cb->micbias_enable_status)
+		micbias2 = mbhc->mbhc_cb->micbias_enable_status(component, MIC_BIAS_2);
+
+	switch (event) {
+	/* MICBIAS usage change */
+	case WCD_EVENT_POST_DAPM_MICBIAS_2_ON:
+		mbhc->is_hs_recording = true;
+		break;
+	case WCD_EVENT_POST_MICBIAS_2_ON:
+		/* Disable current source if micbias2 enabled */
+		if (mbhc->mbhc_cb->mbhc_micbias_control) {
+			if (wcd_mbhc_read_field(mbhc, WCD_MBHC_FSM_EN))
+				wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+		} else {
+			mbhc->is_hs_recording = true;
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_MB);
+		}
+		break;
+	case WCD_EVENT_PRE_MICBIAS_2_OFF:
+		/*
+		 * Before MICBIAS_2 is turned off, if FSM is enabled,
+		 * make sure current source is enabled so as to detect
+		 * button press/release events
+		 */
+		if (mbhc->mbhc_cb->mbhc_micbias_control/* && !mbhc->micbias_enable*/) {
+			if (wcd_mbhc_read_field(mbhc, WCD_MBHC_FSM_EN))
+				wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 3);
+		}
+		break;
+	/* MICBIAS usage change */
+	case WCD_EVENT_POST_DAPM_MICBIAS_2_OFF:
+		mbhc->is_hs_recording = false;
+		break;
+	case WCD_EVENT_POST_MICBIAS_2_OFF:
+		if (!mbhc->mbhc_cb->mbhc_micbias_control)
+			mbhc->is_hs_recording = false;
+
+		/* Enable PULL UP if PA's are enabled */
+		if ((test_bit(WCD_MBHC_EVENT_PA_HPHL, &mbhc->event_state)) ||
+		    (test_bit(WCD_MBHC_EVENT_PA_HPHR, &mbhc->event_state)))
+			/* enable pullup and cs, disable mb */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_PULLUP);
+		else
+			/* enable current source and disable mb, pullup*/
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_CS);
+
+		break;
+	case WCD_EVENT_POST_HPHL_PA_OFF:
+		clear_bit(WCD_MBHC_EVENT_PA_HPHL, &mbhc->event_state);
+
+		/* check if micbias is enabled */
+		if (micbias2)
+			/* Disable cs, pullup & enable micbias */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_MB);
+		else
+			/* Disable micbias, pullup & enable cs */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_CS);
+		break;
+	case WCD_EVENT_POST_HPHR_PA_OFF:
+		clear_bit(WCD_MBHC_EVENT_PA_HPHR, &mbhc->event_state);
+		/* check if micbias is enabled */
+		if (micbias2)
+			/* Disable cs, pullup & enable micbias */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_MB);
+		else
+			/* Disable micbias, pullup & enable cs */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_CS);
+		break;
+	case WCD_EVENT_PRE_HPHL_PA_ON:
+		set_bit(WCD_MBHC_EVENT_PA_HPHL, &mbhc->event_state);
+		/* check if micbias is enabled */
+		if (micbias2)
+			/* Disable cs, pullup & enable micbias */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_MB);
+		else
+			/* Disable micbias, enable pullup & cs */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_PULLUP);
+		break;
+	case WCD_EVENT_PRE_HPHR_PA_ON:
+		set_bit(WCD_MBHC_EVENT_PA_HPHR, &mbhc->event_state);
+		/* check if micbias is enabled */
+		if (micbias2)
+			/* Disable cs, pullup & enable micbias */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_MB);
+		else
+			/* Disable micbias, enable pullup & cs */
+			wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_PULLUP);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wcd_mbhc_event_notify);
+
+static int wcd_cancel_btn_work(struct wcd_mbhc *mbhc)
+{
+	return cancel_delayed_work_sync(&mbhc->mbhc_btn_dwork);
+}
+
+static void wcd_micbias_disable(struct wcd_mbhc *mbhc)
+{
+	struct snd_soc_component *component = mbhc->component;
+
+	if (mbhc->mbhc_cb->mbhc_micbias_control)
+		mbhc->mbhc_cb->mbhc_micbias_control(component, MIC_BIAS_2, MICB_DISABLE);
+
+	if (mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic)
+		mbhc->mbhc_cb->mbhc_micb_ctrl_thr_mic(component, MIC_BIAS_2, false);
+
+	if (mbhc->mbhc_cb->set_micbias_value) {
+		mbhc->mbhc_cb->set_micbias_value(component);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MICB_CTRL, 0);
+	}
+}
+
+static void wcd_mbhc_report_plug_removal(struct wcd_mbhc *mbhc,
+					 enum snd_jack_types jack_type)
+{
+	mbhc->hph_status &= ~jack_type;
+	/*
+	 * cancel possibly scheduled btn work and
+	 * report release if we reported button press
+	 */
+	if (!wcd_cancel_btn_work(mbhc) && mbhc->buttons_pressed) {
+		snd_soc_jack_report(mbhc->jack, 0, mbhc->buttons_pressed);
+		mbhc->buttons_pressed &= ~WCD_MBHC_JACK_BUTTON_MASK;
+	}
+
+	wcd_micbias_disable(mbhc);
+	mbhc->hph_type = WCD_MBHC_HPH_NONE;
+	mbhc->zl = mbhc->zr = 0;
+	snd_soc_jack_report(mbhc->jack, mbhc->hph_status, WCD_MBHC_JACK_MASK);
+	mbhc->current_plug = MBHC_PLUG_TYPE_NONE;
+	mbhc->force_linein = false;
+}
+
+static void wcd_mbhc_compute_impedance(struct wcd_mbhc *mbhc)
+{
+
+	if (!mbhc->impedance_detect)
+		return;
+
+	if (mbhc->cfg->linein_th != 0) {
+		u8 fsm_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_FSM_EN);
+		/* Set MUX_CTL to AUTO for Z-det */
+
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_MUX_CTL, MUX_CTL_AUTO);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+		mbhc->mbhc_cb->compute_impedance(mbhc->component, &mbhc->zl, &mbhc->zr);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, fsm_en);
+	}
+}
+
+static void wcd_mbhc_report_plug_insertion(struct wcd_mbhc *mbhc,
+					   enum snd_jack_types jack_type)
+{
+	bool is_pa_on;
+	/*
+	 * Report removal of current jack type.
+	 * Headphone to headset shouldn't report headphone
+	 * removal.
+	 */
+	if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADSET &&
+	    jack_type == SND_JACK_HEADPHONE)
+		mbhc->hph_status &= ~SND_JACK_HEADSET;
+
+	/* Report insertion */
+	switch (jack_type) {
+	case SND_JACK_HEADPHONE:
+		mbhc->current_plug = MBHC_PLUG_TYPE_HEADPHONE;
+		break;
+	case SND_JACK_HEADSET:
+		mbhc->current_plug = MBHC_PLUG_TYPE_HEADSET;
+		mbhc->jiffies_atreport = jiffies;
+		break;
+	case SND_JACK_LINEOUT:
+		mbhc->current_plug = MBHC_PLUG_TYPE_HIGH_HPH;
+		break;
+	default:
+		break;
+	}
+
+
+	is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
+
+	if (!is_pa_on) {
+		wcd_mbhc_compute_impedance(mbhc);
+		if ((mbhc->zl > mbhc->cfg->linein_th) &&
+		    (mbhc->zr > mbhc->cfg->linein_th) &&
+		    (jack_type == SND_JACK_HEADPHONE)) {
+			jack_type = SND_JACK_LINEOUT;
+			mbhc->force_linein = true;
+			mbhc->current_plug = MBHC_PLUG_TYPE_HIGH_HPH;
+			if (mbhc->hph_status) {
+				mbhc->hph_status &= ~(SND_JACK_HEADSET |
+						      SND_JACK_LINEOUT);
+				snd_soc_jack_report(mbhc->jack,	mbhc->hph_status,
+						    WCD_MBHC_JACK_MASK);
+			}
+		}
+	}
+
+	/* Do not calculate impedance again for lineout
+	 * as during playback pa is on and impedance values
+	 * will not be correct resulting in lineout detected
+	 * as headphone.
+	 */
+	if (is_pa_on && mbhc->force_linein) {
+		jack_type = SND_JACK_LINEOUT;
+		mbhc->current_plug = MBHC_PLUG_TYPE_HIGH_HPH;
+		if (mbhc->hph_status) {
+			mbhc->hph_status &= ~(SND_JACK_HEADSET |
+					      SND_JACK_LINEOUT);
+			snd_soc_jack_report(mbhc->jack,	mbhc->hph_status,
+					    WCD_MBHC_JACK_MASK);
+		}
+	}
+
+	mbhc->hph_status |= jack_type;
+
+	if (jack_type == SND_JACK_HEADPHONE && mbhc->mbhc_cb->mbhc_micb_ramp_control)
+		mbhc->mbhc_cb->mbhc_micb_ramp_control(mbhc->component, false);
+
+	snd_soc_jack_report(mbhc->jack, (mbhc->hph_status | SND_JACK_MECHANICAL),
+			    WCD_MBHC_JACK_MASK);
+}
+
+static void wcd_mbhc_report_plug(struct wcd_mbhc *mbhc, int insertion,
+				 enum snd_jack_types jack_type)
+{
+
+	WARN_ON(!mutex_is_locked(&mbhc->lock));
+
+	if (!insertion) /* Report removal */
+		wcd_mbhc_report_plug_removal(mbhc, jack_type);
+	else
+		wcd_mbhc_report_plug_insertion(mbhc, jack_type);
+
+}
+
+static void wcd_cancel_hs_detect_plug(struct wcd_mbhc *mbhc,
+				      struct work_struct *work)
+{
+	mbhc->hs_detect_work_stop = true;
+	mutex_unlock(&mbhc->lock);
+	cancel_work_sync(work);
+	mutex_lock(&mbhc->lock);
+}
+
+static void wcd_mbhc_cancel_pending_work(struct wcd_mbhc *mbhc)
+{
+	/* cancel pending button press */
+	wcd_cancel_btn_work(mbhc);
+	/* cancel correct work function */
+	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
+}
+
+static void wcd_mbhc_elec_hs_report_unplug(struct wcd_mbhc *mbhc)
+{
+	wcd_mbhc_cancel_pending_work(mbhc);
+	/* Report extension cable */
+	wcd_mbhc_report_plug(mbhc, 1, SND_JACK_LINEOUT);
+	/*
+	 * Disable HPHL trigger and MIC Schmitt triggers.
+	 * Setup for insertion detection.
+	 */
+	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_rem_intr);
+	wcd_mbhc_curr_micbias_control(mbhc, WCD_MBHC_EN_NONE);
+	/* Disable HW FSM */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 3);
+
+	/* Set the detection type appropriately */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_DETECTION_TYPE, 1);
+	enable_irq(mbhc->intr_ids->mbhc_hs_ins_intr);
+}
+
+static void wcd_mbhc_find_plug_and_report(struct wcd_mbhc *mbhc,
+				   enum wcd_mbhc_plug_type plug_type)
+{
+	if (mbhc->current_plug == plug_type)
+		return;
+
+	mutex_lock(&mbhc->lock);
+
+	switch (plug_type) {
+	case MBHC_PLUG_TYPE_HEADPHONE:
+		wcd_mbhc_report_plug(mbhc, 1, SND_JACK_HEADPHONE);
+		break;
+	case MBHC_PLUG_TYPE_HEADSET:
+		wcd_mbhc_report_plug(mbhc, 1, SND_JACK_HEADSET);
+		break;
+	case MBHC_PLUG_TYPE_HIGH_HPH:
+		wcd_mbhc_report_plug(mbhc, 1, SND_JACK_LINEOUT);
+		break;
+	case MBHC_PLUG_TYPE_GND_MIC_SWAP:
+		if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADPHONE)
+			wcd_mbhc_report_plug(mbhc, 0, SND_JACK_HEADPHONE);
+		if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADSET)
+			wcd_mbhc_report_plug(mbhc, 0, SND_JACK_HEADSET);
+		break;
+	default:
+		WARN(1, "Unexpected current plug_type %d, plug_type %d\n",
+		     mbhc->current_plug, plug_type);
+		break;
+	}
+	mutex_unlock(&mbhc->lock);
+}
+
+static void wcd_schedule_hs_detect_plug(struct wcd_mbhc *mbhc,
+					    struct work_struct *work)
+{
+	WARN_ON(!mutex_is_locked(&mbhc->lock));
+	mbhc->hs_detect_work_stop = false;
+	schedule_work(work);
+}
+
+static void wcd_mbhc_adc_detect_plug_type(struct wcd_mbhc *mbhc)
+{
+	struct snd_soc_component *component = mbhc->component;
+
+	WARN_ON(!mutex_is_locked(&mbhc->lock));
+
+	if (mbhc->mbhc_cb->hph_pull_down_ctrl)
+		mbhc->mbhc_cb->hph_pull_down_ctrl(component, false);
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 0);
+
+	if (mbhc->mbhc_cb->mbhc_micbias_control) {
+		mbhc->mbhc_cb->mbhc_micbias_control(component, MIC_BIAS_2,
+						    MICB_ENABLE);
+		wcd_schedule_hs_detect_plug(mbhc, &mbhc->correct_plug_swch);
+	}
+}
+
+static irqreturn_t wcd_mbhc_mech_plug_detect_irq(int irq, void *data)
+{
+	struct snd_soc_component *component;
+	enum snd_jack_types jack_type;
+	struct wcd_mbhc *mbhc = data;
+	bool detection_type;
+
+	component = mbhc->component;
+	mutex_lock(&mbhc->lock);
+
+	mbhc->in_swch_irq_handler = true;
+
+	wcd_mbhc_cancel_pending_work(mbhc);
+
+	detection_type = wcd_mbhc_read_field(mbhc, WCD_MBHC_MECH_DETECTION_TYPE);
+
+	/* Set the detection type appropriately */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_MECH_DETECTION_TYPE, !detection_type);
+
+	/* Enable micbias ramp */
+	if (mbhc->mbhc_cb->mbhc_micb_ramp_control)
+		mbhc->mbhc_cb->mbhc_micb_ramp_control(component, true);
+
+	if (detection_type) {
+		if (mbhc->current_plug != MBHC_PLUG_TYPE_NONE)
+			goto exit;
+		/* Make sure MASTER_BIAS_CTL is enabled */
+		mbhc->mbhc_cb->mbhc_bias(component, true);
+		mbhc->is_btn_press = false;
+		wcd_mbhc_adc_detect_plug_type(mbhc);
+	} else {
+		/* Disable HW FSM */
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+		mbhc->extn_cable_hph_rem = false;
+
+		if (mbhc->current_plug == MBHC_PLUG_TYPE_NONE)
+			goto exit;
+
+		mbhc->is_btn_press = false;
+		switch (mbhc->current_plug) {
+		case MBHC_PLUG_TYPE_HEADPHONE:
+			jack_type = SND_JACK_HEADPHONE;
+			break;
+		case MBHC_PLUG_TYPE_HEADSET:
+			jack_type = SND_JACK_HEADSET;
+			break;
+		case MBHC_PLUG_TYPE_HIGH_HPH:
+			if (mbhc->mbhc_detection_logic == WCD_DETECTION_ADC)
+				wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 0);
+			jack_type = SND_JACK_LINEOUT;
+			break;
+		case MBHC_PLUG_TYPE_GND_MIC_SWAP:
+			dev_err(mbhc->dev, "Ground and Mic Swapped on plug\n");
+			goto exit;
+		default:
+			dev_err(mbhc->dev, "Invalid current plug: %d\n",
+				mbhc->current_plug);
+			goto exit;
+		}
+		disable_irq_nosync(mbhc->intr_ids->mbhc_hs_rem_intr);
+		disable_irq_nosync(mbhc->intr_ids->mbhc_hs_ins_intr);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_DETECTION_TYPE, 1);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 0);
+		wcd_mbhc_report_plug(mbhc, 0, jack_type);
+	}
+
+exit:
+	mbhc->in_swch_irq_handler = false;
+	mutex_unlock(&mbhc->lock);
+	return IRQ_HANDLED;
+}
+
+static int wcd_mbhc_get_button_mask(struct wcd_mbhc *mbhc)
+{
+	int mask = 0;
+	int btn;
+
+	btn = wcd_mbhc_read_field(mbhc, WCD_MBHC_BTN_RESULT);
+
+	switch (btn) {
+	case 0:
+		mask = SND_JACK_BTN_0;
+		break;
+	case 1:
+		mask = SND_JACK_BTN_1;
+		break;
+	case 2:
+		mask = SND_JACK_BTN_2;
+		break;
+	case 3:
+		mask = SND_JACK_BTN_3;
+		break;
+	case 4:
+		mask = SND_JACK_BTN_4;
+		break;
+	case 5:
+		mask = SND_JACK_BTN_5;
+		break;
+	default:
+		break;
+	}
+
+	return mask;
+}
+
+static void wcd_btn_long_press_fn(struct work_struct *work)
+{
+	struct delayed_work *dwork = to_delayed_work(work);
+	struct wcd_mbhc *mbhc = container_of(dwork, struct wcd_mbhc, mbhc_btn_dwork);
+
+	if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADSET)
+		snd_soc_jack_report(mbhc->jack, mbhc->buttons_pressed,
+				    mbhc->buttons_pressed);
+}
+
+static irqreturn_t wcd_mbhc_btn_press_handler(int irq, void *data)
+{
+	struct wcd_mbhc *mbhc = data;
+	int mask;
+	unsigned long msec_val;
+
+	mutex_lock(&mbhc->lock);
+	wcd_cancel_btn_work(mbhc);
+	mbhc->is_btn_press = true;
+	msec_val = jiffies_to_msecs(jiffies - mbhc->jiffies_atreport);
+
+	/* Too short, ignore button press */
+	if (msec_val < MBHC_BUTTON_PRESS_THRESHOLD_MIN)
+		goto done;
+
+	/* If switch interrupt already kicked in, ignore button press */
+	if (mbhc->in_swch_irq_handler)
+		goto done;
+
+	/* Plug isn't headset, ignore button press */
+	if (mbhc->current_plug != MBHC_PLUG_TYPE_HEADSET)
+		goto done;
+
+	mask = wcd_mbhc_get_button_mask(mbhc);
+	mbhc->buttons_pressed |= mask;
+	if (schedule_delayed_work(&mbhc->mbhc_btn_dwork, msecs_to_jiffies(400)) == 0)
+		WARN(1, "Button pressed twice without release event\n");
+done:
+	mutex_unlock(&mbhc->lock);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wcd_mbhc_btn_release_handler(int irq, void *data)
+{
+	struct wcd_mbhc *mbhc = data;
+	int ret;
+
+	mutex_lock(&mbhc->lock);
+	if (mbhc->is_btn_press)
+		mbhc->is_btn_press = false;
+	else /* fake btn press */
+		goto exit;
+
+	if (!(mbhc->buttons_pressed & WCD_MBHC_JACK_BUTTON_MASK))
+		goto exit;
+
+	ret = wcd_cancel_btn_work(mbhc);
+	if (ret == 0) { /* Reporting long button release event */
+		snd_soc_jack_report(mbhc->jack,	0, mbhc->buttons_pressed);
+	} else {
+		if (!mbhc->in_swch_irq_handler) {
+			/* Reporting btn press n Release */
+			snd_soc_jack_report(mbhc->jack, mbhc->buttons_pressed,
+					    mbhc->buttons_pressed);
+			snd_soc_jack_report(mbhc->jack,	0, mbhc->buttons_pressed);
+		}
+	}
+	mbhc->buttons_pressed &= ~WCD_MBHC_JACK_BUTTON_MASK;
+exit:
+	mutex_unlock(&mbhc->lock);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wcd_mbhc_hph_ocp_irq(struct wcd_mbhc *mbhc, bool hphr)
+{
+
+	/* TODO Find a better way to report this to Userspace */
+	dev_err(mbhc->dev, "MBHC Over Current on %s detected\n",
+		hphr ? "HPHR" : "HPHL");
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_OCP_FSM_EN, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_OCP_FSM_EN, 1);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wcd_mbhc_hphl_ocp_irq(int irq, void *data)
+{
+	return wcd_mbhc_hph_ocp_irq(data, false);
+}
+
+static irqreturn_t wcd_mbhc_hphr_ocp_irq(int irq, void *data)
+{
+	return wcd_mbhc_hph_ocp_irq(data, true);
+}
+
+static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
+{
+	struct snd_soc_component *component = mbhc->component;
+
+	mutex_lock(&mbhc->lock);
+
+	/* enable HS detection */
+	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
+		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
+						      HS_PULLUP_I_DEFAULT);
+	else if (mbhc->mbhc_cb->hph_pull_up_control)
+		mbhc->mbhc_cb->hph_pull_up_control(component, I_DEFAULT);
+	else
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_CTRL, 3);
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_HPHL_PLUG_TYPE, mbhc->cfg->hphl_swh);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_GND_PLUG_TYPE, mbhc->cfg->gnd_swh);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_SW_HPH_LP_100K_TO_GND, 1);
+	if (mbhc->cfg->gnd_det_en && mbhc->mbhc_cb->mbhc_gnd_det_ctrl)
+		mbhc->mbhc_cb->mbhc_gnd_det_ctrl(component, true);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL, 1);
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_L_DET_EN, 1);
+
+	/* Insertion debounce set to 96ms */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_INSREM_DBNC, 6);
+
+	/* Button Debounce set to 16ms */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_DBNC, 2);
+
+	/* enable bias */
+	mbhc->mbhc_cb->mbhc_bias(component, true);
+	/* enable MBHC clock */
+	if (mbhc->mbhc_cb->clk_setup)
+		mbhc->mbhc_cb->clk_setup(component, true);
+
+	/* program HS_VREF value */
+	wcd_program_hs_vref(mbhc);
+
+	wcd_program_btn_threshold(mbhc, false);
+
+	mutex_unlock(&mbhc->lock);
+
+	return 0;
+}
+
+static int wcd_mbhc_get_micbias(struct wcd_mbhc *mbhc)
+{
+	int micbias = 0;
+
+	if (mbhc->mbhc_cb->get_micbias_val) {
+		mbhc->mbhc_cb->get_micbias_val(mbhc->component, &micbias);
+	} else {
+		u8 vout_ctl = 0;
+		/* Read MBHC Micbias (Mic Bias2) voltage */
+		vout_ctl = wcd_mbhc_read_field(mbhc, WCD_MBHC_MICB2_VOUT);
+		/* Formula for getting micbias from vout
+		 * micbias = 1.0V + VOUT_CTL * 50mV
+		 */
+		micbias = 1000 + (vout_ctl * 50);
+	}
+	return micbias;
+}
+
+static int wcd_get_voltage_from_adc(u8 val, int micbias)
+{
+	/* Formula for calculating voltage from ADC
+	 * Voltage = ADC_RESULT*12.5mV*V_MICBIAS/1.8
+	 */
+	return ((val * 125 * micbias)/(WCD_MBHC_ADC_MICBIAS_MV * 10));
+}
+
+static int wcd_measure_adc_continuous(struct wcd_mbhc *mbhc)
+{
+	u8 adc_result;
+	int output_mv;
+	int retry = 3;
+	u8 adc_en;
+
+	/* Pre-requisites for ADC continuous measurement */
+	/* Read legacy electircal detection and disable */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 0x00);
+	/* Set ADC to continuous measurement */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 1);
+	/* Read ADC Enable bit to restore after adc measurement */
+	adc_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_EN);
+	/* Disable ADC_ENABLE bit */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
+	/* Disable MBHC FSM */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+	/* Set the MUX selection to IN2P */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_MUX_CTL, MUX_CTL_IN2P);
+	/* Enable MBHC FSM */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+	/* Enable ADC_ENABLE bit */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 1);
+
+	while (retry--) {
+		/* wait for 3 msec before reading ADC result */
+		usleep_range(3000, 3100);
+		adc_result = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_RESULT);
+	}
+
+	/* Restore ADC Enable */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, adc_en);
+	/* Get voltage from ADC result */
+	output_mv = wcd_get_voltage_from_adc(adc_result, wcd_mbhc_get_micbias(mbhc));
+
+	return output_mv;
+}
+
+static int wcd_measure_adc_once(struct wcd_mbhc *mbhc, int mux_ctl)
+{
+	struct device *dev = mbhc->dev;
+	u8 adc_timeout = 0;
+	u8 adc_complete = 0;
+	u8 adc_result;
+	int retry = 6;
+	int ret;
+	int output_mv = 0;
+	u8 adc_en;
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
+	/* Read ADC Enable bit to restore after adc measurement */
+	adc_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_EN);
+	/* Trigger ADC one time measurement */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+	/* Set the appropriate MUX selection */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_MUX_CTL, mux_ctl);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 1);
+
+	while (retry--) {
+		/* wait for 600usec to get adc results */
+		usleep_range(600, 610);
+
+		/* check for ADC Timeout */
+		adc_timeout = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_TIMEOUT);
+		if (adc_timeout)
+			continue;
+
+		/* Read ADC complete bit */
+		adc_complete = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_COMPLETE);
+		if (!adc_complete)
+			continue;
+
+		/* Read ADC result */
+		adc_result = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_RESULT);
+
+		/* Get voltage from ADC result */
+		output_mv = wcd_get_voltage_from_adc(adc_result,
+						wcd_mbhc_get_micbias(mbhc));
+		break;
+	}
+
+	/* Restore ADC Enable */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, adc_en);
+
+	if (retry <= 0) {
+		dev_err(dev, "%s: adc complete: %d, adc timeout: %d\n",
+			__func__, adc_complete, adc_timeout);
+		ret = -EINVAL;
+	} else {
+		ret = output_mv;
+	}
+
+	return ret;
+}
+
+/* To determine if cross connection occurred */
+static int wcd_check_cross_conn(struct wcd_mbhc *mbhc)
+{
+	u8 adc_mode, elect_ctl, adc_en, fsm_en;
+	int hphl_adc_res, hphr_adc_res;
+	bool is_cross_conn = false;
+
+	/* If PA is enabled, dont check for cross-connection */
+	if (wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN))
+		return -EINVAL;
+
+	/* Read legacy electircal detection and disable */
+	elect_ctl = wcd_mbhc_read_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, 0);
+
+	/* Read and set ADC to single measurement */
+	adc_mode = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_MODE);
+	/* Read ADC Enable bit to restore after adc measurement */
+	adc_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_ADC_EN);
+	/* Read FSM status */
+	fsm_en = wcd_mbhc_read_field(mbhc, WCD_MBHC_FSM_EN);
+
+	/* Get adc result for HPH L */
+	hphl_adc_res = wcd_measure_adc_once(mbhc, MUX_CTL_HPH_L);
+	if (hphl_adc_res < 0)
+		return hphl_adc_res;
+
+	/* Get adc result for HPH R in mV */
+	hphr_adc_res = wcd_measure_adc_once(mbhc, MUX_CTL_HPH_R);
+	if (hphr_adc_res < 0)
+		return hphr_adc_res;
+
+	if (hphl_adc_res > HPHL_CROSS_CONN_THRESHOLD ||
+	    hphr_adc_res > HPHL_CROSS_CONN_THRESHOLD)
+		is_cross_conn = true;
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 0);
+	/* Set the MUX selection to Auto */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_MUX_CTL, MUX_CTL_AUTO);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, 1);
+	/* Restore ADC Enable */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, adc_en);
+	/* Restore ADC mode */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, adc_mode);
+	/* Restore FSM state */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_FSM_EN, fsm_en);
+	/* Restore electrical detection */
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_SCHMT_ISRC, elect_ctl);
+
+	return is_cross_conn;
+}
+
+static int wcd_mbhc_adc_get_hs_thres(struct wcd_mbhc *mbhc)
+{
+	int hs_threshold, micbias_mv;
+
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
+	if (mbhc->cfg->hs_thr) {
+		if (mbhc->cfg->micb_mv == micbias_mv)
+			hs_threshold = mbhc->cfg->hs_thr;
+		else
+			hs_threshold = (mbhc->cfg->hs_thr *
+				micbias_mv) / mbhc->cfg->micb_mv;
+	} else {
+		hs_threshold = ((WCD_MBHC_ADC_HS_THRESHOLD_MV *
+			micbias_mv) / WCD_MBHC_ADC_MICBIAS_MV);
+	}
+	return hs_threshold;
+}
+
+static int wcd_mbhc_adc_get_hph_thres(struct wcd_mbhc *mbhc)
+{
+	int hph_threshold, micbias_mv;
+
+	micbias_mv = wcd_mbhc_get_micbias(mbhc);
+	if (mbhc->cfg->hph_thr) {
+		if (mbhc->cfg->micb_mv == micbias_mv)
+			hph_threshold = mbhc->cfg->hph_thr;
+		else
+			hph_threshold = (mbhc->cfg->hph_thr *
+				micbias_mv) / mbhc->cfg->micb_mv;
+	} else {
+		hph_threshold = ((WCD_MBHC_ADC_HPH_THRESHOLD_MV *
+			micbias_mv) / WCD_MBHC_ADC_MICBIAS_MV);
+	}
+	return hph_threshold;
+}
+
+static void wcd_mbhc_adc_update_fsm_source(struct wcd_mbhc *mbhc,
+					   enum wcd_mbhc_plug_type plug_type)
+{
+	bool micbias2 = false;
+
+	switch (plug_type) {
+	case MBHC_PLUG_TYPE_HEADPHONE:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 3);
+		break;
+	case MBHC_PLUG_TYPE_HEADSET:
+		if (mbhc->mbhc_cb->micbias_enable_status)
+			micbias2 = mbhc->mbhc_cb->micbias_enable_status(mbhc->component,
+									MIC_BIAS_2);
+
+		if (!mbhc->is_hs_recording && !micbias2)
+			wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 3);
+		break;
+	default:
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+		break;
+
+	};
+}
+
+static void wcd_mbhc_bcs_enable(struct wcd_mbhc *mbhc, int plug_type, bool enable)
+{
+	switch (plug_type) {
+	case MBHC_PLUG_TYPE_HEADSET:
+	case MBHC_PLUG_TYPE_HEADPHONE:
+		if (mbhc->mbhc_cb->bcs_enable)
+			mbhc->mbhc_cb->bcs_enable(mbhc->component, enable);
+		break;
+	default:
+		break;
+	}
+}
+
+static int wcd_mbhc_get_plug_from_adc(struct wcd_mbhc *mbhc, int adc_result)
+
+{
+	enum wcd_mbhc_plug_type plug_type;
+	u32 hph_thr, hs_thr;
+
+	hs_thr = wcd_mbhc_adc_get_hs_thres(mbhc);
+	hph_thr = wcd_mbhc_adc_get_hph_thres(mbhc);
+
+	if (adc_result < hph_thr)
+		plug_type = MBHC_PLUG_TYPE_HEADPHONE;
+	else if (adc_result > hs_thr)
+		plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
+	else
+		plug_type = MBHC_PLUG_TYPE_HEADSET;
+
+	return plug_type;
+}
+
+static void wcd_correct_swch_plug(struct work_struct *work)
+{
+	struct wcd_mbhc *mbhc;
+	struct snd_soc_component *component;
+	enum wcd_mbhc_plug_type plug_type = MBHC_PLUG_TYPE_INVALID;
+	unsigned long timeout;
+	int pt_gnd_mic_swap_cnt = 0;
+	int output_mv, cross_conn, hs_threshold, try = 0;
+	bool is_pa_on;
+
+	mbhc = container_of(work, struct wcd_mbhc, correct_plug_swch);
+	component = mbhc->component;
+
+	hs_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
+
+	/* Mask ADC COMPLETE interrupt */
+	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_ins_intr);
+
+	/* Check for cross connection */
+	do {
+		cross_conn = wcd_check_cross_conn(mbhc);
+		try++;
+	} while (try < GND_MIC_SWAP_THRESHOLD);
+
+	if (cross_conn > 0) {
+		plug_type = MBHC_PLUG_TYPE_GND_MIC_SWAP;
+		dev_err(mbhc->dev, "cross connection found, Plug type %d\n",
+			plug_type);
+		goto correct_plug_type;
+	}
+
+	/* Find plug type */
+	output_mv = wcd_measure_adc_continuous(mbhc);
+	plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
+
+	/*
+	 * Report plug type if it is either headset or headphone
+	 * else start the 3 sec loop
+	 */
+	switch (plug_type) {
+	case MBHC_PLUG_TYPE_HEADPHONE:
+		wcd_mbhc_find_plug_and_report(mbhc, plug_type);
+		break;
+	case MBHC_PLUG_TYPE_HEADSET:
+		wcd_mbhc_find_plug_and_report(mbhc, plug_type);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 1);
+		break;
+	default:
+		break;
+	}
+
+correct_plug_type:
+
+	/* Disable BCS slow insertion detection */
+	wcd_mbhc_bcs_enable(mbhc, plug_type, false);
+
+	timeout = jiffies + msecs_to_jiffies(HS_DETECT_PLUG_TIME_MS);
+
+	while (!time_after(jiffies, timeout)) {
+		if (mbhc->hs_detect_work_stop) {
+			wcd_micbias_disable(mbhc);
+			goto exit;
+		}
+
+		msleep(180);
+		/*
+		 * Use ADC single mode to minimize the chance of missing out
+		 * btn press/release for HEADSET type during correct work.
+		 */
+		output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+		plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
+		is_pa_on = wcd_mbhc_read_field(mbhc, WCD_MBHC_HPH_PA_EN);
+
+		if ((output_mv <= hs_threshold) && !is_pa_on) {
+			/* Check for cross connection*/
+			cross_conn = wcd_check_cross_conn(mbhc);
+			if (cross_conn > 0) { /* cross-connection */
+				pt_gnd_mic_swap_cnt++;
+				if (pt_gnd_mic_swap_cnt < GND_MIC_SWAP_THRESHOLD)
+					continue;
+				else
+					plug_type = MBHC_PLUG_TYPE_GND_MIC_SWAP;
+			} else if (!cross_conn) { /* no cross connection */
+				pt_gnd_mic_swap_cnt = 0;
+				plug_type = wcd_mbhc_get_plug_from_adc(mbhc, output_mv);
+				continue;
+			} else if (cross_conn < 0) /* Error */
+				continue;
+
+			if (pt_gnd_mic_swap_cnt == GND_MIC_SWAP_THRESHOLD) {
+				/* US_EU gpio present, flip switch */
+				if (mbhc->cfg->swap_gnd_mic) {
+					if (mbhc->cfg->swap_gnd_mic(component, true))
+						continue;
+				}
+			}
+		}
+
+		if (output_mv > hs_threshold) /* cable is extension cable */
+			plug_type = MBHC_PLUG_TYPE_HIGH_HPH;
+	}
+
+	wcd_mbhc_bcs_enable(mbhc, plug_type, true);
+
+	if (plug_type == MBHC_PLUG_TYPE_HIGH_HPH)
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_ELECT_ISRC_EN, 1);
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
+	wcd_mbhc_find_plug_and_report(mbhc, plug_type);
+
+	/*
+	 * Set DETECTION_DONE bit for HEADSET
+	 * so that btn press/release interrupt can be generated.
+	 * For other plug type, clear the bit.
+	 */
+	if (plug_type == MBHC_PLUG_TYPE_HEADSET)
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 1);
+	else
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 0);
+
+	if (mbhc->mbhc_cb->mbhc_micbias_control)
+		wcd_mbhc_adc_update_fsm_source(mbhc, plug_type);
+
+exit:
+	if (mbhc->mbhc_cb->mbhc_micbias_control/* &&  !mbhc->micbias_enable*/)
+		mbhc->mbhc_cb->mbhc_micbias_control(component, MIC_BIAS_2, MICB_DISABLE);
+
+	/*
+	 * If plug type is corrected from special headset to headphone,
+	 * clear the micbias enable flag, set micbias back to 1.8V and
+	 * disable micbias.
+	 */
+	if (plug_type == MBHC_PLUG_TYPE_HEADPHONE) {
+		wcd_micbias_disable(mbhc);
+		/*
+		 * Enable ADC COMPLETE interrupt for HEADPHONE.
+		 * Btn release may happen after the correct work, ADC COMPLETE
+		 * interrupt needs to be captured to correct plug type.
+		 */
+		enable_irq(mbhc->intr_ids->mbhc_hs_ins_intr);
+	}
+
+	if (mbhc->mbhc_cb->hph_pull_down_ctrl)
+		mbhc->mbhc_cb->hph_pull_down_ctrl(component, true);
+}
+
+static irqreturn_t wcd_mbhc_adc_hs_rem_irq(int irq, void *data)
+{
+	struct wcd_mbhc *mbhc = data;
+	unsigned long timeout;
+	int adc_threshold, output_mv, retry = 0;
+	bool hphpa_on = false;
+
+	mutex_lock(&mbhc->lock);
+	timeout = jiffies + msecs_to_jiffies(WCD_FAKE_REMOVAL_MIN_PERIOD_MS);
+	adc_threshold = wcd_mbhc_adc_get_hs_thres(mbhc);
+
+	do {
+		retry++;
+		/*
+		 * read output_mv every 10ms to look for
+		 * any change in IN2_P
+		 */
+		usleep_range(10000, 10100);
+		output_mv = wcd_measure_adc_once(mbhc, MUX_CTL_IN2P);
+
+		/* Check for fake removal */
+		if ((output_mv <= adc_threshold) && retry > FAKE_REM_RETRY_ATTEMPTS)
+			goto exit;
+	} while (!time_after(jiffies, timeout));
+
+	/*
+	 * ADC COMPLETE and ELEC_REM interrupts are both enabled for
+	 * HEADPHONE, need to reject the ADC COMPLETE interrupt which
+	 * follows ELEC_REM one when HEADPHONE is removed.
+	 */
+	if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADPHONE)
+		mbhc->extn_cable_hph_rem = true;
+
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_MODE, 0);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_ADC_EN, 0);
+	wcd_mbhc_elec_hs_report_unplug(mbhc);
+	wcd_mbhc_write_field(mbhc, WCD_MBHC_BTN_ISRC_CTL, 0);
+
+	if (hphpa_on) {
+		hphpa_on = false;
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_HPH_PA_EN, 3);
+	}
+exit:
+	mutex_unlock(&mbhc->lock);
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t wcd_mbhc_adc_hs_ins_irq(int irq, void *data)
+{
+	struct wcd_mbhc *mbhc = data;
+	u8 clamp_state = 0;
+	u8 clamp_retry = WCD_MBHC_FAKE_INS_RETRY;
+
+	/*
+	 * ADC COMPLETE and ELEC_REM interrupts are both enabled for HEADPHONE,
+	 * need to reject the ADC COMPLETE interrupt which follows ELEC_REM one
+	 * when HEADPHONE is removed.
+	 */
+	if (mbhc->extn_cable_hph_rem == true) {
+		mbhc->extn_cable_hph_rem = false;
+		return IRQ_HANDLED;
+	}
+
+	do {
+		clamp_state = wcd_mbhc_read_field(mbhc, WCD_MBHC_IN2P_CLAMP_STATE);
+		if (clamp_state)
+			return IRQ_HANDLED;
+		/*
+		 * check clamp for 120ms but at 30ms chunks to leave
+		 * room for other interrupts to be processed
+		 */
+		usleep_range(30000, 30100);
+	} while (--clamp_retry);
+
+	/*
+	 * If current plug is headphone then there is no chance to
+	 * get ADC complete interrupt, so connected cable should be
+	 * headset not headphone.
+	 */
+	if (mbhc->current_plug == MBHC_PLUG_TYPE_HEADPHONE) {
+		disable_irq_nosync(mbhc->intr_ids->mbhc_hs_ins_intr);
+		wcd_mbhc_write_field(mbhc, WCD_MBHC_DETECTION_DONE, 1);
+		wcd_mbhc_find_plug_and_report(mbhc, MBHC_PLUG_TYPE_HEADSET);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_HANDLED;
+}
+
+int wcd_mbhc_get_impedance(struct wcd_mbhc *mbhc, uint32_t *zl,	uint32_t *zr)
+{
+	*zl = mbhc->zl;
+	*zr = mbhc->zr;
+
+	if (*zl && *zr)
+		return 0;
+	else
+		return -EINVAL;
+}
+EXPORT_SYMBOL(wcd_mbhc_get_impedance);
+
+void wcd_mbhc_set_hph_type(struct wcd_mbhc *mbhc, int hph_type)
+{
+	mbhc->hph_type = hph_type;
+}
+EXPORT_SYMBOL(wcd_mbhc_set_hph_type);
+
+int wcd_mbhc_get_hph_type(struct wcd_mbhc *mbhc)
+{
+	return mbhc->hph_type;
+}
+EXPORT_SYMBOL(wcd_mbhc_get_hph_type);
+
+int wcd_mbhc_start(struct wcd_mbhc *mbhc, struct wcd_mbhc_config *cfg,
+		   struct snd_soc_jack *jack)
+{
+	if (!mbhc || !cfg || !jack)
+		return -EINVAL;
+
+	mbhc->cfg = cfg;
+	mbhc->jack = jack;
+
+	return wcd_mbhc_initialise(mbhc);
+}
+EXPORT_SYMBOL(wcd_mbhc_start);
+
+void wcd_mbhc_stop(struct wcd_mbhc *mbhc)
+{
+	mbhc->current_plug = MBHC_PLUG_TYPE_NONE;
+	mbhc->hph_status = 0;
+	disable_irq_nosync(mbhc->intr_ids->hph_left_ocp);
+	disable_irq_nosync(mbhc->intr_ids->hph_right_ocp);
+}
+EXPORT_SYMBOL(wcd_mbhc_stop);
+
+int wcd_dt_parse_mbhc_data(struct device *dev, struct wcd_mbhc_config *cfg)
+{
+	struct device_node *np = dev->of_node;
+	int ret, i, microvolt;
+
+	if (of_property_read_bool(np, "qcom,hphl-jack-type-normally-closed"))
+		cfg->hphl_swh = false;
+	else
+		cfg->hphl_swh = true;
+
+	if (of_property_read_bool(np, "qcom,ground-jack-type-normally-closed"))
+		cfg->gnd_swh = false;
+	else
+		cfg->gnd_swh = true;
+
+	ret = of_property_read_u32(np, "qcom,mbhc-headset-vthreshold-microvolt",
+				   &microvolt);
+	if (ret)
+		dev_dbg(dev, "missing qcom,mbhc-hs-mic-max-vthreshold--microvolt in dt node\n");
+	else
+		cfg->hs_thr = microvolt/1000;
+
+	ret = of_property_read_u32(np, "qcom,mbhc-headphone-vthreshold-microvolt",
+				   &microvolt);
+	if (ret)
+		dev_dbg(dev, "missing qcom,mbhc-hs-mic-min-vthreshold-microvolt	entry\n");
+	else
+		cfg->hph_thr = microvolt/1000;
+
+	ret = of_property_read_u32_array(np,
+					 "qcom,mbhc-buttons-vthreshold-microvolt",
+					 &cfg->btn_high[0],
+					 WCD_MBHC_DEF_BUTTONS);
+	if (ret)
+		dev_err(dev, "missing qcom,mbhc-buttons-vthreshold-microvolt entry\n");
+
+	for (i = 0; i < WCD_MBHC_DEF_BUTTONS; i++) {
+		if (ret) /* default voltage */
+			cfg->btn_high[i] = 500000;
+		else
+			/* Micro to Milli Volts */
+			cfg->btn_high[i] = cfg->btn_high[i]/1000;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(wcd_dt_parse_mbhc_data);
+
+struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
+			       const struct wcd_mbhc_cb *mbhc_cb,
+			       const struct wcd_mbhc_intr *intr_ids,
+			       struct wcd_mbhc_field *fields,
+			       bool impedance_det_en)
+{
+	struct device *dev = component->dev;
+	struct wcd_mbhc *mbhc;
+	int ret;
+
+	if (!intr_ids || !fields || !mbhc_cb || !mbhc_cb->mbhc_bias || !mbhc_cb->set_btn_thr) {
+		dev_err(dev, "%s: Insufficient mbhc configuration\n", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+
+	mbhc = devm_kzalloc(dev, sizeof(*mbhc), GFP_KERNEL);
+	if (!mbhc)
+		return ERR_PTR(-ENOMEM);
+
+	mbhc->component = component;
+	mbhc->dev = dev;
+	mbhc->intr_ids = intr_ids;
+	mbhc->mbhc_cb = mbhc_cb;
+	mbhc->fields = fields;
+	mbhc->mbhc_detection_logic = WCD_DETECTION_ADC;
+
+	if (mbhc_cb->compute_impedance)
+		mbhc->impedance_detect = impedance_det_en;
+
+	INIT_DELAYED_WORK(&mbhc->mbhc_btn_dwork, wcd_btn_long_press_fn);
+
+	mutex_init(&mbhc->lock);
+
+	INIT_WORK(&mbhc->correct_plug_swch, wcd_correct_swch_plug);
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_sw_intr, NULL,
+					wcd_mbhc_mech_plug_detect_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"mbhc sw intr", mbhc);
+	if (ret)
+		goto err;
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_btn_press_intr, NULL,
+					wcd_mbhc_btn_press_handler,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"Button Press detect", mbhc);
+	if (ret)
+		goto err;
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_btn_release_intr, NULL,
+					wcd_mbhc_btn_release_handler,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"Button Release detect", mbhc);
+	if (ret)
+		goto err;
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_hs_ins_intr, NULL,
+					wcd_mbhc_adc_hs_ins_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"Elect Insert", mbhc);
+	if (ret)
+		goto err;
+
+	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_ins_intr);
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->mbhc_hs_rem_intr, NULL,
+					wcd_mbhc_adc_hs_rem_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"Elect Remove", mbhc);
+	if (ret)
+		goto err;
+
+	disable_irq_nosync(mbhc->intr_ids->mbhc_hs_rem_intr);
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->hph_left_ocp, NULL,
+					wcd_mbhc_hphl_ocp_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"HPH_L OCP detect", mbhc);
+	if (ret)
+		goto err;
+
+	ret = devm_request_threaded_irq(dev, mbhc->intr_ids->hph_right_ocp, NULL,
+					wcd_mbhc_hphr_ocp_irq,
+					IRQF_ONESHOT | IRQF_TRIGGER_RISING,
+					"HPH_R OCP detect", mbhc);
+	if (ret)
+		goto err;
+
+	return mbhc;
+err:
+	dev_err(dev, "Failed to request mbhc interrupts %d\n", ret);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(wcd_mbhc_init);
+
+void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
+{
+	mutex_lock(&mbhc->lock);
+	wcd_cancel_hs_detect_plug(mbhc,	&mbhc->correct_plug_swch);
+	mutex_unlock(&mbhc->lock);
+}
+EXPORT_SYMBOL(wcd_mbhc_deinit);
+
+static int __init mbhc_init(void)
+{
+	return 0;
+}
+
+static void __exit mbhc_exit(void)
+{
+}
+
+module_init(mbhc_init);
+module_exit(mbhc_exit);
+
+MODULE_DESCRIPTION("wcd MBHC v2 module");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/wcd-mbhc-v2.h b/sound/soc/codecs/wcd-mbhc-v2.h
new file mode 100644
index 000000000000..006118f3e81f
--- /dev/null
+++ b/sound/soc/codecs/wcd-mbhc-v2.h
@@ -0,0 +1,340 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __WCD_MBHC_V2_H__
+#define __WCD_MBHC_V2_H__
+
+#include <sound/jack.h>
+
+#define WCD_MBHC_FIELD(id, rreg, rmask) \
+	[id] = { .reg = rreg, .mask = rmask }
+
+enum wcd_mbhc_field_function {
+	WCD_MBHC_L_DET_EN,
+	WCD_MBHC_GND_DET_EN,
+	WCD_MBHC_MECH_DETECTION_TYPE,
+	WCD_MBHC_MIC_CLAMP_CTL,
+	WCD_MBHC_ELECT_DETECTION_TYPE,
+	WCD_MBHC_HS_L_DET_PULL_UP_CTRL,
+	WCD_MBHC_HS_L_DET_PULL_UP_COMP_CTRL,
+	WCD_MBHC_HPHL_PLUG_TYPE,
+	WCD_MBHC_GND_PLUG_TYPE,
+	WCD_MBHC_SW_HPH_LP_100K_TO_GND,
+	WCD_MBHC_ELECT_SCHMT_ISRC,
+	WCD_MBHC_FSM_EN,
+	WCD_MBHC_INSREM_DBNC,
+	WCD_MBHC_BTN_DBNC,
+	WCD_MBHC_HS_VREF,
+	WCD_MBHC_HS_COMP_RESULT,
+	WCD_MBHC_IN2P_CLAMP_STATE,
+	WCD_MBHC_MIC_SCHMT_RESULT,
+	WCD_MBHC_HPHL_SCHMT_RESULT,
+	WCD_MBHC_HPHR_SCHMT_RESULT,
+	WCD_MBHC_OCP_FSM_EN,
+	WCD_MBHC_BTN_RESULT,
+	WCD_MBHC_BTN_ISRC_CTL,
+	WCD_MBHC_ELECT_RESULT,
+	WCD_MBHC_MICB_CTRL,    /* Pull-up and micb control */
+	WCD_MBHC_HPH_CNP_WG_TIME,
+	WCD_MBHC_HPHR_PA_EN,
+	WCD_MBHC_HPHL_PA_EN,
+	WCD_MBHC_HPH_PA_EN,
+	WCD_MBHC_SWCH_LEVEL_REMOVE,
+	WCD_MBHC_PULLDOWN_CTRL,
+	WCD_MBHC_ANC_DET_EN,
+	WCD_MBHC_FSM_STATUS,
+	WCD_MBHC_MUX_CTL,
+	WCD_MBHC_MOISTURE_STATUS,
+	WCD_MBHC_HPHR_GND,
+	WCD_MBHC_HPHL_GND,
+	WCD_MBHC_HPHL_OCP_DET_EN,
+	WCD_MBHC_HPHR_OCP_DET_EN,
+	WCD_MBHC_HPHL_OCP_STATUS,
+	WCD_MBHC_HPHR_OCP_STATUS,
+	WCD_MBHC_ADC_EN,
+	WCD_MBHC_ADC_COMPLETE,
+	WCD_MBHC_ADC_TIMEOUT,
+	WCD_MBHC_ADC_RESULT,
+	WCD_MBHC_MICB2_VOUT,
+	WCD_MBHC_ADC_MODE,
+	WCD_MBHC_DETECTION_DONE,
+	WCD_MBHC_ELECT_ISRC_EN,
+	WCD_MBHC_REG_FUNC_MAX,
+};
+
+#define WCD_MBHC_DEF_BUTTONS 8
+#define WCD_MBHC_KEYCODE_NUM 8
+#define WCD_MBHC_USLEEP_RANGE_MARGIN_US 100
+#define WCD_MBHC_THR_HS_MICB_MV  2700
+#define WCD_MONO_HS_MIN_THR	2
+
+enum wcd_mbhc_detect_logic {
+	WCD_DETECTION_LEGACY,
+	WCD_DETECTION_ADC,
+};
+
+enum wcd_mbhc_cs_mb_en_flag {
+	WCD_MBHC_EN_CS = 0,
+	WCD_MBHC_EN_MB,
+	WCD_MBHC_EN_PULLUP,
+	WCD_MBHC_EN_NONE,
+};
+
+enum {
+	WCD_MBHC_ELEC_HS_INS,
+	WCD_MBHC_ELEC_HS_REM,
+};
+
+enum wcd_mbhc_plug_type {
+	MBHC_PLUG_TYPE_INVALID = -1,
+	MBHC_PLUG_TYPE_NONE,
+	MBHC_PLUG_TYPE_HEADSET,
+	MBHC_PLUG_TYPE_HEADPHONE,
+	MBHC_PLUG_TYPE_HIGH_HPH,
+	MBHC_PLUG_TYPE_GND_MIC_SWAP,
+};
+
+enum pa_dac_ack_flags {
+	WCD_MBHC_HPHL_PA_OFF_ACK = 0,
+	WCD_MBHC_HPHR_PA_OFF_ACK,
+};
+
+enum wcd_mbhc_btn_det_mem {
+	WCD_MBHC_BTN_DET_V_BTN_LOW,
+	WCD_MBHC_BTN_DET_V_BTN_HIGH
+};
+
+enum {
+	MIC_BIAS_1 = 1,
+	MIC_BIAS_2,
+	MIC_BIAS_3,
+	MIC_BIAS_4
+};
+
+enum {
+	MICB_PULLUP_ENABLE,
+	MICB_PULLUP_DISABLE,
+	MICB_ENABLE,
+	MICB_DISABLE,
+};
+
+enum wcd_notify_event {
+	WCD_EVENT_INVALID,
+	/* events for micbias ON and OFF */
+	WCD_EVENT_PRE_MICBIAS_2_OFF,
+	WCD_EVENT_POST_MICBIAS_2_OFF,
+	WCD_EVENT_PRE_MICBIAS_2_ON,
+	WCD_EVENT_POST_MICBIAS_2_ON,
+	WCD_EVENT_PRE_DAPM_MICBIAS_2_OFF,
+	WCD_EVENT_POST_DAPM_MICBIAS_2_OFF,
+	WCD_EVENT_PRE_DAPM_MICBIAS_2_ON,
+	WCD_EVENT_POST_DAPM_MICBIAS_2_ON,
+	/* events for PA ON and OFF */
+	WCD_EVENT_PRE_HPHL_PA_ON,
+	WCD_EVENT_POST_HPHL_PA_OFF,
+	WCD_EVENT_PRE_HPHR_PA_ON,
+	WCD_EVENT_POST_HPHR_PA_OFF,
+	WCD_EVENT_PRE_HPHL_PA_OFF,
+	WCD_EVENT_PRE_HPHR_PA_OFF,
+	WCD_EVENT_OCP_OFF,
+	WCD_EVENT_OCP_ON,
+	WCD_EVENT_LAST,
+};
+
+enum wcd_mbhc_event_state {
+	WCD_MBHC_EVENT_PA_HPHL,
+	WCD_MBHC_EVENT_PA_HPHR,
+};
+
+enum wcd_mbhc_hph_type {
+	WCD_MBHC_HPH_NONE = 0,
+	WCD_MBHC_HPH_MONO,
+	WCD_MBHC_HPH_STEREO,
+};
+
+/*
+ * These enum definitions are directly mapped to the register
+ * definitions
+ */
+
+enum mbhc_hs_pullup_iref {
+	I_DEFAULT = -1,
+	I_OFF = 0,
+	I_1P0_UA,
+	I_2P0_UA,
+	I_3P0_UA,
+};
+
+enum mbhc_hs_pullup_iref_v2 {
+	HS_PULLUP_I_DEFAULT = -1,
+	HS_PULLUP_I_3P0_UA = 0,
+	HS_PULLUP_I_2P25_UA,
+	HS_PULLUP_I_1P5_UA,
+	HS_PULLUP_I_0P75_UA,
+	HS_PULLUP_I_1P125_UA = 0x05,
+	HS_PULLUP_I_0P375_UA = 0x07,
+	HS_PULLUP_I_2P0_UA,
+	HS_PULLUP_I_1P0_UA = 0x0A,
+	HS_PULLUP_I_0P5_UA,
+	HS_PULLUP_I_0P25_UA = 0x0F,
+	HS_PULLUP_I_0P125_UA = 0x17,
+	HS_PULLUP_I_OFF,
+};
+
+enum mbhc_moisture_rref {
+	R_OFF,
+	R_24_KOHM,
+	R_84_KOHM,
+	R_184_KOHM,
+};
+
+struct wcd_mbhc_config {
+	int btn_high[WCD_MBHC_DEF_BUTTONS];
+	int btn_low[WCD_MBHC_DEF_BUTTONS];
+	int v_hs_max;
+	int num_btn;
+	bool mono_stero_detection;
+	bool (*swap_gnd_mic)(struct snd_soc_component *component, bool active);
+	bool hs_ext_micbias;
+	bool gnd_det_en;
+	uint32_t linein_th;
+	bool moisture_en;
+	int mbhc_micbias;
+	int anc_micbias;
+	bool moisture_duty_cycle_en;
+	bool hphl_swh; /*track HPHL switch NC / NO */
+	bool gnd_swh; /*track GND switch NC / NO */
+	u32 hs_thr;
+	u32 hph_thr;
+	u32 micb_mv;
+	u32 moist_vref;
+	u32 moist_iref;
+	u32 moist_rref;
+};
+
+struct wcd_mbhc_intr {
+	int mbhc_sw_intr;
+	int mbhc_btn_press_intr;
+	int mbhc_btn_release_intr;
+	int mbhc_hs_ins_intr;
+	int mbhc_hs_rem_intr;
+	int hph_left_ocp;
+	int hph_right_ocp;
+};
+
+struct wcd_mbhc_field {
+	u16 reg;
+	u8 mask;
+};
+
+struct wcd_mbhc;
+
+struct wcd_mbhc_cb {
+	void (*update_cross_conn_thr)(struct snd_soc_component *component);
+	void (*get_micbias_val)(struct snd_soc_component *component, int *mb);
+	void (*bcs_enable)(struct snd_soc_component *component, bool bcs_enable);
+	void (*compute_impedance)(struct snd_soc_component *component,
+				  uint32_t *zl, uint32_t *zr);
+	void (*set_micbias_value)(struct snd_soc_component *component);
+	void (*set_auto_zeroing)(struct snd_soc_component *component,
+			bool enable);
+	void (*clk_setup)(struct snd_soc_component *component, bool enable);
+	bool (*micbias_enable_status)(struct snd_soc_component *component, int micb_num);
+	void (*mbhc_bias)(struct snd_soc_component *component, bool enable);
+	void (*set_btn_thr)(struct snd_soc_component *component,
+			    int *btn_low, int *btn_high,
+			    int num_btn, bool is_micbias);
+	void (*hph_pull_up_control)(struct snd_soc_component *component,
+				    enum mbhc_hs_pullup_iref);
+	int (*mbhc_micbias_control)(struct snd_soc_component *component,
+			int micb_num, int req);
+	void (*mbhc_micb_ramp_control)(struct snd_soc_component *component,
+			bool enable);
+	bool (*extn_use_mb)(struct snd_soc_component *component);
+	int (*mbhc_micb_ctrl_thr_mic)(struct snd_soc_component *component,
+			int micb_num, bool req_en);
+	void (*mbhc_gnd_det_ctrl)(struct snd_soc_component *component,
+			bool enable);
+	void (*hph_pull_down_ctrl)(struct snd_soc_component *component,
+			bool enable);
+	void (*mbhc_moisture_config)(struct snd_soc_component *component);
+	void (*update_anc_state)(struct snd_soc_component *component,
+			bool enable, int anc_num);
+	void (*hph_pull_up_control_v2)(struct snd_soc_component *component,
+			int pull_up_cur);
+	bool (*mbhc_get_moisture_status)(struct snd_soc_component *component);
+	void (*mbhc_moisture_polling_ctrl)(struct snd_soc_component *component, bool enable);
+	void (*mbhc_moisture_detect_en)(struct snd_soc_component *component, bool enable);
+};
+
+#if IS_ENABLED(CONFIG_SND_SOC_WCD_MBHC)
+int wcd_dt_parse_mbhc_data(struct device *dev, struct wcd_mbhc_config *cfg);
+int wcd_mbhc_start(struct wcd_mbhc *mbhc, struct wcd_mbhc_config *mbhc_cfg,
+		   struct snd_soc_jack *jack);
+void wcd_mbhc_stop(struct wcd_mbhc *mbhc);
+void wcd_mbhc_set_hph_type(struct wcd_mbhc *mbhc, int hph_type);
+int wcd_mbhc_get_hph_type(struct wcd_mbhc *mbhc);
+struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
+		      const struct wcd_mbhc_cb *mbhc_cb,
+		      const struct wcd_mbhc_intr *mbhc_cdc_intr_ids,
+		      struct wcd_mbhc_field *fields,
+		      bool impedance_det_en);
+int wcd_mbhc_get_impedance(struct wcd_mbhc *mbhc, uint32_t *zl,
+			   uint32_t *zr);
+void wcd_mbhc_deinit(struct wcd_mbhc *mbhc);
+int wcd_mbhc_event_notify(struct wcd_mbhc *mbhc, unsigned long event);
+
+#else
+static inline int wcd_dt_parse_mbhc_data(struct device *dev,
+					 struct wcd_mbhc_config *cfg)
+{
+	return -ENOTSUPP;
+}
+
+static inline void wcd_mbhc_stop(struct wcd_mbhc *mbhc)
+{
+}
+
+static inline struct wcd_mbhc *wcd_mbhc_init(struct snd_soc_component *component,
+		      const struct wcd_mbhc_cb *mbhc_cb,
+		      const struct wcd_mbhc_intr *mbhc_cdc_intr_ids,
+		      struct wcd_mbhc_field *fields,
+		      bool impedance_det_en)
+{
+	return ERR_PTR(-ENOTSUPP);
+}
+
+static inline void wcd_mbhc_set_hph_type(struct wcd_mbhc *mbhc, int hph_type)
+{
+}
+
+static inline int wcd_mbhc_get_hph_type(struct wcd_mbhc *mbhc)
+{
+	return -ENOTSUPP;
+}
+
+static inline int wcd_mbhc_event_notify(struct wcd_mbhc *mbhc, unsigned long event)
+{
+	return -ENOTSUPP;
+}
+
+static inline int wcd_mbhc_start(struct wcd_mbhc *mbhc,
+				 struct wcd_mbhc_config *mbhc_cfg,
+				 struct snd_soc_jack *jack)
+{
+	return 0;
+}
+
+static inline int wcd_mbhc_get_impedance(struct wcd_mbhc *mbhc,
+					 uint32_t *zl,
+					 uint32_t *zr)
+{
+	*zl = 0;
+	*zr = 0;
+	return -EINVAL;
+}
+static inline void wcd_mbhc_deinit(struct wcd_mbhc *mbhc)
+{
+}
+#endif
+
+#endif /* __WCD_MBHC_V2_H__ */
-- 
2.21.0

