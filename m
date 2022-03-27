Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1153E4E86E7
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Mar 2022 10:20:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A30721681;
	Sun, 27 Mar 2022 10:19:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A30721681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648369212;
	bh=nAWC2gIJy4JIW8YeRDAX8ToCRxjem9IMhGKuyCt4j2E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iZgNpYS+G69c7tYnvf2d4mRVSh2KA2NCqtSoHgosAPkIEkctGuFSctrD+FFnUZ9dx
	 O0pJYx6t3cdMykxfRY893rBIqvoIzP1dk6gf75Sgf6RHujGnacJmu5WsaHEM56z0VF
	 X1L0nW87gG2gZSV4LnxDaPCqRvIC0veCEBqYDYnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42960F800F8;
	Sun, 27 Mar 2022 10:19:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4263AF80161; Sun, 27 Mar 2022 10:19:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B3FDF800F8
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 10:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B3FDF800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fbkCuL3X"
Received: by mail-pf1-x432.google.com with SMTP id z16so9979052pfh.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Mar 2022 01:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=FRlj4xMxhi5GXSX1Cps2ByHahJKaninAekH9Bevmx9w=;
 b=fbkCuL3X0EpNGQHTKPQN+J5o1tk1WD1ZvaSnCkLlNZpDKc4eMyPgKFGCQbXnWcFvwb
 33MLo/BbChs+qJaWwTnyYbj3zIPZGsB+hU9b1HftLEiRqDP+s/ukZiVzzB6oDjQX7cuC
 VPNty0xABL2HSE+QkHT1+VTL+RwqVUjtukyrmfy/+AEaz45KxkYx+adzwYkTmmeEURC5
 I40YEYLxdDmlXR7uuv6VK1SpwnAaQBuQkhrbokCGJiP5qzD4HAJgSqf+UDyDKLnfO/lC
 YcTVmUj5nvXw6l3PmuEOtQ9uvRmyTPUMo1wb0GJ/zbvt6mrZY+ekvi+hE3cGbKVxQDmi
 kEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FRlj4xMxhi5GXSX1Cps2ByHahJKaninAekH9Bevmx9w=;
 b=cRwTuD/1Ku9SXINInx2AS40LFk67IL8lTuz5L5NmAiYuykTDuVuL05jPdYqL3JFiLQ
 5JlJqOKTIyovNEk8hsrdCB+yVgV5yUrXlBCNOFmza8tZnsziM/lh0oCQnu33rf2NNXE8
 VzIqmFh1xI0C67mRGDf8ciQT8t0plZpCvf2cdhd+7sBnQOAlTaowIJanLbVKdYVPO2S/
 Jyc7bcbwnaDTMVxfuSBqax1U8q08ZYSErMbPgEhn3rZBXsgq2CphYgo/N+ipy/Iz2YQl
 hEOkypxED3xgK8rlHk+iG1cY+U8v4ldfXgxyzdUVi0+p7E4u7IezKgjyvVfKca9KlQic
 Zu3g==
X-Gm-Message-State: AOAM5311LV8lkZNQjiTWdMZz+mRurZznCu8iBhLKIV6dR6d80qbIWy2H
 vUh4Qj8WgYw+xKP2pGlvebs=
X-Google-Smtp-Source: ABdhPJz2wxWOOC7GRX1rgnX4yaY4pEyOhkAnmMPQd+DoD4Q6rJJmJhlYuKx6PRfaZyj47p55C72mMg==
X-Received: by 2002:a63:4721:0:b0:382:70fa:479d with SMTP id
 u33-20020a634721000000b0038270fa479dmr6059863pga.259.1648369136640; 
 Sun, 27 Mar 2022 01:18:56 -0700 (PDT)
Received: from localhost ([115.220.243.108]) by smtp.gmail.com with ESMTPSA id
 x14-20020aa784ce000000b004fa79973c94sm11560749pfn.165.2022.03.27.01.18.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 27 Mar 2022 01:18:56 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: jbrunet@baylibre.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, narmstrong@baylibre.com,
 khilman@baylibre.com
Subject: [PATCH] soc: meson: fix a missing check on list iterator
Date: Sun, 27 Mar 2022 16:18:50 +0800
Message-Id: <20220327081850.13456-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: alsa-devel@alsa-project.org, martin.blumenstingl@googlemail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Xiaomeng Tong <xiam0nd.tong@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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

The bug is here:
	*dai_name = dai->driver->name;

For for_each_component_dais(), just like list_for_each_entry,
the list iterator 'runtime' will point to a bogus position
containing HEAD if the list is empty or no element is found.
This case must be checked before any use of the iterator,
otherwise it will lead to a invalid memory access.

To fix the bug, just move the assignment into loop and return
0 when element is found, otherwise return -EINVAL;

Cc: stable@vger.kernel.org
Fixes: 6ae9ca9ce986b ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 sound/soc/meson/aiu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db7e5..b52915c6f53b 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -61,14 +61,14 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 		return -EINVAL;
 
 	for_each_component_dais(component, dai) {
-		if (id == 0)
-			break;
+		if (id == 0) {
+			*dai_name = dai->driver->name;
+			return 0;
+		}
 		id--;
 	}
 
-	*dai_name = dai->driver->name;
-
-	return 0;
+	return -EINVAL;
 }
 
 static int aiu_cpu_of_xlate_dai_name(struct snd_soc_component *component,
-- 
2.17.1

