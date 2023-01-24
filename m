Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD57679F04
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 17:41:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6BC4E85;
	Tue, 24 Jan 2023 17:40:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6BC4E85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674578508;
	bh=O6tre/K1p3qT0qVodp3E/67TPRmBMMVFkisvqohVZwE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kbIavfZ8ptl5gsW38mRo/DNt7d0vg5DaX/DNWx4rco1nPDjMlPKz5iUad8uT3/p7Y
	 1dDAuxqmOi3cEqhMr/NCbJc+J/tZIDQsVf1z1Y4JbXfm81vBfFMvbCNCxjMwdEL9MX
	 FjPbd+Q0DGst/ziH7NEiVT20zerpanRtCTRJSX90=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76362F800FB;
	Tue, 24 Jan 2023 17:40:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34D69F8053D; Tue, 24 Jan 2023 17:40:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9B5AF800FB
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 17:39:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9B5AF800FB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YWpr991D
Received: by mail-wm1-x32b.google.com with SMTP id
 q10-20020a1cf30a000000b003db0edfdb74so1205915wmq.1
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 08:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aQbzhX3O4aLcuVdNK/dk+Vykc3yQgk316tpQ75kYYpw=;
 b=YWpr991DzZrpCyQD8H8S0rLyjvLpctwo+i6CeAnK+xOkNgDE8l94ht4zYl4pfCkSdF
 ejQNUFYhLR+W72nLyRG2ge6gMOXWrXbTeHAoQQyaNHLUjg8KC41RXe8QkDn+vUPzvims
 GxEbXoFeHMf/vFz4vFRP8LPvk39IK7CtXm0r9Zg+DOhTl7Z1GGCRDks24B6Jui9hUPqi
 NlEen2SWlJJT898HeQK2rnNObiMeUUSqaReAmRQoutH4vJvHKYbBveRozdz/KKg8Awud
 xDSfdiN64mK5SgKZRPC41JDAO5o7dWWkwpDgrk6h1DSRGcP/c1Wk2bIPUu/dcPX2h4Co
 UfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aQbzhX3O4aLcuVdNK/dk+Vykc3yQgk316tpQ75kYYpw=;
 b=VWfmDnirV9JHbe6LShrKZf5sNz4QLykWh+Ulyl9tOQsSwdoBnYM3vMy5wG4KAwR9vS
 8rpfH8vFTiDxTjst9oVFHqWv19d/DfYOTNoYNiZ5oaQEZiMM4qQHuyReM5iIFemuTFVt
 AdV3Y8Gan8JyPjTyZ6ZDHHxs+D/aRD0wffhUkWuBMehgJHfgOVcnmPn0X8UrGhUdD1XZ
 +631wTBBBM8G7KIj0bCpIfw6pL86bvRj9Qq94xSMMKVw7HTDfmjpnij8SpdDNgKv2Aii
 /Rum2JnrvpOat+bi/IcPpzLTYY52ZERnMlW+DAoGDxr7lyHU4lU/Ta2alMu5GfB0mWKa
 9Snw==
X-Gm-Message-State: AFqh2kpRMp05ud/fh+G58yD3L4khZHuFm1k46bf94i5dn5MyTS2kotIZ
 grLnsGc3twtjgYuYR3DNaK949Q==
X-Google-Smtp-Source: AMrXdXsf91JtIJ7nxf2E6Wp9UE/5gAhd0nWlaK0s4hgMqucVu7KQENRzpgWj9EikZa7aj7A4qseFyQ==
X-Received: by 2002:a05:600c:3ac8:b0:3da:270b:ba6b with SMTP id
 d8-20020a05600c3ac800b003da270bba6bmr29759259wms.41.1674578397895; 
 Tue, 24 Jan 2023 08:39:57 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144]) by smtp.gmail.com with ESMTPSA id
 h20-20020a1ccc14000000b003dafbd859a6sm13477147wmb.43.2023.01.24.08.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 08:39:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: codecs: constify static sdw_port_config struct
Date: Tue, 24 Jan 2023 17:39:52 +0100
Message-Id: <20230124163953.345949-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
References: <20230124163953.345949-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The struct sdw_port_config is not modified, so make it a const for code
safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 2 +-
 sound/soc/codecs/wsa883x.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 35bd6f7727ed..d142ca9f2fb6 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -424,7 +424,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
 	}
 };
 
-static struct sdw_port_config wsa881x_pconfig[WSA881X_MAX_SWR_PORTS] = {
+static const struct sdw_port_config wsa881x_pconfig[WSA881X_MAX_SWR_PORTS] = {
 	{
 		.num = 1,
 		.ch_mask = 0x1,
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 4fc7c01c27ae..de3f4b9b0dba 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -522,7 +522,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA883X_MAX_SWR_PORTS] = {
 	}
 };
 
-static struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
+static const struct sdw_port_config wsa883x_pconfig[WSA883X_MAX_SWR_PORTS] = {
 	{
 		.num = 1,
 		.ch_mask = 0x1,
-- 
2.34.1

