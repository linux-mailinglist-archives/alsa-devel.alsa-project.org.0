Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F51329D0CD
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 16:45:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C663615E5;
	Wed, 28 Oct 2020 16:44:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C663615E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603899932;
	bh=nwZZllA5AVjSzqJVYvyFUYoVdBrzZTDOvBh4UeOgEqw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TWPCT0t9JJL+Jf9+kPL6VKq1CQhn/xSxJK2qZy16uwc6n+EKDHv268atLM5cBYas/
	 MUAdIqKPfNB55zw7iVwRt4B4WId1n2hJS1MEfHBEXZx2wSZZXAOqg036rzRQuosHLL
	 5Ej3yMl5rR3C1PyndjwyC7j6ZH7BzdEZQg93xUDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CF9F80249;
	Wed, 28 Oct 2020 16:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAB84F80249; Wed, 28 Oct 2020 16:43:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF904F80134
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 16:43:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF904F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="gV58zQ7b"
Received: by mail-wm1-x343.google.com with SMTP id v5so22298wmh.1
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 08:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ctzgjv+NmABx1Kt3m2tDVwm2LGH0KuiBAUYDbPhDv1Q=;
 b=gV58zQ7bh4+ztDSwyh2p5Aqif/Pag750BWBT8Py2nSDCISM6Unz+z27j16xVcBQbNE
 hjvcViqHWR/L7BtIkZnthPnJ2CJ6z3qgAEMLUtU2lIElxal1mAqnniCxVHx3+ElDsMxO
 jANfc2MOEaSJ4xP5hR7BtOpiSyOoKBayf4UxlRj7G4gqApUM2g0jMOEaLbT4JW4JUZEq
 Lgrod5Zv6t1uKsv3IcmkOE2w/30StqfebZopmwDllb6UNI65U5ImhUIO09K9eo6Q41EI
 TGLz0FX49l0KvJohNis8hdD4NCGOyA19ubHAqd3yfpZfgx2hwpiy7NKm/5Vuo+ds7vFX
 sthg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ctzgjv+NmABx1Kt3m2tDVwm2LGH0KuiBAUYDbPhDv1Q=;
 b=tAaKoSvi2DV1PSfJQM54ox80Yt8GU+139o7Bpd/Ztll8r+KyDAZhQ+eofDpW2EB691
 if1/P/U7jN6dnzlMvHTBFfKiAqTfLw4QClI1kuo0CSh6suXxavnFExMVxynJ9/9UKKla
 eSj8wcYTmzYg/yiHIfawFuMPTQ+GsqgtCeiIX8BoJ32rv4+q+7RhT/Uw+yLAeuKgk9vl
 beMM8D5Wvurxj0ZdIH6WGQCsFoVEY0y6liqsG6MQggQuHirC+ERRZkZ44fc15LXUDu26
 oYsZXHQDwGLyFV6Qri+fxuwUhTKWczUfwT8XRLlaldisiJ3It6Vb4U0NjprFV3jAYDuh
 bsqg==
X-Gm-Message-State: AOAM531Ew/KishrGAKmzauULBSfAjyzAS/zDuyyj/qdI7j8TZvHFQRQi
 A1tjwt9qbZymlEVYX9y29UJxyA==
X-Google-Smtp-Source: ABdhPJwcaqp3i4eiwneqkNGjFUh8FzXBxoYJHVg6VFa94j4eRxJJuLa5s7T5KrPNDyh0rG8MALMp+Q==
X-Received: by 2002:a7b:c7c3:: with SMTP id z3mr8803418wmk.43.1603899829707;
 Wed, 28 Oct 2020 08:43:49 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u9sm7884114wrp.65.2020.10.28.08.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:43:49 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 2/2] ASoc: codecs: wcd9335: Set digital gain range correctly
Date: Wed, 28 Oct 2020 15:43:40 +0000
Message-Id: <20201028154340.17090-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201028154340.17090-1-srinivas.kandagatla@linaro.org>
References: <20201028154340.17090-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
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

digital gain range is -84dB min to 40dB max, however this was not
correctly specified in the range.

Fix this by with correct range!

Fixes: 8c4f021d806a ("ASoC: wcd9335: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd9335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index f2d9d52ee171..4d2b1ec7c03b 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -618,7 +618,7 @@ static const char * const sb_tx8_mux_text[] = {
 	"ZERO", "RX_MIX_TX8", "DEC8", "DEC8_192"
 };
 
-static const DECLARE_TLV_DB_SCALE(digital_gain, 0, 1, 0);
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
 static const DECLARE_TLV_DB_SCALE(ear_pa_gain, 0, 150, 0);
-- 
2.21.0

