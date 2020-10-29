Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C8629E530
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:54:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 812CB166E;
	Thu, 29 Oct 2020 08:53:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 812CB166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958087;
	bh=0unbzYVw+Uzos9ia+hWEfEbVIsnntilN6AH1njzKfCI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JHhnPerNElJYo7HJlMGZPtT7Qr8YyyGsajfRM/FlmkI/dOzFjq2WUahCbb+S46S55
	 6lfgr4nkdEcN22IFDUFszfGrwGSZb8e+ySqn45ZsNskOGXUR0+tzO/sxMALjmW9d9H
	 twAtfT5vN4iaFgVkGNOi5TWQ1vkTi9aZrs+zzY7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91688F804FC;
	Thu, 29 Oct 2020 08:50:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D164F8020D; Thu, 29 Oct 2020 08:44:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21F6DF80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21F6DF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="SwP+WbU5"
Received: by mail-pf1-x444.google.com with SMTP id 13so1651646pfy.4
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n4P04Jz1B6kfqdzGvKKnIFdWyM97aAtPxWHOKKsnz2Y=;
 b=SwP+WbU5kj9ZjusDCDsz3ZrX0Ik+OmEpx2GDCA69DDTslUYaPNIdgDmcJRuoboL1yo
 7+BWeUfR73uuYwyux3tYrR+5De4Twxwtf/dAo5zq5r8vFGd/mFs6zZ0Hw9oWv/qmnkYe
 MD78lkd92G/nc/9d7C4t+HvIqaehcdB42mLPPau6x/IQ8yMg72uJWTIg7o/KrVnR22UP
 v018yQvxEL7kiqfjn28Nmz9WTFHYmuC134PWZ7UoHEQNVEkGHRhsSRFP7bqciw0nUdbW
 3WYoR7wd2Yu6su1PLbIx+T+71nLe2xsGURJQfrslhaMysBSLJaYsEqN4w/i00Dnybaer
 UOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4P04Jz1B6kfqdzGvKKnIFdWyM97aAtPxWHOKKsnz2Y=;
 b=rvGPBgoI79k6BxPqi/grFdAo4CxozItIKfZigdgUXGPmFv29ospmhi7GiJJTjXyvOV
 UXKF0dGxw1lWERkESlyTrnMV9lD0vrBXIVzAV0pxcWXfNJy5ZvWh/LWEM53gg4RbxvGb
 0w9Cxz9PCCYsaAP6TtHXwPpJgl9Evvx6INVF//yWqyTkXlS8PrKpDQOYmR4vGEdUdU0m
 4MKBQPB3BhCSrZRHxz/JuuVJ9NwIr5kZ3aKpuVYSBrfrY4+47ynaGgAi+lVKvoVjTPH7
 2vcIqc6gW03eHi7ZIautyKnf9EjQwYSa04IxTIe7M+QjcgY4sQOB5j4k99YYV4DmndaN
 hHkg==
X-Gm-Message-State: AOAM533pk6FXDQ0REygW68cyE5AyVgdipJNSNwnYTtCNGuzNmCIOedfy
 ArsBYpkHe84kB3U4Ta0nHsc=
X-Google-Smtp-Source: ABdhPJzg83GKBxj/nfpn2Awb2i2RRcM4xIGJAMQ0oCHK8V1W4pzXTmHcNuYFDx78raqWaXw7CRWDeg==
X-Received: by 2002:a17:90a:4684:: with SMTP id
 z4mr2976899pjf.97.1603957455791; 
 Thu, 29 Oct 2020 00:44:15 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id i17sm1827132pfa.183.2020.10.29.00.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:15 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 10/25] ASoC: tegra: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:46 +0800
Message-Id: <20201029074301.226644-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
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
 sound/soc/tegra/tegra30_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index db5a8587bfa4..df55b90c3cf4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -551,7 +551,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tegra30_i2s_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
@@ -576,7 +575,6 @@ static int tegra30_i2s_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
-- 
2.28.0

