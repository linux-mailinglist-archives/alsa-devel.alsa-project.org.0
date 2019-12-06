Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BF114CF1
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 08:53:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE8E01663;
	Fri,  6 Dec 2019 08:53:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE8E01663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575618834;
	bh=vNhgGI7mGd/fUHj/zp0KB8WLxuKzdL5LSTNWdJI0AYI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kH98eRjzGcz81nAoKl8IQhAyNSBUoHIV/RWp5JD3iaJMfQ0WIXsyNLn7oe5fWBjrb
	 8Bi7K+iZD5OMz/z5m7xM07e/ZXDypLQCQSI+e1/45/Oh5qog+RQ1hK9MFA90FrIyxs
	 bAY/tpVyLfuyr96ZtX3qDzVHmN4bGSzUhdNBmjAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1B78F801EC;
	Fri,  6 Dec 2019 08:52:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45586F801EC; Fri,  6 Dec 2019 08:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1FD9F8010F
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 08:52:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FD9F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="YS0AtrvR"
Received: by mail-pj1-x1041.google.com with SMTP id v93so2401311pjb.6
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 23:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esKX0yBbwLj9BsnY+YMN3L28an7nOLNJQ8QXI3FnKzU=;
 b=YS0AtrvRaVMqAcGjqYDM24aoRhvIQBb5zpqO21B2dashN30BhoiGKYcTzMXptoQ8be
 +bYlhz24lNesRSKIz7L37sCRkxl4dvWenJ7gZudcHO+/4dZb6OQfbVjU1em4N5vP3Q3E
 EsIb6yWdDsR7PVIhWldvmL4oh6A5VVI0QYzsTBMbbq5QvYaxUj2aKhSZw+iU4ZYN/pju
 A+GrNfKLEdAdylSd6t0C+sVlkgtm0KtQ8SmX1IIwK2s4cjCBucC7afYwYYQK6rvAKrgO
 x7au5ci0aBRsJ/Pc2BklcnSrzE3CG9mrIrPmrqTpf85XLbl4OY613dMHj/l6eUGGYb9z
 x1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=esKX0yBbwLj9BsnY+YMN3L28an7nOLNJQ8QXI3FnKzU=;
 b=YGL+dcYN2fCUSfmmJoaCJXCBS+Jn8R+4dR7Poy5JxHMOETEah5Ot8PUm4n8Dle5MD/
 tcJsd7OHpKRyHZjy4Ji0umFnJjCXkBgcmbyBoEwPOHZ68mqIEGNU1GN3w0g6Sp6iwbsS
 ysoTMy19OCorgJoL0F1beNaj+AFO63pImHVTQzUtHIwgP+gx0oCo4iE3ht1kRMEZfVOK
 6YacK51XXCnbNw8zSQ3fAH4I8z8uINQv2f48owpyPwFtGUcxhrnPslXjM+qzGjYDm8/C
 jD98fK7wLeb91DnGu5AY4uJDEf9Umm++otZW33+VSddLeek/wB6iJQ8jqMcX64udy5G5
 KH5Q==
X-Gm-Message-State: APjAAAWNebitOyNQtCICPsAhC8Yq+TN9y12EyNMbn1YuMhmvO1fna6gm
 OIwfI2y4KqyshPw2ZJvyFZA=
X-Google-Smtp-Source: APXvYqzieekhi5Z9FrgATSh+2vmlOhNrw5UgkDFtuTD9b6TCthRMcpcYDkwr/oJAQcbClGxXIXJ+DQ==
X-Received: by 2002:a17:90a:610:: with SMTP id
 j16mr14296932pjj.85.1575618721583; 
 Thu, 05 Dec 2019 23:52:01 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id 37sm12647639pgl.83.2019.12.05.23.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:52:00 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri,  6 Dec 2019 15:51:46 +0800
Message-Id: <20191206075146.18011-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: cs35l32: add missed
	regulator_bulk_disable in remove
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The driver forgets to call regulator_bulk_disable() in remove like that
in probe failure.
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/codecs/cs35l32.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 3a644a35c464..be8159bd8ec8 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -501,6 +501,8 @@ static int cs35l32_i2c_remove(struct i2c_client *i2c_client)
 	/* Hold down reset */
 	gpiod_set_value_cansleep(cs35l32->reset_gpio, 0);
 
+	regulator_bulk_disable(ARRAY_SIZE(cs35l32->supplies),
+			       cs35l32->supplies);
 	return 0;
 }
 
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
