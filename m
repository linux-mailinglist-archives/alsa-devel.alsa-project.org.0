Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3729E593
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 08:59:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DEFA16E3;
	Thu, 29 Oct 2020 08:59:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DEFA16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603958395;
	bh=JyYltEeldd6vvU8hU6V9NcwApWjl5aUy8ZtJm0Y8v4k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H9fZGQI9STGWr9UoK97drkk+ZQwgV3PnARnWCkR5QohJzwqVCW2fYuzUDggawE9Qr
	 iFNzGE4rd6PVPpe7TYCuNnSODl07UdV/0Jby2DE3QHdRWVdFD3lVaOpeP9rF2gtg6P
	 1abAdmL3PoOvvQ20J7gU428NzAH96LtIzKTp7tac=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B4F3F8056F;
	Thu, 29 Oct 2020 08:50:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32471F80217; Thu, 29 Oct 2020 08:46:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74423F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 08:46:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74423F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="la+EKPpO"
Received: by mail-pl1-x642.google.com with SMTP id r10so910763plx.3
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 00:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hgMIOmWXJ9K7HGBgYjrpbZiO//zL6oSGlqytPgNqLQI=;
 b=la+EKPpO5ct1LEVZzBW/CKbqNSoVB9EBbcTwNa8NqrRac3AeP3kR+Dk/aBG6reR1h8
 xjiNL7vgYbwfYhFetVIBRpoRPF5F3j8/+ZZjBxK++c82j1WsfQ5FOC1xL+J2zt3vP0aT
 +pA/adDZonS2lInCajm5fnXbXXfU3Okg3FAjaZuXP5h+4dDL7wGeDG3Bgp0cqSd6Qvb9
 EU/P2/ga305d8J7R232rm+2FwBTx+oAuPlV5TSFXL0NbITEOOe1vNlpSJfdvh+H2WNes
 OFWmki3fx22iiVPzteIEbxAFlsFni476OFJOHllXXDEHpu3896MowAloE45R+0uRQJBM
 ZByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hgMIOmWXJ9K7HGBgYjrpbZiO//zL6oSGlqytPgNqLQI=;
 b=cLfhxN6TNKN7OqXVgOnLHTpC3JogG6mCzhI/VctLUPEK8bbh19+IFk63rzx+4qjvwo
 /QRU8/9wyiL0h4IFNt58n3IBF/zzkoIP4N4cafC1JkvQ09Ygi2GoodwZG4n2CWdmtMEa
 3QcbS72TqeiL+ltBg6i25zJYsqUMJFd53U032pAKvwnKJbpYS8n/EWpLF+YUvULgsjtI
 wGolRDhAauy3Z8Uim2YQzr2pZt878W3DkgjAbIIgus/druAN7Vw6cw+r8zZbOnyrvq0h
 Lv3yMFpnGK0n6lvWDV69nI7by8yhbthcH5KRdusjPj0Q8jbGef5GjnSuXeMMRp+z/gbH
 3LvQ==
X-Gm-Message-State: AOAM53158gP5BXwAOYH4Ue88f77TsyihtRjuhhGY5JygteBnzkRHPGkk
 xKVdfyYabESphzWQEY4z4ak=
X-Google-Smtp-Source: ABdhPJwkeHvC8Be56N2RBknuP0794aGvpMrZ/6SsIv8vZ6hg6wh1m67mCsvKmNV5koJ9ORs1sunRZw==
X-Received: by 2002:a17:902:ba98:b029:d6:6b56:7131 with SMTP id
 k24-20020a170902ba98b02900d66b567131mr2897800pls.9.1603957588657; 
 Thu, 29 Oct 2020 00:46:28 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
 by smtp.gmail.com with ESMTPSA id z3sm1852081pfk.159.2020.10.29.00.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 00:46:28 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 24/25] ASoC: wm8994: remove unnecessary CONFIG_PM_SLEEP
Date: Thu, 29 Oct 2020 15:43:00 +0800
Message-Id: <20201029074301.226644-24-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:49:55 +0100
Cc: "open list:WOLFSON MICROELECTRONICS DRIVERS"
 <patches@opensource.cirrus.com>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
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
 sound/soc/codecs/wm8994.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9ea198ac79..9294ad06f76d 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4656,7 +4656,6 @@ static int wm8994_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int wm8994_suspend(struct device *dev)
 {
 	struct wm8994_priv *wm8994 = dev_get_drvdata(dev);
@@ -4681,7 +4680,6 @@ static int wm8994_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops wm8994_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(wm8994_suspend, wm8994_resume)
-- 
2.28.0

