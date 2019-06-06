Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0C5372BA
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jun 2019 13:24:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C95A71614;
	Thu,  6 Jun 2019 13:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C95A71614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559820259;
	bh=J2/6b1mDF8djJIdiLYsnEATwkq8lHdvetTAzbx79X6A=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XZn5eieRIVTwq13zHnBp/fqmrpI2zoKyKKB8jNmMIfDz6ap/ZntEReS06ImzPGZsp
	 lFglZWZf8hgGB665qEKlLUN9+gkUzqyirH4GFADO2+e4hnxs/QpANdZQIU3yS2LN6g
	 QIN57yH3mqOm5mTWvIHKCihMDYwSHwQ4z3XisLDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36367F896FE;
	Thu,  6 Jun 2019 13:22:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 788A1F896F7; Thu,  6 Jun 2019 13:22:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1464DF896CE
 for <alsa-devel@alsa-project.org>; Thu,  6 Jun 2019 13:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1464DF896CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="lH5XM5ly"
Received: by mail-wr1-x442.google.com with SMTP id n4so1971630wrw.13
 for <alsa-devel@alsa-project.org>; Thu, 06 Jun 2019 04:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEs0MSpYL/dt4ruohAAYosuccjeeKQUzYlFrfc+6zvI=;
 b=lH5XM5lywTiuLbf3TJDU9hyYU1xSAF8s/CUIoBMZ2vJA/FwiFIjtrpP1YExH2Jim5h
 mJP+e1bdfvUvPo/VdxJToF5787YNEIbsyv4dOl6YX73oBr7BLFsg1o+fUzX5YQwEN1Ik
 Z6N/oJXYuE2klr2eHuzCSyZFnw1mkQUlcoUrWIhz0F1A/8osMu04SdmKwhhAxa4iVedC
 kXKCMZL6/cjDb+sIEsrGdMyDHNi161BVk4BUO9RzzY2nVatp2lMmfJRCnVn3jjjuRHrP
 YXYnWPz/rOb3joaEt05BrcJMmxErb5qvE8g4I59aC4Jwopo1qKjElK2z0QuzoUaHSkF3
 NoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HEs0MSpYL/dt4ruohAAYosuccjeeKQUzYlFrfc+6zvI=;
 b=Bj8oltCv1qJ6phXk5ehRTV2OGIWioT86M6BJ6aNyJv+W4b0E5EekJStjRjyZocJSqO
 DDU4G//YPQpToaw1yrL25f3JG/ZnriUv/K4rtZ3gK8rpZRj2jiuTcWwrNYONvePKUxoC
 ooV2EF8Orsy6J86v+Iliqs7lw1iZ+n1xw72MrYczCbrYQh10ixn/h3jeljvBOkDUZ8ul
 MzPxG2egu35uXCAo5ueMUaQ0Duaam+QMM6v4YsArPqb2v3+rtBRugcJ541XHraoPcFbr
 geuxZnMbsCnFcn8wF+Cqd51fgm+TENwjlMhFCa+zQmk40ySZiu3gPZAcJq+CH+Kvc4lu
 E0Wg==
X-Gm-Message-State: APjAAAW02gt308ssLPz7ukkEU2WO3v80hbPCsNuLMGVJo9RoPJgM8E6w
 XXymvdF6gp68N2CA3Q3EFyDtig==
X-Google-Smtp-Source: APXvYqySGNx3xiNsNDxvwdQWV+8OLNPxIqztO//kuJu9oMKRLpxuvyvrfr7FXa/ozMXLEThD23sD4g==
X-Received: by 2002:adf:afd0:: with SMTP id y16mr29554545wrd.22.1559820149989; 
 Thu, 06 Jun 2019 04:22:29 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id d10sm1629867wrp.74.2019.06.06.04.22.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 04:22:29 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Thu,  6 Jun 2019 12:22:22 +0100
Message-Id: <20190606112222.16502-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH v2] soundwire: stream: fix bad unlock balance
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

multi bank switching code takes lock on condition but releases without
any check resulting in below warning.
This patch fixes this.

 =====================================
 WARNING: bad unlock balance detected!
 5.1.0-16506-gc1c383a6f0a2-dirty #1523 Tainted: G        W
 -------------------------------------
 aplay/2954 is trying to release lock (&bus->msg_lock) at:
 do_bank_switch+0x21c/0x480
 but there are no more locks to release!

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/soundwire/stream.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index ce9cb7fa4724..73c52cd4fec8 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -814,7 +814,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			goto error;
 		}
 
-		mutex_unlock(&bus->msg_lock);
+		if (bus->multi_link)
+			mutex_unlock(&bus->msg_lock);
 	}
 
 	return ret;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
