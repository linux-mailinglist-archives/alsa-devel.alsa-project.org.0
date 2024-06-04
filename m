Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BDC8FAF36
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jun 2024 11:47:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9570AE68;
	Tue,  4 Jun 2024 11:47:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9570AE68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717494447;
	bh=7iOI2gyIz09ZExE7MThuktVMvBjq3HebuNyhlEujrSo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UPzmyzOx4o8xpn2GY4FFF9t/6suy5Zc61N+i/Gi8H438bgiqMVHMAB6Saqfstb4KC
	 A/ZkCxqD/zH8wGMNggS1Gfh99trCzKGqrDgKZpl9EYAWH1jZ52ZTLbcKplDfPL7P3+
	 Sv3uqu0OnVV8AIV5bqdSIXJhyf10eoiUaayOTa2c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BAF22F8057A; Tue,  4 Jun 2024 11:46:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE2BF8059F;
	Tue,  4 Jun 2024 11:46:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C9B0F802DB; Tue,  4 Jun 2024 11:46:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0B28F80088
	for <alsa-devel@alsa-project.org>; Tue,  4 Jun 2024 11:46:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B28F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=BPLUL8Wa
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52b912198a6so2913283e87.0
        for <alsa-devel@alsa-project.org>;
 Tue, 04 Jun 2024 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717494401; x=1718099201;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h8w3PHphluD8h1jsOJr+esaBLa0WpV3tSQ0DXHRhrVg=;
        b=BPLUL8WaYQrwtI9TOxR7H3pkcZNvlach6s5ebcIgPD921iuBFfW4JMguG/iYOsxAXk
         GTSbWzAgCcD9pAxb6A+PnVSY+yuswLdPO3NsOCuPY9s/OxKqPijv3g4/5sntO5ARBgP4
         C6MZSOwMDVmYmkR8bFh/tyUeClxamtw9U5pdGPqMA29uTcTNe+S6Ek9oXSKKquq4rawV
         0EiZv1h40l/jHjmPVOW39rGWr68djQ3rfQoggKPPQeMKAEcwIvmA8Emjk++JzLLVgzlo
         ODaVg4e44lUs/ReIkqbwfrL+4Omgq9kAjN0uLxd1VTY1WfYJhBAOhfYXPH3KoYBo9Yo9
         QTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494401; x=1718099201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8w3PHphluD8h1jsOJr+esaBLa0WpV3tSQ0DXHRhrVg=;
        b=CTcO4TSapG3fQMHZCmZgFHL8Uem5NmDSZN8YjlVnytNcZi4oDfJJ2aGSIm7Zqi/MOl
         7ysTdB602MBUYj1VoMsuy6wIrXFYHDvspjqqzbRpchoCggUEvNJBG+HHlgNNZCrujtAg
         /U9M6C5xvDaKX2nGQIFMokIycQJFEsCKTeap6nOyFSII+5Sn+Cl9H5u4jOJQ/01HbZgf
         QAMQJCik4hwVvevx4YR1m4scsNCkrBF7RU5BITbszXMCsIXuBP+JYrfED/lg+Wn/u2sQ
         3ZiX2ynFF2Bmz3YkFMAvzjBK4dicMOkMmgmbgiy5m9CV/fkwS0A7oqzwp7X8JgMeO7B+
         UvHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDPu/kPsN2IHZIIaP3UZsz8zCL95JP6MNK/XBIgpjFpT7osxkSYDgxy+rPEztoZQv2GtwhX6s2fM4pu1ivIv2g21mhrEhsbncPo8Q=
X-Gm-Message-State: AOJu0YwD3sQ9sHs+zFHrSh1W6E6TP6Pz/unlpSpX8Jh75H4V2ktsytqO
	MTgNSUGo0S5CMjnwM9NU79gXvN87WDylxMP8/2ZXHMh4+pUyK6FKOXqfn51NKVY=
X-Google-Smtp-Source: 
 AGHT+IHmnuqj5RmW/dGeIKGHajzkpP8hr3o/H52znLirAojQLFtRIWcisscJHUffN4MHWiqHDEGJUw==
X-Received: by 2002:ac2:58d8:0:b0:52b:82d5:b361 with SMTP id
 2adb3069b0e04-52b8959629amr8278360e87.37.1717494401183;
        Tue, 04 Jun 2024 02:46:41 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd0649fb5sm10903837f8f.94.2024.06.04.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:46:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: x1e80100: Add USB DisplayPort plug support
Date: Tue,  4 Jun 2024 11:46:38 +0200
Message-ID: <20240604094638.97780-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LT2JV3JYV6SPDJO76GOVUVU3EVEZVPXD
X-Message-ID-Hash: LT2JV3JYV6SPDJO76GOVUVU3EVEZVPXD
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LT2JV3JYV6SPDJO76GOVUVU3EVEZVPXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for handling jack events of USB (DisplayPort).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20240422134354.89291-1-srinivas.kandagatla@linaro.org/
---
 sound/soc/qcom/x1e80100.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/sound/soc/qcom/x1e80100.c b/sound/soc/qcom/x1e80100.c
index d7e0bd03dffd..bc00722b7fdd 100644
--- a/sound/soc/qcom/x1e80100.c
+++ b/sound/soc/qcom/x1e80100.c
@@ -20,12 +20,32 @@ struct x1e80100_snd_data {
 	struct snd_soc_card *card;
 	struct sdw_stream_runtime *sruntime[AFE_PORT_MAX];
 	struct snd_soc_jack jack;
+	struct snd_soc_jack hdmi_jack[8];
 	bool jack_setup;
 };
 
 static int x1e80100_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct x1e80100_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_jack *hdmi_jack = NULL;
+	int hdmi_pcm_id = 0;
+
+	switch (cpu_dai->id) {
+	case DISPLAY_PORT_RX_0:
+		hdmi_pcm_id = 0;
+		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
+		break;
+	case DISPLAY_PORT_RX_1 ... DISPLAY_PORT_RX_7:
+		hdmi_pcm_id = cpu_dai->id - DISPLAY_PORT_RX_1 + 1;
+		hdmi_jack = &data->hdmi_jack[hdmi_pcm_id];
+		break;
+	default:
+		break;
+	}
+
+	if (hdmi_jack)
+		return qcom_snd_dp_jack_setup(rtd, hdmi_jack, hdmi_pcm_id);
 
 	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
-- 
2.43.0

