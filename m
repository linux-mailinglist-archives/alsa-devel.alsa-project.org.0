Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA8929E520
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E9301681;
	Thu, 29 Oct 2020 08:53:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E9301681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958054;
	bh=4DeplbETW4fyikai3AjTqHX7VVrkWDqX0tH6hlFUzAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R0Oc8gLy0edRuBRsZfHlyAnz/3Efb0EoaD3WHvUGMeK6e/MKFwMrU/AOrOl/6uGQV
	 JsVH4OW/BPGLqy5RoEHALh4SX2ZSd4thAf7M96XYRJQlz6qV2udV4RJjSyi0W3nVvI
	 dvlEZKenYcFDcbLzuNWkT5cq4wLO/zFyHwOZzMVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB1BBF804FB;
	Thu, 29 Oct 2020 08:50:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E98A6F80217; Thu, 29 Oct 2020 08:44:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E52DEF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E52DEF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QXaJtgDU"
Received: by mail-pf1-x443.google.com with SMTP id o129so1661936pfb.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ESVv+pY5jSD1d+HDXCLrZGsW+m8ltnbCHyHJOCs8m+I=;
 b=QXaJtgDUeYsx+AcGbv7NKaPCw/bNzWl7kGcmJ8UeBrLmEBrptvJTXdbPEdNcUqcjvS
 T9pUt8/HfBrbFIKq4OyEgYw6ozuCyIOATOKkehoUZPuZGvf6s6b4G80OhfbdlgCzmh8D
 7H3+BJFK+iK+v7/NKL6FUSbsJT6cGSzQ20a2NtQju6a40ATQ65huUbx76b+EmuzKG1//
 m0BZ+AYHX8/4e3HzYF0QIYp+pF/gDOSi3gU+oXDpHgv1Cha/xPY3eXzwhlqFnf0YTBeS
 nSlPC7+zT6IZJhLUiWJ5uODsK8PKb/XgShs/rfyHug0//TfXmQe++1QQWuVNm223KBsI
 WGFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESVv+pY5jSD1d+HDXCLrZGsW+m8ltnbCHyHJOCs8m+I=;
 b=L8rP0VsfDDFkz9DvrAULIaiTBbPVH/Zq4BFeUDu/czpmJHqUEi/Br2XqJsdFASDRJ9
 aYMBjJoDxciuOh08W60n9l6XiK3tgx4FLlssymFJ6HMuw8dFBssMHQo+GwfDsQpvl+bD
 rtW/9SxTmcvxBuP8D4DNBqFZgrpslBr/fvsKeqim1tPG3OzP506YP6gwpze0ilYGNBeX
 r7V0WMWR8ZboniLD1d28/BZzuQDtrn4R5SZ8JzuqMogLcYIxgb6NcG/SyB3vyOpQ7RUn
 96XxCjBwsmQGd0GveNdHo4Mfn2t4dj5A5zQIh6+Pf6qMhz9nGefRA8RnjRfhyxdnG65m
 jIjg==
X-Gm-Message-State: AOAM5300QjKIZT79ZxYV26XtU/7gQcJbkV9Whi0PaDExsppxMREff+g7
 OyU2OHG7qfiY/pY+qa44ovw8+MrFhSjy27Gh
X-Google-Smtp-Source: ABdhPJzfU3gWLWZn9sHRpVXg6rAqMMuzgyKIAJpqJHIJWbB6Z1zMoTjgOJ8HqL/1lFSZ4IlWTLfSpg==
X-Received: by 2002:a63:b819:: with SMTP id p25mr3005032pge.282.1603957451120; 
 Thu, 29 Oct 2020 00:44:11 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id nm11sm1920467pjb.24.2020.10.29.00.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:10 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 09/25] ASoC: tegra: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:45 +0800
Message-Id: <20201029074301.226644-9-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
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
 sound/soc/tegra/tegra30_ahub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index 156e3b9d613c..9fc22d5e9f6e 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -629,7 +629,6 @@ static int tegra30_ahub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tegra30_ahub_suspend(struct device *dev)
 {
 	regcache_mark_dirty(ahub->regmap_ahub);
@@ -653,7 +652,6 @@ static int tegra30_ahub_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_ahub_runtime_suspend,
-- 
2.28.0

