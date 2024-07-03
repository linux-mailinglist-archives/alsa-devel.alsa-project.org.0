Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AEB9258CD
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:36:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35D671930;
	Wed,  3 Jul 2024 12:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35D671930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720002995;
	bh=cOn7ju16wjK6pDolLwYz3MYYA0UeyCHv7oicnzceFGM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dTT7F8N8z53YNQouRQqYy3G3F64GjS2rSkbz6YUHqBUQ3GOlhycd3R+Gi+sSea/sO
	 Fh2PPy063Svul7d5qTJRIzpO+tq6GuCMV1uQbws7SrUkfLAOTUZIADCWqMzDi0slZW
	 HXCyFOL4d/FKpb6Ac3QY2w2U9QuE6CfrT1V4fEVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C40BF805E2; Wed,  3 Jul 2024 12:35:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 28CC7F805BD;
	Wed,  3 Jul 2024 12:35:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96970F8025E; Wed,  3 Jul 2024 12:28:18 +0200 (CEST)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4CE14F800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CE14F800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ObK6E5ix
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a75131ce948so493560766b.2
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001778; x=1720606578;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q1gM5YfJ5m/5Sqzk9+V5O7T+yd7cVFhUsmikU//os+Y=;
        b=ObK6E5ix5+ux8HUQSow7oLyIAOG1/xwPJmBeqoRMNNJ3ZA5GIAe82u+WL1BPDAggZk
         UQJF847DFBvZlVPX1Xp+jOzTJBIYKsISnSF+VIavUww8tIuWu3LRH5WkIV/vmZzEN51K
         pjA0J4w/e3p2LVXY1htp6S4P2QFCEa6JYPaj6B/oPKig9aFpjIk+3r5KPl33J1MCCT7H
         7rsmPhSNxfJcYpC7bEdR7Xie2TN1Cz1zPW+uxQNGIlWRxLeKYCxXJshHd1b99HNYS3gd
         3Sa7AxZAOF2PaPNFhm28QS7bbLCvnbyDCl41O5XIcYSOZqsG00svu+tlCt3nP3fLBkFC
         Gp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001778; x=1720606578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q1gM5YfJ5m/5Sqzk9+V5O7T+yd7cVFhUsmikU//os+Y=;
        b=sSLsdN9ggfqlCmqYseAN24QICH1VNME3TJdiRmc0u7INgrGh7HbYYImamkFu7QkX81
         SzkZB7MsMOoNsRIblIudg1gboe4+JAhv11/J+lEK0hgRSbzP3vc5d/YDl/O6Hcfk+y2T
         iB7kFHZ3+BrInAtriYran91AjPjXkK3JtuDzwaPS4J3Vi81SWt9sgyqcHwDSxe65Yd+U
         /23pOaTS8O51vexfFQGWnk3iU9OmMPFRkA2DO5yLsumPc+pLDEZjEYPklnbSasn86nbf
         yY9wWMFD+bulih6AjsSRwe9TFUYujttscVfjFxzokGSUGC7YN27p8hT+cuuW1qs7zkmU
         tdgw==
X-Gm-Message-State: AOJu0YxKY6XU5tYjBwixZrRD808gcMGVQLtqNQlrOH+T26chUo0UYyhG
	2x72/lkzu2Hrmjv+5L6ykpEbo6ABeoCs/CF9UY4QwwPCM0nle0/7/8+lrqTkAOs=
X-Google-Smtp-Source: 
 AGHT+IHu4HDX7PNB+RrIZabjL3r10C6WAGWLrBJ/SniR7QXeM4+uEi1nx8/QXXKaEFa8XSm0LDA0qQ==
X-Received: by 2002:a17:906:3716:b0:a6f:1dbb:d38b with SMTP id
 a640c23a62f3a-a75144309f6mr639801266b.28.1720001778032;
        Wed, 03 Jul 2024 03:16:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:57 +0200
