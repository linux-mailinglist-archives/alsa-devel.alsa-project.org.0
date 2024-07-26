Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C505793D4DA
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Jul 2024 16:12:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 675BDB71;
	Fri, 26 Jul 2024 16:12:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 675BDB71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722003150;
	bh=vYWYuVN4lK3XkrzlF4N+aA8raJCbc8inqKOksPmsXIE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oxFzEZw7sXSYAFLGRlvhBelRcQsBPmVS4mJdxTxXz7W+kRVNl0JLRMSy96M3Kdkod
	 BWwsxjl6YCMJJV75o9EXV2qbSNx+vaIX5TbXBkgMx4OfyYXGNBIcltvdApWt/4EfRJ
	 9JYVXqBPMluRbV0SbEcfOhhz375D5hHZQXnNudW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45421F80624; Fri, 26 Jul 2024 16:11:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0A4DF80622;
	Fri, 26 Jul 2024 16:11:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7A2EF805E3; Fri, 26 Jul 2024 16:11:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 614EDF8057A
	for <alsa-devel@alsa-project.org>; Fri, 26 Jul 2024 16:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 614EDF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=pOAcHobS
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-428035c0bb2so11928315e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 26 Jul 2024 07:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722003065; x=1722607865;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zm4i9m/ncQZPuov6nCVEVOfcxXDmdJCtPoFsZxzq7VE=;
        b=pOAcHobSyz+Qhdkd0ZCLOWL6eV2shncqca6/lMyOuI5p3Q+5HKgt8zOfeNoajgDOpR
         iT3s9+sw2c9nnrepdxT9+Rv2SWN3mqDyQCpLMIo9c2fn68TX5LEqqn0Q3oijBaaY/YZu
         Ir0tdAeHEQAyBly73x9RW88ZC5Gxnx8hl6wrRpaHlPg7eanCS7gziTBHm0oeerwG1uEz
         OCuVrY+sXOOL66FCRczTPGtCiRRUUQzmXL2J+KJ8N8h77PX6OTveNEhJgovaDSn97+/e
         rtWMK+8yFaMX6fP9Cef7OipbLWuRjXDnL6YIKmX9jhNaJKQsgR+4OLJeqPJDTSltfLmX
         WBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722003065; x=1722607865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zm4i9m/ncQZPuov6nCVEVOfcxXDmdJCtPoFsZxzq7VE=;
        b=oGN3Fl7OQHab6OZ5HQLs0qH2l0rgVGVttBxdgOSXt9xyyhnctxaZ653TFDyuaN4yi/
         r56Es5FbeHBnuTMJCDUp6zf6s3e49jnwoz2qGrhGGJkPE2VOE7ert+srj8SBnobQBir4
         ffxGUmqFjsWoycFcc5igyx7lvq+0RNs4UBLboBdAG04NM7ZX0Hsl4vUN56PoAY1nnDa8
         mspz7NLKcTxd11NFzfhL4sDyy7T14a6UW+4EHIWWh/Vnl2bUcKLpW2FZmPF+ouoH+Vwi
         1LTHy6uXAkVPRuam6Qaf/aRj4GgMUqJLEx+C+JYKX9t95TlIgiyE8pd2gsLFOgYCSiYU
         aBIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCm4uk5vKLscRV5p9YLAmkl/GlfOG3Pv08IdvqHRtza1aGCj1oJPuUqhtiCsiJEEA/Vd58U8ZNEpnt28eoInvzXO36mgDWsKtrt4g=
X-Gm-Message-State: AOJu0Yxihl9OQQ6udOp+rOyqhZ0sN9Rc29jS59tdHMpu/EmTm3Jl7hSX
	GQmpRd8JKTCxsB56eYzkNNEy8b5v8QyiTCWKJJQy7LG01IK/QYvPyhmQnMlI1r4=
X-Google-Smtp-Source: 
 AGHT+IHwl9iv5umoPhExYwiCZKYi87nvMtqxmxK8Rx49dM71Q/xYQD0kJO7Hzb+m82Le5VpchJQRlA==
