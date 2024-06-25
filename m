Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F81916EB7
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2024 19:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25DCAA4B;
	Tue, 25 Jun 2024 19:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25DCAA4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719334903;
	bh=IgGwHrHuFpbFHTEvgUPbclMeTRgHKAPJp73FYsZVpTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cxTFOLPe6hgZlWxCQZTDy96lDMoczxmJe4Jv22DlcEkJ3xDhHkFXB3xzZU4N3fxG6
	 Aoeh/YXO6bLQLX1oWlK/1vCoE6+ZOsg9NWEdGASt+CdWsFi22JxBio8fnTiSYe2FQe
	 G/pTH0aON1ELdEYqTL5odTHLlsA/r7yk8gw9HkcE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7485BF805D2; Tue, 25 Jun 2024 19:01:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DE94F805DF;
	Tue, 25 Jun 2024 19:01:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43628F800ED; Tue, 25 Jun 2024 18:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 963C2F8013D
	for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2024 18:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 963C2F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oySDwBFF
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4249196a361so18384695e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 25 Jun 2024 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719334662; x=1719939462;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRIDFf691thT58ox/N/VuEZHKFWQnoUZUCRyx39jn5s=;
        b=oySDwBFFInQs38DvGK9I+Gd/rL3aFGbzVxYqkZhMETLSOlgBc3ljm0iWxN5yiKcv7/
         qFFRy5OTVZlAG50ZB8DdVFegeJTOeOyQ/ADtmoJ4DCBpQcmf32ZRI49AvVoQiSUs4RNp
         AAEQlYLcOXLoFyWnysRfStc+/kLxn1I+W3LYYMdGyaJhzUlSrT/9GL8Ww5Yr8WXud8+M
         CVyKesmpRXSt0JlmJwQSAL1tG6T3ii7fvl1ysxfl0q/94XvoHj82bQBFYn7RRKW++xX5
         zbXz4zTVFQb413p0XJlZ8oCeZ31t52rqjZ3kI1zWKT/i3Ds5m0yLjJCQqnxcs84O9D44
         LQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719334662; x=1719939462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LRIDFf691thT58ox/N/VuEZHKFWQnoUZUCRyx39jn5s=;
        b=BwNQSQJWZmkHdq6YLbSiHNTSqg9x/puYo67fr3f6wEBOKTctcX8rx3HebXyreGK4C7
         NJIxxVB8DYpGIhvOHFD7BYRkgu2NxOHHK8IIdW8F6+nVvBrjM1vmjFRgFQX2Hd7KmPls
         fdQIUUCY6jkkh7W3ma7KnFjUHoIevnyD13N+yWVxo+mViLcA/Uacwa7tzGMEXFJftGxa
         B+QfgyKndo2QN5tGO1FjHTFqLcNsrEelJD/misf3562JnIuhm8u4ct+YgSUoCLS+SJPj
         jJmtQtuQrqNucvm1nlSaRVymnPGV6v4Tpy+GhwIzFXcEdqBI21Kd039xIhonTeyPWTd9
         YS9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVir/V3OaSQyF289jyJuMvloDyw7Ap8imGcbyDI4+Oav5UwD1htin+gV1KrZ+F70c1yfA5ZyhBvOUPDml2/VSjmOsl2YWv0/Uua1Q0=
X-Gm-Message-State: AOJu0YzhgPwXYXu/VBvGaFvqqEHaFpmUJzk0rmPFlZ+UKxIiLmHR4qpx
	EtWWxyruv1KDHC1CPfnphPJaCgapRUWmYr0YrIcH9NuvWvO8fo8NrxdtyR4XtrM=
X-Google-Smtp-Source: 
 AGHT+IE/O1fv/lIki0Fwzrt9YYS/r8AY/7+8D+IqPaAgKoFLSWyy9JqVUr3ddgb2fUcIuTZSME2ZbA==
X-Received: by 2002:a5d:46c2:0:b0:360:9cf4:58ce with SMTP id
 ffacd0b85a97d-366e96b22damr4696741f8f.46.1719334662267;
        Tue, 25 Jun 2024 09:57:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663a8cb6d2sm13360519f8f.111.2024.06.25.09.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 09:57:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ASoC: codecs: lpass-macro: Use enum for handling codec
 version
Date: Tue, 25 Jun 2024 18:57:36 +0200
Message-ID: <20240625165736.722106-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
References: <20240625165736.722106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5BJK6YWAV52J2RXA3AQVQRWDCSJUU4NQ
X-Message-ID-Hash: 5BJK6YWAV52J2RXA3AQVQRWDCSJUU4NQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BJK6YWAV52J2RXA3AQVQRWDCSJUU4NQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace 'int' with proper 'enum lpass_codec_version' in every place
which handles the parsed codec version (not raw register values!) to be
explicit about contents of the variable.  This makes code easier to read
and compilers could check missing switch cases.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-macro-common.c | 8 ++++----
 sound/soc/codecs/lpass-macro-common.h | 4 ++--
 sound/soc/codecs/lpass-rx-macro.c     | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 8b038a99a8f9..6e3b8d0897dd 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -12,7 +12,7 @@
 #include "lpass-macro-common.h"
 
 static DEFINE_MUTEX(lpass_codec_mutex);
-static int lpass_codec_version;
+static enum lpass_codec_version lpass_codec_version;
 
 struct lpass_macro *lpass_macro_pds_init(struct device *dev)
 {
@@ -69,7 +69,7 @@ void lpass_macro_pds_exit(struct lpass_macro *pds)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
-void lpass_macro_set_codec_version(int version)
+void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
 	mutex_lock(&lpass_codec_mutex);
 	lpass_codec_version = version;
@@ -77,9 +77,9 @@ void lpass_macro_set_codec_version(int version)
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
-int lpass_macro_get_codec_version(void)
+enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	int ver;
+	enum lpass_codec_version ver;
 
 	mutex_lock(&lpass_codec_mutex);
 	ver = lpass_codec_version;
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
index 94697d0ba8c9..3aa9737f2737 100644
--- a/sound/soc/codecs/lpass-macro-common.h
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -38,8 +38,8 @@ struct lpass_macro {
 
 struct lpass_macro *lpass_macro_pds_init(struct device *dev);
 void lpass_macro_pds_exit(struct lpass_macro *pds);
-void lpass_macro_set_codec_version(int version);
-int lpass_macro_get_codec_version(void);
+void lpass_macro_set_codec_version(enum lpass_codec_version version);
+enum lpass_codec_version lpass_macro_get_codec_version(void);
 
 static inline const char *lpass_macro_get_codec_version_string(int version)
 {
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 1c3429f004ed..320e3261c151 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -642,7 +642,7 @@ struct rx_macro {
 	int rx_mclk_users;
 	int clsh_users;
 	int rx_mclk_cnt;
-	int codec_version;
+	enum lpass_codec_version codec_version;
 	int rxn_reg_stride;
 	bool is_ear_mode_on;
 	bool hph_pwr_mode;
-- 
2.43.0