Subject: [PATCH 5/9] soundwire: intel: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-5-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cOn7ju16wjK6pDolLwYz3MYYA0UeyCHv7oicnzceFGM=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGaFJOWjVZRJlaE4+7o8j3BoA3vRf5jfJurtUc9fTi9oPNE2H
 4kCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmhSTlAAoJEME3ZuaGi4PX+Q8P/1QR
 pWn/0I9oFGlPVBDkeUK+8ZgI+HK4gDCXUcmphuWo3fkkIISCmpdjU1CMhUIoxw0XJS0WCo4+cA7
 ftUEG6AjbJ1lt7tN+UQcgof4l1hADQ2wXlaW0CzC8Bw19MC61jGS1yJvIAGAboAYgKrQSfrsnFc
 XY3r4AyZc3gHF7uJIm4yqrXikozsOMttAHUoafi6f6feaTFi1a0A2ISoyT+AW+RHUfyweB1E6fg
 QDE2hu6HhT9ON7UzbcQgoVQkCjj1CdNOZOwBYVS6wrb/B7ORkgj3dB+WI5FnMnJM9iwLkK5QDZj
 LoFJzQ07N5Gi1i73wARhjBRw2b/4Oo1Mi2LL0m5N4rb4IbZtyCUfNALfhRIyu72agXKYAqzR6zI
 7Idc0TQZAN69ijTjxaYsaRFJs2SRoN7Z0p2hTMzk5Jr+vw0KpfS4eXaT81AJPXRx9gv8wXIBEfj
 Xe9LKrsmjmOV6ZgOu8O9RJK21kVII6uvktYyW4vkAVEA8conI6TgWIQKXI3TxTPAUmmhV8QO2d5
 OR255h+cU3rPAb1DtzI9iXXLTncjldmjDZyoPxA32JNyQS6fBUrEZxTt9PVlb88DKKYDBS+4Iw5
 u1hdypdpA5Dqlp6VHr/Lz/y9QpgZMEKfnflUiIGuux0zBtnOfNXP6/9gCRRGyYnAAXfDJZqL7rh
 omplR
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: IZLQSJM6WKJPLNMAYN2KO7U7HZQBHYVC
X-Message-ID-Hash: IZLQSJM6WKJPLNMAYN2KO7U7HZQBHYVC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IZLQSJM6WKJPLNMAYN2KO7U7HZQBHYVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Allocate the memory with scoped/cleanup.h to reduce error handling and
make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/intel.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index b4449095b423..421da0f86fad 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -73,12 +74,11 @@ static int intel_reg_show(struct seq_file *s_file, void *data)
 	struct sdw_intel *sdw = s_file->private;
 	void __iomem *s = sdw->link_res->shim;
 	void __iomem *a = sdw->link_res->alh;
-	char *buf;
 	ssize_t ret;
 	int i, j;
 	unsigned int links, reg;
 
-	buf = kzalloc(RD_BUF, GFP_KERNEL);
+	char *buf __free(kfree) = kzalloc(RD_BUF, GFP_KERNEL);
 	if (!buf)
 		return -ENOMEM;
 
@@ -129,7 +129,6 @@ static int intel_reg_show(struct seq_file *s_file, void *data)
 		ret += intel_sprintf(a, true, buf, ret, SDW_ALH_STRMZCFG(i));
 
 	seq_printf(s_file, "%s", buf);
-	kfree(buf);
 
 	return 0;
 }
@@ -727,7 +726,6 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_cdns_dai_runtime *dai_runtime;
 	struct sdw_cdns_pdi *pdi;
 	struct sdw_stream_config sconfig;
-	struct sdw_port_config *pconfig;
 	int ch, dir;
 	int ret;
 
@@ -771,7 +769,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	sconfig.bps = snd_pcm_format_width(params_format(params));
 
 	/* Port configuration */
-	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
+	struct sdw_port_config *pconfig __free(kfree) = kzalloc(sizeof(*pconfig),
+								GFP_KERNEL);
 	if (!pconfig)
 		return -ENOMEM;
 
@@ -783,8 +782,6 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 
-	kfree(pconfig);
-
 	return ret;
 }
 

-- 
2.43.0

