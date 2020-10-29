Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8C29E53E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:55:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D1A1616;
	Thu, 29 Oct 2020 08:54:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D1A1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958148;
	bh=rK7nHTnGhUurXLfqkfdLuRTgIvJzYbkApNCUL/FDBjg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/e6PFA8fTa9u+BouSPNEluc5F0nGyquMIafW3Dtry7rd1sVPpbwRBuMgrI8W92vE
	 veWDAjUykPbkQoNyYCpOYxoDWGKquZ13bMjNudh+eS42BA7oETGtqkkiMJvY5izbkE
	 BZQMfW3zgezXTb5xRoMENlm3n1K634Dgzgvc8bt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86F7CF8051B;
	Thu, 29 Oct 2020 08:50:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70824F801D8; Thu, 29 Oct 2020 08:44:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C11CF801D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C11CF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WGv43752"
Received: by mail-pl1-x641.google.com with SMTP id 1so908166ple.2
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jpXiCRDdVAzZIis20MTViXOEmD/OZxxv4T9W35au2I=;
 b=WGv43752G20ZWCFW2dJnU7OTDDBqJHnRjacRItawB/45pQd8bZo/Jo94pL+f8Saczs
 snbxfZ5ieEjYPt7HQFA8U95p6BXyibnyHeGLF60W19Wy0K0LWCIRD5IbNyGhMrY0Wn4q
 +KBqJyu9JK0mr/RAOQJPOadPRbaz6TUL1bWqRYqGlplmQARzkl+X99F3zKItG9seZeyh
 0+JVpIl/+R+1SL+5v8GF01kxDp2UbJ+XpTmn6KVxc2XdzQPrIAi2vuIRHzGLMI51aLRh
 zBKU1vv/6fkJlRD87TIrBnW0fze3JjdKzvf4nkDTUl6ZN3OmGovDgDAAdQDk+dj2j8FK
 vtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jpXiCRDdVAzZIis20MTViXOEmD/OZxxv4T9W35au2I=;
 b=pQwpE+XWA43bKX8zZ2hgXIU0la62vXZGM4DsLTjiwUn+evoXKvGQhWwNaBIECLwe8x
 cQi6MPrj5dIjlQo0KRqrdFrJT+t+6h1/V4IXUC7aPdUqBqz11SiDnAz0MoA+PQH4YJ3T
 Xo5qdl3kpYgcb9KdiN1tilPmqAlzB44+vQ7RC3pK9KV8TYluWxg+IOlQjJs0knOkaFtr
 XOVBhxm1kjuW/MuudkP/WFoUIca6/kI9NUPj+YdIottSwKnuLm6UK/xe/aCsVY55tL2a
 u/5mN56yKKxSrOw0wDyB2K69UQGhHwBDCAZtBiu87NDkcEcEFUcX1PQAXDtU3dNvOFMX
 qeLQ==
X-Gm-Message-State: AOAM530yxGV6O5VbGwSmvPY1wokIDFTXxcoFnQiPLevkaqpdF7b5RaOh
 KBtC1gtAfp0gCrwtorp3JV0=
X-Google-Smtp-Source: ABdhPJy6bo/OOxq28BpnumOynqNEHVJ3pfP9rwwlCtI4HJlzGRADoHpABRPlFl/v/E/8HksFmQHsxA==
X-Received: by 2002:a17:902:fe07:b029:d6:88c5:f5d5 with SMTP id
 g7-20020a170902fe07b02900d688c5f5d5mr2125554plj.63.1603957470376; 
 Thu, 29 Oct 2020 00:44:30 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id n18sm1800059pff.129.2020.10.29.00.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:30 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 13/25] ASoC: stm32: spdifrx: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:49 +0800
Message-Id: <20201029074301.226644-13-coiby.xu@gmail.com>
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
 sound/soc/stm/stm32_spdifrx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 1bfa3b2ba974..40262ff0c588 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -1056,7 +1056,6 @@ static int stm32_spdifrx_probe(struct platform_device *pdev)
 
 MODULE_DEVICE_TABLE(of, stm32_spdifrx_ids);
 
-#ifdef CONFIG_PM_SLEEP
 static int stm32_spdifrx_suspend(struct device *dev)
 {
 	struct stm32_spdifrx_data *spdifrx = dev_get_drvdata(dev);
@@ -1075,7 +1074,6 @@ static int stm32_spdifrx_resume(struct device *dev)
 
 	return regcache_sync(spdifrx->regmap);
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static const struct dev_pm_ops stm32_spdifrx_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(stm32_spdifrx_suspend, stm32_spdifrx_resume)
-- 
2.28.0

