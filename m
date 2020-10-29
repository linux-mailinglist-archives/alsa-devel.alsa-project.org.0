Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A229E538
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:55:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C75F81693;
	Thu, 29 Oct 2020 08:54:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C75F81693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958134;
	bh=kdKtFn3j/dG8N9u04x3uspzraK0dPwqBQ2cSyUSuOvk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IGLt0HpnX1wfLC+ZnO1O3/Lq5ex5y744hXxs92XSy3DZY3U0SB9VFyDvvWKJEFuo4
	 DqHX9ekgo2+99TTnFufuKUPLjo19MqFi/U1FDwXpApRGttGGJXi1wMXGAjztTBbB0d
	 VMiCyZyQ60D/DJg/TdQwkv8D4vLb6+n+owGTWxpY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F420F80510;
	Thu, 29 Oct 2020 08:50:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CE7F80217; Thu, 29 Oct 2020 08:44:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C280AF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C280AF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="TkJ1akdf"
Received: by mail-pg1-x544.google.com with SMTP id z24so1661710pgk.3
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nVqH6ZdDZsxjhz6ACxTIa4F9n2pNeqLVCfy2un8GTaA=;
 b=TkJ1akdfIG0oF27sYc+gc8WT0yjtsPijZW5V4jOCBNoMk3VeHalSL2CyeLWeT2FEL8
 I6Q1Cj2eSEz4INHzkIZuePaC7S86drVW9TDaVxNS2PWkqc5eckuuAWzdTxpSp3yzfV6i
 5nbuNAJQB5dSfCGWywWkWo+j36Mvdt1UpiDiLfGFEOCcX0PMKUBpngEqIKDSP06MtHQi
 1FPCuRdZjfcV8VHzvRerkB6Kqq2D91okuEuDNWXX8nmXfVCMULqI6HcDujDqOqVEteqE
 Cov05UKf9ZngGAHfEGIljZ/T0AQcjjlzfX0zQwW1mv9SL5fcEx63QNS2Q0++I6J7gYVc
 VtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nVqH6ZdDZsxjhz6ACxTIa4F9n2pNeqLVCfy2un8GTaA=;
 b=aYe77xH5g6UoGaow7R7EfiTponyNQbnKE7p2M14Z4ZijtMvJVz0MTGDp4XAssQp8Lr
 ctpKg7GyWJM/gmDzLHqabqv4uOAArwac8tQNWrqvZeVMF9OfLlxlgkDqvZlqCng7+Rub
 GB33U5m6zevDXlzMRFFd1oaeikHKOXDhZJdjXysdKjWmRxVa9XHqfliT6q4BeH78UAqo
 RKPR06jtH8y6FZhEtJgzBfrL6nL4WK+Yt//md+XDimhnkskEv7/TJHu6eeX1sTCyy+ml
 QuJec+UAapP3wqR8nHMaWPZltdGoob5eG9PvGct9e7erbp6I/FlELs0pnKMwLyGC6muP
 61Tw==
X-Gm-Message-State: AOAM530dXv3JpUoqafAMri5PVH+GbAqOi6lqTb0KQQh+Xe4Bcxci5BYz
 65IGNRHWH1TpnT4Q32YorgQ=
X-Google-Smtp-Source: ABdhPJzXC8sP+c39Xx1NVeZuvBhUppi3iLLlmqr3BQXMvhyTNMf7wD/5G8LbipRnbyxWoNz0D3NnRQ==
X-Received: by 2002:a17:90a:784b:: with SMTP id
 y11mr2950425pjl.165.1603957464479; 
 Thu, 29 Oct 2020 00:44:24 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id o4sm1855935pjj.38.2020.10.29.00.44.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:24 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 12/25] ASoC: stm32: sai: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:48 +0800
Message-Id: <20201029074301.226644-12-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "moderated list:STM32 AUDIO ASoC DRIVERS" <alsa-devel@alsa-project.org>,
 Olivier Moysan <olivier.moysan@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
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
 sound/soc/stm/stm32_sai_sub.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 3aa1cf262402..38dd7e30af1b 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1582,7 +1582,6 @@ static int stm32_sai_sub_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_sai_sub_suspend(struct device *dev)
 {
 	struct stm32_sai_sub_data *sai = dev_get_drvdata(dev);
@@ -1616,7 +1615,6 @@ static int stm32_sai_sub_resume(struct device *dev)
 
 	return ret;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_sai_sub_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_sai_sub_suspend, stm32_sai_sub_resume)
-- 
2.28.0

