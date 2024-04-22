Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D65EF8ACE93
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Apr 2024 15:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6F5CE66;
	Mon, 22 Apr 2024 15:44:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6F5CE66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713793480;
	bh=rPldZ9H/ghc6AHkcMuyq2S8TeCvPuuLZe494dCfPxzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i5IHjcRdDg5DcBPRk50a56akOwPFqqDcSS9qdSR9I3LHH9jYWIdO8EflBE6jC9Eur
	 HIIW8Gar3GRxj3eSXjIW/Qiaw48DLl8lXffRRSQXoDhh/CZifVBfPxesv8MrlR8I75
	 Vv2bpfX+6QwwGljAi4Vr4m15lu601nJhhttqXc4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA37F80568; Mon, 22 Apr 2024 15:44:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44612F8057F;
	Mon, 22 Apr 2024 15:44:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40C22F80423; Mon, 22 Apr 2024 15:44:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D898F8003C
	for <alsa-devel@alsa-project.org>; Mon, 22 Apr 2024 15:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D898F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=JzUNZaWG
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41a7c7abdbbso6371555e9.3
        for <alsa-devel@alsa-project.org>;
 Mon, 22 Apr 2024 06:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713793441; x=1714398241;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C68a3MzfkPxx0ofANoAgzKhNox/WCcxWh7hhMFfdoBw=;
        b=JzUNZaWGvtISqJ1d28PRW6/YSXd2WflRk+ae+Bf95z/HQFI4pgfbs3J28DMrt/6rQ0
         i73W/jk398Uj+RK0PWz9iSD5NwfRlCifOLvSU6lWsBzkUPAoy2LfZUC5mKzx5Mwul3in
         h8IWGdHNg2huONA+elMpepNsbeUfMlw1h2u4MWvSAmHCqCLgbljd/AXP1Y0gP3OelMMb
         SgDsKu9gqWuA9MpKOR2iBy/FlKJ8ulXPdOiSteyN3ClNPQ9qty1+kVtVSrTj5nR5Xg3l
         VcsQzbCPFKpdvVkvT5aVbyYKE4hhqy0ZiSqmv09wJnwRiAOGjWAYeWUNvhC1BCCb4ujG
         SJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793441; x=1714398241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C68a3MzfkPxx0ofANoAgzKhNox/WCcxWh7hhMFfdoBw=;
        b=qM7tdNWvYmU6GGX5Id+7vfOwWUjiPKAUYzp0r8WIxi+LXNGM/v4Yhdh18aPMMqRq6b
         nHi3EfeoyE//McZPm8GIAiJN79WBghgdRA8MVZXbI3vSjLE39WN0LR9tFPfr7/ORDpet
         FxSy/f9W4YNs8B1xEZhIs2M+997mYmRd5Lpc5e1nbtMnEe/Rv6SNMm0KqsTJZjJBqthO
         cy0A7qeLboRH8ysES0182MTr4vd6ZtrJ1ZYDDO/vswXCHpH2XTO3p8r4Y0Ms3NaKOMXt
         XM39MGY8qCZ7blBhMkFf5bWd2D4EDRFtvecdQuXKouDkKqCxU/1El7eg6lO4yEAddvpp
         J6XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqmkgVY9OrBEI7HXGyBxaEr/5aHzTZoHbpTvvGhEfNimpN3TMin713SGPjH3ENPMoxaH73jXJZLs2h61spe0saukHcStO3IJ76G0U=
X-Gm-Message-State: AOJu0YwtqoJYFlOpaUUzRVcSk5bmBY9X6BGiQmAUmuBKBT4tbzwJ8ExA
	WbQLwzAAycF0ZBA9rjsA+w20YUegLDhK6jxH//wMPao1L64J8uLrdGMC0bKPm0o=
X-Google-Smtp-Source: 
 AGHT+IF69zomYFFe3gyx0JQZWSWnA/EuT1tmDcqnUqTrWCK1PAfUVruv7UpMnVLeTSrBE1kQSTUlSg==
X-Received: by 2002:a05:600c:3b1a:b0:418:a706:3209 with SMTP id
 m26-20020a05600c3b1a00b00418a7063209mr8005525wms.31.1713793441064;
        Mon, 22 Apr 2024 06:44:01 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 g18-20020a05600c4ed200b00417d624cffbsm20731069wmq.6.2024.04.22.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 06:44:00 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/4] ASoC: qcom: q6dsp: parse Display port tokens
Date: Mon, 22 Apr 2024 14:43:51 +0100
Message-Id: <20240422134354.89291-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
References: <20240422134354.89291-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZFDZKQVIQ4KVYGJMIYK5J6LNUYBPDLR6
X-Message-ID-Hash: ZFDZKQVIQ4KVYGJMIYK5J6LNUYBPDLR6
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFDZKQVIQ4KVYGJMIYK5J6LNUYBPDLR6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

DP Module needs to know the data format type which is specified in the
tplg file, parse that info before setting up the module.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/topology.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 70572c83e101..27a5adb201c3 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -730,6 +730,29 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
 	return 0;
 }
 
+static int audioreach_widget_dp_module_load(struct audioreach_module *mod,
+					struct snd_soc_tplg_vendor_array *mod_array)
+{
+	struct snd_soc_tplg_vendor_value_elem *mod_elem;
+	int tkn_count = 0;
+
+	mod_elem = mod_array->value;
+
+	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
+		switch (le32_to_cpu(mod_elem->token)) {
+		case AR_TKN_U32_MODULE_FMT_DATA:
+			mod->data_format = le32_to_cpu(mod_elem->value);
+			break;
+		default:
+			break;
+		}
+		tkn_count++;
+		mod_elem++;
+	}
+
+	return 0;
+}
+
 static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 					 int index, struct snd_soc_dapm_widget *w,
 					 struct snd_soc_tplg_dapm_widget *tplg_w)
@@ -760,6 +783,9 @@ static int audioreach_widget_load_buffer(struct snd_soc_component *component,
 	case MODULE_ID_I2S_SOURCE:
 		audioreach_widget_i2s_module_load(mod, mod_array);
 		break;
+	case MODULE_ID_DISPLAY_PORT_SINK:
+		audioreach_widget_dp_module_load(mod, mod_array);
+		break;
 	default:
 		return -EINVAL;
 	}
-- 
2.25.1

