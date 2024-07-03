Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4359258D0
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B93C31914;
	Wed,  3 Jul 2024 12:36:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B93C31914
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720003028;
	bh=H6MHDzn4DJjvMx+UU3AarlEqCOFCm2kvbOhK8C4skwc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kTI7/NeV7tUWXjPDZQL3WViy91uIknTW2GjFB+YWNl9gVIX9vclQZK8rlVrypyCbk
	 Uu2FL+zfuAFMUbYZ0p9hcb/uPA/5ypM223MK0Vjig0KqEsTgriD8Kt4IzAc7+2/+6e
	 Gjx0L63ADw1C0aaGV/Uls5PTkUgFc0+8KT6ZyNlU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DB02F8061C; Wed,  3 Jul 2024 12:36:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BD192F8060B;
	Wed,  3 Jul 2024 12:36:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93F34F8014C; Wed,  3 Jul 2024 12:28:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1F56EF80301
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 12:18:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F56EF80301
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nrXrx4f+
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7252bfe773so545889466b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 03 Jul 2024 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720001779; x=1720606579;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4h10YGfrwPkkGVTEjCw3qirW9g6luYJ5Y1/Sh0BpRyU=;
        b=nrXrx4f+mvlISO+bWo1AA9ZmS9Pi0Qps+4Qj+mi4gh8QHNCdH3LeXVO48KHYEwcJsH
         VvqGpIqbSwyxgklHTWSaQEKqn0HuMeumW+eB5s4sfaOh8U5oIClZ3Tim/SEhdw676lTK
         9SNiNptT0ri4gj3OWd3lws4Y8LA4bmvA0xB7ufJBkfNO5NBcXuclW+3hBgfL6bg2XvXu
         VF3y3+7gmrvnz50YYTeuE7ujy4yFgLPmxJpqyOreL0bPw11H72F8MBZVDipcaI4eBd32
         zR5sYqzJC5L2eSxdV4gxZFr4lS42pK1vqOtWiQSrmvdJokd9HocBHN10Y9aUNeil/BqR
         sNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720001779; x=1720606579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4h10YGfrwPkkGVTEjCw3qirW9g6luYJ5Y1/Sh0BpRyU=;
        b=gbL+cXMWAG3P0vl0RjJ+3c5+r3uLAWRIdkBDscuemERFXnCJtemPcybBk3xN8dvRjF
         BqBjzKi5ktpOoFA15qKuSpH+SzfheyraZCBUzJQ7Is3N4AqQCcApApFbLDU+nMDpYPbG
         TUe7djLAooencdxCSt7wuobNyL9Neo/VRtEzS7ew1WNMICBx0ClxpEOZ5CkwEIi/meWs
         xh8k0cyiTqJZCvUgw9dYROjL0zj2S1SsL5D2dJqrLy2KySwkxaip9+1Fiv4abm3arnOp
         8finGYV6NaCtVT9YcIQecwSgtQuVY0CfAfZSUiAdZ7jMkv1wsounkD0epMVGB4emzHmL
         j/Tw==
X-Gm-Message-State: AOJu0YxhGar2zuj2c48twdt8zcUmeHgJa2dIYnFoC4+rbQG/YhqpDVTD
	YrDGKgR82SnActDa9IhJOijzaH09ZoAdIYTtWY9HtxqeFpLnoXEflgyPTf4IFvg=
X-Google-Smtp-Source: 
 AGHT+IE2lrUjD2pD2f+fZKLRkMjumm7fxaU+U4uTiEAcTuke1jkfQkdtKdbpoN9AyTeSI5vhJJyf4A==
X-Received: by 2002:a17:907:7e85:b0:a72:9d25:8ad3 with SMTP id
 a640c23a62f3a-a75142d84cfmr1002976966b.9.1720001779364;
        Wed, 03 Jul 2024 03:16:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a72ab06565csm494291466b.103.2024.07.03.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:16:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 12:15:58 +0200
