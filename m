Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C6A29E58C
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:59:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72CC416DC;
	Thu, 29 Oct 2020 08:58:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72CC416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958380;
	bh=K2KISi2QL+qHq6t2MZky1WAkI//prDYVpgHBYfvmjtY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CwFh5KdxepSe9VSNo+022G8yLFJICHJ4KCSf5WQPayRKMMmBDqvh8dxhQmRc7w1kL
	 k9Uur2oQ+YREYUw69TG7tqecxcbw+ycLC+Jc3eB9DLnLvIGXLFE/QIKayH6xvRt2WF
	 Pzn/1aa8QcpkfoSU4jacbbfL4MlB+Rd6iQdCIFEw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4797F80567;
	Thu, 29 Oct 2020 08:50:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE4BF80217; Thu, 29 Oct 2020 08:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAABFF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAABFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="s9AEqi+R"
Received: by mail-pg1-x543.google.com with SMTP id x13so1651080pgp.7
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mKrg1J0hIePVXQXkTT7U+Izo63Hxn8pT7uIj0drTK1U=;
 b=s9AEqi+RnJT45EUtJzN3jm/eOmIcV0IVBleAkDOoNYGsnCjnnW6YdPdIVO0Scxv5y0
 MBpwekR0XZgzAV+7dajkVS2yqEVs0WkSJpJYPH7/5nZ0yRFuAGk9qR2zRpDRkhFHFxle
 yLICcQSvl13x1F90Zftr5ixFbkkrGG7PC7TIXSE9Obordf7JcB1AZf7wNqeHN4EFuiK6
 4IE9TN4CZ/5yWuhwft5yZdUn13Louv40BsJGLpsG6u20fU9lwU3ImMvXxdGwCenX6Cmf
 ab/k1JF7mMfAmNPRO60LVSEgxVq3EaVgRG56+oN4H8kbAMILYDE9u9z1M/G5cD1cpCNM
 PXVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mKrg1J0hIePVXQXkTT7U+Izo63Hxn8pT7uIj0drTK1U=;
 b=nXLv2b07sAOMla7QQ2DeZsX+w7JBQoRukf7xJv3c6uBGYr9pNad5uCuRpPLh0wzlGf
 k5mNJkbAu4wl6uPJZgGDTUTL1tb5BdODpW+5WBmOzw7JjLcOprYElzqeMoQRYGZ44yB1
 uE0ZREbCX+aA+BE8DfWhusHHFqpr+gcO3kk0z10w2xXRvxUDk57x3lP2wGtfdOxoGQAG
 M+HCyUO/7rQTvFsGrgUGHNm/gI8YEeRqHOLBO6sZXtb0jmowwwWD980gQTEBlpTzYb6Q
 sHbSugtiZpUFbXzanmG8UJwLch493X89ZbR3QKGUtqAZE9DavB/qACnzCTavnCyC3jaV
 LL6Q==
X-Gm-Message-State: AOAM53038v8MeiaHMZM4wpRhs+O2xab8yDzvB/cLmHJlluek7mLK5FWr
 I69nbpjiIrpAYV5h7F+cv6Q=
X-Google-Smtp-Source: ABdhPJzh4iM4udtBfzaWyKyEdasZLfhkR4CpL3B+tUcGzTZNh1FCHDe9m6Nv+/LvQXQ5eDp9Y8FAKg==
X-Received: by 2002:aa7:9f90:0:b029:164:bcf:de16 with SMTP id
 z16-20020aa79f900000b02901640bcfde16mr3303380pfr.3.1603957583129; 
 Thu, 29 Oct 2020 00:46:23 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id j23sm1549643pgm.76.2020.10.29.00.46.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:46:22 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 23/25] ASoC: ts3a227e: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:59 +0800
Message-Id: <20201029074301.226644-23-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>
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

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/codecs/ts3a227e.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index 3ed3b45fa7ba..95d17cf7695a 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -334,7 +334,6 @@ static int ts3a227e_i2c_probe(struct i2c_client *i2c,
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int ts3a227e_suspend(struct device *dev)
 {
 	struct ts3a227e *ts3a227e = dev_get_drvdata(dev);
@@ -354,7 +353,6 @@ static int ts3a227e_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops ts3a227e_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(ts3a227e_suspend, ts3a227e_resume)
-- 
2.28.0

