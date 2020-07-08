Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 866FC218641
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 13:36:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345F216A4;
	Wed,  8 Jul 2020 13:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345F216A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594208183;
	bh=1wI6JP3WiOKZNxaIsUKQCJAgyajuKfiFdc9wQedxcz0=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bokm4TguqCVuq+lMRwNYSH/VQX8ew+6GG6/qJlp8omxRbWGi2H4LEm4xjoQTtSTIv
	 pS77URjpsK/TO90t3OotERTfeEzW+dhH5mhUFA1JBY7kqfJ574vhJGyY4BoF+4IGJU
	 YMs2SPKtQIvldl2aIqwlev8vHmBI30wrlggpDHzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61795F802BD;
	Wed,  8 Jul 2020 13:33:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1864AF800AE; Wed,  8 Jul 2020 13:33:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F75F80150
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 13:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F75F80150
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="sPcXnGBL"
Received: by mail-yb1-xb49.google.com with SMTP id 124so18732330ybb.5
 for <alsa-devel@alsa-project.org>; Wed, 08 Jul 2020 04:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6FhChgNsjWl6gND82XH9wwnoBKtHa/ehVm4YKI17cOw=;
 b=sPcXnGBLHEBpPbBJvUpkHZegzNgRAmYuS35JMlanSO4OXGf1no4O8LwlkN10MsXmT0
 woWxbfr8kxWXB5jN/x+fgGwjBhbek/ClIz/A1sHpu15kcPjinWcITugsqapMsQSOeuOz
 EMnUbUyYZ8hVX/3BiQL/8MI2MokaU9tixu4/Amx9WmDVfXvNX/FYwmMqZw4VXzkQM36P
 +0cYobVv2Q6eVyjCyIelbjVWY//lVn53g5HiSeWtOXv1cdrUeYXlFH5VfVVBtscikjJ6
 zjLU/VDONk7IuyQ0nAJBLWXXIHwlEpmbFhGQrCm56JzmVsxu15aiO1k3G+fmS5Y7DpFf
 TatA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6FhChgNsjWl6gND82XH9wwnoBKtHa/ehVm4YKI17cOw=;
 b=NmB7Bgg0hQKs9rsHiZ/+LOVDaLayo6gnRrRNFHoYmSog0QtJRLk0JZjv68Bv8ire3C
 OJi3z3fv6RShx5pNzr+dwkKCHofFzIGmqltROwB1ejOIgAwsfj9gDjy85BNfhhSKmgwU
 dqTd5JsUOfQ2SJdHSJJQOmp+ujgnv5cKClMWuGr1JtIHwosdBUqNd1HIothaYcgw0Aca
 E7iquS/gXLYLypI4toQiinWTBFlRcKMY6v7SuBmGxbW2V8q9aqLg6qIOuzvSyjLUqHuB
 BE7kz2w3FZ/4ZqWOM3bKQTKgDyzRJuTL8NKvFfTvR8e8+JciE7Q+ITe6jLzm8YkuT26H
 M+sw==
X-Gm-Message-State: AOAM533455pJZbd6b4tU/8OXVBq3nL7C/rL6i5AJLGWM+HuRaWAO3ne4
 7usLglhc0N9UL4SrsdsPAcJwKO9wIZyl
X-Google-Smtp-Source: ABdhPJyjfU9P0otQHIiqz1zn8C0iSCfzci2MI/wGNecYetCRSI0gPiU2S0h0PyrgUg3b/oDtQ9c6KUCNTeiM
X-Received: by 2002:a25:8008:: with SMTP id m8mr37507113ybk.104.1594207968592; 
 Wed, 08 Jul 2020 04:32:48 -0700 (PDT)
Date: Wed,  8 Jul 2020 19:32:31 +0800
In-Reply-To: <20200708113233.3994206-1-tzungbi@google.com>
Message-Id: <20200708113233.3994206-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20200708113233.3994206-1-tzungbi@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
Subject: [PATCH 1/3] ASoC: mediatek: mt8183: sort header inclusions in
 alphabetical
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, tzungbi@google.com
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

Sorts header inclusions in alphabetical.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 1fca8df109b4..8cd53403a080 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -7,13 +7,13 @@
 // Author: Shunli Wang <shunli.wang@mediatek.com>
 
 #include <linux/module.h>
+#include <linux/pinctrl/consumer.h>
+#include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
-#include <sound/jack.h>
-#include <linux/pinctrl/consumer.h>
 
-#include "mt8183-afe-common.h"
 #include "../../codecs/ts3a227e.h"
+#include "mt8183-afe-common.h"
 
 enum PINCTRL_PIN_STATE {
 	PIN_STATE_DEFAULT = 0,
-- 
2.27.0.383.g050319c2ae-goog