Subject: [PATCH 6/9] soundwire: intel_ace2x: simplify return path in
 hw_params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-soundwire-cleanup-h-v1-6-24fa0dbb948f@linaro.org>
References: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
In-Reply-To: <20240703-soundwire-cleanup-h-v1-0-24fa0dbb948f@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=H6MHDzn4DJjvMx+UU3AarlEqCOFCm2kvbOhK8C4skwc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhSTmLDnJUL3FsGDF5drvgu3fqPTzR9Y/ZiOGC
 mlwnnfvADqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoUk5gAKCRDBN2bmhouD
 16qGD/0RTy0gf025ZbhLA1kN/XXZ3PlVTWyAloNPGC57y/esZhOXT/qt53fssZ7KSpHzpKNERDt
 flw0qiIrQwaGh0tIfMFkQAgPOUX0IK+QcVX5Da4Wu2rHui3mest/vCtHs+v9GuY+ey4bGENm6Up
 wqF/fkwK7tNmYNBrWsNkDdSmpfLak2VaFfRqwcdS4NCcUPbDtPXin5ijO1ezNwPT7oEg6PkVnaW
 f87mCHd0QPF93MOCsUl8U9Df39Wloe9QZ9pn5Qh3a8IxJX9nxxcrP/dnBkXQIpbEnMwOII2doic
 nGobn0vQq2v1+Tte0V5hS7paQolA2IsyHfUwblLJ1yb/tn9rrbCWB9Rq9ImCTx4IKaI9FVqGJ9a
 dAcZaW+8Jd/xeFwQMRsnwVu+PsJPMpjrTC+4vx3/kBvqMK+e6RAK1aY+r0aoYBBUa2Y5MuwgBLa
 RR6JGDAO1eFUay9tABD0VU6VeHb2lT6izYKhi1FZSHW6IRa1W07dDTNQQtQZG2Wws9ATEcvliuP
 X+8G5QzMhXHdSUh6n53+4ZJ7xH7hHjvCv6rwtGcyAzueVoTDbNPk+COndQwODT8MomTTLf8zNva
 hIoHT6MEounK8Z+iGtLxmFv6ed3+RmrX0Ewuwvo315qpZIX2EpIsorjuZBuzuM/nSU8QDc+HsnT
 PWxuBI7PWu2MliA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: ZFZGWJJ7THHH4EIV3HVCTUOLWTIT5ZSP
X-Message-ID-Hash: ZFZGWJJ7THHH4EIV3HVCTUOLWTIT5ZSP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZFZGWJJ7THHH4EIV3HVCTUOLWTIT5ZSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Remove unused error path (label+goto) to make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soundwire/intel_ace2x.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 4f78b7f99e44..f0008ff84ab4 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -325,11 +325,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		dir = SDW_DATA_DIR_TX;
 
 	pdi = sdw_cdns_alloc_pdi(cdns, &cdns->pcm, ch, dir, dai->id);
-
-	if (!pdi) {
-		ret = -EINVAL;
-		goto error;
-	}
+	if (!pdi)
+		return -EINVAL;
 
 	/* use same definitions for alh_id as previous generations */
 	pdi->intel_alh_id = (sdw->instance * 16) + pdi->num + 3;
@@ -350,7 +347,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 				  sdw->instance,
 				  pdi->intel_alh_id);
 	if (ret)
-		goto error;
+		return ret;
 
 	sconfig.direction = dir;
 	sconfig.ch_count = ch;
@@ -361,10 +358,8 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 
 	/* Port configuration */
 	pconfig = kzalloc(sizeof(*pconfig), GFP_KERNEL);
-	if (!pconfig) {
-		ret =  -ENOMEM;
-		goto error;
-	}
+	if (!pconfig)
+		return -ENOMEM;
 
 	pconfig->num = pdi->num;
 	pconfig->ch_mask = (1 << ch) - 1;
@@ -375,7 +370,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		dev_err(cdns->dev, "add master to stream failed:%d\n", ret);
 
 	kfree(pconfig);
-error:
+
 	return ret;
 }
 

-- 
2.43.0

