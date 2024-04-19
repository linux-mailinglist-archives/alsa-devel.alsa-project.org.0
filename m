Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9507B8AAFF9
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 16:01:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09557EC7;
	Fri, 19 Apr 2024 16:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09557EC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713535265;
	bh=+y0ELje6OMvct0t5gsg3M/DTNAL11X3WBMSj9XC06zE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=k2fJa6Km0pDEBq7pVxGWx56S0nwJIwsIB7/AF+n6/bjl+bG3tn+Vo6uMDnzEeAWOl
	 d/fhr3Nyep4ykPyGIDZfyvXrkHU2t8jGqFRxdL2uC55lwMSFs6KgolwKLnL3eBjCNK
	 f30B4KJ5UlfHHsWx+b40ZuLBA1la24HmV+t+OGXA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7611F80568; Fri, 19 Apr 2024 16:00:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D522FF805A0;
	Fri, 19 Apr 2024 16:00:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FEAF8025A; Fri, 19 Apr 2024 16:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFE26F8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 16:00:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFE26F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ocO5gJ7b
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-418c2bf2f90so11917165e9.1
        for <alsa-devel@alsa-project.org>;
 Fri, 19 Apr 2024 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713535220; x=1714140020;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=et/By6g3N2xOYyVKoVljtP1YQDkPxwi2YdxAV4CacS4=;
        b=ocO5gJ7bRRBGOeZF4TduH0NbgPJ3y/QyUYDU4MrA8qpkijlLK4m1B3Ag3IFVDrQgdB
         oqHQI+zaJkGS+1fiCsTVP7BsaHmLmfON+NRjSDT4W7bYQRrGAvTs5LFmNron+xsW5b9n
         /8jhm7J2NOpJy6GcBNTOE1v2PkxMkPSaLOQURgXwyk2EVhPW9tYObpMPTVDDbxtKH7gZ
         OLTe649Hs343tT3WiWzL8cH2Iq0gv+ofPfC+PHEVsGeBD/NZyF+a3NMlpArtUm9ImwNP
         lrMP1TVWeGHTOCPhAocIdDJJ9DO9g5OIHzl/4fnthrpiWcxeVoihmrKVwgtIfqnnBJSt
         EnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713535220; x=1714140020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=et/By6g3N2xOYyVKoVljtP1YQDkPxwi2YdxAV4CacS4=;
        b=mFCm+urU3ru9S4yFmIPvcaDYlWfwVvc95R4mqxoJFTlRGj7YZ3QnQV+a1ynqlkJoap
         JdIfJ8+qYTaDrkzrnEpaDoWhy1XJAvpeMW4w+DhEVog3aKAJ/y0LtzW2cB7H3mLjrBFv
         znoL00FiRozwbPHDeicMyrE6govwbctDdwRhX5bEgXGb+mfcjRkPQi6MM5JBe3qEBFWT
         Wwu/gZheX3/vIZLOOQYR3LLjpJQRiFJk12SoeyvvHgwe4hMo3zQxZDBvkcvSleYqMZon
         edh8eycHSfGHA1dqv1acwTyDg6KvSUyW0H7SkD9cxOqSy8CqMLh5PrXgX3iZEYOvPFK6
         zbsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXWkkfe5KhM0vymHn2MzAP32tvcbJlhB4qfE1KpJLHrHExlb4vLxlpg7TuwXABomWQMfoeCUyezgCKFu6sUFLgCBzXsiDm+/vf8mw=
X-Gm-Message-State: AOJu0YzabjhKufDsLlDdz+6okpUWCGm51+UVQC4XQ95rpO7X9PzHi7VU
	/qMhXFZ/7srd++XUf9DhDHP+6h/HHDfDfH/l6GJJx+qbgDtppzrS4rN5aQcyesA=
X-Google-Smtp-Source: 
 AGHT+IG8wYNyZVNJGrFo9rlWXv8j/iJXruv9AWybdYLlLQbDnS+NQSM5JpHpj1re+OmVb+varOCkBw==
X-Received: by 2002:a05:600c:190c:b0:418:2981:c70f with SMTP id
 j12-20020a05600c190c00b004182981c70fmr4291650wmq.19.1713535220351;
        Fri, 19 Apr 2024 07:00:20 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b004186f979543sm10479160wms.33.2024.04.19.07.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:00:19 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: codecs: wsa881x: set clk_stop_mode1 flag
Date: Fri, 19 Apr 2024 15:00:12 +0100
Message-Id: <20240419140012.91384-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XKUCVGUAYKA545PDJS73CSRQW3JCYWL7
X-Message-ID-Hash: XKUCVGUAYKA545PDJS73CSRQW3JCYWL7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XKUCVGUAYKA545PDJS73CSRQW3JCYWL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

WSA881x codecs do not retain the state while clock is stopped, so mark
this with clk_stop_mode1 flag.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 3c025dabaf7a..1253695bebd8 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1155,6 +1155,7 @@ static int wsa881x_probe(struct sdw_slave *pdev,
 	pdev->prop.sink_ports = GENMASK(WSA881X_MAX_SWR_PORTS, 0);
 	pdev->prop.sink_dpn_prop = wsa_sink_dpn_prop;
 	pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
+	pdev->prop.clk_stop_mode1 = true;
 	gpiod_direction_output(wsa881x->sd_n, !wsa881x->sd_n_val);
 
 	wsa881x->regmap = devm_regmap_init_sdw(pdev, &wsa881x_regmap_config);
-- 
2.43.0

