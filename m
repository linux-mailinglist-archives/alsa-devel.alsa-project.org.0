Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C09458458
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Nov 2021 16:07:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0929916F8;
	Sun, 21 Nov 2021 16:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0929916F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637507256;
	bh=XP8+GLb4yZWi71yvMQnO/LEvVYSzpy8K5HplxTTb3iM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Zwe/AvQ7Az7IK5l8y4+Obs2lyCeIjUI8h1dOsSRoM8jIO+A/7In5tUlfOlDbGdAWQ
	 G+2tS9E8xPpos4mXHjwRfjX+5hUmKhxWgsbUUN8SyXDVcsQcJLDmmGtjRn27aExWxj
	 1XMVqeSMQkkoptREqrl6v6NNDLQqc1V5eFDJhRIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44C3FF804AB;
	Sun, 21 Nov 2021 16:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A389F8049E; Sun, 21 Nov 2021 16:06:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F195F80154
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 16:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F195F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ky9HhfB4"
Received: by mail-wr1-x42a.google.com with SMTP id u1so27706754wru.13
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 07:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhMbJUwa3m/sRiL1gTb1ydr+MolnUwJkremam+jJja4=;
 b=ky9HhfB4zPRUT2MnXbKup+kEwCKXxsvGrrygGL4zkh5UidAS7NSi0OJY8yc/fVZsWW
 Zk1UjB2WGE/Sfuvt/Cte2OD3KqKhaUnUGrMU+zRfMGK++0FlWdN1FIdsYMEhW4N45qe7
 6nELj29FMrBwYQ0k8NmWh2WNL5lcKkGtm+sYxwGr9IMvwN5ou8sbmbGBcXZB6hpwlyFA
 AugIqDuEJSlUGEsT+rS5Ds4qaLScsWuSLc/WtuCCc9KKeQ+87W9tWmsVWlqIm7rmug/D
 /DcgZrhA/Sg70KaS7KxzAqc1HdIN0Vsyy4bGl5djCtmJ+agJR5xHxuxhM1Z2IFetzh/F
 mOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WhMbJUwa3m/sRiL1gTb1ydr+MolnUwJkremam+jJja4=;
 b=6fnnulGIx/oVqgR8rbYBinAb/AjTDH7yvjjMKTl/901mUzIgn+9EqtFxiJ203omy2+
 a/kwLrHXquWMwhnFK+itod4C3f0V0IkgxR3vwMV85B055CKhFxIwVMIuCIr4+dhHfVTS
 5jQErIPA4quHs9cGiD0X0VvVi2HE0RnRQj7+vNMW+T58L2Lkpk1FK7+Fq7sgOVXs22R8
 b6D7z9EROdIKRLT+Jd+4ZiE/iyzTBv8NXEWbC0/FU76N2ghRK0wtKgGr8wyNLcrFdxOH
 oSScFuWPekSIXPqcNzar3DVCbh/pX9yTPEU48Gg1t5secuFfeQ06wuIKHbrJPeHp53r0
 TdvQ==
X-Gm-Message-State: AOAM532ATa+P8a9LbxU5I9Q8+6FHm9b/7srN/62gZy2uSMh5pXoD5FaV
 /m8Md3T27SwmFrujyxhPVUqDQFdgtTQ=
X-Google-Smtp-Source: ABdhPJxsC+4TTcof9z/OHJG/6NWbE6UbhfEGg7Yh4W72/NKnNh67brFJFmEc0qg3V4uOuLuyJqjZdw==
X-Received: by 2002:a5d:648f:: with SMTP id o15mr27742341wri.381.1637507157762; 
 Sun, 21 Nov 2021 07:05:57 -0800 (PST)
Received: from localhost.localdomain (84-72-105-84.dclient.hispeed.ch.
 [84.72.105.84])
 by smtp.gmail.com with ESMTPSA id j19sm6037448wra.5.2021.11.21.07.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 07:05:57 -0800 (PST)
From: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee.jones@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rk817: Add module alias for rk817-codec
Date: Sun, 21 Nov 2021 16:05:20 +0100
Message-Id: <20211121150521.159543-1-frattaroli.nicolas@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-rockchip@lists.infradead.org
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

Without a module alias, autoloading the driver does not occurr
when it is built as a module.

By adding a module alias, the driver now probes fine automatically
and therefore analog audio output works as it should.

Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
---
 sound/soc/codecs/rk817_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 943d7d933e81..03f24edfe4f6 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -539,3 +539,4 @@ module_platform_driver(rk817_codec_driver);
 MODULE_DESCRIPTION("ASoC RK817 codec driver");
 MODULE_AUTHOR("binyuan <kevan.lan@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:rk817-codec");
-- 
2.34.0

