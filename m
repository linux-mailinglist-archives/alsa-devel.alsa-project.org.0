Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0904E64F8F
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jul 2019 02:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 672F316BE;
	Thu, 11 Jul 2019 02:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 672F316BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562805044;
	bh=qW7/yWZ3ccWVYC+oeAMSQ3PEuvQJlsk/cncVxZRJPF0=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vj5gRecgAENaqw2Fx/7CF7TzWMrax4ziDFQSOd5Vf66eg02R4JAhc+28VQejpyQNU
	 281ojIs1XqoV9xa2YgyuYlkeyWqqu5Y6rEYjlM78g9a13ktB9rmYOhX7OttPHC/z9E
	 6Gr2VHfSjB7l9JldduCl/38b4WjR1BOmsmUJz9Jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB29F800E2;
	Thu, 11 Jul 2019 02:29:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52206F802A1; Thu, 11 Jul 2019 02:28:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, PDS_NO_HELO_DNS, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 20D2FF800E2
 for <alsa-devel@alsa-project.org>; Thu, 11 Jul 2019 02:28:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20D2FF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="ZbS9D0xz"
Received: by mail-pg1-x542.google.com with SMTP id o13so2004084pgp.12
 for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2019 17:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjPZ4RZ/s0K9TemDmpVH+3CtdelkU0RpBAiTMvveQGI=;
 b=ZbS9D0xzz9LOVmBLYW9LhTyBMaAJWWj2Fqe2nc4/i9sX4BIZO1KW/HGi+FU2phWdmX
 DM6Tv3Ir3Omy02fUxdqMl90itPVvg25DxLBdeu1x9Uzo9AjUb/CRdi4QbE5BMoh2OKBQ
 v6e7hC19Iu7TZLHn7gtVFCTPARlPTxrMmYEzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PjPZ4RZ/s0K9TemDmpVH+3CtdelkU0RpBAiTMvveQGI=;
 b=LcUpqVqCRbPG1ifPAQwZ82BmEt6HAez0GtvoefytPIoo8FWJyxeVp/1AGlf9yaM7bm
 LMLjDEJSEb5Hc8gp7s8F7zzt0XcEsrEjvSnuYhAZfGavNqeDpNC3p+52QGWjlzPHbHj7
 2i5DYgQtO6jtP/CUAg2BgY6gYmqtBMJQKVNqLTVanHdKd7CdojUuTcBW2oZxhxuScBg4
 syN0n1zfzmw5tSeNXJeqHXEa1XqCtuSRLyrX0eyunXIGuxsLFt756zpzrsDAYpX3gM1L
 rJMKPDhaoM8UR83m3XGKDnx7lDGBG9rSZLynJ8+KkrL5ttp/3Bd/SMnY/Q47fhSIx5Ys
 x2iQ==
X-Gm-Message-State: APjAAAVWz1uypP3GaLpPTJy9F+SZszE2nLwBWWsF0rlVtDy7c+iT0Hvv
 JhUP9reeomVYvF6PuHo93PGNejREKBFd
X-Google-Smtp-Source: APXvYqwqlIoPCqnwQ6LqOsov51J4oO9gVsaQZVq3959YcMVvd6wrYlD0vIE8LOGFd7msUZpQhOhmug==
X-Received: by 2002:a63:f44a:: with SMTP id p10mr1187473pgk.148.1562804929792; 
 Wed, 10 Jul 2019 17:28:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id x12sm4146684pgj.79.2019.07.10.17.28.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 17:28:49 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Wed, 10 Jul 2019 17:28:38 -0700
Message-Id: <20190711002838.35363-1-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH] ASoC: rt5677: remove superfluous set
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

We define this variable with the same value, no need to set it twice

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index c779dc3474f9e..deaed5132dc95 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5098,7 +5098,6 @@ static irqreturn_t rt5677_irq(int unused, void *data)
 			goto exit;
 		}
 
-		irq_fired = false;
 		for (i = 0; i < RT5677_IRQ_NUM; i++) {
 			if (reg_irq & rt5677_irq_descs[i].status_mask) {
 				irq_fired = true;
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
