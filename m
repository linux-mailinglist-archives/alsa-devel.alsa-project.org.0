Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2A51306F6
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 10:42:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25CB61758;
	Sun,  5 Jan 2020 10:41:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25CB61758
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578217325;
	bh=cqdtjZ9R2AWoyyPQ+q8KSsQGZaXfvU+eFYR7tZKQllw=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CbYj4etnD1Fu50M4hIxpjAwME8USWpsKMFqNL0XYl9EG7l0qnAyoK0uSvoV3KJwMr
	 Ri6/CYVWBpNleGU+Ye6axG46qDlS6s5ZXGhCebDW+KBuYsjk8XvlfVCT+ayBpq19Kj
	 hVQJjLWs4EKdYC4LED4btTZCD34nRMIx9xrdPBwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 500F6F80172;
	Sun,  5 Jan 2020 10:40:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9CA6F80157; Sat,  4 Jan 2020 15:14:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82866F80105
 for <alsa-devel@alsa-project.org>; Sat,  4 Jan 2020 15:14:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82866F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pTAE/TWG"
Received: by mail-pg1-x543.google.com with SMTP id s64so24706795pgb.9
 for <alsa-devel@alsa-project.org>; Sat, 04 Jan 2020 06:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=N1zAzNFuGiZZLxkXFIxcCFopAhIskKxqeAZ70oWHN78=;
 b=pTAE/TWGL4KOmpshoapLVk4oal5VsWsqN1WERVXpTbb8CJqLFoY773wx3GEKbJSYp5
 oiIYqn8PaoCJyi7gxGY4he4K3s9jQEjPSMIEjHIFkSqoJ0Rb5/tGkf/4MnJwgIqo8clL
 EJLXW/eP2Ckycm0sQFudGQ47S/yXCa9wzc0lcTbl8//LDupJ7NV8ynqvmPk5qklZ0a0Y
 /1C1cdDwtdgADigLLn6cfdtOnBGVGuH6O/tG5zP3pFEnRrNm2T+EEOqlEk6WxAolC+eR
 NKMQIKVgdPVNexnTbpD0OVpP4NoJLXPWdFlPrRz7MJL0vEqB1dR9PPUows/WfmG3msuT
 56IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=N1zAzNFuGiZZLxkXFIxcCFopAhIskKxqeAZ70oWHN78=;
 b=ZBxgaekb6LCd7aPqoyUJ/x/w8NoqsRPFRwWewA/WvOaDpN7LNfqzvGFU+4YkFHMLg7
 iZCoZsaWaRFYSS/sIF8Hv0sfn8jaUHjIspvadnwYQWhbXRCYo2rek+71qRqy9demcUxR
 0QD1qcyQ7U4rAfSgMqVz/vaxW9RU4OP0OObAzbIqbZkfHinO7JwNXcUhLHYrmWBJ73U4
 +eK6TJWj1JAD9pBzHDoF6EblLURY1oMg1BI87N1g8f0ESuwkhLD5rGEhVa9Tee7Kxzwz
 aYQwDGCVzkEB1oOiu2Tr3sIQorkdkye6X3d16wyPu25CEyxGn20gYkHB0w91U6axHg5+
 heHQ==
X-Gm-Message-State: APjAAAXXtlQBTctlPYD1UozfgeqI1AwxQ06EAQj9US8Mpw0dnGyWzspl
 yVx9lPj3lu1Vhu8t48R50WIb/zO6mRA=
X-Google-Smtp-Source: APXvYqxXOCrgGL6D/EiQqmJ8Z0X+5hRA7oPRVgi4k2IF91Zl4z7AINE3kaOaDElLnzGCqpXfSWuaKA==
X-Received: by 2002:a63:ff5c:: with SMTP id s28mr99938380pgk.196.1578147283228; 
 Sat, 04 Jan 2020 06:14:43 -0800 (PST)
Received: from nishad ([106.51.232.103])
 by smtp.gmail.com with ESMTPSA id m6sm18310663pjn.21.2020.01.04.06.14.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 Jan 2020 06:14:42 -0800 (PST)
Date: Sat, 4 Jan 2020 19:44:36 +0530
From: Nishad Kamdar <nishadkamdar@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joe Perches <joe@perches.com>
Message-ID: <20200104141433.GA3684@nishad>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Sun, 05 Jan 2020 10:40:18 +0100
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] slimbus: Use the correct style for SPDX
	License Identifier
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

This patch corrects the SPDX License Identifier style in
header file related to SLIMbus driver.
For C header files Documentation/process/license-rules.rst
mandates C-like comments (opposed to C source files where
C++ style should be used).

Changes made by using a script provided by Joe Perches here:
https://lkml.org/lkml/2019/2/7/46.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
---
 drivers/slimbus/slimbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
index b2f013bfe42e..c73035915f1d 100644
--- a/drivers/slimbus/slimbus.h
+++ b/drivers/slimbus/slimbus.h
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (c) 2011-2017, The Linux Foundation
  */
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
