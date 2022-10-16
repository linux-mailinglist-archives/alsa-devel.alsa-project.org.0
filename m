Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE955FFD4A
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Oct 2022 06:47:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DB9A8930;
	Sun, 16 Oct 2022 06:46:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DB9A8930
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665895646;
	bh=QQn7byL82/1hrXwSA0LxZhzgG1mJMbf435OfAw/sDk8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hh1mmTXyY2p+5ER3/MJ/CDJVqm/vbb9ESafN3SQAb5wiclNt1ZDSWa3bi5PEUiQIp
	 3MNbLqswDJpbczY5KN3yc4jLiqFBEbQvnBLZANK+m2y1no9z8LhIddGRbE+SUF9gXn
	 SVRCQIDcggeLVUI7saZZAYLxo1pHAZYm6OuKhr6g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB243F8027C;
	Sun, 16 Oct 2022 06:46:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F60BF8027C; Sun, 16 Oct 2022 06:46:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, 
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5814F800F8
 for <alsa-devel@alsa-project.org>; Sun, 16 Oct 2022 06:46:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5814F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ig6Dy5kU"
Received: by mail-pl1-x62f.google.com with SMTP id i6so8106077pli.12
 for <alsa-devel@alsa-project.org>; Sat, 15 Oct 2022 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gOPGjdkUUwBD33Ljs14iPONiNzANh82bKNKcOAVpv2U=;
 b=ig6Dy5kUHX/xCi/qhfXtOSmXyx21TOvJnI+Qe0WYy+CrzaePjxltimPIbm/E/bz4b0
 Thq1g4ovro3P/B4Pwzu2sbOQuw9JJ4CvxNedhA80rlTJcVgvMeUPAxVGRH2KYByPLfe/
 1RtuE2vyn1ARWx3ulPnABCPzy/EN3bXPyTcUYUcsq8oAvuIogH6oszJV8ymX2h/Y14Wo
 /PJNTVd/8mzaKDQyvwYbQQuMOjN7S48l3S8H603mRUAwkTWiSdR4gZuhD+KEJDUXHVrg
 fQdjrKnaCKiIqEtn9b8tpLq/Fe2+Zf0lP0aeI6z1eYMqy6d8ldiYOn7B5fyVGwY1HsUv
 BKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gOPGjdkUUwBD33Ljs14iPONiNzANh82bKNKcOAVpv2U=;
 b=EVYsW2IgGxpTwEjLXkWkMgYs+iCGNb/3pGDC3kWVWISbSTCfKOSmYAAsR5RYE93hPW
 GsjPLA/qfz/plC4pdXATRItoHU/2gVtRMngi6N4LDAUjnrSW3/0Pf9NpsbaDGTJleAQJ
 9Y/lxBeO6d2fcT9aV7BiSq71oZJnvzIH95iAiBKm99nZANWgw+1O4DZ1O5Iccp87IoUv
 KrLlvi9Bu5XQLfx/0d9KdbDmMlrhRzsl7kHUn0o1o81A9GTUv1lvSPbuZA/w/VM8egXk
 5k+apmTz3tD9rzw6pJVGh4yWSIroEz5zfZpzev1gnEKR9K0gCWYTmlETRWYAGocEbFW6
 3F8w==
X-Gm-Message-State: ACrzQf0ftIdljaoj67rVWgciZDI03uYzoa4WCrDw80opd2RylfzVduzk
 JAgU8T66gkU0psKEd1cmNw==
X-Google-Smtp-Source: AMsMyM63j0z/1xvhysZgEbmP6pbY1z3+XW9PpVel3uuw8eOMbfB7ujM/Qo5QvMY8PkoBbfj2qSylXw==
X-Received: by 2002:a17:902:c7c3:b0:182:7a62:4fa with SMTP id
 r3-20020a170902c7c300b001827a6204famr5855511pla.122.1665895579262; 
 Sat, 15 Oct 2022 21:46:19 -0700 (PDT)
Received: from localhost.localdomain ([113.110.232.129])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa79e4e000000b005631a40a00bsm4308555pfq.139.2022.10.15.21.46.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 Oct 2022 21:46:18 -0700 (PDT)
From: Ban Tao <fengzheng923@gmail.com>
To: fengzheng923@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org
Subject: [PATCH] ASoC: sun50i-dmic: avoid unused variable warning for
 sun50i_dmic_of_match
Date: Sat, 15 Oct 2022 21:45:24 -0700
Message-Id: <1665895524-122458-1-git-send-email-fengzheng923@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

In configurations with CONFIG_OF=n, we get a harmless build warning:

sound/soc/sunxi/sun50i-dmic.c:268:34: warning: unused variable
'sun50i_dmic_of_match' [-Wunused-const-variable]

Signed-off-by: Ban Tao <fengzheng923@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 86cff5a..62509cb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -391,7 +391,7 @@ static const struct dev_pm_ops sun50i_dmic_pm = {
 static struct platform_driver sun50i_dmic_driver = {
 	.driver         = {
 		.name   = "sun50i-dmic",
-		.of_match_table = of_match_ptr(sun50i_dmic_of_match),
+		.of_match_table = sun50i_dmic_of_match,
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-- 
2.7.4

