Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE09910008
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jun 2024 11:12:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67F30DE5;
	Thu, 20 Jun 2024 11:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67F30DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718874765;
	bh=c4D7Z9CR9MfOFr8x4TqhuN903N+QSpMF6a7kToVGrDc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oC3fjSbFtvU0QTDa8czpiGtTEu7BNJWsJnYGbUDFWTg449hYX+5EM/PKnqzk1QbXL
	 IrNfxQnzq+gBSlLhpeNIqNULfh3Yaz3SYTuK8cmiOzFwM6sIspQt/2E6UGLr9zjE5x
	 WrygP+/RfXrbsvZotMIddmhIsgQjGD2yya4uyOtQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A52AF805AC; Thu, 20 Jun 2024 11:12:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 52F88F805A1;
	Thu, 20 Jun 2024 11:12:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84D90F8023A; Thu, 20 Jun 2024 11:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 25DEAF80154
	for <alsa-devel@alsa-project.org>; Thu, 20 Jun 2024 11:10:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25DEAF80154
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jg3zdH1h
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4217a96de38so5262795e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Jun 2024 02:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718874651; x=1719479451;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PHBkJAins6g8k8CRgVDBSrncktJoQ1zQZ+ZidiRGnrM=;
        b=jg3zdH1hiQKvoR7y16lGg76Ggp87MiG7g7GAMgOfuZ9lfL9OIvnvgypYFSGdzGOCw6
         23BvJc77I+mrf5TqZWl3Pr6NYo8yLsCuUortSuAyVhtGl3xvCXfRsKtxZlXJgk7H1Af+
         s7ok+rcGgtgK3pksOUVKVlri7oAQZxq2kA1pyh5K7EcV0rZs3zXaEVSQsMvqVPdedcXo
         k7Ag0shoP52USadNamsUpYu4ux7IjfmA257Hg7yUeo5azC4pcBEnkHf93X1nD3GOCCGd
         zc1lugsu+j/9nkpNStFCzmGTMrHq2lVOY2myZhcT3FFwbgb1gES4VfDct5+oqaHjNaQT
         5yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718874651; x=1719479451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PHBkJAins6g8k8CRgVDBSrncktJoQ1zQZ+ZidiRGnrM=;
        b=WqLyssCD5Kd4DXabllC+/5QoVaHLgk7GM8aGqTPep7NVo6CY425gIhnSiUujoUBBQE
         Ry0wwvl/eQIUzWwYEtV8ufxbubXEyXLX0yBXXkocHeunFs8vKPaE279owLQFaT/9nTdr
         +KEJ4EHlIAssDWBiYocxdhVumqjbAzOjnDI00KnVDLHDJSqKdWa0l9mvfuXe0QFFMOE1
         m/AulXjDlbofafEfevdND+8W5eDC7PU8H1MUsTWrANbcoTYG26cWoG/ecXekFKAaJjd+
         EE5KyWi+T7e4icPv/DSqL8o0W5Ca89ZbfkoeHNPYCEz1EeHYAE/lCZATCuxynRtUGJV+
         cPHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7oCwBDBHWd3zebihyJvXP0XxEGc4LZSP4lbVmTW0q3AW0D+1W4puw9rQiP/MDiMNkodeQ0wtPzpYUsFBYh9wZPHkqhulY8ASuCF4=
X-Gm-Message-State: AOJu0YwYXfsyDYbue9tyEH7+5UYLyMjbp2dhjR5ssR4w4y5Gceg/wysn
	0NTGPKJNOKV3RvBJy4ct0fuKbKVNYOwnR4znHiLihndpxP3+vLaM9fSEHZBBnvY=
X-Google-Smtp-Source: 
 AGHT+IGbAsr4VCtVmR91oxpzAar7lPnAha8zhGqOQi2bz0FL/BFRbaDZAys1bZaV9FZphUYTqCbqqA==
X-Received: by 2002:a05:600c:158c:b0:422:dfb0:8644 with SMTP id
 5b1f17b1804b1-4247529bc07mr38253855e9.33.1718874651188;
        Thu, 20 Jun 2024 02:10:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247ef50750sm8238195e9.14.2024.06.20.02.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:10:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] soundwire: bus: simplify by using local slave->prop
Date: Thu, 20 Jun 2024 11:10:46 +0200
Message-ID: <20240620091046.12426-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UNCR7ROULTESYYIVLGNV2C4ORLYENRRG
X-Message-ID-Hash: UNCR7ROULTESYYIVLGNV2C4ORLYENRRG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNCR7ROULTESYYIVLGNV2C4ORLYENRRG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The sdw_initialize_slave() function stores 'slave->prop' as local 'prop'
variable, so use it in all applicable places to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index 191e6cc6f962..263ca32f0c5c 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1410,7 +1410,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 		}
 	}
 	if ((slave->bus->prop.quirks & SDW_MASTER_QUIRKS_CLEAR_INITIAL_PARITY) &&
-	    !(slave->prop.quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
+	    !(prop->quirks & SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY)) {
 		/* Clear parity interrupt before enabling interrupt mask */
 		status = sdw_read_no_pm(slave, SDW_SCP_INT1);
 		if (status < 0) {
@@ -1436,7 +1436,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	 * device-dependent, it might e.g. only be enabled in
 	 * steady-state after a couple of frames.
 	 */
-	val = slave->prop.scp_int1_mask;
+	val = prop->scp_int1_mask;
 
 	/* Enable SCP interrupts */
 	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1, val, val);
@@ -1447,7 +1447,7 @@ static int sdw_initialize_slave(struct sdw_slave *slave)
 	}
 
 	/* No need to continue if DP0 is not present */
-	if (!slave->prop.dp0_prop)
+	if (!prop->dp0_prop)
 		return 0;
 
 	/* Enable DP0 interrupts */
-- 
2.43.0

