Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16559905882
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 18:21:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A23E9D;
	Wed, 12 Jun 2024 18:20:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A23E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718209260;
	bh=DfQrCy7EPdHobgPyU9Z15QMCzkozExD4qQYmVl1720A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Pj/W5S3Vvx0KhwniY8LjpfAK/6bsdm0okX7UtTgvJ/5h5p6igtR1iUmu75gvBjTVH
	 85D5POeB0DJn0gxaRYsizSTKnUJxc80CY3K/Nbp11VFESPULJqchaFSi1YSYd1MKvB
	 V8x4n3ttgX6HHGNlBtwPIu3YmBHoJDmwxcygX6wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD30CF89664; Wed, 12 Jun 2024 18:16:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE6CF8961A;
	Wed, 12 Jun 2024 18:16:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211A6F80760; Wed, 12 Jun 2024 18:16:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6D9AF80678
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 18:16:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D9AF80678
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=r4TsAXHV
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-57cad4475e0so1140649a12.1
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718208963; x=1718813763;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2qLhgW8KCLNLm5E9+T5V7rINfGXJY8In7L0xJk0yrk=;
        b=r4TsAXHVmHkS6CIj/jRzvgBRkoB2Ee4OX8sbLGwTshs1pwOxUWYNuStijjDbGicVvK
         7vEMD4CEywtfbM49+3qX7Fj09x+dxg4gC3EB/TWQ1hO0kPsC7W3TE9+JVdxgeqHRd0Iv
         ZZeCs+aqzlJlbp3C80yRtEFgyjeqBIqXKVVD4OR96Bxg5rgZQZQ/uOQZaBvwzUq97zd9
         qlBtKyQlCLq3xfhwOZJc4ybk83iQ810UPvEHABCRM75gddnzy/JSDxnfdHuqRU0y8xW1
         3WFGS0nT2nFEwEvFw0aLr3bOmETxmgPyLghxr/2EeTiuKrpEXXkD5CVT0kJ0VRGG374X
         jXIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718208963; x=1718813763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2qLhgW8KCLNLm5E9+T5V7rINfGXJY8In7L0xJk0yrk=;
        b=AlLaSymZPpPZrUsBclA8Edn6EXJoA6wwa2zhUGpKn1Hw0q+i6+9h9gdT4bae/gcm2L
         Y/DZTfx/lyQ4dtfl0/B8nrLdx3cosP4VWlgs4hz1oH586oBOBln7rPUPvlTRUGnm7wXL
         lUkt1ga99wqcLOZb3JjFBOxlq1uG5hHpx7te08LoqpbX4mV4uYmJyGpgRU1BJeDK/dsY
         8lJNth3aHLhr0FmAYk2p4JtzOgQLZ6bhvARVItXiml5waOuia0kzdOOUusSqBIawvsU6
         4bGRVQ4I3792xn+f7r7p+iTTc9Q88Kx8WI8FHoOlsfFrjXoS770bg27cmakd9TqhBaWw
         W2TQ==
X-Gm-Message-State: AOJu0YzWdQ5pAefJLwsybwwMJXjGmc1HzQnWF+Tx9a3GD3bBO3rdbFOw
	eOYH/ErqF9I1Yv/dMhhSkexSXNw92VUufEr45jfrlGlLvzh9Fm1Njq4SIgXudPw=
X-Google-Smtp-Source: 
 AGHT+IEaxDscDTCz98NySxu5kWNh8RbOVnW92/hmTae69P40NS2kQrWhez3Q7lBBRuGgxN9hl/EswQ==
X-Received: by 2002:a17:906:27d6:b0:a6f:4232:4370 with SMTP id
 a640c23a62f3a-a6f523ed34cmr9882066b.5.1718208963267;
        Wed, 12 Jun 2024 09:16:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6efd6cfb74sm624815866b.20.2024.06.12.09.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:16:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 12 Jun 2024 18:15:28 +0200
