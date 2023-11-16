Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83E7EF344
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 14:03:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79D74886;
	Fri, 17 Nov 2023 14:02:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79D74886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700226205;
	bh=Xcm+smH9NfBLtcFNrqYMpFgpw43C6PBz7Ok6CzRre+Q=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=EhuJFGRGig+kT8blqNPITJ24oqyvNRUQstI2k2Bw/myMN9dpj//u+wjPvGZwjP3oW
	 R52gyj/IRDaE/bUUMboOoIjzre2kuqNWnZ2tMBlgdwgPMMCfQ0D0Dc6ujubolmq6aW
	 xfzRQo03N9zRrcJOBO2fsuVCkJ0JD2noARoAk/uY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE36FF8055C; Fri, 17 Nov 2023 14:02:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8674F80551;
	Fri, 17 Nov 2023 14:02:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85330F802E8; Thu, 16 Nov 2023 23:41:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0BBC1F800ED
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 23:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BBC1F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=O0284JnC
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-991c786369cso195638066b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Nov 2023 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700174498; x=1700779298;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkYOsjbO3YnBcAkSwiI6Lkt5UTyKsDvNbvGkwXIl22Y=;
        b=O0284JnCnFboiy8jFwHZNWKYDzZ3/GAubhJfrU/Y3dI5U80L5SD4nS84+VdV9rfPQn
         3HqCbd+8fNkTyTgPO0fZ5uz6vLB6BViQmS1lVvHO0zSxoGiDagzYZv0Lad/LD+2k0zIZ
         hmkCbkyPf74AyMyV9jhJGFIbpC8rXiVe9aWAgqTL8Dg+6ur6SyqcXzeAVGlGAx2EWjly
         QMdXCzh+FDjiejM3Cj/3BymeS6JS8nZXCEgjUMB99kWeorD6FBxQ8DDBGqtN87mpHY/v
         8WYjxGkyc/5moVgF8wVbuHOQgata3Phxyh/Lc0gD+gzZGDeyhqoGp+kLSQ/C/tSXQDaH
         vUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700174498; x=1700779298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkYOsjbO3YnBcAkSwiI6Lkt5UTyKsDvNbvGkwXIl22Y=;
        b=uMWT3q6qwTDQ0eFl1EUzBeR+hrgRDXkCfAt14CxG7q8Thu1xyYTxOFGcOsTnm6qliT
         g5RhvX3Bn37BN7/JEjSZJU/rceLBKZnudfXk2DceVI6gfu2sAutH12rZShqQhRQi+UYV
         Yf9kG0WYVkYZ3wYBbHBOmXW84c/mT5cORtXwv11sbXnX83A59g3Ce5EIA9o71YVPtLpW
         E/2junhtfAxtx6usNnU2z7sD9Mh1DaVwEfIesb66wjxsgT2GvCrKF7sIiJ+sTMuITcr5
         CG2MBvCTxE1C08MJCKyvFteyWlUUZHNL2OPiLqhJgV2qQ6CCGB1E/eNV6ZWw1HsKwux7
         U9zA==
X-Gm-Message-State: AOJu0YwQFDn1NVCyekamert8ZW7GXTECWSKOq3Ojm7HrZilOb7z1li/v
	M9/qMGJ+XwYdStxCctIdW2Y=
X-Google-Smtp-Source: 
 AGHT+IEA7sEQNhqIZPT3K6xZTA4L+cnbuRkCp6N6sSnDsqse8+u/YCYPLchwfyukXsn/2HNwOo4tGg==
X-Received: by 2002:a17:906:d201:b0:9cf:18ce:95e6 with SMTP id
 w1-20020a170906d20100b009cf18ce95e6mr3042773ejz.62.1700174497947;
        Thu, 16 Nov 2023 14:41:37 -0800 (PST)
Received: from localhost.localdomain (87-206-74-243.dynamic.chello.pl.
 [87.206.74.243])
        by smtp.gmail.com with ESMTPSA id
 um13-20020a170906cf8d00b009c5c5c2c59csm118829ejb.149.2023.11.16.14.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 14:41:37 -0800 (PST)
From: Kamil Duljas <kamil.duljas@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	Jaroslav Kysela <perex@perex.cz>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Kamil Duljas <kamil.duljas@gmail.com>
Subject: [PATCH] ASoC: Intel: Skylake: mem leak in skl register function
Date: Thu, 16 Nov 2023 23:41:13 +0100
Message-ID: <20231116224112.2209-2-kamil.duljas@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: kamil.duljas@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: BI2CLAMNEI6W72A2PGJBDLT7KRKWHWOP
X-Message-ID-Hash: BI2CLAMNEI6W72A2PGJBDLT7KRKWHWOP
X-Mailman-Approved-At: Fri, 17 Nov 2023 13:01:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BI2CLAMNEI6W72A2PGJBDLT7KRKWHWOP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

skl_platform_register() uses krealloc. When krealloc is fail,
then previous memory is not freed. The leak is also when soc
component registration failed.

Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..e2578ee001ff 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1462,6 +1462,7 @@ int skl_platform_register(struct device *dev)
 		dais = krealloc(skl->dais, sizeof(skl_fe_dai) +
 				sizeof(skl_platform_dai), GFP_KERNEL);
 		if (!dais) {
+			kfree(skl->dais);
 			ret = -ENOMEM;
 			goto err;
 		}
@@ -1474,8 +1475,10 @@ int skl_platform_register(struct device *dev)
 
 	ret = devm_snd_soc_register_component(dev, &skl_component,
 					 skl->dais, num_dais);
-	if (ret)
+	if (ret) {
+		kfree(skl->dais);
 		dev_err(dev, "soc component registration failed %d\n", ret);
+	}
 err:
 	return ret;
 }
-- 
2.42.0.windows.2

