Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3450FA58FC1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 10:32:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74C2C60399;
	Mon, 10 Mar 2025 10:32:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74C2C60399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741599167;
	bh=ODOxbQAFTkkMl3VTehGUWrA0qwACaUpaCCDYxYjQoIU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=jmCI/7Hm+rklCyioLWYhX3ljsy4PjseBecDvJYi8m8FdLQvLZZfLJQnA786H5h5Yg
	 xtbDy5au1qAT5IONMqUXTW33hx+SysP4l2Wc6edwDP06xH3fWTLasb/NOrkMJTYudN
	 5o4brbePSIldOsDZbDa/jDI+poLF+k0RbjHjC7IU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 713C3F805CA; Fri,  7 Mar 2025 12:25:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F0C8F805E8;
	Fri,  7 Mar 2025 12:25:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46325F805D7; Fri,  7 Mar 2025 12:24:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BE8AF805CB
	for <alsa-devel@alsa-project.org>; Fri,  7 Mar 2025 12:24:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BE8AF805CB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1741346696019557476-webhooks-bot@alsa-project.org>
References: <1741346696019557476-webhooks-bot@alsa-project.org>
Subject: PORT: GTK2 to GTK3
Message-Id: <20250307112458.46325F805D7@alsa1.perex.cz>
Date: Fri,  7 Mar 2025 12:24:58 +0100 (CET)
Message-ID-Hash: ATNPZMXQ4C4BKWTQJSFBIV6JTKCRDDBM
X-Message-ID-Hash: ATNPZMXQ4C4BKWTQJSFBIV6JTKCRDDBM
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ATNPZMXQ4C4BKWTQJSFBIV6JTKCRDDBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #27 was opened from genbtc:

I've undertaken a task of porting alsa-tools programs from GTK2 to GTK3.
These patches start with a base of 5eaadd15bda4cf0424ee2470a6d304a0c2ce10cb (master) Date:   Mon Jan 27 (latest pull)

Results: Compilation completes successfully, Linked to GTK3, but I do not have the hardware cards to test run them.

All work has been done by me, and I request a code review on the GDK 2 Pixmap  to GDK 3  Pixbuf + Cairo surfaces.
Like it needs new logic and new plan. not simply change statement A to B (whatever I did to get it to compile)

I tried to comply with the existing style, and
There was also a fair bit of inconsequential whitespace removed like (\n\t\n) or trailing space chars as I discovered them.

Looking forward to upstreaming these changes somehow if you would like to work on this.
 - genBTC @ gentoo

Request URL   : https://github.com/alsa-project/alsa-tools/pull/27
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/27.patch
Repository URL: https://github.com/alsa-project/alsa-tools
