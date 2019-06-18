Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246B498B0
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 07:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0E4E1714;
	Tue, 18 Jun 2019 07:29:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0E4E1714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560835810;
	bh=qKGt6ovEO2iegOW3q+Z5Q69RLjXu578/8HbD84Rk6QU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=euzQ5aIspEWotlZiGQromBCXWYXbJCJPiGV71ZWCXm9jrfb3j1D2abVu9gdeVt95m
	 voy3PQZLeRyld6Kdi9VArMPIJwWjUZa9cWE409wGgdbcbF9bDTiWqj1srsqFL0QlIH
	 8ddQleRCyG2D5699FXCtpReaBOV4KmE1BzgcMFGE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A8A6F89682;
	Tue, 18 Jun 2019 07:29:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB3BF896F4; Tue, 18 Jun 2019 07:29:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4B04F8075C
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 07:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4B04F8075C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mPvW2e6m"
Received: by mail-pf1-x444.google.com with SMTP id r7so6956347pfl.3
 for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2019 22:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=Lj4Or491uCz2tJJXb3WzbO2VXWNk3Hk7nTOtYQN43sI=;
 b=mPvW2e6mcV/CIqhidFpo+Yurn5TdvkXOW1QdaK3u5WTFGziti+wTCsJW/eOOr02fqG
 J9JT0PVET8S1CLVBiYeXo2sKcEPICn18rwWbomdjPf2FiLN4VjQzlUsjJufdGHsHnIl/
 yucipCljbwALWRVvWM6KF4m8FqUC2+lBTG3jYhsyOODebLlB5k6xtqgnNbW6rZWsrHBN
 +ls1KOFsQeRhllGKvOrw9dfca9T45nBQEH7T4VCNFlpTSgvYvAJ3jh+83VBphd3ftRIL
 nZl+2bwQZIS7GAI/obVHxanKvqbfkrHlqkWTaG4cJGi3M4vUQGG4EWgtvcuI2qzN5EqR
 RdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Lj4Or491uCz2tJJXb3WzbO2VXWNk3Hk7nTOtYQN43sI=;
 b=LPwAm1KWUWIBw9Wc3zKw1ETp4fMT3Ltcyrs+tvtdoprYvrp7sGRWGO6j4OcsS+8FE5
 CNlfPKhV7Dn76F6PstVzphmi5m/y7ZMLothj3vtwoSZNoSOYDDFMV9hWmHKJGm6Y5zZ+
 A6E3A33Ii+8A2zHRc5PcX9cqF5SCyTNyEH3SC/9LwuzBxAQPjP6RxuAeMAF/NPSYk8md
 9sTrU1XrNkAqKSX8gmlMeJJ9RH8fbu7gJwRVNQWYs0bxrq+kz/Pg35/NW/r72dnk5TKs
 Fr+pmFFGLRnpfbA/1FQNGCJcl7sUQkqVcdFmByqZGq0acPx4TMQiLEB9rT5kPBo8+vtK
 oF4Q==
X-Gm-Message-State: APjAAAV+cIhvPk0VNCdOsVioHOlp2Rg0pJn56ngk7vRpXQkwKmkSHySi
 RE61NHyozbOm9xhqiCoaE3HR8w==
X-Google-Smtp-Source: APXvYqzVQmDQx7MS4P1iKQ8RlVJhSS2xJyaB9wF2eydxpDgmsaFQMWNabJZt0GUQO5Ds3AbcW/Ei9Q==
X-Received: by 2002:a17:90a:a385:: with SMTP id
 x5mr3088727pjp.76.1560835753055; 
 Mon, 17 Jun 2019 22:29:13 -0700 (PDT)
Received: from localhost.localdomain
 (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id b6sm13477601pgd.5.2019.06.17.22.29.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 22:29:12 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Patrick Lai <plai@codeaurora.org>,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Date: Mon, 17 Jun 2019 22:29:09 -0700
Message-Id: <20190618052909.32586-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: qcom: common: Mark links as nonatomic
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The interface used to communicate with the DSP can sleep, so mark the
links as nonatomic. This prevents various sleep while atomic errors when
bringing up the audio interface.

Suggested-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 97488b5cc515..2c7348ddbbb3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -116,6 +116,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 			goto err;
 		}
 
+		link->nonatomic = 1;
 		link->dpcm_playback = 1;
 		link->dpcm_capture = 1;
 		link->stream_name = link->name;
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
