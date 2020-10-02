Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59428187A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 19:01:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4A1941F28;
	Fri,  2 Oct 2020 19:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4A1941F28
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601658067;
	bh=BC14ZZ8+RW20UktRNUAs6dAmBtor9jwXzaHl+Rs7a8I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hJn9Rf/58CqZFXqZsXz7yaDV8M7b8GZufTdXmZJ12gPDOk37rzQMforGu22wTWcOK
	 dyT5z55FEwqbkVZY7uKQyZh+0IdLTMfjdQ4v8ZNkY+Xu/Z0gE4Ydmpl+RyozLoexGT
	 NHpUSNEcMVaVW6AU4y6vOT0O9+z+5dmpF5UBLeEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 760FCF801ED;
	Fri,  2 Oct 2020 18:59:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34FFAF801F9; Fri,  2 Oct 2020 18:59:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp13.smtpout.orange.fr
 [80.12.242.135])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FAAEF801A3
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 18:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FAAEF801A3
Received: from localhost.localdomain ([93.22.36.20]) by mwinf5d76 with ME
 id b4z92300c0S4PiM034zA6k; Fri, 02 Oct 2020 18:59:12 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 02 Oct 2020 18:59:12 +0200
X-ME-IP: 93.22.36.20
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: wm8523: Fix a typo in a comment
Date: Fri,  2 Oct 2020 18:59:08 +0200
Message-Id: <20201002165908.637809-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

It is likely that this header file is about the WM8523.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/wm8523.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8523.h b/sound/soc/codecs/wm8523.h
index 79afbf1e4f1a..5f9bb3df1866 100644
--- a/sound/soc/codecs/wm8523.h
+++ b/sound/soc/codecs/wm8523.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * wm8523.h  --  WM8423 ASoC driver
+ * wm8523.h  --  WM8523 ASoC driver
  *
  * Copyright 2009 Wolfson Microelectronics, plc
  *
-- 
2.25.1

