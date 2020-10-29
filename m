Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCCF29E595
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 09:00:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8244816D8;
	Thu, 29 Oct 2020 08:59:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8244816D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958423;
	bh=XUoOP9xg7cSnAQdhwbP0Ez8487Pc2Qfpps7JP1j5vmU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wy5/Rr0OBw2UHgP2xA6C4iuv5/lW680DwcHprAntS+G/vyvP0NV+ytbIw1oGPjshE
	 Dp2lvB9Ja2ftmawtkEPZkVQqDp2MT4M10O4FlhhFpvM32l7lcUFhqb7y10VhK9NNuZ
	 3JVkla/XelwNrsB4iP18s8A/mX6Md2B3WpvO+agE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA500F80578;
	Thu, 29 Oct 2020 08:50:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E52C5F8020D; Thu, 29 Oct 2020 08:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00E1EF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:46:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00E1EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="vQuYh02Y"
Received: by mail-pl1-x643.google.com with SMTP id z1so888311plo.12
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfuBmTvMg9MUKxvXP6ERdTgdyYc2LTvWkNxHfpwVAwc=;
 b=vQuYh02YfBH3Q+Cu83OMh2Zw+ddNnqCqUof8ZKGw2KlqXfKzFZgQ3CKG7n4D04vneY
 VIveM2fn6WoY+IaxjawuSGrxQac5F9E4ANI6VTeELqU82avE9JRXNCnS6LUEtmrH6thS
 4OJMnyNpzOZU5Sd6GpLLXjgcS/OaTHx+D1IxWBTCTFNV6ZuPp5AUAZq+s4Se4VrpbL6i
 bJYrAPOy87/ZvYuzKR8N+zeFKT/b+nN02CPJqOMQkGz4XcOdkdss3dqVhGllpWfL8wm6
 it6HxpZ336KvN6kbphzOfgTxQ/D14TG9gEOA68EaBOGJeHX9+Y4PKt13gw3gykmzb/+I
 yCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfuBmTvMg9MUKxvXP6ERdTgdyYc2LTvWkNxHfpwVAwc=;
 b=FGTyYD1lHIJ06bbuX7N8FDUBZxVXt6UfV51J5bIqo1XpsgvZr9W4xzmBbdbnd1jyK2
 uGsIVepAYvIte5258Xvw+8cuCDZuCI+6QCH92qMr959vtcnA3W1sBMZ4WZF6B2+sUxEt
 m5E9J3w1tGhVBNzVp+ay+XU4T9XMhLE5y/4vGiuPh6PUCuEDJghAqm9n1qttQSqaygi6
 XvhJ6K9NkvWiO+VJKMeDJ5lqOm2AD6MsbnDL8iElJT9+JMUSPhdsacSPLkF1YEsD9/wf
 PDhsvlLfFis+9+n1fT4oM3GygMgXoaJaBF1ddvMVg5ZpBPc/dpfFUXM/Z5f0Nc3H9NQg
 j1uA==
X-Gm-Message-State: AOAM530r0wb9aCgioOWRVi8ZSDNHRAhputG23tJ0p4dCmunU1ny6f1a3
 39dYWmXP/qXtgo6q1yXbvM0=
X-Google-Smtp-Source: ABdhPJxf8E/8cKa23EfUte88B96UerFuRSXyvagG8YXcECd1HyINeZl2Eec9Usnqoet1h037d3io5A==
X-Received: by 2002:a17:902:23:b029:d5:b88a:c782 with SMTP id
 32-20020a1709020023b02900d5b88ac782mr2750215pla.5.1603957595930; 
 Thu, 29 Oct 2020 00:46:35 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id s4sm1737502pjp.17.2020.10.29.00.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:46:35 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 25/25] ALSA: aoa: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:43:01 +0800
Message-Id: <20201029074301.226644-25-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: Johannes Berg <johannes@sipsolutions.net>,
 "open list:AOA Apple Onboard Audio ALSA DRIVER"
 <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:AOA Apple Onboard Audio ALSA DRIVER"
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>
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

SIMPLE_DEV_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/aoa/fabrics/layout.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/aoa/fabrics/layout.c b/sound/aoa/fabrics/layout.c
index d2e85b83f7ed..197d13f23141 100644
--- a/sound/aoa/fabrics/layout.c
+++ b/sound/aoa/fabrics/layout.c
@@ -1126,7 +1126,6 @@ static int aoa_fabric_layout_remove(struct soundbus_dev *sdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int aoa_fabric_layout_suspend(struct device *dev)
 {
 	struct layout_dev *ldev = dev_get_drvdata(dev);
@@ -1150,7 +1149,6 @@ static int aoa_fabric_layout_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(aoa_fabric_layout_pm_ops,
 	aoa_fabric_layout_suspend, aoa_fabric_layout_resume);
 
-#endif
 
 static struct soundbus_driver aoa_soundbus_driver = {
 	.name = "snd_aoa_soundbus_drv",
@@ -1159,9 +1157,7 @@ static struct soundbus_driver aoa_soundbus_driver = {
 	.remove = aoa_fabric_layout_remove,
 	.driver = {
 		.owner = THIS_MODULE,
-#ifdef CONFIG_PM_SLEEP
 		.pm = &aoa_fabric_layout_pm_ops,
-#endif
 	}
 };
 
-- 
2.28.0

