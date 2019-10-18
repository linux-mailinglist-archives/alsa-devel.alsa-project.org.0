Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFFDBFA0
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 10:17:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B63E85D;
	Fri, 18 Oct 2019 10:16:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B63E85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571386631;
	bh=hJXY4xeU2+HmHWwt0q4T/efcIyOuBJeJpFnUwFQA7g4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AtVDuxHgbi+DZhHg4gVoYy0WvCGhFm+3uUnIFOeK3fwd1bNUyeGP9enQgCzCVICCq
	 1lB5G7n1M9AIiQE3AZXkF1FBViBxwO5Co/W8FtODclYly6Ohko4a9GWXJuoHQ3ppiU
	 tvHFu0JtsV0ioWvuIGrXVn7pJBKrxmdKuCVfbQpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9C64F80323;
	Fri, 18 Oct 2019 10:15:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 962CAF80362; Fri, 18 Oct 2019 10:15:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B264CF800F3
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 10:15:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B264CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="m8ChvJlM"
Received: by mail-pf1-x442.google.com with SMTP id x127so3390307pfb.7
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 01:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uiSq7qeFYNBf+B+hvyqTL3DKogK+/9GgP2nnW/iTdJQ=;
 b=m8ChvJlMrxPv5W8hkfPBg5heCY/fbqHBiTpBTRP3b/WNHPtpzvGVHF5e5f+wCXWtss
 rZ1oxTtWrm/r15UOlkNpO/Yqi/nCcSaE2vTYRRFdUC8JUJ41R/RMgiFAjcLWBCqEbW9q
 qS42/w5YDBEf/LJhPrwB2VBrQ+9h14+tjCMHcLSDVYDQMqSL3UgXqMMyZBs1qlykOUsc
 lfTRNrLm4lw9MuG7v0032yGm+EBoRPQKCtWlZl/hGfg239A/o9eQM3nFqAWK6hikKnEL
 KTnTPx67BNmIYewuXrz8Ersk3DU4QMpbXM+tbPjrxcAJOQ5BmYx9UzQ+ggM0VZHREvj3
 TC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uiSq7qeFYNBf+B+hvyqTL3DKogK+/9GgP2nnW/iTdJQ=;
 b=Y19J8OLR6nEKneKHa6CWXkm2Dqb5V1oR/H2da09ZIZtOtFNIugD6BpC67+XSgclTZJ
 ZQit+ARCmFfi00A7GvSN86AEAZmKErnsq+wPnj0S7/slbeZqzJlFdrF3E5yLbgUOKAwE
 VHAEKz8gYdFqMZzcNtWfoq5OCWFqfqj4dKNDn5IiuQEcbhmL6dCjRcmIUUP8dBNVKdAU
 95maPnwnZpEG9XiGwkPY7R008k4cOWrUnltCuWAw7oXbZW51EeJM1IH8GS+xCC4V8PnN
 yDSaGEK5NZJupkxkMusaLhBhENL2SGmDrXQhdXxm91YU+2M5JVCeS9XiOeF68PD4Bo1u
 hmLg==
X-Gm-Message-State: APjAAAVlMBaAIs4CHFPW9xtcjnlngG4mJj56j7WKxX4bY94RtKHjXH1Z
 Jd7+oC8Yvwx9kMoUs/bCGqg=
X-Google-Smtp-Source: APXvYqyaREvbxLHrPizSXgFUs5I1CvDkE+rdYjdtx6uTUnVXZOAzUbbFx63V9/unDy0Pp9RTOGw4Kw==
X-Received: by 2002:aa7:9472:: with SMTP id t18mr5105603pfq.261.1571386519409; 
 Fri, 18 Oct 2019 01:15:19 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id z12sm5688656pfj.41.2019.10.18.01.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 01:15:18 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Date: Fri, 18 Oct 2019 16:14:49 +0800
Message-Id: <20191018081448.8486-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] [PATCH] ASoC: tlv320aic32x4: add a check for
	devm_clk_get
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

aic32x4_set_dai_sysclk misses a check for devm_clk_get and may miss the
failure.
Add a check to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 sound/soc/codecs/tlv320aic32x4.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 68165de1c8de..b4e9a6c73f90 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -573,6 +573,9 @@ static int aic32x4_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct clk *pll;
 
 	pll = devm_clk_get(component->dev, "pll");
+	if (IS_ERR(pll))
+		return PTR_ERR(pll);
+
 	mclk = clk_get_parent(pll);
 
 	return clk_set_rate(mclk, freq);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
