Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C966F46D
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Jul 2019 19:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 454BA16F9;
	Sun, 21 Jul 2019 19:48:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 454BA16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563731356;
	bh=A53debP6GwhXRDRIcPXHCMeuDwufVpjl8hxQjcEQZfI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KK+d0em88BJNYgvUgycYQ16qNHYzTZZbDAqCK5zdfXQVR4d8bCSL2hHzvo9Ievd9+
	 b2g21niOyqAqXiGY9BVf4qsyutkWeincKZ7tBy0PPIf79/DloL7ygu/FlUCmuWzRvC
	 U3xMk6qfrYQknWOIrc5JilxPmh42PbxYk1K8FxJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56DEBF800E8;
	Sun, 21 Jul 2019 19:47:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B97C9F80448; Sun, 21 Jul 2019 19:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA029F800E8
 for <alsa-devel@alsa-project.org>; Sun, 21 Jul 2019 19:47:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA029F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="agbSGPgY"
Received: by mail-pf1-x443.google.com with SMTP id r7so16235997pfl.3
 for <alsa-devel@alsa-project.org>; Sun, 21 Jul 2019 10:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:mime-version:content-disposition
 :user-agent; bh=wfPtSDK6aeQ/5qCMCN3mM+awlrKw6JZ3Ltnav27AGWE=;
 b=agbSGPgYAkz8RINO8A9YIX3aoh13aW/Egoh5xl7JWIHhrbb13bKHL6CZXdU81vEdoY
 ZPRPk68EB/1nhGApq8ABJlq/NBW4UOk0aai4BGyImZSoZsLjWWuV26JaHFPLvW9ITm67
 JzvwIh08zHxx764XxY5kKGTb+5GJ53qIwrZSEAIHB/oYHvj8zrBrdvePkOSrqv5WtuhE
 38cxfb4tpbb1AXz2kSf44eXcBIqCrHWJeq06wwKFAgv9ZKAOGUGO4jBKJZfqhMVkZ0XU
 ejgWqCK1OkR/q/EohlmeZuAl8DRZWcHfED79ixq59S1SETR8AkSIgngfFK0ssc81vOe5
 /K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=wfPtSDK6aeQ/5qCMCN3mM+awlrKw6JZ3Ltnav27AGWE=;
 b=ZQHN/cukWVb1S2Fl5pAGNsWLNGQH0X7MqWZ/xxWRLiN7wIFSfWgVHcA/sPTH+RWdQy
 YdrzjPOr4bRiZ9kOk4tNWo/WPij1lKltGnia9MkMY6C8UgEf9B5wEXt7Vdb3nz3sJ01/
 sWVizQYkT58ydZqItdPqyqo/tO9Ura02EMNj8qt7pMyagxeUaGTroRHevpuj3zxbqKNQ
 HyrTNKgptPH/WgIh8xb32NCYjPxpRs3TfkJ5zvINuD4FN7bumLx60esUuQeTJ1n55Z0f
 beURMZtUGBRQWF8vy91gsQ7pfhSaEw6SBzYcj928XmJQYT08XRicmpvwFxtXm6LgL+fp
 W5Vg==
X-Gm-Message-State: APjAAAW5KEe3ZLaCStLmJY8XmAbs2LugHIAvwE4jkzpy37rMmgbQiu/7
 2EvzXG0qw5vm0WBQO8Y17Ew=
X-Google-Smtp-Source: APXvYqwf7V9YESE5laxDZ8XK4KR1yCREzPtDTl5Mzg1CZSfoQAVoEeaqqGA40xxdYJMVNrpbuJ/5uw==
X-Received: by 2002:a63:de43:: with SMTP id y3mr4432535pgi.211.1563731241085; 
 Sun, 21 Jul 2019 10:47:21 -0700 (PDT)
Received: from hari-Inspiron-1545 ([183.83.86.126])
 by smtp.gmail.com with ESMTPSA id u16sm36964292pjb.2.2019.07.21.10.47.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 21 Jul 2019 10:47:20 -0700 (PDT)
Date: Sun, 21 Jul 2019 23:17:15 +0530
From: Hariprasad Kelam <hariprasad.kelam@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Message-ID: <20190721174715.GA10747@hari-Inspiron-1545>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: [alsa-devel] [PATCH] slimbus: fix duplicated argument to ||
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

Remove duplicate argument SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION.

fix below issue reported by coccicheck
./drivers/slimbus/slimbus.h:440:3-46: duplicated argument to && or ||

Signed-off-by: Hariprasad Kelam <hariprasad.kelam@gmail.com>
---
 drivers/slimbus/slimbus.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index 9be4108..46a6441 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -438,8 +438,7 @@ static inline bool slim_tid_txn(u8 mt, u8 mc)
 	return (mt == SLIM_MSG_MT_CORE &&
 		(mc == SLIM_MSG_MC_REQUEST_INFORMATION ||
 		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION ||
-		 mc == SLIM_MSG_MC_REQUEST_VALUE ||
-		 mc == SLIM_MSG_MC_REQUEST_CLEAR_INFORMATION));
+		 mc == SLIM_MSG_MC_REQUEST_VALUE));
 }
 
 static inline bool slim_ec_txn(u8 mt, u8 mc)
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
