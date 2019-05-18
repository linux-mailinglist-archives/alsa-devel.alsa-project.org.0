Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DBD23B75
	for <lists+alsa-devel@lfdr.de>; Mon, 20 May 2019 17:02:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B371616;
	Mon, 20 May 2019 17:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B371616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558364558;
	bh=CATDVikseg0FigB7EeRIixrIgVRzhT5WwU9Enkt3nUk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ndIb8Ld/36q5bp4v3wBq6fhPbZoyY9xhF7N6znB1MBgyqmCcHucrkPOs2BjGzFQiG
	 c5UxKleq5vufI8KWbokK0G1z1fSPEkLd6sG8Iibs20ZUjU+tsj+zUp3VtHifQHMn6e
	 r3lymX+nrlqVcBsHntRBgjHvBjxXp4UDLj8lHKuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 919D4F8963E;
	Mon, 20 May 2019 17:00:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B964F896B7; Sat, 18 May 2019 14:10:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2C4EF8961D
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 14:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2C4EF8961D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZMU/cnC1"
Received: by mail-pf1-x443.google.com with SMTP id g3so4988641pfi.4
 for <alsa-devel@alsa-project.org>; Sat, 18 May 2019 05:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hsExk2EVE9qHmQv/hDpWARWS77nXTJQOdwcfYjT4HFc=;
 b=ZMU/cnC1wUwXTMw26G/cc/0dgk3svpNp1Lrliqm4RpGZsPEcBi9a0hcV6wCBnoCICZ
 EvXmTaI0pF3Mo2nsek14s77tXOC4VfC7U6LY4bM7J1x+b4nnK6ot7rnIgObqkZPb+J4C
 lYKwM+4GCWjt2voajVnXNS7gXEoP8dbVXW/Iv9356ZjJQmF+3hoitppYRzUIZo6O2zf3
 6RIfC/i2DiilYTaqHZU22VO+qH53GgOa7aItuY8zNJ/hNXj2GF6/XQVMXb4mNoY/yz7q
 kliDzc3LI+Ybmi2+HUCf5Bitq399OQcAo2dqpB8qstdUcAPfgfaVga04DtDW9At64rKW
 8jqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hsExk2EVE9qHmQv/hDpWARWS77nXTJQOdwcfYjT4HFc=;
 b=dNPAd7OFmYosOU0psLXqCCd0pslNvqPMggI1urBtzAPei9EDgaVUhSQGM7wttfJZL6
 TbJW1R4ylzp4sMgMZBTj7+0xBWVZL6cVdGmturA7b/EhQqp4CYUOaBpNJmHra+HQrl+f
 wnXIiSt8YOHUEmGsyYPQQCyMqdl/HMru/6X5IBIxs3Ru5z6zyvdFavb0fWSAz1df3P1G
 jTwM2+cxu3y2z3YZNa63H0QGWBA88hpOLkuRxxHjS+5szLPPoVutk/oPLr/MMSsurOTv
 MG2mlvSNhUjlWj0YQFpFR6867iH13TTUPerwkkUH3fK8ZqZJqEJDlUDoA3egb3eBA5Oo
 Ah3w==
X-Gm-Message-State: APjAAAWNOPKrz9URDxQHe35VUIh93T3QHXTkTk7K/Qn2Cl1vjGDIqFPK
 Cpa05FU8qrLtTm2YxUFyi3c=
X-Google-Smtp-Source: APXvYqyrY4opcaZJV1zKzZpEJ1t6eh1ysuCOBwPaeSx2WLZGmuPHHNhMruzPwI+uksaW7iI69D1VzQ==
X-Received: by 2002:a63:2bd1:: with SMTP id r200mr165414pgr.202.1558181431523; 
 Sat, 18 May 2019 05:10:31 -0700 (PDT)
Received: from localhost ([43.224.245.181])
 by smtp.gmail.com with ESMTPSA id 5sm13994078pfh.109.2019.05.18.05.10.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 May 2019 05:10:30 -0700 (PDT)
From: Weitao Hou <houweitaoo@gmail.com>
To: plai@codeaurora.org, bgoswami@codeaurora.org, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, niklas.cassel@linaro.org,
 yuehaibing@huawei.com, houweitaoo@gmail.com
Date: Sat, 18 May 2019 20:10:26 +0800
Message-Id: <20190518121026.19135-1-houweitaoo@gmail.com>
X-Mailer: git-send-email 2.18.0
X-Mailman-Approved-At: Mon, 20 May 2019 17:00:11 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] sound: fix typos in code comments
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

fix lenght to length

Signed-off-by: Weitao Hou <houweitaoo@gmail.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 4f85cb19a309..e8141a33a55e 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -1194,7 +1194,7 @@ EXPORT_SYMBOL_GPL(q6asm_open_read);
  * q6asm_write_async() - non blocking write
  *
  * @ac: audio client pointer
- * @len: lenght in bytes
+ * @len: length in bytes
  * @msw_ts: timestamp msw
  * @lsw_ts: timestamp lsw
  * @wflags: flags associated with write
-- 
2.18.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
