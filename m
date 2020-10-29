Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E154B29E51D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:53:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 704AE165E;
	Thu, 29 Oct 2020 08:52:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 704AE165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603957993;
	bh=OW+p0ifLybazhn9elelkE3KIk6KN/nRrVpNcfJ6RaMM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Nwc9v7uPhkWGIXm44fvX4WH0DVfyxk2n2zwMIkU1DZxaa52WvgozNv1WlQ8+wiQSY
	 Hxq3OGTXTniYjpGp4/IQ9jFRan+2KdgQs4GXqi6ghp2uxvQCXjaLTGuscate04sxxQ
	 NNWD6zJC3P8jgWKHW2aKp7oY7BVk316H5vDWyNu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A20BAF804E3;
	Thu, 29 Oct 2020 08:50:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35EFAF8020D; Thu, 29 Oct 2020 08:44:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE34CF801D8
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:43:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE34CF801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PGf6dq+p"
Received: by mail-pf1-x441.google.com with SMTP id o129so1661457pfb.1
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jaZN7uq6O01jrWfQxHpgtRmb0Gb7gUhtZJtDfvvhJ7c=;
 b=PGf6dq+p2oOvbusQem443qtzdvhBWli1vPwCNwRQauHczKlGVDO8iheu7TDaCQOMUT
 ZSD28bFk+QbEOsrpRnYyrCcQ3xFlildoAUpDn0NfLGsQ+hYBm5hqTo1axD3uZFr9ds8Y
 55S+ImBATyrOHYV3tVVpr57zs7U0d1xDpEO+KqJjC5OgWoC1tAiFkUc/2M98wf5pX6Ol
 MJY3swSjgBnJ9/kr7p3mM4LAKu7IBAzIxnODqJxoArtQgnQcAJ+xff36LWOtdRYHw9ag
 SDWCvPtBP6EsmHRTlt3lyFbntprdnyTgseIv2VLT3OEe27gN+eQaSBtc2KAQdRG8VCuz
 524A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jaZN7uq6O01jrWfQxHpgtRmb0Gb7gUhtZJtDfvvhJ7c=;
 b=axgR4l1zOvi6uCXy+hWVaQr8N9TZ37EVS7lE2FBplvslao6MZFIURJIxrUW/RjlQ0n
 zp97nBRWOnUN/+9SHXbqIjbG5MAc1YUdN0CoCGEOXjMh+zM8wHFeEAQ5HAKrsVh45j0V
 nAJTeNLQc8QuzEVWBgsKhZM9ydNE6tZkYBnTNThnbBgBGf0F9SSieVKTTO5hfFbkqX+m
 j3kqUs2S9KqhnaeCYFymqziL3THLXs+WPidWlsbKXDvznMLPyOMPFHNjlFLwobQ2S8zP
 1dVysu8snjV7CNkjZZGHnZSUfOYDxEqnQ6EjX7Fc81XjVHVQh+x+9T9sK5uTsZZdCvpe
 5Zpg==
X-Gm-Message-State: AOAM532oOkvwqHfNBo9r+1uqB+1u6lDbVdyChxsVh7zEUwC/hhjYgKFB
 OR8Bx2hhWyEdqX87GOt4nZc=
X-Google-Smtp-Source: ABdhPJxZrPCuwMP0s8yJdpRCq4IbmG/ZNBJz/5uBLQ30gGijnR/FLOYvomcsc4KxDgTZMtldI8oUtg==
X-Received: by 2002:a17:90b:17c3:: with SMTP id
 me3mr2702800pjb.56.1603957435363; 
 Thu, 29 Oct 2020 00:43:55 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id a4sm1865321pfa.65.2020.10.29.00.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:43:55 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 06/25] ASoC: img-spdif-in: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:42 +0800
Message-Id: <20201029074301.226644-6-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:54 +0100
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
 sound/soc/img/img-spdif-in.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 46ff8a3621d5..bb73b7fc35da 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -823,7 +823,6 @@ static int img_spdif_in_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_spdif_in_suspend(struct device *dev)
 {
 	struct img_spdif_in *spdif = dev_get_drvdata(dev);
@@ -863,7 +862,6 @@ static int img_spdif_in_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct of_device_id img_spdif_in_of_match[] = {
 	{ .compatible = "img,spdif-in" },
-- 
2.28.0

