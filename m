Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF63334186A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Mar 2021 10:32:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 592BF16A0;
	Fri, 19 Mar 2021 10:32:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 592BF16A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616146371;
	bh=xcwlkR0kEiHZAHua5UWkaYFtuMUiLX5SXR83CNbAWUU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjy1Vy9ajAVfVZwygPntW3uNCUKTN0h+63PieRr1cI7EUrdLnXl7Kr6DMxoKxYtjJ
	 wg5khVrU5Paq9R0JQFvgKB8Pd7vlwR2gzSr2TsKrela1Ywm2yXz8UZfqkrZybh+kXd
	 f4is+o9sxsqNktBdUUkrot+aMPBO3aCZsxKfX+Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 374EAF80254;
	Fri, 19 Mar 2021 10:30:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF561F80423; Fri, 19 Mar 2021 10:30:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 41033F80124
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 10:30:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 41033F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pNHdPIHm"
Received: by mail-wr1-x42b.google.com with SMTP id v4so8374131wrp.13
 for <alsa-devel@alsa-project.org>; Fri, 19 Mar 2021 02:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/vUWvhAchaqpjbMn74HpIxb8CiMc71rLCGrcTJNmxv0=;
 b=pNHdPIHmuys1S+NLA4GVXhsQwh0YiF8DEeE2g9Rhs3q/uiP+fReKsGbZjDsugpM4A0
 PSKJQrHK+22w+DsUrCWQEoA+NlB7JVLJBfepykLFoFW06gjMPDmFzknFj5dY/Ja+qnhC
 UaAmUdCBWL8PVsyFroDro1RhKarPVHXYGbcjiz0m3fYTClCuNL5OsX2hGilEA9b56x+r
 4VCzyh9lt6VCs/rUwvyuF9snlP3VYAuwNe1gzubbLYtg0xnLtS1f1JcqhYgfNZGo5G4M
 Rqo1+9avB/nWWLb6jh0Y1T/OuAJkzV4IOokk7eWVlaV8uZdacT9dQqRoqLuEc4UUyYn9
 e7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/vUWvhAchaqpjbMn74HpIxb8CiMc71rLCGrcTJNmxv0=;
 b=hlGY97BFR7wsjQTdK0Q1QEC9OXJuOEpIj6G9S9o9P4U8tCsFgltU1NTQw2jt5l6ipt
 yPEozw/4Cfylx2O+6raBMIfB8tzCxGzuqivMuOHQhyMoHPjutIK3v5W7zYRUwd2oWi1v
 4ZugftIOPzUMf6mnhEVxAE4flqq0XuLw2IbYxS4F5kBe6oCoLfjLOJtNZYVmrDLkGfbj
 tRn5x9b17vP7LwkV9aCKoYHnoUmfaWnJOPNYBLfH/M2mQmBjt+Q11EwRQUgiCW3YlMEu
 7eWrPEfUBpg0YTRUGlQv3q9/V7K691/W8/WFBlUHnndjF1UtyW4FzcBMqLWvS+1VfmiW
 zD0Q==
X-Gm-Message-State: AOAM533eMLvfEAcOCx04/BKuPnZDVlxWuNBv7YBDeF0vkNHCidjZf0ko
 XAHktmoNcfEig1WdwZRptTW6+g==
X-Google-Smtp-Source: ABdhPJwohojKWtyTcT7HFyM2s0tU2NVlaQmsEkP0ult9XOLTFZyW2e16y+H5yeIt/DAYhdRpW0hgCg==
X-Received: by 2002:adf:f144:: with SMTP id y4mr3603415wro.408.1616146212029; 
 Fri, 19 Mar 2021 02:30:12 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id p6sm6779058wru.2.2021.03.19.02.30.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 02:30:11 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 7/7] ASoC: codecs: wcd938x: add audio routing
Date: Fri, 19 Mar 2021 09:29:19 +0000
Message-Id: <20210319092919.21218-8-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
References: <20210319092919.21218-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

This patch adds audio routing for both playback and capture.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 97 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 31e3cf729568..0f801920ebac 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3153,6 +3153,99 @@ static const struct snd_soc_dapm_widget wcd938x_rx_dapm_widgets[] = {
 
 };
 
