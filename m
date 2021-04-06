Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A355B3556F3
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Apr 2021 16:47:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E0661607;
	Tue,  6 Apr 2021 16:46:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E0661607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617720469;
	bh=WD2DiI/WtjAjQ3m9KC8/WigL8GBqBA1Gbb+P09KSXNQ=;
	h=Date:Subject:From:To:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bkxiwZB/PqehlSxaevwWNwpD7QE5jnu0+AkzhJUUTOPxzkV+eYyyPMsJNuInPpqwB
	 KHCeYnaoKEfxvozraX+JdvgOCxqq2bXuc58FMvfKaxUzzu5uIxM4Pea8gENPDyJpgL
	 srKOUQeXvM6Bxolw1yEtIgvrYRoMNP4Wk+3JE6Xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6DAAF800E1;
	Tue,  6 Apr 2021 16:46:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8001DF80246; Tue,  6 Apr 2021 16:46:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,USER_IN_DEF_DKIM_WL autolearn=disabled
 version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B6EEF800E1
 for <alsa-devel@alsa-project.org>; Tue,  6 Apr 2021 16:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6EEF800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="giIt6BWI"
Received: by mail-yb1-xb49.google.com with SMTP id 131so20832152ybp.16
 for <alsa-devel@alsa-project.org>; Tue, 06 Apr 2021 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
 b=giIt6BWIWMwL+8oWHNwVESB6kfvJE2Hmau2LQVK/qOvPwuVEBKftkRZlFONM4nGfoF
 Hf/3c1QQXU1V6LSOxXw1m8k1LrR5PqMpXkizk0pt2yxTS2VNowkZ6SXdp7lnqTD3G36P
 DfFnoQCzXpXGqSfvu8nyoT3dfIcQVDUz7hkC9HBCD50BIfK6GTOyruWVW2MGRGtsKlqS
 +717WzuUfV63wlvhHPAOm1OQKLr9d8jar0vqcjCLaVwtoMvwR++xHQXqUD0eKiREtED1
 KH7HytuHx9+jM5UHZfehajQldXI3Ey5Jq8TyimnuZ2+Udhr92HChGO5d4JgRFXoTo73v
 cylw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=K97dfDzOakTNCO8JzrPfznFhYT4VKiM9VzlN1DMwR60=;
 b=FhJbjc2l9dpPMwgq5Rc0EKvbEVZiKGFmakxJfRPPctRseIBu2Ln3xkkyCIKZo1djyk
 8xC60xk15WJJgDYOg+DumVxnO5pAak6YKFlEiBW23OZvbGW1il6EGziBu9BrbR4/Ez+W
 StW3zcH5bXfsh9fSxOwHfdAMm6DaDb8CssV0V7RIDlvg+BBdK9FdIGlcdfq839NgAsxb
 a36wcTYGYfCD872DC7pQ56EM7/QJLLgUc+1izT+dSSAgLQtgRGTkPHjAkJJdecIxYxLn
 IldxwccM1GT/rrOcuVRArb8iahsAmyCo6tSD1EOIgsyMCCRgjdtA6hITPXcmu/qWlfEh
 yhbg==
X-Gm-Message-State: AOAM532d71hNYBM3y/TJynqUNqCQzqE75MyRqmRBRo86AJBVkcevH3gB
 zdYA4ljFG1aIj9XRxO0u7tWAlcHIjC5S
X-Google-Smtp-Source: ABdhPJxLBPH5IlbJAcEx+YiWk14ww+bmR7OEBrrGRnZpj3rZAnOKTtdeTjOnpEQ5A5YxHscwtF3PTCwuzler
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:9d56:89cb:f993:7b46])
 (user=tzungbi job=sendgmr) by 2002:a25:e90b:: with SMTP id
 n11mr38157321ybd.467.1617720372864; Tue, 06 Apr 2021 07:46:12 -0700 (PDT)
Date: Tue,  6 Apr 2021 22:45:40 +0800
Message-Id: <20210406144540.3467756-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.0.208.g409f899ff0-goog
Subject: [PATCH] pinctrl: mediatek: use spin lock in mtk_rmw
From: Tzung-Bi Shih <tzungbi@google.com>
To: sean.wang@kernel.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 zhiyong.tao@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
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
2.31.0.208.g409f899ff0-goog

