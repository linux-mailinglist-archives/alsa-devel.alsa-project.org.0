Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C63480EC7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Dec 2021 03:07:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE35F173F;
	Wed, 29 Dec 2021 03:07:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE35F173F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640743671;
	bh=69mQw8AzHK62KMWz6FvLggkb57AmTHGwOitHnaCsahQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THRVR7Ytemfya0qNCDA6XWA1WJXh9Z7ZPGOCfucl8HVRfOz20+YhEjLEsVK2j7SHD
	 AFRJlvsSePQVwZkTwll6ZXAw1LPI1ZTO7ScMrLmeXBeLe6PDEMET/vtGij+7WTzqNU
	 sFzUV8mOVbikAYT5I6r4iYGrvkitPFcvTU9cpqro=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50045F80246;
	Wed, 29 Dec 2021 03:06:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23AB1F80224; Wed, 29 Dec 2021 03:06:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BBC9EF800E9
 for <alsa-devel@alsa-project.org>; Wed, 29 Dec 2021 03:06:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC9EF800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640743600192063093-webhooks-bot@alsa-project.org>
References: <1640743600192063093-webhooks-bot@alsa-project.org>
Subject: [patch] 1st line of /usr/share/alsa/init/00main,
 which is a comment and contains a typo
Message-Id: <20211229020644.23AB1F80224@alsa1.perex.cz>
Date: Wed, 29 Dec 2021 03:06:44 +0100 (CET)
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

alsa-project/alsa-utils issue #132 was edited from ZjYwMj:

With alsa-utils 1.2.6:
This should probably get applied to [00main:1](https://github.com/alsa-project/alsa-utils/blob/90f59671784a7e47b40485095cd66892d4840ed7/alsactl/init/00main#L1).
```
--- a/usr/share/alsa/init/00main	2021-12-06 18:44:25.000000000 +0000
+++ b/usr/share/alsa/init/00main	2021-12-28 17:04:36.835174838 +0000
@@ -1,4 +1,4 @@
-# This is toplevel configuration for for 'alsactl init'.
+# This is the toplevel configuration file for 'alsactl init'.
 # See 'man alsactl_init' for syntax.
 
 # set root device directory in sysfs for soundcard for ATTR{} command
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/132
Repository URL: https://github.com/alsa-project/alsa-utils
