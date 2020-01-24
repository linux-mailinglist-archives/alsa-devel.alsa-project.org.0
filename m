Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1287C148B9E
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 17:00:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4FC1685;
	Fri, 24 Jan 2020 16:59:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4FC1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579881603;
	bh=hx92BKFjbufkiLfYt9XZ0b18lu6K2YHuMB5t/SU8jas=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ALKEA7ALW9ZTmpyTFFeX0Nk8k9AUwhFZnWe3f8wmUl4JSiLXd4taz5SzMWiM1HJ8n
	 asB/99p7/tYKbHf9IXPwEN4bf58/FFTOaCZN5YNw0sv+9MA/2FSEmoq8UntxtryZr7
	 lunESABEAFHGt6tyj18nlqEVRILxnGvG2LggqQXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D814F8020C;
	Fri, 24 Jan 2020 16:58:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 328B5F8020C; Fri, 24 Jan 2020 16:58:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3A03EF800BA
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 16:58:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A03EF800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="JpQEHJ2R"
Received: by mail-oi1-x241.google.com with SMTP id q81so2298280oig.0
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 07:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPUbG3hCFOeAz+2tCYBbaM8hPXs0XfYtKSvTc52tAwI=;
 b=JpQEHJ2Rcu3UyhumgEo2C76O1gAHMmICbO2XqI7Cx98M0sv72GM6EfAYOsMAghsqQe
 JhMIElcRwrzaB1PpFbvbZE6ZPXLJlxYob3nq/iQTVmdVW9VWBTmfDnTtLYgBvXZrYFBW
 +PwQ5MwpbCW6+5LcAeBGsvRQiBrVRwreDkJQbpHKrM2qiaH7OMfO16arMTqYmNuxKMik
 fK63KEzewuCjpm1mdX2UgaUF8lzZnLb2oOisZUeJ1UUJTWUZSFe2d+4ejC2PkgJ0IUn8
 saG8B3Lu3rsM2mERpGk+B+s8M6aUbZwxBHmmASQwgJ5RdytOrVrPukKjrggp4ZPZEHM2
 kBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KPUbG3hCFOeAz+2tCYBbaM8hPXs0XfYtKSvTc52tAwI=;
 b=sibNqACxU+d1TOmGniD2rfBodO1SITHvCXtxYVhH2ngAkkC5bHQAVps1Ugw/UxAI1f
 /zxK6+IFubGhlFFLnTQ2Z1LWq60GanrB/9qDiSy9koFqvrKAQWVhfSo8GJjKIvhtgnoI
 E400HiDCFDN53npqw84G2Z2YocVuspxH9R+zgpBcc5h8UL/I5GVuzBPsfsmvhIl03LLr
 OmImjHP11VJ3wd37uLkAWEq170BdVX2v3PsR5EEBbA5n+tixnhqhjSRfRWiV1WrUFWUe
 4ZYgY7/GMBAwDtN3HEf4RTNgNMl1NytwA5vrHmfYYIa1ezF9ZxSSceL+3hd4/q3SBv0h
 Pstw==
X-Gm-Message-State: APjAAAUCK500XYj+nITa32/AJNltdQV8euD7T+R6KYGpnaP6d8DebfOH
 s64EepGyYIPKsoaIvKC5VSg=
X-Google-Smtp-Source: APXvYqxmvd6MtkEknI+El5yUIiHfg27D/3uWaC3fx0XSnCQ5yTtInRzhZgJc540e0oIK+rptku90Pw==
X-Received: by 2002:a05:6808:a9c:: with SMTP id
 q28mr2455682oij.176.1579881491127; 
 Fri, 24 Jan 2020 07:58:11 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id h9sm1820292oie.53.2020.01.24.07.58.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2020 07:58:09 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Fri, 24 Jan 2020 08:57:50 -0700
Message-Id: <20200124155750.33753-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 clang-built-linux@googlegroups.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ASoC: rt1015: Remove unnecessary const
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

Clang warns:

../sound/soc/codecs/rt1015.c:392:14: warning: duplicate 'const'
declaration specifier [-Wduplicate-decl-specifier]
static const SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
             ^
../include/sound/soc.h:355:2: note: expanded from macro
'SOC_ENUM_SINGLE_DECL'
        SOC_ENUM_DOUBLE_DECL(name, xreg, xshift, xshift, xtexts)
        ^
../include/sound/soc.h:352:2: note: expanded from macro
'SOC_ENUM_DOUBLE_DECL'
        const struct soc_enum name = SOC_ENUM_DOUBLE(xreg, xshift_l, xshift_r, \
        ^
1 warning generated.

Remove the const after static to fix it.

Fixes: df31007400c3 ("ASoC: rt1015: add rt1015 amplifier driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/845
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 sound/soc/codecs/rt1015.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index 4a9c5b54008f..6d490e2dbc25 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -389,7 +389,7 @@ static const char * const rt1015_boost_mode[] = {
 	"Bypass", "Adaptive", "Fixed Adaptive"
 };
 
-static const SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
+static SOC_ENUM_SINGLE_DECL(rt1015_boost_mode_enum, 0, 0,
 	rt1015_boost_mode);
 
 static int rt1015_boost_mode_get(struct snd_kcontrol *kcontrol,
-- 
2.25.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