Subject: [PATCH 15/23] ASoC: codecs: wcd937x: Drop unused chipid member
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-15-0d15885b2a06@linaro.org>
References: <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
In-Reply-To: 
 <20240612-asoc-wcd9xxx-wide-cleanups-v1-0-0d15885b2a06@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=DfQrCy7EPdHobgPyU9Z15QMCzkozExD4qQYmVl1720A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmacmke3u0kf8lnyb0s0QfPL8aI/2dH2R1t684n
 kmKyhh8/siJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmnJpAAKCRDBN2bmhouD
 1x8cD/9qfnVnoulRcTk6aU0YK+dtSPJsmk9BsXwzTqwP6Ehddbn+CarFRP2bjWywEuweaxNGAl+
 QaGdzy8AFkLtQzgtJFZr3nf/CShN+mvfOIH2zK7VmnhYihL4+AW6RS+Y8Bm21xvFFGbZejrOKQa
 9l3kfbRn5+8s5ZIxIQ+zba/V+sZsG9fAYIAO560YoCCejowEl60W7uJ3+yntEBo2ADlE1xsdnCw
 OH9NOL0L+V24troQbqXV2v+tN6txvfka2NGDrIDNfVoFfipZlijd/8I14YSnoZwFgBARcyqCFyg
 CoZX8HVQLxLFfo1ljtLJAahgmZQ/XRDZj13hM/TF52MaYuV/zaSW1Jyw63Qn2lAn+0zvojZobnG
 7RXw8KUbnOBc+tecVdA441Nz68RKgnx0M9r4EOl0j9rb2TwsfeT3vjGJHU3sxxbwnzamMTqK3m3
 JVSrInxoo4VVwvrCbRTNk7WA+a20B4A/jhRwUq8//Gtusg7D4jt9ahU9OOy/aTo7fEECG1ZYF61
 ysCZxeUFm2vdapjO40MtZC+DJjmeuCCaN7p0jYl+UTgiKPR4bJHo/qy/zXr67r/0bkl1BF9LzAs
 DEVKCINiuMNGwbtL//wTaiUlfmVwvC5RxShzuz32ycPERp750AWQkqX4ZBNGAJq6kL5/W8+Cts7
 TSWOUyWEsbCbCRg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 5SB5B5PYBYVG7VI56GHKVTU5WV32EZ7T
X-Message-ID-Hash: 5SB5B5PYBYVG7VI56GHKVTU5WV32EZ7T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5SB5B5PYBYVG7VI56GHKVTU5WV32EZ7T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The driver stores the read chipid in 'struct wcd937x_priv' but never
needs it after.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 96e2989f9722..4beb70bc4d8c 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -99,7 +99,6 @@ struct wcd937x_priv {
 	s32 pullup_ref[WCD937X_MAX_MICBIAS];
 	u32 hph_mode;
 	int ear_rx_path;
-	u32 chipid;
 	u32 micb1_mv;
 	u32 micb2_mv;
 	u32 micb3_mv;
@@ -2539,6 +2538,7 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 	struct device *dev = component->dev;
 	unsigned long time_left;
 	int i, ret;
+	u32 chipid;
 
 	time_left = wait_for_completion_timeout(&tx_sdw_dev->initialization_complete,
 						msecs_to_jiffies(5000));
@@ -2552,11 +2552,10 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 	if (ret < 0)
 		return ret;
 
-	wcd937x->chipid = (snd_soc_component_read(component,
-				WCD937X_DIGITAL_EFUSE_REG_0) & 0x1e) >> 1;
-	if (wcd937x->chipid != CHIPID_WCD9370 &&
-	    wcd937x->chipid != CHIPID_WCD9375) {
-		dev_err(dev, "Got unknown chip id: 0x%x\n", wcd937x->chipid);
+	chipid = (snd_soc_component_read(component,
+					 WCD937X_DIGITAL_EFUSE_REG_0) & 0x1e) >> 1;
+	if (chipid != CHIPID_WCD9370 && chipid != CHIPID_WCD9375) {
+		dev_err(dev, "Got unknown chip id: 0x%x\n", chipid);
 		pm_runtime_put(dev);
 		return -EINVAL;
 	}
@@ -2605,7 +2604,7 @@ static int wcd937x_soc_codec_probe(struct snd_soc_component *component)
 	disable_irq_nosync(wcd937x->hphl_pdm_wd_int);
 	disable_irq_nosync(wcd937x->aux_pdm_wd_int);
 
-	if (wcd937x->chipid == CHIPID_WCD9375) {
+	if (chipid == CHIPID_WCD9375) {
 		ret = snd_soc_dapm_new_controls(dapm, wcd9375_dapm_widgets,
 						ARRAY_SIZE(wcd9375_dapm_widgets));
 		if (ret < 0) {

-- 
2.43.0

