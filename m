Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BF0114D01
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Dec 2019 08:55:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F60F1607;
	Fri,  6 Dec 2019 08:54:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F60F1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575618938;
	bh=dkLXnTU0YDRhdhN0OpkxrF0/AJxlMI8NExojphvhoG8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SQNsc2V3bsqP3mbiiHBrkSdmskSEdUYwYtMXqYG780Hvdw2wdBzgH7oGRAYhGqhHE
	 v3OA5N5dekNEd2/KibpPjiUOWSg9lL9p+Wt7J/HGVheL85A96MqCicx9zW4nbAPXeI
	 GbhJUIasgcXcjP6l2262MWM7pqRPQxYSIe0znjj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FCE1F80245;
	Fri,  6 Dec 2019 08:53:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9325DF80245; Fri,  6 Dec 2019 08:53:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_SORBS_WEB,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14371F801D9
 for <alsa-devel@alsa-project.org>; Fri,  6 Dec 2019 08:53:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14371F801D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="qN1H8LBY"
Received: by mail-pj1-x1041.google.com with SMTP id ep17so2406519pjb.4
 for <alsa-devel@alsa-project.org>; Thu, 05 Dec 2019 23:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QO+ulCytfHgL7qVYv09QqcQL+hLC3saTPny9UiLdvA=;
 b=qN1H8LBYbMmKIwNlI9yzqDRW2TyamGui3efbW/hiY6qegMZI6tvwZsels63TUNqDov
 ky6rAXJvi3QSSPnrul01cUfqF4sZ1EsVtg4L9+2Pdb7ZFuxVWaC8d73ezcr9Hrd8HkHG
 hW6zIFeDgEuxBWuYxYSqVkJWySSRbst0ZJIkdPyTo/NKNuzjhRJvK4A2KQoxf6IdJozY
 ee5KlI8s4ccDDP/OnlUDWkZ/Nxr49cFZZDaRdxxU9FL+9BpPuJQXedzcXL3sMqzhIeWV
 gKL4O/IY2wSfy5HAizvO7JByJiaNqqFIHP6bE7e88PeEUK5hVmCodAsiNNCWZIudtCRa
 juEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4QO+ulCytfHgL7qVYv09QqcQL+hLC3saTPny9UiLdvA=;
 b=kEjtuFkA3BhvQphrJ2L3Q0jjz30ICy2uH01lInonAlCmO9aMZjEXWG4UmhAdaqba0X
 yxNVUO6g58XtK0LqWeitnxZ0HtJDRbQuUamcsJYvKK3c5PmTDLkWyO7yQJluKAXpCu20
 XNJ/9VvWEoLe12DICkzHjmazPCpgXPut5R/sQMKpa/FKHb9WXxcOQU4/9rap1kFrYTOD
 e6Qg67xBAUb8FFj0UN5WGhvh1iuPV5ZQcbj9aZGkazSJKApDljjrXlnqZRaPlPaGqy5n
 s1QRS9bRkvwA+WVECfE8HPYAxw3OYTBCBdC1b4BIvx/TNtQ4yfqKGfeMMATP746lgPcB
 CKpQ==
X-Gm-Message-State: APjAAAXxIP9BxBT1nNDHZODXNynf6HdrXVV1TY/yoYvyR1RrxBPVkxy8
 UeBWau1LF8yyamgp78aB3mQ=
X-Google-Smtp-Source: APXvYqzUWI9hR0utwQQmr4dSL+uVpikqVFuARQHqDsWtZnT0kqMol7jeccCmFX6CmDqhW41doA88Cw==
X-Received: by 2002:a17:902:9682:: with SMTP id
 n2mr13035545plp.336.1575618791691; 
 Thu, 05 Dec 2019 23:53:11 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id h68sm15999256pfe.162.2019.12.05.23.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 23:53:11 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri,  6 Dec 2019 15:53:00 +0800
Message-Id: <20191206075300.18182-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Chuhong Yuan <hslester96@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: wm5100: add missed regulator_bulk_disable
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
 sound/soc/codecs/wm5100.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 91cc63c5a51f..d985b2061169 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2653,6 +2653,8 @@ static int wm5100_i2c_remove(struct i2c_client *i2c)
 		gpio_set_value_cansleep(wm5100->pdata.ldo_ena, 0);
 		gpio_free(wm5100->pdata.ldo_ena);
 	}
+	regulator_bulk_disable(ARRAY_SIZE(wm5100->core_supplies),
+			       wm5100->core_supplies);
 
 	return 0;
 }
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
