Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C8216F5B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:52:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 09E951677;
	Tue,  7 Jul 2020 16:51:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 09E951677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133540;
	bh=0FVxQneLc0kXrGDjM8rqEU0RgT4cRqOVRCGonSO3BA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DQBAZLd/lxAlEBwbsl2zCgLCC9LF6YkFkEPDMGOXtzBPzE9c4Vf18X6r5gcKMfepY
	 TpYqnizuNTDRwh5xfFjg0g288oNBX79V8f/Z9DkUlKUJlwVU38jZYhOEND23+ccQFe
	 C98nMWAFoswKWvjYqEfeI4uaXvR/YYjzpgAex1i8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8AF6F80391;
	Tue,  7 Jul 2020 16:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6ACD4F8035E; Tue,  7 Jul 2020 16:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9ECDF802FE
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9ECDF802FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="o5qFIiE6"
Received: by mail-wr1-x442.google.com with SMTP id b6so45387883wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXLqTyUKMLj4M51ntYR1QA4V9xA1YrzmuNUETaX0PBA=;
 b=o5qFIiE60x8cX+Bhm0rgzWF0oy0LXLTwf++5sVrWU5JMR62946RZ49b2fud+ahUxan
 M3fyhMHkqfpuyZPTvDJ6FLSUfLQZSmxONDGQ5cEbwEnAEEIlIjX/w+B9YHhPuaO/ydBR
 +7G31bbUN/ChKb43mdklUoqkHM2wTxewBYKlrV8Ic+LjI5zxU0xnw/9ps3p7Q/IYFkZC
 bSPRlsbBl90eqE1Wrcaad9xHV1OArmn3GcJA4JxXnmZq9Z8XjsfwdVfYMJFL+IbYyqIP
 ghwioQaNbFCOyXYEV0SfC7uV+2lls7XmQ01d5xuzA3RjuI1uH+nHX6DtiKjxfhFRljqM
 ec+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXLqTyUKMLj4M51ntYR1QA4V9xA1YrzmuNUETaX0PBA=;
 b=LzjeEOSflZkQ/ol5x3gr2NXUwQD52LGJ/0NuNDWlnx8iVY68/ooDhT19Ff0ZaXji2t
 nYAEziHa1kByH/Bs7iV+v/jSztwCOCynak6qxWDIlE+20MvsUV7WQCfcIvPYjhpMEun9
 xtel56e2KtB+OfWoKAsG6+z0vjT+eWPe2kE0OZdA4WqwhmkEB3vEGhaNQJfId12RY9by
 9jztiR1rO4KPaxnn5vN4kFnXnGY5cnFID2wgK9BR070KQ6E/hhM5RRymRbV+zBhHAeBZ
 LGsJQM9LbZj3WExamRrZriCTh6LAOPMUDOqXs9aHZYGywdErNGqwe2YxNu0hTU6PhrCa
 eu1A==
X-Gm-Message-State: AOAM532bP51dBT8LWmRBKYwTsq5bAbq/SP5FoPzqNqaGRpv9H73tHj6d
 ll50v9QGIsmzb7YAoBWmmXEaaw==
X-Google-Smtp-Source: ABdhPJyRMAvI6NkTDV7IWsTK5HtfFZ6l9B/O82Lz0Ooky54tkmtjUVeL9Ss/7Rr8kNE7uRm+HvYhCg==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr53076969wrx.26.1594132699386; 
 Tue, 07 Jul 2020 07:38:19 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 23/28] ASoC: soc-ac97: Demote seemingly unintentional
 kerneldoc header
Date: Tue,  7 Jul 2020 15:37:37 +0100
Message-Id: <20200707143742.2959960-24-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Richard Purdie <richard@openedhand.com>, alsa-devel@alsa-project.org,
 Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
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

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

 sound/soc/soc-ac97.c:402: warning: Function parameter or member 'ops' not described in 'snd_soc_set_ac97_ops_of_reset'
 sound/soc/soc-ac97.c:402: warning: Function parameter or member 'pdev' not described in 'snd_soc_set_ac97_ops_of_reset'

Cc: Richard Purdie <richard@openedhand.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/soc-ac97.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-ac97.c b/sound/soc/soc-ac97.c
index 906106ed8ca14..af789552a9d4c 100644
--- a/sound/soc/soc-ac97.c
+++ b/sound/soc/soc-ac97.c
@@ -391,7 +391,7 @@ int snd_soc_set_ac97_ops(struct snd_ac97_bus_ops *ops)
 }
 EXPORT_SYMBOL_GPL(snd_soc_set_ac97_ops);
 
-/**
+/*
  * snd_soc_set_ac97_ops_of_reset - Set ac97 ops with generic ac97 reset functions
  *
  * This function sets the reset and warm_reset properties of ops and parses
-- 
2.25.1

