Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A48C84CF42F
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 10:03:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25C6E16FA;
	Mon,  7 Mar 2022 10:03:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25C6E16FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646643830;
	bh=75WRyuPbnV9lLjBM6kBvq5GWkgfpyg+hxJWevkwMD70=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m4Shu7DjR1nT0aJVjvFem6bFGGcMkRYR4xwmzpwFz7LazbRq+IisCuxkUQgu+S2hJ
	 054siyVbFmHii4+7clRH8UUs7bUkpjZRwHpGT3z+8hKeorBn9SsDfQgVY6eZrWV7Jf
	 q25a4mJW7UbXqoCJL8QZ6GQh+nJR9ctC9VE/8IJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96DD9F800D1;
	Mon,  7 Mar 2022 10:02:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E2F9F8013F; Mon,  7 Mar 2022 10:02:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D60BF80124
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 10:02:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D60BF80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kKYdGsJR"
Received: by mail-pj1-x1034.google.com with SMTP id
 mg21-20020a17090b371500b001bef9e4657cso12631418pjb.0
 for <alsa-devel@alsa-project.org>; Mon, 07 Mar 2022 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=T9sNyGPslu7pePFJSRIoI7XN6IK0Rl/U6UawibuUj8w=;
 b=kKYdGsJROD4OCCbZLJfSbXDMuUvSumWj8d/pHxsMdlNQJH0c43xdLeVuIhK/9jkAh9
 I/had2q6jkKGNqwPXv2Q2kJ8q1/9lX+z92l3zRzcoUDnXBkuv7vmkyiZz2Tu+srNfcTI
 zqzK+uNoiv9VvRd6zw/sAXbTUf8KfY8LboKMENE/cdvNF2R4HqOqAMQ87X5EIHDFY0tR
 DdakT5HIykvDSRe/c1Ls15g/HzYEurN7pH/ysDj7aYBgDYwnGM6i0EWEPx7G5/OFU9t+
 vSDvBcYM1ZBcHC6Oo8wbjfPGS1j0YIde0h7zzLs4gPVPYfY5/dJJxY3MuWtO9XpOiUif
 biAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=T9sNyGPslu7pePFJSRIoI7XN6IK0Rl/U6UawibuUj8w=;
 b=tuOZR+at+93RWq/xaCpteyVeq8bWg4dTVwaNpomlqtLe8MIfYog/AeLjiXRlX2YYNj
 2KbcKaxzawoRY34BGa3j4czKFKm2DwcM0vNbZ0Yhq+toYJPl3Y5SgIhW80Cox4G2NDtk
 XNOXMFKsrzd9qRaVcm2YYqofqqnF8G6D2jpIhUtaRC1rdtXokPp9z1VPUft23Q56AqLh
 W9AA1qMFatM40gRJvnG2LdKYY1gXgXvCK+h2WTMwYed/L0Ob3VtMp6JuIeeyqIrIPE+Q
 dXVDRD1daPxUqV/Iiu0ne+CVbi02rCjCJGy4S8Lc4zwKLDX4xdmPWlvp08Y2WoBV/ISN
 XsSw==
X-Gm-Message-State: AOAM532jyYMZsoskaLU/zkAi0u+mVdw8FgmKEFIs4PbUbSizkv7tyMeV
 HlxMSWOU4tfXTZZWiVHGUG8=
X-Google-Smtp-Source: ABdhPJzkVOsSJAkFEiNUwUFAsy1730LBS8+OzwMcXGSseI3J/C0zrMKB8QafKzTl3vzqGryZ2R83uQ==
X-Received: by 2002:a17:902:8b87:b0:14d:7920:e54a with SMTP id
 ay7-20020a1709028b8700b0014d7920e54amr10915799plb.140.1646643755176; 
 Mon, 07 Mar 2022 01:02:35 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 u10-20020a6540ca000000b0037445e95c93sm11177939pgp.15.2022.03.07.01.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 01:02:34 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lee Jones <lee.jones@linaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wei Yongjun <weiyongjun1@huawei.com>, Miaoqian Lin <linmq006@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Colin Ian King <colin.king@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rk817: Fix missing clk_disable_unprepare() in
 rk817_platform_probe
Date: Mon,  7 Mar 2022 09:01:30 +0000
Message-Id: <20220307090146.4104-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Fix the missing clk_disable_unprepare() before return
from rk817_platform_probe() in the error handling case.

Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/rk817_codec.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 03f24edfe4f6..8fffe378618d 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -508,12 +508,14 @@ static int rk817_platform_probe(struct platform_device *pdev)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "%s() register codec error %d\n",
 			__func__, ret);
-		goto err_;
+		goto err_clk;
 	}
 
 	return 0;
-err_:
 
+err_clk:
+	clk_disable_unprepare(rk817_codec_data->mclk);
+err_:
 	return ret;
 }
 
-- 
2.17.1

