Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9EC29D0CE
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Oct 2020 16:45:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C35166A;
	Wed, 28 Oct 2020 16:44:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C35166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603899943;
	bh=lcWe0j+GzgirIh+YqQoahaM3bgWS9KRoVefKMLCmdx8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jNb78opkKqj3xk6y4TOTyPcArokzw18gA15xKQrNmtzvZbJD6YFQc2KDuHN2udimJ
	 j0qn3T5aumzxHf//AIVs6SJv6RUj0azqx0r6kTW7J+3Q2L8Nka0aFZ87spSnF7G2sC
	 C5gpsVFHXYN85mnoduftc0zp4I/FrgbJH1FHFbpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2DB3F8027B;
	Wed, 28 Oct 2020 16:44:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4BEAF800FF; Wed, 28 Oct 2020 16:43:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17EFCF800FF
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 16:43:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17EFCF800FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ue43BboF"
Received: by mail-wm1-x344.google.com with SMTP id c18so16067wme.2
 for <alsa-devel@alsa-project.org>; Wed, 28 Oct 2020 08:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jiFD96u1vsSshJT2G6FxWinttPuhbJMDO1vlNStSZQ=;
 b=ue43BboFstD7BslgWL5NP2j9f4R7dBrO0gVxQwM2ZSxZpjgYdygi40RQnisUbZ9cxY
 Mvy9FwvzZt4F8NRUHVF9Fi1adgNvQnrI4G38mpKFGjUJhoxxXCc/R5CLZXzlsJUL6Qg9
 qLyLuhVpB0bvcgrfLHIUrjoWlLsJToZsgxsXhf9X6bcUwgbQJauiPsuev302BrYGKTv6
 30HA7N57KM/dPVmZUqBeJENDnT55rrCqPs4/Pkh9XAauc71W2t+FW8g9hhTX8EkX1Dz9
 yg7p2MdRoVBoKqAf4UnVcehIv4YO9M1pK7Ko658cyHLGGQkOC1p24G8oGwOZ2Anvkvjf
 E4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8jiFD96u1vsSshJT2G6FxWinttPuhbJMDO1vlNStSZQ=;
 b=V/M9jSa5t3sWT4JZZZLQjVzaPjcUY5LWCzAVEB+4JNs4BzaddwSDQuGjJQbvp3RucL
 QWPDaTEDD4mRlA1tDjK610/dzcP0pZaK1qG7o/2M6cPjvi5HPerpBvALjXl+zLIcLl1Z
 3Z0N/ppgTT2ac04yweV3EmZyqM+hrnpEW+TChBbM+o2XmgYBtZhyI217jio5P8WckSi+
 Qz3vcy83Vkkk4rHiJO6Jn7/YN/tg/TjlScbqIvrt0Z7cLnLrKtzuB1+m6cZW/7wanz/X
 pdOq4gE8Szn0B3bhG67QZxX5+1LAacILeEnX5pGhC/kxVEoS8ubjTVVowjKZuGER08Ea
 kDMQ==
X-Gm-Message-State: AOAM533M/zWO0/pL8C6DxPwzQnDWZh36SMmZYwHIT16t0Awofx2CISF4
 nv2vyKpkf3nB4I5suV/jUS+KtQ==
X-Google-Smtp-Source: ABdhPJwCNhUQpvs6QaTPF7N+31qqRF0YSXToRPPhMSIZJbIert0f/um74RENbM3UepdhAcEA3MdRQA==
X-Received: by 2002:a05:600c:2041:: with SMTP id
 p1mr8846861wmg.15.1603899828374; 
 Wed, 28 Oct 2020 08:43:48 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id u9sm7884114wrp.65.2020.10.28.08.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:43:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 1/2] ASoC: codecs: wcd934x: Set digital gain range correctly
Date: Wed, 28 Oct 2020 15:43:39 +0000
Message-Id: <20201028154340.17090-1-srinivas.kandagatla@linaro.org>
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

digital gain range is -84dB min to 40dB max, however this was not
correctly specified in the range.

Fix this by with correct range!

Fixes: 1cde8b822332 ("ASoC: wcd934x: add basic controls")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/wcd934x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 35697b072367..40f682f5dab8 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -551,7 +551,7 @@ struct wcd_iir_filter_ctl {
 	struct soc_bytes_ext bytes_ext;
 };
 
-static const DECLARE_TLV_DB_SCALE(digital_gain, 0, 1, 0);
+static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 static const DECLARE_TLV_DB_SCALE(line_gain, 0, 7, 1);
 static const DECLARE_TLV_DB_SCALE(analog_gain, 0, 25, 1);
 static const DECLARE_TLV_DB_SCALE(ear_pa_gain, 0, 150, 0);
-- 
2.21.0

