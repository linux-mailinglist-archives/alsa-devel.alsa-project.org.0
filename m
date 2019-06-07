Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC965386AD
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2019 11:00:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523681654;
	Fri,  7 Jun 2019 10:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523681654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559898043;
	bh=9DPW7U6UTjWzLhqfPhcuEE78NywxO7yCqQHHftI+a8A=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mbNEyXH9HeL6eDptuyPsviWSx222p/Xto07iNVarrDk2b2lzvbgJUZbKIEqf/B95E
	 11ytUrOPWDyQBTlhfW01Ub+fzq8QWtspCkcbE0duo0KVAt8B1+9iwsWQZc+x39IKiC
	 g4dVaJaYhv4s1bSFncS09RERTum/M3caJyaCeeMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65371F89738;
	Fri,  7 Jun 2019 10:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDA29F8972F; Fri,  7 Jun 2019 10:57:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 095F6F896CE
 for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2019 10:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 095F6F896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lGf990GU"
Received: by mail-wr1-x444.google.com with SMTP id v14so1320495wrr.4
 for <alsa-devel@alsa-project.org>; Fri, 07 Jun 2019 01:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3Nk/ajWW2fVH/9L9yBJ6zZfHfEglcI3MSG9DcJjyJ+A=;
 b=lGf990GUa32z0NWIrq3IT6/tA3Tr8dWI3lrZM3jaURZmclg6wXHKJYFjEWQHzF3XIg
 /m/7PkryJ8qIuEbig95LkE1ACJ7vLBmvws+COjHV+uc5rLqRm40f7TDDINmKXQquq7s7
 W5SkXYwzLakiKIMVw/RMB9xwCfM0uhLqzlxAULjh8N78xMuyizZS4nojgOYLt0c9LUjn
 qZrx1OdGESo+38kl0Enl+Gp4WMpsRkxPx/y60Vd8NvYLkHJs0Cfq0ZhqWjYwlw606Pos
 wS77pebk39PKtajivrkP1jwJ1U94AyJUtC+grClHgRgbn0tbUqbqnTvZlInDE8HmL6N7
 ETyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3Nk/ajWW2fVH/9L9yBJ6zZfHfEglcI3MSG9DcJjyJ+A=;
 b=Aq6j/tm2xZef/grXjUFseiD4aVZTpXhrn3UZKN2to/6SSqmTFkAMoFgupOq5bvSp1K
 IefAUiwk65oDSYqrSQ9EGGH626O4gWqJo+xGx5wuuGL2+7L2taekEvi1L3IPcFlOiElz
 j326yNDiOvO5nHZ/QWEht28RTZj3Q4233yd490vM8l35DYYtT1RxKYkjhV7R8aAEwyiO
 TCcUgARqdgtXF+sdydN0rEr5YLLqXCt+drPD4sba3nznv2qrry6pMsyhWw/fPVVgC4Pi
 jn2pt3eEnRgSCKcLDhRc7ecKqVyLzhYBA0Qcp8Sp8ErZ5PxNSESC8kxxlpySls7TZTtQ
 F5UQ==
X-Gm-Message-State: APjAAAXBQ4RB8t7P7oMS2eccp0dLoneM8I+X0TPXun0JPxhOK1mWEkFj
 2DrD/xuazQUEn0hGvVlHqQO/sA==
X-Google-Smtp-Source: APXvYqz4IVNqNRbjq+XkvxaB+gbUjrylYR3ZBRzgq2RaTUqsgoCPlp1OgQmHsCNzGYDFiJsh9GGXLw==
X-Received: by 2002:adf:ee49:: with SMTP id w9mr9789849wro.112.1559897828100; 
 Fri, 07 Jun 2019 01:57:08 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm2035308wrh.91.2019.06.07.01.57.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 07 Jun 2019 01:57:07 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	vkoul@kernel.org
Date: Fri,  7 Jun 2019 09:56:38 +0100
Message-Id: <20190607085643.932-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
References: <20190607085643.932-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [alsa-devel] [RFC PATCH 1/6] ASoC: core: add support to
	snd_soc_dai_get_sdw_stream()
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

On platforms which have smart speaker amplifiers connected via
soundwire and modeled as aux devices in ASoC, in such usecases machine
driver should be able to get sdw master stream from dai so that it can
use the runtime stream to setup slave streams.

soundwire already as a set function, get function would provide more
flexibility to above configurations.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/sound/soc-dai.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index f5d70041108f..9f90b936fd9a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -177,6 +177,7 @@ struct snd_soc_dai_ops {
 
 	int (*set_sdw_stream)(struct snd_soc_dai *dai,
 			void *stream, int direction);
+	void *(*get_sdw_stream)(struct snd_soc_dai *dai, int direction);
 	/*
 	 * DAI digital mute - optional.
 	 * Called by soc-core to minimise any pops.
@@ -385,4 +386,13 @@ static inline int snd_soc_dai_set_sdw_stream(struct snd_soc_dai *dai,
 		return -ENOTSUPP;
 }
 
+static inline void *snd_soc_dai_get_sdw_stream(struct snd_soc_dai *dai, int direction)
+{
+	if (dai->driver->ops->get_sdw_stream)
+		return dai->driver->ops->get_sdw_stream(dai, direction);
+	else
+		return NULL;
+
+}
+
 #endif
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