+static const struct snd_soc_dapm_route wcd938x_rx_audio_map[] = {
+	{"IN1_HPHL", NULL, "VDD_BUCK"},
+	{"IN1_HPHL", NULL, "CLS_H_PORT"},
+
+	{"RX1", NULL, "IN1_HPHL"},
+	{"RX1", NULL, "RXCLK"},
+	{"RDAC1", NULL, "RX1"},
+	{"HPHL_RDAC", "Switch", "RDAC1"},
+	{"HPHL PGA", NULL, "HPHL_RDAC"},
+	{"HPHL", NULL, "HPHL PGA"},
+
+	{"IN2_HPHR", NULL, "VDD_BUCK"},
+	{"IN2_HPHR", NULL, "CLS_H_PORT"},
+	{"RX2", NULL, "IN2_HPHR"},
+	{"RDAC2", NULL, "RX2"},
+	{"RX2", NULL, "RXCLK"},
+	{"HPHR_RDAC", "Switch", "RDAC2"},
+	{"HPHR PGA", NULL, "HPHR_RDAC"},
+	{"HPHR", NULL, "HPHR PGA"},
+
+	{"IN3_AUX", NULL, "VDD_BUCK"},
+	{"IN3_AUX", NULL, "CLS_H_PORT"},
+	{"RX3", NULL, "IN3_AUX"},
+	{"RDAC4", NULL, "RX3"},
+	{"RX3", NULL, "RXCLK"},
+	{"AUX_RDAC", "Switch", "RDAC4"},
+	{"AUX PGA", NULL, "AUX_RDAC"},
+	{"AUX", NULL, "AUX PGA"},
+
+	{"RDAC3_MUX", "RX3", "RX3"},
+	{"RDAC3_MUX", "RX1", "RX1"},
+	{"RDAC3", NULL, "RDAC3_MUX"},
+	{"EAR_RDAC", "Switch", "RDAC3"},
+	{"EAR PGA", NULL, "EAR_RDAC"},
+	{"EAR", NULL, "EAR PGA"},
+};
+
+static const struct snd_soc_dapm_route wcd938x_audio_map[] = {
+	{"ADC1_OUTPUT", NULL, "ADC1_MIXER"},
+	{"ADC1_MIXER", "Switch", "ADC1 REQ"},
+	{"ADC1 REQ", NULL, "ADC1"},
+	{"ADC1", NULL, "AMIC1"},
+
+	{"ADC2_OUTPUT", NULL, "ADC2_MIXER"},
+	{"ADC2_MIXER", "Switch", "ADC2 REQ"},
+	{"ADC2 REQ", NULL, "ADC2"},
+	{"ADC2", NULL, "HDR12 MUX"},
+	{"HDR12 MUX", "NO_HDR12", "ADC2 MUX"},
+	{"HDR12 MUX", "HDR12", "AMIC1"},
+	{"ADC2 MUX", "INP3", "AMIC3"},
+	{"ADC2 MUX", "INP2", "AMIC2"},
+
+	{"ADC3_OUTPUT", NULL, "ADC3_MIXER"},
+	{"ADC3_MIXER", "Switch", "ADC3 REQ"},
+	{"ADC3 REQ", NULL, "ADC3"},
+	{"ADC3", NULL, "HDR34 MUX"},
+	{"HDR34 MUX", "NO_HDR34", "ADC3 MUX"},
+	{"HDR34 MUX", "HDR34", "AMIC5"},
+	{"ADC3 MUX", "INP4", "AMIC4"},
+	{"ADC3 MUX", "INP6", "AMIC6"},
+
+	{"ADC4_OUTPUT", NULL, "ADC4_MIXER"},
+	{"ADC4_MIXER", "Switch", "ADC4 REQ"},
+	{"ADC4 REQ", NULL, "ADC4"},
+	{"ADC4", NULL, "ADC4 MUX"},
+	{"ADC4 MUX", "INP5", "AMIC5"},
+	{"ADC4 MUX", "INP7", "AMIC7"},
+
+	{"DMIC1_OUTPUT", NULL, "DMIC1_MIXER"},
+	{"DMIC1_MIXER", "Switch", "DMIC1"},
+
+	{"DMIC2_OUTPUT", NULL, "DMIC2_MIXER"},
+	{"DMIC2_MIXER", "Switch", "DMIC2"},
+
+	{"DMIC3_OUTPUT", NULL, "DMIC3_MIXER"},
+	{"DMIC3_MIXER", "Switch", "DMIC3"},
+
+	{"DMIC4_OUTPUT", NULL, "DMIC4_MIXER"},
+	{"DMIC4_MIXER", "Switch", "DMIC4"},
+
+	{"DMIC5_OUTPUT", NULL, "DMIC5_MIXER"},
+	{"DMIC5_MIXER", "Switch", "DMIC5"},
+
+	{"DMIC6_OUTPUT", NULL, "DMIC6_MIXER"},
+	{"DMIC6_MIXER", "Switch", "DMIC6"},
+
+	{"DMIC7_OUTPUT", NULL, "DMIC7_MIXER"},
+	{"DMIC7_MIXER", "Switch", "DMIC7"},
+
+	{"DMIC8_OUTPUT", NULL, "DMIC8_MIXER"},
+	{"DMIC8_MIXER", "Switch", "DMIC8"},
+};
+
 static int wcd938x_get_micb_vout_ctl_val(u32 micb_mv)
 {
 	/* min micbias voltage is 1V and maximum is 2.85V */
@@ -3332,6 +3425,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_rx = {
 	.num_controls = ARRAY_SIZE(wcd938x_rx_snd_controls),
 	.dapm_widgets = wcd938x_rx_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd938x_rx_dapm_widgets),
+	.dapm_routes = wcd938x_rx_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd938x_rx_audio_map),
 };
 
 static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
@@ -3341,6 +3436,8 @@ static const struct snd_soc_component_driver soc_codec_dev_wcd938x_sdw_tx = {
 	.num_controls = ARRAY_SIZE(wcd938x_snd_controls),
 	.dapm_widgets = wcd938x_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(wcd938x_dapm_widgets),
+	.dapm_routes = wcd938x_audio_map,
+	.num_dapm_routes = ARRAY_SIZE(wcd938x_audio_map),
 };
 
 static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_priv *wcd)
-- 
2.21.0

