Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F064C0170
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Feb 2022 19:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6E44181D;
	Tue, 22 Feb 2022 19:34:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6E44181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645554914;
	bh=3pyhuthwanfxS5nWWbTlgdbILpj0kyAne8vH/5EO01I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjBiMQChy04cbIibDOnd78ZHQQNDnvNbHt5yjrh7j4wcyO087WnOkuAU80Yz868ng
	 8uYwIHzx/7/TbMr/6jaNjYrTZC2LqB6u9ODryqO1hdE2lDUFhOJxZCPomnvihZTUzL
	 q8zkV1H7JX1daMcyhJQRzaTdusWPEObhiHK0dr/w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7E4EF80529;
	Tue, 22 Feb 2022 19:32:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 442A2F80520; Tue, 22 Feb 2022 19:32:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EB97F80311
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 19:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EB97F80311
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LXUOfvYc"
Received: by mail-wm1-x329.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso2629485wmq.4
 for <alsa-devel@alsa-project.org>; Tue, 22 Feb 2022 10:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ht2zsDCw6mTpQAlwd9QIJhSI+uSP7rAlJbSv+42FdW4=;
 b=LXUOfvYcs0kbsRz+8veIC8emfQuSsGfkrwhm84FAWeP9sc3AI+0gN0owZNz+Zr72pY
 cIAKJyS4Gub9M71Vn2dsP4KurE2gzAozuSkzWPopWbzIIIDVrCC9lo5yVnRmZyuv8apq
 bq3hSG/PvG/efxwji5GBYA0YoTOaPOIau9kF2l3M8rR6QoJxNxkzQvnuA+QUVWZTiRem
 Q0GcIFB73m2Wyh3aTZJKXEE+jhJwEpG1rDVCnI3V/SxWCAlaWl5yaI07DOGu2z4B+LzX
 N0hB1DBPZ/RIpP7cWo20uCgw6RSQp/JCb/U3jONsszLTAbYxKt22RZ7Oird9AZ4rvs76
 BGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ht2zsDCw6mTpQAlwd9QIJhSI+uSP7rAlJbSv+42FdW4=;
 b=GG1wyTWYZyyQKC4A6/B0H3+ZzI5LravxEtou1hpOAB0LHz1LTD259lgL1H0zTk1NWt
 8WZ0xCa2Gxx+NDM8o7p5KKBpr5J+ILOojc0eAXd7bl/oNNQ8yHQYEbS4D3B4GF6AHR9o
 qMbcLtGfOtfPFK+4fqGYHY/s1rIjtvVF7UqPiSW/wOg5RftslC/+/fWQk3/FAykOPg5z
 YFq1Kg9MF8i90fpbi1aG3EAoF9aGa3u+h3qYhKWhdPklrbf5a49bRBWwBgIIjIk0UKH+
 PrZqVyVAs+fGqI+eBNLEfhvSFMhyoADCFUkH+p5gqJXFMSM/LkTMPlphSZXQppDaugp2
 ZyMA==
X-Gm-Message-State: AOAM532c+d7rXQdNONRVBZ4BS+Z/lu5j5H696ikLzMUmBJD/73va8cxf
 e+ONgNVEW+87WRxp3CBb3w+oHg==
X-Google-Smtp-Source: ABdhPJyRSJz2xS81gFD3nqaVdA3VppkmlAX5k2fgyY5ea3oCaj0wITSJje5BPCTZboDEjS4yLjtmyg==
X-Received: by 2002:a05:600c:a03:b0:37b:daff:6146 with SMTP id
 z3-20020a05600c0a0300b0037bdaff6146mr4479777wmp.85.1645554752394; 
 Tue, 22 Feb 2022 10:32:32 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id l28sm57642165wrz.90.2022.02.22.10.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:32:31 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 6/9] ASoC: codecs: wc938x: fix accessing array out of
 bounds for enum type
Date: Tue, 22 Feb 2022 18:32:09 +0000
Message-Id: <20220222183212.11580-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
References: <20220222183212.11580-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Accessing enums using integer would result in array out of bounds access
on platforms like aarch64 where sizeof(long) is 8 compared to enum size
which is 4 bytes.

Fix this by using enumerated items instead of integers.

Fixes: e8ba1e05bdc0 ("ASoC: codecs: wcd938x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index cf61d23bfb1c..deecc83eb592 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -2506,7 +2506,7 @@ static int wcd938x_tx_mode_get(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	int path = e->shift_l;
 
-	ucontrol->value.integer.value[0] = wcd938x->tx_mode[path];
+	ucontrol->value.enumerated.item[0] = wcd938x->tx_mode[path];
 
 	return 0;
 }
@@ -2530,7 +2530,7 @@ static int wcd938x_rx_hph_mode_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
 	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
 
-	ucontrol->value.integer.value[0] = wcd938x->hph_mode;
+	ucontrol->value.enumerated.item[0] = wcd938x->hph_mode;
 
 	return 0;
 }
-- 
2.21.0