X-Received: by 2002:a05:600c:5247:b0:426:526f:4a1f with SMTP id
 5b1f17b1804b1-42803b5b181mr45562735e9.16.1722003065313;
        Fri, 26 Jul 2024 07:11:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f941352asm120841115e9.41.2024.07.26.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 07:11:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 26 Jul 2024 16:10:46 +0200
Subject: [PATCH 6/6] ASoC: codecs: wsa884x: Correct Soundwire ports mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-6-d4d7a8b56f05@linaro.org>
References: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
In-Reply-To: 
 <20240726-asoc-wcd-wsa-swr-ports-genmask-v1-0-d4d7a8b56f05@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=vYWYuVN4lK3XkrzlF4N+aA8raJCbc8inqKOksPmsXIE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmo65te5MyhCVdZRhQoHqqUXph8EfgHYbDMktc+
 pR/3JMeV2eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZqOubQAKCRDBN2bmhouD
 17QID/9o+ExG1syoZx5GLY0VzNCNteL6E5cuNOrA+OdQ1Nwtug1RHqQ17IoqY4nYjtU1xZuKl2i
 eU7iEHYb5Ak2H9DHF0jbUsWP7ymH9YOY1WsPCQ5Pe2bNj7iJpru18vvrFABFVrqP1bMjZt37vUb
 Okr+pWTx0kPweMewQCs8jwl2uzQh1dYoh+mutI3sZ1bZLXDD0RM+db37/KQU2Ptrqn28XU+pVIR
 i0svhkxEOoSQUgLAGwQXviUnOLHFB57YjBlwIh6bZ9B26xMEWDKsWVrIvwoxny5crwDJHPxskUS
 KGe6PlEErlhXGeDYueBPkTgNsAb5JGWGeL16VpeqVXKBu1N/xZKT7lHHk1cT7bQuYlC6GoDu77d
 sQzT/MM0h6aWxFF46cKn71HA5/7+Mf9v3Y6X5Oifc0lj6G87IAHxTIFmA0xaFXvMMOubh8HYDVW
 Q/PvTuMQKp6Pn0OD5Q182HtBc5VJYmmS2+SNAxqbPX57XKCjrzNaFOrVe+4QZp1do9y+ztGF1fJ
 ymixiwT3tNPclmBqOXqGvaik23plgrnrOde+GRei6PivJtCkBo+a1dnOoEWOkOVI7RzjdxVWi0q
 AUaQ3YXZuTLyzGaS4vALPi2g8flrO3ev5qKxZ4nLyJlXxUPqEXO6bssiPuO8RkfBf5yrbyfY/1B
 3fDQ1WwNDYRRw2g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: TLZ3WM5BVKCQPRZRII63NVAGNE4AKFHR
X-Message-ID-Hash: TLZ3WM5BVKCQPRZRII63NVAGNE4AKFHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TLZ3WM5BVKCQPRZRII63NVAGNE4AKFHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Device has up to WSA884X_MAX_SWR_PORTS number of ports and the array
assigned to prop.sink_dpn_prop has 0..WSA884X_MAX_SWR_PORTS-1 elements.
On the other hand, GENMASK(high, low) creates an inclusive mask between
<high, low>, so we need the mask from 0 up to WSA884X_MAX_SWR_PORTS-1.

Theoretically, too wide mask could cause an out of bounds read in
sdw_get_slave_dpn_prop() in stream.c, however only in the case of buggy
driver, e.g. adding incorrect number of ports via
sdw_stream_add_slave().

Fixes: aa21a7d4f68a ("ASoC: codecs: wsa884x: Add WSA884x family of speakers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Cc-stable because I don't think the issue can lead to real
out-of-bounds read.
---
 sound/soc/codecs/wsa884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index d17ae17b2938..89eb5e03a617 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1895,7 +1895,7 @@ static int wsa884x_probe(struct sdw_slave *pdev,
 					WSA884X_MAX_SWR_PORTS))
 		dev_dbg(dev, "Static Port mapping not specified\n");
 
-	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS, 0);
+	pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0);
 	pdev->prop.simple_clk_stop_capable = true;
 	pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;

-- 
2.43.0

