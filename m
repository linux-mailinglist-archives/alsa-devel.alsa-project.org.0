Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9680C4BD9D5
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:13:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BF8816D4;
	Mon, 21 Feb 2022 14:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BF8816D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449223;
	bh=e56jG/lyd6oGBZ52c9erwIAX8hNA9r6AzEtczhHWtZo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BtLXTn+Yv7bXy9QXKnKbA0q+G7O89sKBwLEYmX7/mUZfSChT9+jOfhLR4S4hA8HJf
	 GiA8m32jgGol1rbzByruqiOBr5DfR6LcmftWvoznUlKiuGCkYHTvb+wxrxJKLqevoU
	 uRgXSvPXQ9/iF4UUqRs7cVQt5Mkx+gOE+lv2piTc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60196F80529;
	Mon, 21 Feb 2022 14:11:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2D63F80527; Mon, 21 Feb 2022 14:10:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9190FF80516
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9190FF80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xT89kU+5"
Received: by mail-wm1-x32d.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso13514290wme.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfKStxRvgTEmdqhNQGyq07ydIW9Hyz4sxw/jfz5hVYw=;
 b=xT89kU+5gglDuZfx6otMltL5s7sd25gDnq0q4fQB0XM+AhvrbYxRIJ5l7pBHySmK/k
 XO6zRM7SVmSs3EEvbmC+Tg7r5/CRu8k0Vrk+9McU4UPvtv2Z5MsIkW/+FjrXgZnqQZEZ
 K9cx/g/gTSYk6G0eO3UwnMWCFqOL7VWBHJXIK3vaIPejk0En/mPfx4VCAeFmkrtl38ZT
 lcd3l8QoSrdWhRyaQpxhPhdh9JECU1aFGtuSjKOo13cdGlqRiJqgpjC3nNLK6uHsTWC7
 tFi5qctN54EPThIa1wmKm4/RJEvUgrrv6nJBjfxIn+RJVJsWg02qe1t0QcGOipsKgfdh
 GLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfKStxRvgTEmdqhNQGyq07ydIW9Hyz4sxw/jfz5hVYw=;
 b=CmHBrL4yPTO2v648np0jz4a2PlGoVXLLX5i5ekuyJ8z2IYKt24TT3Oe03iKMsPU6ty
 JA+ukHfBE14DipU5KUb+BMGI69d2j9wCo6R76oM7DlqbvjsO0gBlgAqPuSbC/6hxgql8
 hgONb8X6asrL7sf51eJWRtPuM8zDfV90eLYogpakTAKLsNz/LGFEdc8USEzKjMHSMgfP
 8PFanDVfdxpHoPvXDJY9U24KbaRHLsXBH6OkXVILGKBvSy4xXiJq0T6nCt7DIK6DolRG
 6a7rW9qwCVmw7kgPRNZONaQDJiW6CaShCchggx0C0D/gQYe2veSg2enSQh+qCiF7dMiV
 AFig==
X-Gm-Message-State: AOAM533RSM/a1yGyNZPXqto5WYWUthU0okFxCGtISLDg1x2myEBCAS+T
 Jctr4YFQSfBFf82exIfDM7Vn0A==
X-Google-Smtp-Source: ABdhPJyEohRKma9akNiOWsxMFqCf8yJ7AknxrWOekQ8wSnBWxATqwZPl0jD7d3d/0zk+IUHr41hoaw==
X-Received: by 2002:a05:600c:3b85:b0:37b:baf8:f542 with SMTP id
 n5-20020a05600c3b8500b0037bbaf8f542mr17847152wms.26.1645449047634; 
 Mon, 21 Feb 2022 05:10:47 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:47 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 06/10] ASoC: codecs: wcd938x: add simple clk stop support
Date: Mon, 21 Feb 2022 13:10:33 +0000
Message-Id: <20220221131037.8809-7-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
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

mark WCD938x as clock stop capable.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd938x-sdw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 1fa05ec7459a..1bf3c06a2b62 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -249,6 +249,7 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 					SDW_SCP_INT1_BUS_CLASH |
 					SDW_SCP_INT1_PARITY;
 	pdev->prop.lane_control_support = true;
+	pdev->prop.simple_clk_stop_capable = true;
 	if (wcd->is_tx) {
 		pdev->prop.source_ports = GENMASK(WCD938X_MAX_SWR_PORTS, 0);
 		pdev->prop.src_dpn_prop = wcd938x_dpn_prop;
-- 
2.21.0

