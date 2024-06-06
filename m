Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A888FE805
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2024 15:39:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84AB0850;
	Thu,  6 Jun 2024 15:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84AB0850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717681143;
	bh=A6SXqGkyXxxcgHrEZHtDmBI/tOkvX/XnW5ssJY9STpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qW5b07ImPXXGeNydhglhe/3XGuI2xqKfUHvH3c5lIbub4utzIDRURMofJpCxlQY+V
	 Jsw63pcTDr8fN/doveuQCDFewulivO0jqNcH67xZ3p2UonQNvWKObzTX4iesT+IyJd
	 GZtLlCNbATtpqyhAqpe26bVqYkf+fjyXv4Q3mR84=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 790B9F805A1; Thu,  6 Jun 2024 15:38:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0294F8051E;
	Thu,  6 Jun 2024 15:38:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3305F804FF; Thu,  6 Jun 2024 15:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3845FF804E5
	for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2024 15:38:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3845FF804E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=krij4Iek
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a68ca4d6545so179482566b.0
        for <alsa-devel@alsa-project.org>;
 Thu, 06 Jun 2024 06:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717681104; x=1718285904;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3FtJnXuanKqQrI14wMr56vQtXua9vfr0htfdfN4mK8=;
        b=krij4IekltPxkEo6kZhUTNCzR9EvP03I8M1lRY2ffF0ArXBr9BvDXyFdv20sMCBL3x
         4xd6sWAZAe57nXs2dSevTvVwTyGir0t9PjTnT6LyiGbGDe2x8MMb/BpZ9Z+clymadqdd
         80JjCVZaa89Ym62TWP4pwRaH+zvuBce3QQwapPiTAihbAZ1O1V8+OKuBJzVtq1rcL1QB
         p17Da8rR7y3/62ogvM6pbXXyZBgALLHHi0J3YxUIllgJGMARnrmbvwXrqFaRo6woNBrf
         Wv7/Q/yHeh8mdj6YdWz3nMaS1wCfRHnFFZxBQDb7qwrbo8sWjUbXn88HjHFu2YbAJKwm
         GhZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717681104; x=1718285904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3FtJnXuanKqQrI14wMr56vQtXua9vfr0htfdfN4mK8=;
        b=snvP43umvmp5ynrK7KI0RHvc+Rs2YLHrs2DMIdmKGniKy36rCaOQRVRFADXCpmXsQ2
         I8h7te3OmSYzigOsTnpd3IHgd+6zp6EOGe6oNCwTUCEnrPXLzzPPy08At8Kblr8gW0JM
         ks9EHv45P8zZrE8cuj9H4BgV8tHxLeiawlDCYTaGKqwaw86VcD5N8QV5Wug8jb6sVv7Z
         MQDyEv+LEIzOxv7Pm0TRyAM7hPRoTjk7T5tLeM/A+Z7O+gNbE6dTs++KVZFdLNZOhAzR
         qekLY3QLNCeLPtwTi+pzEWrpFBPmwdvM+ckSJPvExgqzDI48kN2Fr9kkWefi62FhuSWu
         qKhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+xVG4PuOP9cMrnBTSJ5dZYW3HWTrJmmnBkB0k/gNqI3lNTEI0gjEa3LCisUgwWUKyFlXeJ+WnfnCB86FxxxQzkXGxCR281hWABIA=
X-Gm-Message-State: AOJu0YwvUummVa5wQ4RAJqxybiypJs5yN1CtpVhrg33FB/00po0nDAyb
	l6qFV1POycm4xRD3VyQkyR+pKcJEYqwuaBlQZj3s4Jg5QUONFwCtqqokKt96O1bbS+JgwyYksfu
	Y
X-Google-Smtp-Source: 
 AGHT+IGGh1ki9EKzIXM30V5LNCm2Ko5lpV0vUeAV0GMLMi1Sr1y4SqZGh77dYQrdKIRcuwCFwEQ0Rg==
X-Received: by 2002:a5d:5223:0:b0:354:db90:6df4 with SMTP id
 ffacd0b85a97d-35ef0da7179mr2046837f8f.23.1717670969348;
        Thu, 06 Jun 2024 03:49:29 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5e95bcesm1223185f8f.77.2024.06.06.03.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:49:28 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	krzk+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 1/4] ASoC: qcom: q6dsp: parse Display port tokens
Date: Thu,  6 Jun 2024 11:49:19 +0100
Message-Id: <20240606104922.114229-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
References: <20240606104922.114229-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570;
 i=srinivas.kandagatla@linaro.org; h=from:subject;
 bh=ri4vhulg4ZINJtTQIuA7x2JtkitUZzfgA3Wq29ZBz3Q=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmYZQxG2PLQMRgwWTkOxdJVbHoXpyRODp3JfC8D
 48WQNk8tgiJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZmGUMQAKCRB6of1ZxzRV
 N7iQB/9w/lG+yandz7RnuLtqKi1u30/oeoJ2aJw1Z79swhcGbEJ7eMqMVbkZ9PaHhPOPUIZs9jR
 tctEaoWtuXyhgaPVGVzPg0/I0AUmXaw/hlzxuj6BdhA56PYB5vk678+6iL57kY5117PQzRqapOH
 by9WZRQJtaq6oAb8w3WlnJuxKlCjwVOklREKzMTTXqwYnuS7l+OZAFyesYus9XRLQ+cchSISBTN
 S8QQS5s7Pn2Cjiqcc8bpPYXS5pfr/JnE7wqkiOau9qLM1iIvyFn5wNszwxWPdbWdpbtjj17I5io
 rNZIQnU2vhuz4gZljD2QJWPBOIVj00r6VOtsicZ/9kVeWXZG
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I4WZF3WR65JWK2DWVPX2HSM6E6UDGEAJ
X-Message-ID-Hash: I4WZF3WR65JWK2DWVPX2HSM6E6UDGEAJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I4WZF3WR65JWK2DWVPX2HSM6E6UDGEAJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

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
2.43.0

