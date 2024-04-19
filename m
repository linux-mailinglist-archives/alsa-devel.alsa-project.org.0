Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6348AB142
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 17:03:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AB26DF6;
	Fri, 19 Apr 2024 17:03:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AB26DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713539023;
	bh=z/01KbpJUrnhSXb2YDfo1h/eKOvCBmVA/IVm+kzFUng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GJaDEBhkfke0oNmTtIKCRzuw2eRZDt8rRXe/lOTP+Y54ey3Zr2tgbj8wVuIm1hPlT
	 GAdOkC8NILlhC/sIhrnp9H2ObocMF76twF7i1YbrQt4SE96yu6Bc8IUNMfHzhuYwlA
	 YYDudbW4uGMvyzojdA07eJqiQn3VXr9OYO3l8eXg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24D27F80630; Fri, 19 Apr 2024 17:02:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 72576F8063C;
	Fri, 19 Apr 2024 17:02:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CADAFF80620; Fri, 19 Apr 2024 17:02:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 368E3F80601
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 17:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 368E3F80601
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GNuN6+9d
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d87660d5c9so23073721fa.2
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 08:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713538908; x=1714143708;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zadu6QxqqDPKAQWxO1aQV8SmpVW6EVj/pCdtlgNCkU=;
        b=GNuN6+9dHjp59Byzi/RD15+UnI3a4x9EcUd2qmnt2qXaMVtgmtUzotGcrDbR4eaipT
         oEo8vMB/EChPkGg92BP/yu6dPkCimi/dDf+RF7JWZv1CjpZPtDBLXX+SFEN5vlG5eV16
         5K3BpSmxnR7uSwd4SP2l942s4Y1tHQSKHUAW3J0Ld5AXloB8mrPjgAlstNblzNqCddvO
         XhrZPNB0rgkhd+tkU1z50iMLXVNPPvd68tFMmMSwWntXiyAAJOfN9FoQXu1Vj17ilL2F
         VRLw1I7VhP7683cv28WBiis1/nd4iNNyCkRw6t7QXwVzf4mhGX/pkUNe6BiCxyB9DmhP
         s8KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713538908; x=1714143708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zadu6QxqqDPKAQWxO1aQV8SmpVW6EVj/pCdtlgNCkU=;
        b=ff83CIfG1kaGi01MxG1BUSA16kmg1beaBBj+d1US0xScdBQXJ/Ln5GDNRXadF3ahFz
         8LpZcSV4fzZjQ9+xrNn+aWbpZhr/0lpKu48vEyxxKtgoHh8Dp8eexiTNjwQ8bFCYtaqL
         Hxsoh0ChQ8TYhFbV+9hvGlqKwx1mr5BIWc+PZbmdmDuYrbrP/aM1eUIq2gXXxN5MER9y
         2pZ0bGnMiqolMcEF7wjbmUPiYlH7QuQMfmJm+20b1ylMwSQUtUwWfElpmdknY7wBmAw1
         p5S+DTzjQVu92Iy9Y3fJoEVa0kM0zoNpfX+keTeFZQjrygOls4ANmHbYLY1MCH7fabB0
         44cA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOx5Au35i/Zj6cICQAzBi24sJKbKkH/lPm8j8DkbpS9N3q8ROel/rPNS5KaZRWksUgQ6n5FgKSbbz7f2ln6/RwoecpfYzOh6/mhv0=
X-Gm-Message-State: AOJu0YxTUa5LLBYis15G8k76fB9PPG7HCm5ifYrHwiegw/GiH309KGv9
	4hOoGRWKVc/R4hMkv1Yk6fgGVg4W6jLEati9uVPigfEEDjKN6d45Zc8nElAeQEA=
X-Google-Smtp-Source: 
 AGHT+IGL1W85WvvhW6kovpHuj891c1aSzJ4lVgOhlczmIfJv+733Fam7cnZaouVfnf6+MpkTnF3jyA==
X-Received: by 2002:a2e:9f14:0:b0:2d7:1323:6792 with SMTP id
 u20-20020a2e9f14000000b002d713236792mr1881512ljk.43.1713538907620;
        Fri, 19 Apr 2024 08:01:47 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b00417ee886977sm10660462wmq.4.2024.04.19.08.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:01:46 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/4] ASoC: qcom: q6dsp: parse Display port tokens
Date: Fri, 19 Apr 2024 16:01:37 +0100
Message-Id: <20240419150140.92527-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
References: <20240419150140.92527-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33FK6AKZBZ4O2OZ45NIDC376OTDC3LKG
X-Message-ID-Hash: 33FK6AKZBZ4O2OZ45NIDC376OTDC3LKG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/33FK6AKZBZ4O2OZ45NIDC376OTDC3LKG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
2.43.0

