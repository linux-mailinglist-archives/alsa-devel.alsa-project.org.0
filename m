Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A4F114CFE
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 08:55:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9377F1663;
	Fri,  6 Dec 2019 08:54:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9377F1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575618926;
	bh=+TbVq+8HiqOE24W+d/WLmQgMXwqer6eMiDsJ6J3YnQ8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SFBlFAGwrjhryIxvaXDQDcfBsKsrEzZ6iwBCJlbiBjOQVb9izGstejsaSVZEZ+Kvn
	 VGDsDs3u5hCg5Me8N+XmbMjUcn3rlOv0MqJIpZ11kmrMPQdHVrBzW2Ht1cZwK2bq7F
	 ksGYAtmeCJdWs3E8G0vFlcCrEk/WPQ2/FB361QAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2A82F8010F;
	Fri,  6 Dec 2019 08:52:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09CEBF8023E; Fri,  6 Dec 2019 08:52:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8CB55F8010F
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 08:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CB55F8010F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lG2d9ugx"
Received: by mail-pj1-x1041.google.com with SMTP id j11so1285779pjs.1
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 23:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kAJkkEoeN3MEGLHwJYyylmkvJRvoWmMXbreTxA7D7g=;
 b=lG2d9ugxobHRE41/kg5UWdt0/yE4MsppHo+FrDfzlbWQN240CcA9QpUdB3SQ3LGPIW
 FHvT7uruy43ruGMQXKstaoy8ymSo8ryl7KSqDmRj29NpfpOXlKcQPZWrl6dt8ALkkOZ9
 Zig5X8896xQgd+00Uoi/PyyvzDO08m+wsfWdIGLNg2+MAXX8sDplWJSkgGmADIRpEuPD
 lUhfMkSw4+Rn7J680wUJySL2nPtRwwNabx3qXoaws0M2oA6UZCiiSdzakhdpFF05Zt9l
 9/ms06dU6dNYtdFBV3TYOOo6NphX8GCXZRbW7xX025t/adrKwXjtamf1ErokL3M3h4w8
 1vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2kAJkkEoeN3MEGLHwJYyylmkvJRvoWmMXbreTxA7D7g=;
 b=tS7G5qjHybbftEHHRPdkCtj2k+fB329IM/9miZjFFLAe4HNCHLZ9Nf4T2bkX/u42jq
 9LvXyghotiQBKXbPfFfwglys8wm6MdUPuVF6ON4trottTFzMVy7M/zBiUa7JsQLx438b
 aSdDW3K9skTSbt9KTTHTHFUNIwV1AbIW3cL9NPx+Sksn4y7X9JQmif1AvHPMJVwdZrWY
 pDWtDJnEvNev6OVd34mwZ2czFKD/iD2Fpe9+NXiHkfyR1oRbls0w//6taH1E3xq00bOM
 TKM6AjZSGFhkPKE2L8rJBtrRbXS/sLaLkt3Ge27IkSUjt8Z7SPr2WLORXBkJJ+J1BJnc
 8OUw==
X-Gm-Message-State: APjAAAXsdOq1YCiC4O2v5vh15GQog2n8DJeFRL3yG2Z98c7tR6/QzkdA
 xDKnB45tbCQEbnsaSi/rlQY=
X-Google-Smtp-Source: APXvYqw3qlredLsb+GwlZ2m05paSNQl2kY1qLzfGL5YtxkQXqv7xVIAc82ovW1wqhDwKFuUPyJENJw==
X-Received: by 2002:a17:902:7084:: with SMTP id
 z4mr13014504plk.247.1575618774178; 
 Thu, 05 Dec 2019 23:52:54 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id i16sm14491341pfo.12.2019.12.05.23.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:52:53 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri,  6 Dec 2019 15:52:39 +0800
Message-Id: <20191206075239.18125-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: tas2552: add missed
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
 sound/soc/codecs/tas2552.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 56671f21cfe5..0e19ec76aae0 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -616,6 +616,9 @@ static void tas2552_component_remove(struct snd_soc_component *component)
 	pm_runtime_put(component->dev);
 
 	gpiod_set_value(tas2552->enable_gpio, 0);
+
+	regulator_bulk_disable(ARRAY_SIZE(tas2552->supplies),
+					tas2552->supplies);
 };
 
 #ifdef CONFIG_PM
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
