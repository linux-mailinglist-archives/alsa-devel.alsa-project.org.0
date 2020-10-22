Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F03295F5F
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 15:07:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E708717C4;
	Thu, 22 Oct 2020 15:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E708717C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603372037;
	bh=AN0XQjIQ453W6nn1nK+fvep39BPD5gFXeY4htluyopw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=og0sI4I5otyMNTImm7NEQiAWbdmfJcfaalmikC6wV5UHNhYRTuwbD5Q1IYmMTT1ZB
	 1JGvz4J7WK2waSs58kE1wBe1EgbfMvLEHBUfqqG/aBUkHfFrInPLLG0OuCT+vBsVza
	 ohLVx8KNkE0FeKS3D5R4sfLCxq5iXDfAAVRKirxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64C91F80247;
	Thu, 22 Oct 2020 15:05:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA74FF804A9; Thu, 22 Oct 2020 15:05:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86357F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 15:05:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86357F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SQYceg6i"
Received: by mail-wm1-x343.google.com with SMTP id a72so1985003wme.5
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD2fhi7uj9wBjpHePs1vSB8IMMPxOp1dR+wvh8+B+NQ=;
 b=SQYceg6i2VBNXJV0SqUIN3SzJ+LinPXiudKj9p4WhH20AIq99iSAzFuU0gqOhbisM1
 rx4wCimkQLGpiFi2XgQkhAPXcEoHSBKipsptBmN6/rFuOdnRxtCiqv1kbknDO9/9pKVh
 EMmPRNFHAzs+ffDamD2zct0CZESrLyZZQKGg6A3MEY9hFWyhnptcVMpI+NmI9lqGmwg8
 rNMRa9aTSkCQ8gNBR/FCE6I7YBUU2bWqLCJKY4TvOGp9ss/ATvPnA1dfkrsXqKFRFLe7
 Hd16SHdVx2VGgiLtuxKBU0nDZfJ3jNBgPtmmy+tD/S5Zo8zgDbHlJrEgvIdRe3RfE58d
 zPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zD2fhi7uj9wBjpHePs1vSB8IMMPxOp1dR+wvh8+B+NQ=;
 b=hNPcS21GVYt/0RhSXy12Xocp+OnKS8hfop/YKXGGUwEIWhrgzlFH7kEfKOHvR3iE2y
 Lh60Khy5U/lzG9lvsdTISPygaz6O67dz04oaUUi2xRt/n6ZgiWYj3WtIHVQKypAZuR9T
 qs7KDOc+boeXA3fxuk0hMo9TbL8LFwqNNGtM/x1433VDWSAPuv9uascWsY8OF1uI7/q1
 G3DK+InK29486uD8Db6g2vzO1xGnDc7FggB1EGKAuz4P5JMK2psUwqbYU24udwYt2XQy
 FIQrRA3l5T7FpzSmvVoUiDBqQ36jtJvJ9hYnrjrWwc8ufjPoMvWI16xQnwtrJGwnjxSd
 9C9Q==
X-Gm-Message-State: AOAM531hABaOvYkemc6cPV4Wb9og1S7LzYDw3InnCrMfjeSDWCk9Qo32
 2ObHbIjhzr4X5/YTnlCv78lcew==
X-Google-Smtp-Source: ABdhPJwreKUFAFyls6vhjyjWZPDdzxUvqssC05P6DYwqnrR/UL+rlWKOwLkeDzlANgGwX8CnusZndg==
X-Received: by 2002:a1c:2d53:: with SMTP id t80mr2342033wmt.125.1603371935248; 
 Thu, 22 Oct 2020 06:05:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id y185sm3592680wmb.29.2020.10.22.06.05.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 06:05:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: codecs: wsa881x: add missing stream rates and format
Date: Thu, 22 Oct 2020 14:05:18 +0100
Message-Id: <20201022130518.31723-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
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

Add missing supported rates and formats for the stream, without
which attempt to do playback will fail to find any matching rates/format.

Fixes: a0aab9e1404a ("ASoC: codecs: add wsa881x amplifier support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wsa881x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index d39d479e2378..5456124457a7 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -1026,6 +1026,8 @@ static struct snd_soc_dai_driver wsa881x_dais[] = {
 		.id = 0,
 		.playback = {
 			.stream_name = "SPKR Playback",
+			.rates = SNDRV_PCM_RATE_48000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 			.rate_max = 48000,
 			.rate_min = 48000,
 			.channels_min = 1,
-- 
2.21.0

