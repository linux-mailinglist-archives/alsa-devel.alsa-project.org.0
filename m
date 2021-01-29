Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 625B23087A8
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jan 2021 11:07:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E43CB16A4;
	Fri, 29 Jan 2021 11:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E43CB16A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611914844;
	bh=3HPvIU6X9t2pPAjfaIcceKOcvyPoEK3/lSERRRBhj2c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IRAaHHzsNDKoQlCiT4hoWIW6YS2wbmocK3aNPCgSt9NJUL1K2j47g3I1SPxHoFvm+
	 74uLa7EWeRw0p7XiS3GFTJ6XiioKpt4DGuhU095A2lU/HFfysatSIFJD+oh5QJojAV
	 8QE/jbefCunfr1kVhmIRH7HI0+BRpcKnKUDEJ54U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35349F8025F;
	Fri, 29 Jan 2021 11:05:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C929F80259; Fri, 29 Jan 2021 11:05:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49803F800E9
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 11:05:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49803F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="q4ZRywYQ"
Received: by mail-wm1-x329.google.com with SMTP id i9so6699698wmq.1
 for <alsa-devel@alsa-project.org>; Fri, 29 Jan 2021 02:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpRpuvbCjxo6Q1eyzpy8Z1uCp+BK0P9ZIoiJ3t71Ysk=;
 b=q4ZRywYQgLGbpERpFoA8GdJf3IgZWpFvxVri61p2X9du6PvXKmNW2U5Ty94tXnUgox
 ffHAcQS4Ed4sILoNkp5NfXk9okon5V4IKCCcQfhI9MAWwah0M0ayfxY32aIjeDx8NQcj
 jYXAbreaWmJ7JbvMY/Eob8ZnSoaXKyVLnIe/JzTXqOZjCWjfERsHGBiFbEiFUkKZ3BxA
 1sf81yFjgAZ+mX72u55KuwJn5FZ3HUjTIL+lJWC1vrwYKfhpP6Fb600oPgsQbACJYfYS
 7YO4opLbotZ5KPZfHoB36FN8zth7JqTr3DC1HV89bzPEmQKxu8W09H3JyF4j8TWahFZw
 qCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XpRpuvbCjxo6Q1eyzpy8Z1uCp+BK0P9ZIoiJ3t71Ysk=;
 b=WGF6Cw2zM2JXM9rI7VpvFmn7xrfcZaJ+mS6+KNLNQQrOR49TKDiQgaufgmjoXANmxV
 eC1vY81fcxlLkwRARJxN6BcyG574Dyw1hgpGLX9YBWN7hMqhVuUR6MrxmpGed+i5JqeB
 u0hb57FDWyxHlBnFq8K8IEskaV3JBR/RPSmarZlp7YJkGyfmHk8Q62wU0lYzUuybZ+uQ
 izV369msVQUpGHEp9y4vH4E+t437vmPJz2ryFa5aWmk7IrS50/KEPCZNzq4VgMW2MXXc
 9Y/hLZ82pWcWvWWTARvkSYexAklv0amAApYtBm5Jm8MKc3p6wIpiDYp8HJOttxyjExp+
 1iVw==
X-Gm-Message-State: AOAM532cBUWwZgcQcdnf8ICMVLmziHlxgOxTL7bX11fWzkiZ4D4WwLw7
 lEjtY7eRcT9zH5XERFWHad5Kaw==
X-Google-Smtp-Source: ABdhPJz/uscMUCV76CPaCVrUDlk654KuRzMlEw3dXk3WwowTg57lI68ahC047kgWHTFd768HFBzbxw==
X-Received: by 2002:a1c:408b:: with SMTP id n133mr3063144wma.103.1611914743077; 
 Fri, 29 Jan 2021 02:05:43 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id q9sm10561823wme.18.2021.01.29.02.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:05:42 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: soc-component: fix undefined reference to __ffssi2
Date: Fri, 29 Jan 2021 10:05:39 +0000
Message-Id: <20210129100539.23459-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

microblaze-linux-gcc (GCC) 9.3.0 complains about missing __ffssi2
symbol while using __builtin_ffs at runtime.

This is because arch/h8300 is compiled with -fno-builtin option.

so fallback and use kernel ffs() instead to all the arch builds happy!

Fixes: 1da0b9899abd ("ASoC: soc-component: add snd_soc_component_read/write_field())
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/soc-component.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 361a79d655e3..159bf88b9f8c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
+#include <linux/bitops.h>
 
 #define soc_component_ret(dai, ret) _soc_component_ret(dai, __func__, ret)
 static inline int _soc_component_ret(struct snd_soc_component *component,
@@ -43,7 +44,7 @@ static inline int soc_component_field_shift(struct snd_soc_component *component,
 		return 0;
 	}
 
-	return (__builtin_ffs(mask) - 1);
+	return (ffs(mask) - 1);
 }
 
 /*
-- 
2.21.0

