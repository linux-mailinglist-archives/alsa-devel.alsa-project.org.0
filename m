Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58D3E45AA
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 14:34:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD5791695;
	Mon,  9 Aug 2021 14:33:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD5791695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628512461;
	bh=D6HxvvXH18kMkFS7XC+BvIun40QiV9zMfQJq+JL32RM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZmutwjcSLXfaowEkqRHhoUZXKoxa1JM8wqDOdUQ0KnjASwyzCtG2ibYK+ULH51bQ6
	 CmObFov2u4Uxao1Pur2jz2vZWbuAfdNrx/fAdwj2OANs8yOyQ78V4EM0hm9X8OF1Ev
	 GkIwG1MBMyOvWNORlczlpUM5X0N2Ybiq+wuRhNHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E58BF804E1;
	Mon,  9 Aug 2021 14:32:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D61AF802D2; Mon,  9 Aug 2021 14:32:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1C7FF80105
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:31:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1C7FF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="bFDNQ6xy"
Received: by mail-wr1-x42d.google.com with SMTP id h13so21196610wrp.1
 for <alsa-devel@alsa-project.org>; Mon, 09 Aug 2021 05:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=51lUzZccKvH6yS4jgbBMyr0ZIf73Jibtm9v60S5oJn8=;
 b=bFDNQ6xykpHKDTt6gCBSy4I5bPetjQzlCFgS2SeQT4nQpFDOfS8tbzzst6n2nXM5Jn
 yoIu/UZKIhX17xN8M0wx7xcz+Y3i+KoSTPws/gWfiX16Gkd3J8ewKbvdRvdRPJyorZVT
 1klO/uufewTFk+dxD46athToPvf+Gt/8ZyEdw59h68lGayimB2Rzuk7pe5G2Y85XmPTC
 CzK2lUW9i4OwKC7fvUx8Ia+vcmtkyBawbtSpNU0bLT9E6w2s490A4pkVdWePGCdd/P0+
 9niSr3mbV3NXinc7T5WLCboy1NYGJ7cKlSuL/+DZa6b0Bgybh8WEzItI43xDQhlo4ihW
 bZ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=51lUzZccKvH6yS4jgbBMyr0ZIf73Jibtm9v60S5oJn8=;
 b=qmd8YgM2I8N6uk04zq/jIwhDNChCeEk72nO2jLUtXwLHlSbKPQTzhbSxGRfAnig6pt
 OKA41ZmYPGeMFTyhG+nvXGwmLWSFflEvnV7yrTp9LX6ahd98KJAYE80uqS8/mIYotRko
 pFDdHqih1nXcPJwDglNkg27gPanBqC6IMe5jpfNOHaUOAKOu2LyU23Nx+3xyxHcGBQDS
 MkE/xtJniOY2UW1epf0WCkU17I1JwtTIHOo5gL0AXYlCpPY9x9+cJywQWAsRdZeLrtXx
 UBoV5JmY8Z1Z2GUcJXx/aWnetwF8TRo9ee7tTC5lGGkFKYOz7YD24cxOjtmoMwtuuXIu
 T8Bg==
X-Gm-Message-State: AOAM531BCBm1up/daiYMcIUpemwAAIpUyYcKuWfNq+9plA+HhOBvO6tm
 JdmYNfxWlWNqQagKGSpj/QSsHg==
X-Google-Smtp-Source: ABdhPJwqrwSKgnMXDH9S2o5Ey1PoIimoLQm/3WSXTUKUSz422rgDwwI6vUhlLqx7UssM5foBKsJ+mQ==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr25687377wru.33.1628512313875; 
 Mon, 09 Aug 2021 05:31:53 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id g12sm19369193wri.49.2021.08.09.05.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 05:31:53 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoC: qdsp6: q6adm: fix cppcheck warnings for unnecessary
 initialization
Date: Mon,  9 Aug 2021 13:31:37 +0100
Message-Id: <20210809123137.14456-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
References: <20210809123137.14456-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, tiwai@suse.de,
 lgirdwood@gmail.com
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

cppcheck reports below warning.

q6adm.c:475]: (style) Variable 'matrix_map' is reassigned a value before the
old one has been used.

This is due to unnecessary initialization of variable matrix_map, which is
now removed as part of this patch.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6adm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6adm.c b/sound/soc/qcom/qdsp6/q6adm.c
index 1855b805eba2..3d831b635524 100644
--- a/sound/soc/qcom/qdsp6/q6adm.c
+++ b/sound/soc/qcom/qdsp6/q6adm.c
@@ -465,7 +465,7 @@ int q6adm_matrix_map(struct device *dev, int path,
 	struct apr_pkt *pkt;
 	uint16_t *copps_list;
 	int pkt_size, ret, i, copp_idx;
-	void *matrix_map = NULL;
+	void *matrix_map;
 	struct q6copp *copp;
 
 	/* Assumes port_ids have already been validated during adm_open */
-- 
2.21.0

