Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A33532A27A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 15:30:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11D3E172D;
	Tue,  2 Mar 2021 15:29:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11D3E172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614695415;
	bh=aaMQ/10XH/k0JQvi4EoQkj1XXzwA8OAx1yzqdTkAKI0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jGIntRLLR3lFmnQy2yXLGG2kbM5boeUK8c8a8slnTor6sHiEtYNhkZwOFm3D1xOoO
	 pTVAA1t8ANdDeg17R/7wp4CBCNcnDLUu2OmeJkiS2IcBwvja4zm0L0tu2OhXOQoMB6
	 MwVTZPsIT+KTo/JGblCoVPhC6ofEpGvTUZkBtNkI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18FC1F80271;
	Tue,  2 Mar 2021 15:28:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AC18F80269; Tue,  2 Mar 2021 15:28:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9149DF8012D
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 15:28:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9149DF8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="ZXWPdWu3"
Received: by mail-qv1-xf31.google.com with SMTP id h7so3003078qvm.2
 for <alsa-devel@alsa-project.org>; Tue, 02 Mar 2021 06:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3pZCgJ6TdKFreVrtIo90OeUZKud+pvF9qadigeYa9o=;
 b=ZXWPdWu35v5qQcQ/SETrY8n8MJDHZQguJsK6R3/39h5pp3CG2awSYta3ColPdDlTmh
 SFsFmM9nhmyU+XylC/wBQkv2dFAt7Kt9uTObYjHBuc0WkEIfHZ06nDslqTW0YoqLvsx2
 H4O4cwkfdFfvMbpUtQQ53LfcmqyELCu/rA9RcFniKk9sj1ZTIeSCZKiLIvam/H/sEozn
 XN9f1YISTHIEnjRhJAjfXWqotJdYT60pe0xbsl1x9MNeb5RPDoHLPHqZJ0bhb1Dns25U
 Tb9hbIbvinbi4Y881Cvk7vEYsmrj/TUVF+Iie/gXHK8QuDnShQslb92RrxbI8AxIj+6k
 VAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j3pZCgJ6TdKFreVrtIo90OeUZKud+pvF9qadigeYa9o=;
 b=HqYFu02bZhYkfS6lh8OuZ99TFBN+05EPgj4LlwBjpDNtQ6sKypnihCBIgjHgwQJN6X
 ZaenAd5FPtnR9aHXPpU7DyJlMGD4ciVkFxS91O1jhEJGiyZ5AqBvxoD61WnI77YjR3wL
 VHKVeQkUJGyxlgiRz45e4GfN5xgMI39cDP18mofUlzsWru/RoxZgoSPpDAl5fjwvfeXy
 8op2odW2ifxUWFmqmOgSZ+RM3TZm1CnXtR7VW1+X6GEAF9xs4+WQSEcDMPqqHdKf3UCv
 ib0saBuhn531MwA8HAh0BoflmyOt11C0Tya3EDPMJXtqWspwFl5mvIGctd3JPWz1HXYK
 MzJA==
X-Gm-Message-State: AOAM532Skyiino1FzAo6/S1EhakPj/duQXe6RWNsLLyzIZsJYUAJy2/Q
 hXFRIVhQefkblFjlhC514nA=
X-Google-Smtp-Source: ABdhPJzMuwnswjq6F/Lb7eBpV0f6AKM9bIXVDJAtwvcAeIjY212s1u+ufM8Lx8F1q9f8kbOu3PJmhg==
X-Received: by 2002:a0c:e9c7:: with SMTP id q7mr3758229qvo.7.1614695310562;
 Tue, 02 Mar 2021 06:28:30 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:482:919::1001])
 by smtp.gmail.com with ESMTPSA id u126sm14869741qkc.107.2021.03.02.06.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 06:28:29 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: sgtl5000: Fix identation of .driver elements
Date: Tue,  2 Mar 2021 11:28:17 -0300
Message-Id: <20210302142817.2141923-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Fabio Estevam <festevam@gmail.com>
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

The .driver elements are not correctly idented.

Fix the identation of the .driver elements.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/codecs/sgtl5000.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 73551e36695e..34ac2e7fd3b5 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1819,9 +1819,9 @@ MODULE_DEVICE_TABLE(of, sgtl5000_dt_ids);
 
 static struct i2c_driver sgtl5000_i2c_driver = {
 	.driver = {
-		   .name = "sgtl5000",
-		   .of_match_table = sgtl5000_dt_ids,
-		   },
+		.name = "sgtl5000",
+		.of_match_table = sgtl5000_dt_ids,
+	},
 	.probe = sgtl5000_i2c_probe,
 	.remove = sgtl5000_i2c_remove,
 	.id_table = sgtl5000_id,
-- 
2.25.1

