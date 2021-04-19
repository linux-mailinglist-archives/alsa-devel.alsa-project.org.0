Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E518363AFD
	for <lists+alsa-devel@lfdr.de>; Mon, 19 Apr 2021 07:23:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4576168C;
	Mon, 19 Apr 2021 07:22:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4576168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618809818;
	bh=0Yhsk/h+8JfchiDnAtYzFtOI6Szmwsyv4Gl14u0XSiw=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rDcgmFrz+JgVZXVZSbrabCfN0gCIrKATW9cgc/oVmv8t+kFMoHUsRs34uDVodeY7N
	 s08ss8HuQXZfLgQHHocyTHUqTha+I25WaeKj0ErdjIqc4/oM8QHzG75bKMz+L2L79i
	 /Dm0F+TUA9IAUcnqJD6E8ZaBO2vC4KnfXt2Ge2ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B9E5F80256;
	Mon, 19 Apr 2021 07:22:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0CA5BF80227; Mon, 19 Apr 2021 07:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4AF1BF800C5
 for <alsa-devel@alsa-project.org>; Mon, 19 Apr 2021 07:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF1BF800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="Pphg5mXO"
Received: by mail-pf1-x44a.google.com with SMTP id
 b19-20020a056a000cd3b029024d8d7a88c1so6028862pfv.19
 for <alsa-devel@alsa-project.org>; Sun, 18 Apr 2021 22:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
 b=Pphg5mXOZuX6oJxCRM8EBukui/4NuJxx07jOJDaZz1oq1vh72/E4kIv/Afhn6yyAcR
 EfMdqJvIT67EtmxeEPcppHNgvSaIQPOIWJEKuAvixPXl6NcyUGtSYF2ZOumOjk2NKp7e
 /gPLjB7hfPzcBXywKFCqzY+pgCwsh4yuzTFPt4gBvldEG0jf2Eg5ZjUF4azjaFlsZbtQ
 xqnx/wTz86t8j22AGehRmp06JWUlH0D8OubZVltZ2Jq+ZUyDzdm9SsUffrads5P6bSb7
 zJbv6Ewjm3nbOqwseOVLNuIztevd8+pl8nABP/jwcrxuT2ucfO4javgEgVWTw29tqmMx
 YWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=1jlzay7NrHhIzm+rkAGcTage5tjUJRiEa0qA/fxcnjY=;
 b=KWoAp1MW9UvX/XFaEqUG6oMnDQshdHR4nekhVqhX328fu/SZOPz11s554Kr6XNpIoy
 r7YCEtqcdmO6xb6rXHJxGmKg9rnGPVoJgUgXxs1CsmuoSiRoMfbpXnl6upoOQiP2s+/v
 faYNVwJ7FjKq0xbcLoCEhFh7VVwZ43Uno4K3Z3i60KxspmBuf+pVGr78FjRDRQcdFP/5
 Gl1jXdwIK6mrRG02n3wtRKKKpdKka/4CRTgwTdoehy7oTFDhyCz6YXMyXGVStUTyLRh/
 InnEkpbFpCzbkRIgnH79MRWT3eMSuAQgNayrK8BwULSJedMjA31mACUym21MSeCXn7dp
 2ypw==
X-Gm-Message-State: AOAM530778KqJeEOZux2GYjDc/Sr8hjqBEwf5PnXEWG959kWRpJ/dkEk
 jA+JjWFVtTgjkicxZEwrC9sgNbWbUM/P
X-Google-Smtp-Source: ABdhPJzi09lEATgb9ztaNjHZI+V7lwptJqTFm+vZoxp1DMfaZ2W5dklVTK8P6wG5Z0mHX0ArfOEsBq9To+nA
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:b01e:e82b:cf1:a8ce])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:e2d7:: with SMTP id
 fr23mr22096275pjb.29.1618809718810; Sun, 18 Apr 2021 22:21:58 -0700 (PDT)
Date: Mon, 19 Apr 2021 13:21:36 +0800
Message-Id: <20210419052136.2475373-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
Subject: [RESEND PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From: Tzung-Bi Shih <tzungbi@google.com>
To: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 zhiyong.tao@mediatek.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: linux-gpio@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 tzungbi@google.com
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

Commit 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.") uses
mutex lock in mtk_rmw.  However the function is possible called from
atomic context.

For example call trace:
  mutex_lock+0x28/0x64
  mtk_rmw+0x38/0x80
  mtk_hw_set_value+0x100/0x138
  mtk_gpio_set+0x48/0x58
  gpiod_set_raw_value_commit+0xf4/0x110
  gpiod_set_value_nocheck+0x4c/0x80
  gpiod_set_value+0x4c/0x6c
  max98357a_daiops_trigger+0x8c/0x9c
  soc_pcm_trigger+0x5c/0x10c

The max98357a_daiops_trigger() could run in either atomic or non-atomic
context.  As a result, dmesg shows some similar messages: "BUG: sleeping
function called from invalid context at kernel/locking/mutex.c:254".

Uses spin lock in mtk_rmw instead.

Fixes: 42a46434e9b1 ("pinctrl: add lock in mtk_rmw function.")
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 2 +-
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++--
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h | 2 +-
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index f77921957f15..3a4a23c40a71 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -619,7 +619,7 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	/* Copy from internal struct mtk_pin_desc to register to the core */
 	pins = devm_kmalloc_array(&pdev->dev, hw->soc->npins, sizeof(*pins),
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index fcf7c3eeee4a..9ffe01a8ceca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -58,14 +58,14 @@ void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set)
 {
 	u32 val;
 
-	mutex_lock(&pctl->lock);
+	spin_lock(&pctl->lock);
 
 	val = mtk_r32(pctl, i, reg);
 	val &= ~mask;
 	val |= set;
 	mtk_w32(pctl, i, reg, val);
 
-	mutex_unlock(&pctl->lock);
+	spin_unlock(&pctl->lock);
 }
 
 static int mtk_hw_pin_field_lookup(struct mtk_pinctrl *hw,
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
index 65eac708a3b3..13836bb188b7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
@@ -252,7 +252,7 @@ struct mtk_pinctrl {
 	struct mtk_pinctrl_group	*groups;
 	const char          **grp_names;
 	/* lock pin's register resource to avoid multiple threads issue*/
-	struct mutex lock;
+	spinlock_t lock;
 };
 
 void mtk_rmw(struct mtk_pinctrl *pctl, u8 i, u32 reg, u32 mask, u32 set);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 48e823f6d293..85db2e4377f0 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -970,7 +970,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	hw->nbase = hw->soc->nbase_names;
 
-	mutex_init(&hw->lock);
+	spin_lock_init(&hw->lock);
 
 	err = mtk_pctrl_build_state(pdev);
 	if (err) {
-- 
2.31.1.368.gbe11c130af-goog

