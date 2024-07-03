Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660D9258A2
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:31:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C80114DC;
	Wed,  3 Jul 2024 12:31:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C80114DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720002695;
	bh=IY1oPHTeYFkPAQIumDC8e25FwPrkJ2qyVDIkUd9B5LY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u/hCS2LjA/MvcFboqdcXdWu6VyoYhrU2/JGdKBNM4EQMl3ZU6vDgjG0qr/UPs9LYR
	 IfTUr7Y4HCU3FFh7QfYAnfbA3V8j8iogIESEQ3RuC0qgxLnm+0jbttAfImu50rOqia
	 gTxfLygFkCjDoeHz6+29/SUlgqbkiP000p1q/zRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1357F805D3; Wed,  3 Jul 2024 12:30:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3D5F805D5;
	Wed,  3 Jul 2024 12:30:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BD0FF80589; Wed,  3 Jul 2024 12:24:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 18127F8014C
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18127F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=je2nbkeh
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a751ed17b1eso77783466b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001781; x=1720606581;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VrtpT+q3ugRzypCVgwmAVgi8FHiU6FE6B5vA8wJQ87o=;
        b=je2nbkehek4hFpjObKEk7ssJ1DeFRUHRPfvrUyZNxgH6yybzWV+guubIha5x/JfH3+
         3VlaKMnsXD1vhONqJaUs/kmLix81aDoz0D1+Qm7pt3ZtxEbmKe8IzoFoSSzxWIuIt9ke
         E7bIuA+p5aVU5Fj1HZiB9Mien8OwmNCLeBNwE4+GpfW3dGM8aZPpxf5sKBsUMTUd+Gfz
         P62ngp5rjEO902M+ZXKHuD3hk5XEBEpIyhiIYWJDfVR9AjgDhxjHdLSVx+gMnYs0ibLE
         922hJUikXQfwoHjzkouLPAxuyY7AWZRJspkck3yanv1dDtVsODsZHlB9RMdG2xrmajf0
         2j4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001781; x=1720606581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VrtpT+q3ugRzypCVgwmAVgi8FHiU6FE6B5vA8wJQ87o=;
        b=N4BlqNIJ1GZpJhPMkvVKTQRU4Edd9zMFSpd+s0QcV5FR61s2yTZ1b6BTXlK0a+V53P
         gCd0snp9tMgVf/8Msu1pKPzWzxZWWro7J2rxNess4SnpTNKuJTrBBfpNhOFMo+MHCM5J
         R2JtWo9ph0KhnqDXixRxMd5RnU/S2kkpqt1UozMTf31MMvyApCh95Ta9RiwNfwtVp43U
         iV+cZoKOLb47yvsODLQQsb49z7UKQRtNlgpUuQETbywU5tqDkyeXXlAMA4pxd+lEoVEt
         V0YfUq2oCoor85P6EG1Ci/f32w2qv6PIeXTJdiHxG9Zn+6/BP6RHgeGBBIV0IO9bMkh/
         FWlg==
X-Gm-Message-State: AOJu0YxYbvVtHYbB4qpldeCQeM1R2lKo02oL4ofWnVBbYprBBTkBd+jH
	hjgZXIZLZ2NEofOlyPTj1aWzuQnF/uE96qyAb+kT7x7jxYrIYnP6IW9ddDrFw44=
X-Google-Smtp-Source: 
 AGHT+IEtZoY5JzZntBzNzE4Y9+mfHfz4VIjEoXHHcvOnPR9dBqvKKOQoXhvwcg0LzXPqeLC+5E0HGw==
X-Received: by 2002:a17:907:3681:b0:a72:7736:9e14 with SMTP id
 a640c23a62f3a-a77a2441768mr102819766b.20.1720001780715;
        Wed, 03 Jul 2024 03:16:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:20 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:59 +0200
Subject: [PATCH 7/9] soundwire: intel_ace2x: simplify with cleanup.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-7-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IY1oPHTeYFkPAQIumDC8e25FwPrkJ2qyVDIkUd9B5LY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTnkavgfEK5yCLUKTCxvvF4PXPL5NgXbOKSZ
 sWx7SD8R86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk5wAKCRDBN2bmhouD
 1xwsD/9gMhWaZZjNTAwmFUzuScG1m2CPsqiZWoBezCyR5KEDWxWf69dUBsYBPLlAYXfSHIrm5xT
 M8P3yDHaE9MQGJaR39xrtArAoYt2Qm3DiaOaSaxXPSH/nqNJrb3wIS56tYPbVCXevejg+elOd8C
 XU0lrreoxsHeEF2QpHehJJYoVpx0BlOTYe5SoExvz3gJrDYCVEt+YSYWhUqSpRii1LC0WNuBTYz
 GM1/9ei9HhvvhdgsnK2TMfiaYSsd9w6TDxeosIy1fXtgSHyaVYev7CIhJi4EI3o1eunWtc0nwDZ
 6QtuoJGh4BMsA3jyc1Q5QxM05YkK2TzvEaaH9nnBhhfWGQYna0MiuYx4Z5uZgVdzKaxsSRbusWj
 nPERQk47di6YubUGrG5j1ezzyrr91UfHhW/PIvu//4uoGIytIEku+jVYdo7BSUWvl/+/kzBJkh8
 J6p/UxVp/kJU5Ioz4yTpGpMDX6Z6kCyC1G2zUSs42BXVMWY3er3FkWkLRzW0PfE1n34coDePDFT
 K0dylCRRUQqDY1jSZsSQpFv1MKGZUS6uxDXZcWifj9ThsOn7rvhKGHtyY2roqmP8TdkrgeABAtQ
 iLubbXCuFNg2eHpsURlbaq8gaeZmAaNe9tjHo/bGlI7nBzLOdjqS3O6lSdFgIC49kid3mb993xN
 dFiR2mEyDKGSEag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: MXQZQCEIOYEWM766FRV54Z2H22GSTPGH
X-Message-ID-Hash: MXQZQCEIOYEWM766FRV54Z2H22GSTPGH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MXQZQCEIOYEWM766FRV54Z2H22GSTPGH/>
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
 drivers/soundwire/intel_ace2x.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index f0008ff84ab4..781fe0aefa68 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/soundwire/sdw.h>
@@ -310,7 +311,6 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	struct sdw_cdns_dai_runtime *dai_runtime;
 	struct sdw_cdns_pdi *pdi;
 	struct sdw_stream_config sconfig;
-	struct sdw_port_config *pconfig;
 	int ch, dir;
 	int ret;
 
@@ -357,7 +357,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	sconfig.bps = snd_pcm_format_width(params_format(params));
 
 	/* Port configuration */
-	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
+	struct sdw_port_config *pconfig __free(kfree) = kzalloc(sizeof(*pconfig),
+								GFP_KERNEL);
 	if (!pconfig)
 		return -ENOMEM;
 
@@ -369,8 +370,6 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 
-	kfree(pconfig);
-
 	return ret;
 }
 

-- 
2.43.0

