Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6020988571
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Aug 2019 00:02:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9FBB852;
	Sat, 10 Aug 2019 00:01:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9FBB852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565388122;
	bh=FBe5IFaOyw00Cnfvp9W048yWKA03kLgBENwyG/oIZuk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MXYUE4yl5YTYjioGCMaJhFgOUwz50POKEwY1tZN8Km2j9LtpLgSx6e/4aCgWXNrPJ
	 /6FGwTb1XC2pCYLKB48fh9RRuPwFCDFgyUZbA+Ln1xlP9LCq4kO4wRFHXQETv3vXo6
	 mnLA+4eMEZ+tTyBBeMe1T7kmjqt5KHKVN94i/55U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E60F80483;
	Sat, 10 Aug 2019 00:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0086AF803F3; Sat, 10 Aug 2019 00:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C351F800E4
 for <alsa-devel@alsa-project.org>; Sat, 10 Aug 2019 00:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C351F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Y5snIyqd"
Received: by mail-pg1-x542.google.com with SMTP id n190so5675827pgn.0
 for <alsa-devel@alsa-project.org>; Fri, 09 Aug 2019 15:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efvFRJZr7Rf9TeA5bWWouG/wG7fwsDd9OejySA2vlLQ=;
 b=Y5snIyqd3JLGu2NyZ066n09EFNfqXsowM1TlVMjoOrl6Lk1wljKkupjFMfLruMSc3i
 Jo6vLdNr3CCetytBV2dY3Ovex1wDgEz003fVyBvSFQyL0yxhly/9LzNqhXjSfCvGnWKA
 2CmWI2e4Ynn03LHF+wh6Mbd7sCS705GP6Qdxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=efvFRJZr7Rf9TeA5bWWouG/wG7fwsDd9OejySA2vlLQ=;
 b=pdbphsKrGiEOzwwdBdupkLE/RUcaDQkbc/N0k53bfZCzHCY6e2ryR3XFxBBKtigcFa
 pIRjPrp56FzmpXiicF5bVtsxE7XmW1N3MTZx00Z2jGeMHwZyyBgk/fykay0nhB1HVKfx
 XI6lQ1EnHNvbwSmWnkN+Lk9Ec1PsqoHRL0GBvqpHZ4daqkl1Z2Zr5/mNBEtRAzjm6IDi
 mzvy/k5fGtY1Q6a/3hSzjEOzVnbHdNyD2GXp+d8A4KLlhqEViBkmBxLM48gnksOjCqf6
 wCeEA5Siwpy+fnBISFvqbchZ75eyFATUwDVE3r5HBU5GVIn+ziy0EB2eY3w4g2kYcOZL
 jWjQ==
X-Gm-Message-State: APjAAAUxi6pswHAX3mbrF0XCKUbVKrmvOXC0X9rKxkYSmcoaH9g3I60f
 x2gYS8jU4RQpNaRzu9D/bsSYS/0HxQ==
X-Google-Smtp-Source: APXvYqwXatICScS3BUacxqcjE08u4Hy4zYQKBr38OntCEe820gQfMALct7VNgHcdcWtpT4N5WA/DjQ==
X-Received: by 2002:a17:90a:d343:: with SMTP id
 i3mr11954450pjx.15.1565388006940; 
 Fri, 09 Aug 2019 15:00:06 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id 81sm94827161pfa.86.2019.08.09.15.00.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 15:00:06 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri,  9 Aug 2019 14:59:51 -0700
Message-Id: <20190809215952.155660-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: Revert remove superfluous set
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

Commit 4dc057a786dc23 ("ASoC: rt5677: remove superfluous set") was an
attempted code cleanup but was incorrectly tested before sent and
actually breaks the interrupt since it never resets the value on each
loop now. The breakage is most testable when hotwording code is added
and also uses the interrupt.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index deaed5132dc95..c779dc3474f9e 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5098,6 +5098,7 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 			goto exit;
 		}
 
+		irq_fired = false;
 		for (i = 0; i < RT5677_IRQ_NUM; i++) {
 			if (reg_irq & rt5677_irq_descs[i].status_mask) {
 				irq_fired = true;
-- 
2.23.0.rc1.153.gdeed80330f-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
