Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B823446B9B4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 12:02:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A60F2443;
	Tue,  7 Dec 2021 12:01:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A60F2443
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638874946;
	bh=C7ttICrw6Hm5Lz7hWNKK1MaYOOQaI+VTLSD8PJVJM34=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnN++JVn+tugx3ThTjYIWw9+TtYpgdrNk/gq5MagD+wGSrKwO2GjyBFA2G7FTqS44
	 OzUlZG7lTfYnKcwzGt1IzUha/lcywhmqcncg3FA/XvGSNi516b9SJsmWkwabolb9xB
	 w8+I0mZSu6UqW8uU5kGi/V2OKjuvNDrf8P9iTBiU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C39C7F8028D;
	Tue,  7 Dec 2021 12:01:12 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22D3AF8028D; Tue,  7 Dec 2021 12:01:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EB7CEF80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 12:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EB7CEF80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="AkuoJj6c"
Received: by mail-ed1-x534.google.com with SMTP id r25so55180395edq.7
 for <alsa-devel@alsa-project.org>; Tue, 07 Dec 2021 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptsvV1kleA1LtJa+QFl6NmI3SOUoq7RBkJ0eF/rWVyU=;
 b=AkuoJj6cCFFXgQqRtrrmz1i66mQV9j6h2awDmburQUuGzBr86ub6W2c4ZcdtbT324j
 DvrThKp2QleDKBIrI25cGkr9BJZGNlDmH/TeC/KkrmrhzFW3l6T5oSovmvGsI+GVULlx
 dyMuU3ZwI2Ct1Bf5lqpZqbOfWZY41FfZA/ygU+egJjQT2C+CBQnKxYhu72bm4Bmi3Vgn
 f4aLfvyIsDhlN7gfSHNv70b1g+CleSswJAb2YHgHp11D9Ml987EItr6T2T/70yCpRCRi
 Icij1+d6W+EIDT2n0CAcGCUtrdDs/RxozhUhiKV17RI6+7VKAyiK2BKAGAdUNzYfEVXc
 +nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptsvV1kleA1LtJa+QFl6NmI3SOUoq7RBkJ0eF/rWVyU=;
 b=rZRqt0eBgrY6b3vH/VK1JwvgmLozSNtdiHDVi1Q698fnXapV3J4ntdvFtorlcpQ6KV
 B8b1aiyiPfKvMRwedRwhlX4wc/KQdCLy15LtFnm/jtPjI3BIf5zjrdOWkzvbvf3q8ClH
 KLbkXfSDIfBGAM9g7/DQvPRKUcv1ShInAc3lKqc7eXHEF4qZ9n73Dd2Av+bwa6UIUj0V
 NoElrlT5PjwAXd8QzIlUz+yFyBUacKjpryqYkhYcH/YrkljONB/wMDKLpGC/Nv7Mvys/
 Y2V6Ku2GUf5zmD8YvUCS47UeWYUENa5ianLm1BhRGU19CsIeNn6DE1pVL1plevicTgBq
 WV/g==
X-Gm-Message-State: AOAM532tHMcS88COw7on6yPwzssIBlJYASZFFZ4YZkvaJsxQvpz+hWAA
 jY/HlqSjx0c2atdmEd1bCa0hjg==
X-Google-Smtp-Source: ABdhPJyL8WuOA2aVcFyjxLd0b5iozXAcekRxzldlcNfDg1/+YC8Ucg0r3084WvyJl0shdFPPBaIbRg==
X-Received: by 2002:a05:6402:147:: with SMTP id s7mr7987920edu.8.1638874861500; 
 Tue, 07 Dec 2021 03:01:01 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id h10sm9939533edr.95.2021.12.07.03.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 03:01:01 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound: ppc: beep: fix clang -Wimplicit-fallthrough
Date: Tue,  7 Dec 2021 12:00:53 +0100
Message-Id: <20211207110053.695712-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Anders Roxell <anders.roxell@linaro.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, llvm@lists.linux.dev,
 ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org
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

Clang warns:

sound/ppc/beep.c:103:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
        case SND_TONE: break;
        ^
sound/ppc/beep.c:103:2: note: insert 'break;' to avoid fall-through
        case SND_TONE: break;
        ^
        break;
1 warning generated.

Clang is more pedantic than GCC, which does not warn when failing
through to a case that is just break or return. Clang's version
is more in line with the kernel's own stance in deprecated.rst.
Add athe missing break to silence the warning.

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 sound/ppc/beep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/beep.c b/sound/ppc/beep.c
index 0f4bce1c0d4f..bf289783eafd 100644
--- a/sound/ppc/beep.c
+++ b/sound/ppc/beep.c
@@ -99,7 +99,7 @@ static int snd_pmac_beep_event(struct input_dev *dev, unsigned int type,
 		return -1;
 
 	switch (code) {
-	case SND_BELL: if (hz) hz = 1000;
+	case SND_BELL: if (hz) hz = 1000; break;
 	case SND_TONE: break;
 	default: return -1;
 	}
-- 
2.33.0

