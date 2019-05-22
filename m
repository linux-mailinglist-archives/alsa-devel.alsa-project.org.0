Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7336A26857
	for <lists+alsa-devel@lfdr.de>; Wed, 22 May 2019 18:33:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10797166A;
	Wed, 22 May 2019 18:32:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10797166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558542782;
	bh=JlnxDKBu9YESln9mRJfLxYMO1TWiVpwX/gscI+GuK4U=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=a6X45p0EXyGpuUoqv8MpZ4nXc9exXH0FOadm8PyMnUUc9BOmXjl2dX7KIaCedJXKt
	 9BGLVHEmZXH7zK/Z7TNVElU8qXl0UPtpXyFkyklQ6FIVd488/63pFJj79xxgJcj1Tk
	 lXbW53zqMFtS0P66XfwgcsFyIgxN+GCvW/rPc+xc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02891F89725;
	Wed, 22 May 2019 18:25:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87C9DF896E9; Wed, 22 May 2019 18:25:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 230CBF8962F
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 18:25:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 230CBF8962F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FQFZQ5pL"
Received: by mail-wm1-x341.google.com with SMTP id y3so2876612wmm.2
 for <alsa-devel@alsa-project.org>; Wed, 22 May 2019 09:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AztR0YxQPjo+dl6FLzdHONEyjeweZt0zVC2E221XWlQ=;
 b=FQFZQ5pLhc3+G+tTnarBWj9uCgHvf6MQVBOxmiQB84MjmbRYL3d9lr0xad3tVwk8Us
 KBrk17D7HVu1WMERpxk6odDZFQxiXDopaksQeKlUNuYq7ZyHbsKfDGBajoJYU8L1O9Lp
 iCjUt7y3UsBPgcPyZ9PlKEefGwcj5aKUxuSOclGe3gowAl3nU5/Ney9Q3IodZ7ZbGWTS
 24uMV/lfJ01p2zjjMsk54w8H7v7gA6bNoMNIR//+Z/SHeppmnhUqCuZsW1ZS0QZEpBSw
 CEwgWTUze6dsp6PxquA3kWgBIxrU8SuBShC89UFH77qqyEnAoFfQTaSw9H7snGzQACyQ
 gV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AztR0YxQPjo+dl6FLzdHONEyjeweZt0zVC2E221XWlQ=;
 b=GcnAjji+yIhUBC9lgOMVIfb3ctWgk08Y1Zk82vA1gKnwag8q4TeMMctktoq37WqO/D
 ALcOuW2guluQKZZ/S4m4oqDjONytpo13V7lPH3rMFtHJQUJ1zEFPIXG8oktt8wDKsgud
 p+sBmjQWHEdMB+dRzwVl5jWBWjEHttaAZJjJ8+Y98u7mWvi1z8Srki27bsutzSmUQf/I
 eGq5eaMjM3rbLrOotUY06VIOqPik9JkJsItOUMmdRnelvCXaLiT5GJlaRam2JDAgn+lG
 7GU46Pn2vG2dLZ/gsNsJm9T2ZyI1p4CwgP3+7znLv9zz4MMmM83j2peK+dmxpBIu1jd9
 7bQw==
X-Gm-Message-State: APjAAAWPT7NrBL7HCKmYqXsvFpZEUrnmFAbLhFZfNvOyOtRDCSvuc3Q+
 MwvEYLmVOzHtQphfOTQ9dl3PKw==
X-Google-Smtp-Source: APXvYqwIODKI5c57KNCc8y6bUOIDanKrY+1pmIzGXwTstBFshTpXKRLQcFKf9Vf1xDgV4/+VGDHmmg==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr7976175wmg.117.1558542335118; 
 Wed, 22 May 2019 09:25:35 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id q15sm8462720wrr.19.2019.05.22.09.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:25:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: vkoul@kernel.org
Date: Wed, 22 May 2019 17:25:28 +0100
Message-Id: <20190522162528.5892-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: sanyog.r.kale@intel.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] soundwire: stream: fix bad unlock balance
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

This patch fixes below warning due to unlocking without locking.

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
index 544925ff0b40..d16268f30e4f 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -814,7 +814,8 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
 			goto error;
 		}
 
-		mutex_unlock(&bus->msg_lock);
+		if (mutex_is_locked(&bus->msg_lock))
+			utex_unlock(&bus->msg_lock);
 	}
 
 	return ret;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
