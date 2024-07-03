Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 814609258CE
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:36:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 162041923;
	Wed,  3 Jul 2024 12:36:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 162041923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720003006;
	bh=Ol678uS9dQ4xA1iTWHOJsbF5rd2bR0cJ9zqotT/ChuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lrDtcJHVkYoYbhGp/1XGsEiKO11R/XsvhQZUOz+u1HY5B9zFkqyayhzEB8ePxtfwo
	 pcpU6T5AISLcGQNJvxCRKY0L6kuKi+AiTLYE7HQeKDjGgRyqCJi6fEJN0eJ2M4MFf8
	 iJDvk/F+cfIHlC2wdiB7Z+bfSQhc35xhC/G3ifOk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 33708F805EC; Wed,  3 Jul 2024 12:35:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96666F805F5;
	Wed,  3 Jul 2024 12:35:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 294AAF8014C; Wed,  3 Jul 2024 12:28:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C43C0F80568
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C43C0F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ye+F+Q7e
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a724958f118so636293666b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001774; x=1720606574;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eewbky52yFyCjHy8tFMyxq78GyiBRf7ePSPsH7UZe34=;
        b=ye+F+Q7e0TbLT3h2+IT8y0lrUx0r5oa4U9NkRdH9nhfKtdQBHTg654hkYmVGzTfgMP
         WBQ56dfyvE/5pHzyn43WQ1w0XFS9veqa3A7RnoVOtLqTQ3Ms9D4vBBTeVyqeI576kpoE
         VgipjkDkArsejLVXPfeyzaYqMw+koLf9QGgpcGNOJtMWa85js23PYCg3aSYqy6OihwUU
         b55MZ2BqIQR7KgeH3VFkpAIRtFpjOB2knq4eCUAdQv48NRjr0cs5GL0fw43cOqNF5uH3
         6b6cMW1br3k2tDdzEhpEXz95RgRChDg6SD2I0AK672M2q1MH59sBA2XqI7m5bY8fMyKC
         9eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001774; x=1720606574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eewbky52yFyCjHy8tFMyxq78GyiBRf7ePSPsH7UZe34=;
        b=gkKn2FwVou+sBC8wsPUD1GSm97lerW0scGqEbQXwZ3gK0CFIrBSIbhb5MiTf7v/O3d
         cGCM/CjAG711V8BIqv6MXgM0Ay15lx/MW6xncJeyYyLXtajFcIk1JjllBxACt4s4PQkW
         PObNiaqzt3i3lg2PuBqOb8YkcbvMBHSqdblbyvNPK7wo3K5eN4/6vX+uBEXjAl6lU7Z7
         y8rekQuVtQG358xTb0e96UnsMKShN0ErxE5Duggzpb8iHyPlJAqmH9H9Py6YTjhVTI9f
         B413e4fXiQ4QTaKIcaBfjyOiRJ21c1kmolqhueco8nAexPoW/L9J201GJC9nNtftXawQ
         AItA==
X-Gm-Message-State: AOJu0Yz7GbePCJUG6CSxr0DO6M1/m9/2K6gVbMxz6G8V7/BBVpf+3Nid
	MP1RR8f4G/DmDuhNIsIK2BPV3mV2b87nCjW54A2IaBB4nRnttZN6i8pHiBL7QLU=
X-Google-Smtp-Source: 
 AGHT+IHmjbSzPCX5JxTEYJT9gZmcA5MeHmQoPhQv3t1ZxolhjaIIPWitPETXciwwLMO8r6zR017fKw==
X-Received: by 2002:a17:906:229b:b0:a72:4281:bc72 with SMTP id
 a640c23a62f3a-a75144dd493mr756319266b.63.1720001774022;
        Wed, 03 Jul 2024 03:16:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:54 +0200
Subject: [PATCH 2/9] soundwire: amd: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-2-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Ol678uS9dQ4xA1iTWHOJsbF5rd2bR0cJ9zqotT/ChuY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTjzmj5Rr2bqkWjyjn3muBzm30I9Ht2Qp4oK
 8nKJxeL+OeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk4wAKCRDBN2bmhouD
 1y66D/0fKO4gzBi5mD4kXweROjCrsgr94HyHuatSkmOW3tA8yr7ADL+1MGVFenX3CB99m3Gm70l
 NY0xWe5alMpLkQbelrBouC402XM7AHvM7m9epYbZjFjMT3mjZwweYcwfoQhQqq0j6g+xh87mL7t
 bMnnl8UWMlW6ipJciZsNQvh5weMNCkPawFUQPzy1wb+LmDX1Tzk3SN0NnXAAf0oz6wJU6PE/V7M
 hFE4hJ+SQzmWuDPykGrCRi+nxcT4FI4APLYoctY/kTxpD1IPSvYuu4n4jnc6+D0UqdLgWqkOesh
 dC5ECkcu6fzWdbGSMNkLyxcpScB1RjsNGChYAi5kVxIb0uSDqjIlveUOYFSzT96yu11HZ36kdZC
 dsRbP6BoKv1st4oV9na3f5lNADHUIEp2Rbn7xigza3o1Dey13i8ce1UNYp8HITxK7A4DGg6HaTt
 qc3Zhd7kLWksAuPlDVXI6QtMzY9nwvSGynRMNcVj/WiqixBElXJ8pdHnVIU/h3pjOLEtWzO0Eyw
 os/K+v6q907S3H481NDaFYj3PHMlmcr2PEOk3z3WzC1DVWaC+M+28uyT3CkNWR+fst9QaBVESA0
 xgav4X5dmMRz0OXimVABXLLjYQPpt9zNEKy1lgrqzfHmvrmPyfREPioPwPTnqM74t3jfasBhGEG
 D/zwGI5F4jvh55Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: 37MWSODQUZCYO4MF2S7FEN5NX52OLB4S
X-Message-ID-Hash: 37MWSODQUZCYO4MF2S7FEN5NX52OLB4S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/37MWSODQUZCYO4MF2S7FEN5NX52OLB4S/>
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
 drivers/soundwire/amd_manager.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 4470fda83c5c..0d01849c3586 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/completion.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/jiffies.h>
@@ -603,7 +604,6 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct amd_sdw_manager *amd_manager = snd_soc_dai_get_drvdata(dai);
 	struct sdw_amd_dai_runtime *dai_runtime;
 	struct sdw_stream_config sconfig;
-	struct sdw_port_config *pconfig;
 	int ch, dir;
 	int ret;
 
@@ -626,7 +626,8 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 	sconfig.bps = snd_pcm_format_width(params_format(params));
 
 	/* Port configuration */
-	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
+	struct sdw_port_config *pconfig __free(kfree) = kzalloc(sizeof(*pconfig),
+								GFP_KERNEL);
 	if (!pconfig)
 		return -ENOMEM;
 
@@ -637,8 +638,6 @@ static int amd_sdw_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		dev_err(amd_manager->dev, "add manager to stream failed:%d\n", ret);
 
-	kfree(pconfig);
-
 	return ret;
 }
 

-- 
2.43.0

