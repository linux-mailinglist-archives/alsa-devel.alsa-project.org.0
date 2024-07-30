Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E569940FA4
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 12:41:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94AA6EB1;
	Tue, 30 Jul 2024 12:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94AA6EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722336072;
	bh=b75YOHBxm2lQYDbG5iuWV5yJhvgfQruxGNEGB+zBnrQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=GJzg1L0ZDJVwfuPaAv1IzmYEx0tCy6PWxiRtdsCe2KFXQ0yoJga/F7fkQyBIK0wiU
	 XKN1M3U8eASHLbJIOYP8mKBNzvOqVJF8OV52OcVLpPoU92LgsLKoqv7kS0XYSD1F2z
	 xIQF37N9zxTbgTLgbLh2lb7EKz1zmXc8dXr1jaQY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA36CF805AA; Tue, 30 Jul 2024 12:40:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4763F805AF;
	Tue, 30 Jul 2024 12:40:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFBEBF802DB; Tue, 30 Jul 2024 12:35:24 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F2FD9F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 12:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FD9F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=hCsW+quq
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42808071810so25509525e9.1
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Jul 2024 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722335718; x=1722940518;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2k7WfqvNrE7q/baTECjG6uCgYMUMqGAXr8zev5hDQtc=;
        b=hCsW+quqtJLNZcPyBPMCbSXZDM/aMNPMxsBumvJ9r9OEHjIG3IcnjkFNSs/+R1OLM9
         A37cGH1DcrBAqm+17TdCW9WC+fGqTMjhFmXaVsL7rklG3GRO0CvTlA8Luv8uWEJ2ix46
         3Du2KpwNZJgyxP1mUFsNYeS8GzfNw70EX0b7l/XnVhC4xhOOxKjY5xOmkYTu8uWJQcRJ
         G2RZIHmf33WtC52v/JfryIx4UL4HBkOq8KVTCvq4df/gXIk6HISCywzOJZC+eljad+qz
         jwGeEqSg+S9G8f9v5YokLkM5JPSVkiT8kFrXGZGINiJ32eOmBCCxbMrTTQn9Zlg7e0I/
         LZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722335718; x=1722940518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2k7WfqvNrE7q/baTECjG6uCgYMUMqGAXr8zev5hDQtc=;
        b=nkGle0VKwoo3KJ6c0+emhMdFlLVaY9bU8hzDs/8gg24KJdufxq/nqO+ZyK9Q6l2S8s
         BxwAmW9uUX9evh83Y7+cxlA5qbh00ldpH9AVnAiEv6alPEo/qbWAgRMcfwea7TudYVvM
         yuV6Nbxj9RZRv868kg93uiBofh94cIRKJxIWoSNEG0r5k/Fq5cTvbmhwTZQ7LQ9hGvl9
         jUs8y0NqEVp6ECyqa6JXcXcQiAnjxcGixjvNAa1Ubgijn1MQwm4Pv+lu0fcp5rowj21O
         JT74K9vSbI50CkfdOKBDt+DI2EsDfVzyP3KACKCPyKx1mVYk4iotyo6lIzjj6037xb5d
         h+KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ8DyRpZH975wXF9fiGQMrWDVAZQ0ZbDqPQPP4s/YfHD7LbbG/wQSC/C7tdIoQgdQvHTbfQ1t1gTlpKagyYf0rmpayHer6vebN+Y8=
X-Gm-Message-State: AOJu0YzqmtK89X6fIhIrMlUVoxyT/DJe3ijfpoHbG0HHNyrB4bdhxVdu
	T1kdH9DR09rLhx0TE82VAfEwcvBn6MKnOU31pHDULl6vAbDl8eX2eh7mS6l7ugo=
X-Google-Smtp-Source: 
 AGHT+IE9D+3MsMR02xuAhjzlxgXskiGjsFnlnKtGunsAe9F0MUMFrjLgF7vKlnZ2xqmjqZZBdUI2XA==
X-Received: by 2002:a5d:560d:0:b0:369:5d7d:ee96 with SMTP id
 ffacd0b85a97d-36b5ceee0dfmr7519309f8f.27.1722335717783;
        Tue, 30 Jul 2024 03:35:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b36863d87sm14284048f8f.110.2024.07.30.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 03:35:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: Drop Banajit Goswami from Qualcomm sound
 drivers
Date: Tue, 30 Jul 2024 12:35:11 +0200
Message-ID: <20240730103511.21728-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7AU7A5OT5ZRQGGPC4B6JTHVTQV2TS22W
X-Message-ID-Hash: 7AU7A5OT5ZRQGGPC4B6JTHVTQV2TS22W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7AU7A5OT5ZRQGGPC4B6JTHVTQV2TS22W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

There was no active maintenance from Banajit Goswami - last email is
from 2019 - so make obvious that Qualcomm sound drivers are maintained
by only one person.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not moving to credits because lore does not point to significant
contributions. Just ~140 emails:
https://lore.kernel.org/all/?q=f%3A%22Banajit+Goswami%22
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c8e16a649a0e..43e7668aacb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18419,7 +18419,6 @@ F:	drivers/crypto/intel/qat/
 
 QCOM AUDIO (ASoC) DRIVERS
 M:	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
-M:	Banajit Goswami <bgoswami@quicinc.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
-- 
2.43.0

