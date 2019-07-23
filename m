Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2562A71992
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Jul 2019 15:42:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0788189F;
	Tue, 23 Jul 2019 15:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0788189F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1563889339;
	bh=3v877PL8F09OGgjsXv3LY9i/GBIq/Hj5CG/kbqHEOBo=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qGBIVMiQV/jsoYAG9JCADxnJAPy9rLpnndzTEUYb50tHg6uE2L7/wri5qvXG2WnFu
	 yKs4zHu0505A+5o/WM1MD6NOYcX8Sno3w7GjxqViElA84GZPiIgmC6HY0mHTlqFwef
	 w0PdxsZPrn662nmESx2z3GOQL8HMnKP5dh0gGG0s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A336F8044C;
	Tue, 23 Jul 2019 15:40:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 142A8F8044B; Tue, 23 Jul 2019 15:40:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7088DF800E8
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 15:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7088DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="htZKGSZg"
Received: by mail-pf1-x442.google.com with SMTP id r7so19176414pfl.3
 for <alsa-devel@alsa-project.org>; Tue, 23 Jul 2019 06:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jugRb2vt232DJ0Tf9bLWXh+Q8rg8VA+VLd86FZGf/5M=;
 b=htZKGSZgs7EAS6bHJHCCD1rlhs+g8kjPbkcAjHDjjnVRqUXoJ/Op7Nc8H/+IN4uKHK
 41NySenxDvpM4uOPOzcGBovI94jHxhaiHYI4P9ILZpM9swPw9CFPT9M3XoKf4auraunj
 cKxA4D0m1M3ZukOiqFvDsxYOmNYOOg3Ftv6DvBN9Gou3MP/QZPdwQtHmbtA+JDKLIV9b
 QfznGZ8dq7j44JmbcM48IYAldcSLRBcQ283zrv21VxAh9rNYiAvlbRQ36EP7Rk4DFvio
 pu3bzJcO6i/1PuOi20iHkvNQQPnsbhpLwIvXbOk8/vj8cF44m3BlwcGGDMSRyMS2jiZY
 lZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jugRb2vt232DJ0Tf9bLWXh+Q8rg8VA+VLd86FZGf/5M=;
 b=M7kzFF/TA9UAJ9pztwIy+TmIn6YTr+WTNjEs9ZAraejSth8N/Bj+YXxv+KwcjZ+3i3
 tMJeAo/LTyX8Q1tqmwhWXwz42FCfey0Jar+XRzbmZVUo2i1qRIxHFRT6kIaJ25BA3hT+
 yTSJZ7bw8bm9c+m54HJh7etHvzBk3sko7EZwhk0SVHzhEUgON6cE/p8P/1XgOVrNSjWV
 F+JjRvb42GM9d4AEAb/NX15JdVKDKeZMRWlYU0jSFQUlbCHQ+R9R9oTOBjZcaAWqrdq6
 4pxHUvaB+7yBOF86m+IUxdPuqZe1jHiZFeemvi7CTqWlZXAF/iVJiPHXeCgTAz7rYIX9
 BiAg==
X-Gm-Message-State: APjAAAW9iy3yc8O504DsMpkmyShiFoq8mdyPuq8skF/SLN8y5T+tHgM4
 NDaQLeHPqfqD1pnzZgYGPUMvXc0g
X-Google-Smtp-Source: APXvYqy8VT8V/nFcsrgzWFDj6Z0IY9HPcv+uKoEjpRhDzmbL3rSCPKiqORlzVCMoErFHH2h5eRopMA==
X-Received: by 2002:a17:90a:9903:: with SMTP id
 b3mr81880307pjp.80.1563889226916; 
 Tue, 23 Jul 2019 06:40:26 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
 by smtp.gmail.com with ESMTPSA id d6sm37813630pgf.55.2019.07.23.06.40.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Jul 2019 06:40:26 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: perex@perex.cz, tiwai@suse.com, huangfq.daxian@gmail.com,
 tglx@linutronix.de, allison@lohutok.net
Date: Tue, 23 Jul 2019 21:40:20 +0800
Message-Id: <20190723134020.25972-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: alsa-devel@alsa-project.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] ALSA: isa: gus: Fix a possible null-pointer
	dereference in snd_gf1_mem_xfree()
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

In snd_gf1_mem_xfree(), there is an if statement on line 72 and line 74
to check whether block->next is NULL:
    if (block->next)

When block->next is NULL, block->next is used on line 84:
    block->next->prev = block->prev;

Thus, a possible null-pointer dereference may occur in this case.

To fix this possible bug, block->next is checked before using it.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 sound/isa/gus/gus_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/isa/gus/gus_mem.c b/sound/isa/gus/gus_mem.c
index cb02d18dde60..ed6205b88057 100644
--- a/sound/isa/gus/gus_mem.c
+++ b/sound/isa/gus/gus_mem.c
@@ -81,7 +81,8 @@ int snd_gf1_mem_xfree(struct snd_gf1_mem * alloc, struct snd_gf1_mem_block * blo
 		if (block->prev)
 			block->prev->next = NULL;
 	} else {
-		block->next->prev = block->prev;
+		if (block->next)
+			block->next->prev = block->prev;
 		if (block->prev)
 			block->prev->next = block->next;
 	}
-- 
2.17.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
