Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB0195E2D6
	for <lists+alsa-devel@lfdr.de>; Sun, 25 Aug 2024 11:03:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 928B983B;
	Sun, 25 Aug 2024 11:03:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 928B983B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724576591;
	bh=1J6BWW2PKL0LZoDDixa5BAHxaPBO3B1K4JK5Epy75ZY=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=VaXQju5kJPSvmZXShTHUMRm5d4yHA7onzKmPOeJ3Ib6OEl7I0paqrGlHRGxgzBsnQ
	 830+h/GA0zV4z5auTUrnS59YOedrTDZrR+HaPtRHqwC16xILrq3UCCSX9OX9ymoHY0
	 4dfb2dyv+4YJ9IHtqR48WVHbHJ/IXu8wasJK6Qf0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BC8E0F805AC; Sun, 25 Aug 2024 11:02:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A9E8FF805A0;
	Sun, 25 Aug 2024 11:02:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3EC13F80423; Sun, 25 Aug 2024 10:59:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C1A52F800AC
	for <alsa-devel@alsa-project.org>; Sun, 25 Aug 2024 10:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1A52F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NOj44ar9
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-428e09ee91eso4097695e9.3
        for <alsa-devel@alsa-project.org>;
 Sun, 25 Aug 2024 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724576269; x=1725181069;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RJtwn4ZxojcRke0143CcWqq6cxB8ohpeltqblKHrcIk=;
        b=NOj44ar9bv+y2bs2aJtYfgdEk4ogOb/cl+Y40iDGxpx72KBJj/kYOmn6Wuzo8ZMuX9
         SvEp58RfqXavKfD0L9RTuiJ3qq6Uvbkv7dTrA+C518AiZaSvXvX9k03wN/sUjhnqQfIY
         kvKGTEqaVIQ1HeL+wkX9sSpPSV0xxiDnQe7OvkkC8pdDc+CjNdCG0uO5hzNcZR6gt/1t
         fQW1SO++hYWUpVp/vWi4zINVBrx2qn+FxYzcazvuO0A9Sg+WvT3n69epZTh8+EECsOG6
         m6FhrjZDG9uaDDbpWf/6vNNwgKuyi709wkmR60JTINMtrQtlaR6L6Fwg38AItl4xtpTK
         NPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724576269; x=1725181069;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJtwn4ZxojcRke0143CcWqq6cxB8ohpeltqblKHrcIk=;
        b=kIxtwqseGc4RWvGsbO5glf+Yifg7e0+8XTRfIfv5iSn2vS08nd/Z6jgGsT3Q3GFtY7
         uHjG1TVZfn7N+rCJRKWwFgG0S2RQEUZdhJ4gLFxLl3DP6+GfqWj+1E5CgDTOHfK4SUTJ
         g1BLjXbPqlrtljO+2MaC0bgFCac5EiFEURAI2SHfSHsy6mRa2XT4xWNVcmLQvL1HbkS2
         3xn2cnXWlT1x8jvcfGlEdrDD5ljmn85XZDx36ogM782Xvn7Juxcfi2ildMJq+jd5dIpP
         oo7sAckKUxHHHcvavIBxXHq0MTvLStkYwBaog36m1GFuXiZsGHYszpm47SxhwvV1nSxN
         Y6rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW68yc3+ftHm2GuCPBwdt18AaKHUzRg/v5iwBZVWlzBYqKQ9aAjkPpvGF/bYvRirAyDlmEC92u57rCr@alsa-project.org
X-Gm-Message-State: AOJu0Yx4a5bqDjmLz0+SS56k6yKDpuhLDQwHmzUsGQuMEsAoHahza8Bm
	lQrgJEMpnxbCOw7gK46UWo/rNsYq6HrVGEOBZvKfr+X8SpI2xZsMoldghl/LPmU=
X-Google-Smtp-Source: 
 AGHT+IH2giCB6AK7UOeGgPjHxZzeVMkrTX0peXsvssYIaa3ZOlWUGHmwGDlXFRjxw2dLm3mN2IDBOQ==
X-Received: by 2002:a05:600c:3b8b:b0:426:67e0:3aa with SMTP id
 5b1f17b1804b1-42acc8d50f1mr30009775e9.1.1724576269155;
        Sun, 25 Aug 2024 01:57:49 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42b8a351d3asm57432765e9.13.2024.08.25.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 01:57:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: MAINTAINERS: Drop incorrect tlv320aic31xx.txt path
Date: Sun, 25 Aug 2024 10:57:45 +0200
Message-ID: <20240825085745.21668-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: POR4WHQWKOWVQU2UIEXXGUABDNLPNLE6
X-Message-ID-Hash: POR4WHQWKOWVQU2UIEXXGUABDNLPNLE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/POR4WHQWKOWVQU2UIEXXGUABDNLPNLE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tlv320aic31xx.txt was converted to DT schema (YAML) and new file is
already matched by wildcard.  This fixes get_maintainers.pl self-test
warning:

  ./MAINTAINERS:22739: warning: no file matches	F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt

Fixes: e486feb7b8ec ("ASoC: dt-bindings: convert tlv320aic31xx.txt to yaml")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6574b4910f8a..028186bb4e8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22736,7 +22736,6 @@ F:	Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
 F:	Documentation/devicetree/bindings/sound/ti,pcm3168a.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320*.yaml
 F:	Documentation/devicetree/bindings/sound/ti,tlv320adcx140.yaml
-F:	Documentation/devicetree/bindings/sound/tlv320aic31xx.txt
 F:	include/sound/tas2*.h
 F:	include/sound/tlv320*.h
 F:	include/sound/tpa6130a2-plat.h
-- 
2.43.0

