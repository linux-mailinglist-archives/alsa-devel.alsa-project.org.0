Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43134953894
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 18:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 449B52BAF;
	Thu, 15 Aug 2024 18:49:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 449B52BAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723740608;
	bh=tFpXS3GuOZgmyhYlErFt6pCIn0BCfVCnojKLEo1Xp0s=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uxqAP5F/xGOaTmvP6XsHReA2hDSWhkGbzB3a8ofjbdHUZfEprCwlsH7im9XaYlr+O
	 m5ZIvTHBB7vrnXgO/Bko4uh6nNPlIhHS5HBJfjeh65Ca0BIzAm+vrjr4uT6XLGDutv
	 bJO8gtcoZtn2UjWqzLZgUQk0QkOcw9N9vIr92M1g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C6A1F805B0; Thu, 15 Aug 2024 18:49:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A48F8F805AF;
	Thu, 15 Aug 2024 18:49:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 920CAF80423; Thu, 15 Aug 2024 18:49:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1AC3F800B0
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 18:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1AC3F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=j2kI4fPc
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-428163f7635so8205705e9.2
        for <alsa-devel@alsa-project.org>;
 Thu, 15 Aug 2024 09:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723740548; x=1724345348;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Y6ZvBDWCoaIRtuHQSX0AStS65o7NOQvjseSgluHUkE=;
        b=j2kI4fPcqtD+cSia39cNg/WQ8bmXnU2CGbZgFRaBvMWp56pZbNuc4CSe2kHDVYWiNr
         i3uhFc4PDWPANzo0kbZ18MecOSrKWaR3QFLiZ9s6wDQEZMuRcirvtAeO6xfgWfROa/zc
         y8ws8cwDQoqWG3mL2bqePA5v+EIuVKosIBxx0l8qat1409OfT6QAeTkXrr6nsdWhLt2N
         X356SUD43JTEorbX9l0sJskfAGhcLbLjcnRRqJRY59H2wG7oooilinBxoZTMLyTNQqWq
         5Zp812b0gliv3WUFodChlNWgYuNyIyhrDh7OxoXWlRipwxaHje3Fj/3VhYoPqI06FqWP
         +rLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723740548; x=1724345348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+Y6ZvBDWCoaIRtuHQSX0AStS65o7NOQvjseSgluHUkE=;
        b=PjoKLFeLdqIWwiaM8lwxCMjq2cbgICUUdQTvP4T9rJ9ynJRj3l5awvDSZp2vOmC1iS
         +DqSYqegVNfTzJ3kTSOxQKqvPZofRvFWBwm31ElqX6h5FHwn02JU3J9RS84um+h9suZ4
         mP9fhCFCcEI+W1iEe5dqyQPCMSZ4VB8xAaZk9g2hmpNkA2145zsvJ+l63D1yvG7xL9HT
         qlK9V25C8KPx0Yjucvf7Hp0Gs8mWdhWkpuHydLGvwcG0aVqM5OzXM1lxnzaJZTnXjBRJ
         n4TOhucNGXdGswCSMxnWHlWTY1C8RCFUTlz6vqu3B0xqxlvLkQI/fUQg7wygPuswpBOw
         57zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHVjE5NNCp/xSoXFSzcRhMjL52ZyF97k+2t/8qZM1OFp2KJlbJtuKdUv4oA3TS4QitHRKZHU13YIe/7JAomYFsAnHyn58kZa3MgTY=
X-Gm-Message-State: AOJu0YzPPyZUm97QX7sA3TUJRPfvzyaN5cnAkQvNEE7v5k8BL1aLsjoT
	BTzkV/HMIduxFtB3GMrrwRoixBcZ5us2Adsi0IQLpNTPFymXHifyfBhqF6ahxu4=
X-Google-Smtp-Source: 
 AGHT+IEBnZLAf9YOI60yg1r6SCUktEL5+20HiBAaC6yEF9ZLknx9q0499kEGmstkp3oNB17v8y2TrA==
X-Received: by 2002:a05:600c:3108:b0:426:61e8:fb3b with SMTP id
 5b1f17b1804b1-429dd264e92mr45940385e9.27.1723740547705;
        Thu, 15 Aug 2024 09:49:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37189896bf0sm1940718f8f.73.2024.08.15.09.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 09:49:06 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	amit.pundir@linaro.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: lpass-va-macro: set the default codec version
 for sm8250
Date: Thu, 15 Aug 2024 17:49:03 +0100
Message-Id: <20240815164903.18400-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AWKQCXFKCGXJXC5D55MZ4KQLIKKU5XTE
X-Message-ID-Hash: AWKQCXFKCGXJXC5D55MZ4KQLIKKU5XTE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AWKQCXFKCGXJXC5D55MZ4KQLIKKU5XTE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

sm8250 and sc7280 have lpass codec version 1.0, as these are very old
platforms, they do not have a reliable way to get the codec version
from core_id registers.

Add the version info into of_data, so that it does not need to use
core_id registers to get version number.

Fixes: 378918d59181 ("ASoC: codecs: lpass-macro: add helpers to get codec version")
Fixes: dbacef05898d ("ASoC: codec: lpass-rx-macro: prepare driver to accomdate new codec versions")
Fixes: 727de4fbc546 ("ASoC: codecs: lpass-wsa-macro: Correct support for newer v2.5 version")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-va-macro.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8454193ed22a..e95d1f29ef18 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -228,11 +228,13 @@ struct va_macro {
 struct va_macro_data {
 	bool has_swr_master;
 	bool has_npl_clk;
+	int version;
 };
 
 static const struct va_macro_data sm8250_va_data = {
 	.has_swr_master = false,
 	.has_npl_clk = false,
+	.version = LPASS_CODEC_VERSION_1_0,
 };
 
 static const struct va_macro_data sm8450_va_data = {
@@ -1587,7 +1589,14 @@ static int va_macro_probe(struct platform_device *pdev)
 			goto err_npl;
 	}
 
-	va_macro_set_lpass_codec_version(va);
+	/**
+	 * old version of codecs do not have a reliable way to determine the
+	 * version from registers, get them from soc specific data
+	 */
+	if (data->version)
+		lpass_macro_set_codec_version(data->version);
+	else /* read version from register */
+		va_macro_set_lpass_codec_version(va);
 
 	if (va->has_swr_master) {
 		/* Set default CLK div to 1 */
-- 
2.25.1

