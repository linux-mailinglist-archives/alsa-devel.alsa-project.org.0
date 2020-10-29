Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA21729E51E
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:53:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ABC0166A;
	Thu, 29 Oct 2020 08:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ABC0166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958025;
	bh=eDPlsL3p86uluY2iuNdkl4L3CS5krVyoD1cKMNlH8w4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AULIwSj7wIQiQEvm0dnfoAQMQ//GEPozjZMSIJuHtbY7PqdxJ4wUax6w272NHzDqm
	 /8+meAIKXpuL5vguPyQ5kpLKG+rU/mKGZ3AYA2OScto8KPtS39SFOLnbfBcYgjcdtw
	 X5ktnBFOY1MsStAf7Y/3hUcZL7qepiT2hR2NFwCU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED5E2F804E4;
	Thu, 29 Oct 2020 08:50:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E215F80217; Thu, 29 Oct 2020 08:44:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37E59F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E59F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="L+BUDkqZ"
Received: by mail-pl1-x642.google.com with SMTP id j5so900433plk.7
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AHzIBGN0BQuBgCIUGfl4ZLzJ/JT7l0StfYhAvIeJ/MM=;
 b=L+BUDkqZgHM6yV7+oOTVLr5ity64t3juhbDn2kVjjj3viJ8SZBngjBLD1QrHAwPGxE
 C5we+AdSZ5CVr/HefW9VLX/3MSn5UFGoDDOeIWvhEn+AF2ANz9V4uEEONpGuOAgTU8J8
 P5LL4ZpXHrfUaHycVOQEDHuAoRhJT8yJSXizlOvVpqSKQojJWXts+GIdudFA98eDm7gC
 d1L0B1BK4xJ2dgtgDJ1L4cF4f44eTfPcjVRy4KuTRAi8nfYlkTW1FtDenFFIYS33HMxV
 jqMfWv2QZHhCy2WOOUb9Zv+ydkly5FX2P+L7y5VRw7YUNOPrGcghXKjr6x6dHy/ALtEf
 jrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AHzIBGN0BQuBgCIUGfl4ZLzJ/JT7l0StfYhAvIeJ/MM=;
 b=gryZ/8BVIpwYuLpaD/4codAXN5XRg58MGVJcTcP/6oGc7GY9b+TY0E2aYJxEyxmiSR
 f1iIc6+4xXLKajx8kejxH8RnFAeyLn/i2IyL1F0vm4aGOaKSg2HKzrvj0qhJ385hyhZJ
 oTMIqxnz2wQRfkKo5WdI7khaRKNrxfG3MWe24TgIZegRYpdMjUIbcCaZorRV7ZoNMlQA
 8BMMoVYPqmjL3p3VzA/w+iT9ajM6+lq1g6rjLj+CAoHYrbyI6u/z+97CYWRo625jSRDF
 oWNtGlP5TDe5JbFkIdgJBhp+YJMMYVyHf4gcaaXrGrFuw3aWRXc4P23XNPagOT3MlJO4
 SSLQ==
X-Gm-Message-State: AOAM532SdCPlxc5E17iV48Kbqa7RGuLDZIs20qOQNIqS/IQycK5vdnO9
 G/9R1BiqcLLqgXeLuyGa97U=
X-Google-Smtp-Source: ABdhPJx7ijebngEZU7m/kqD/GAuqvQt2AdGg9Ne5c4u/3+DKAtE02bgPvipElzUVy1Bnz6dMPAIC7w==
X-Received: by 2002:a17:902:ed54:b029:d3:d0bc:e41d with SMTP id
 y20-20020a170902ed54b02900d3d0bce41dmr2975304plb.13.1603957441202; 
 Thu, 29 Oct 2020 00:44:01 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id gb13sm1691152pjb.55.2020.10.29.00.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:44:00 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 07/25] ASoC: img-spdif-out: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:42:43 +0800
Message-Id: <20201029074301.226644-7-coiby.xu@gmail.com>
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
 sound/soc/img/img-spdif-out.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index b1d8e4535726..1549a8db6657 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -419,7 +419,6 @@ static int img_spdif_out_dev_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int img_spdif_out_suspend(struct device *dev)
 {
 	struct img_spdif_out *spdif = dev_get_drvdata(dev);
@@ -458,7 +457,6 @@ static int img_spdif_out_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 static const struct of_device_id img_spdif_out_of_match[] = {
 	{ .compatible = "img,spdif-out" },
 	{}
-- 
2.28.0

