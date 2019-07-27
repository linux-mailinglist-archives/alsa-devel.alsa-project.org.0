Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1072F77952
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 16:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DF7718C7;
	Sat, 27 Jul 2019 16:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DF7718C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564239096;
	bh=XDMh1VA4D6fQKRBgNTWum4wA669hdwCRAJCC5C9eQ2g=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tqCQJP5DdFc9wxgXZBsKCGjm9z9eRZE9colm+lBkH8AjZPplMIUAZD1njKjK7LDGA
	 3LQaiW3H+uQwww8caj5HJ2A1MjlQ+z+1EGNL+jcKrsqdqha5X++0vFGyrwlAYzq+gt
	 8OWA6v8W7TCb3kakqTpgO3qdj6uwYvYTd2cl92vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0C28F80394;
	Sat, 27 Jul 2019 16:49:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73A52F80394; Sat, 27 Jul 2019 16:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3768AF800E8
 for <alsa-devel@alsa-project.org>; Sat, 27 Jul 2019 16:49:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3768AF800E8
MIME-Version: 1.0
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1564238987542835951-webhooks-bot@alsa-project.org>
References: <1564238987542835951-webhooks-bot@alsa-project.org>
Message-Id: <20190727144950.73A52F80394@alsa1.perex.cz>
Date: Sat, 27 Jul 2019 16:49:50 +0200 (CEST)
Subject: [alsa-devel] axfr/tests fail on hppa and sparc
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

alsa-project/alsa-utils issue #23 was opened from DerDakon:

There is a Gentoo bug about this test failures: https://bugs.gentoo.org/681652

The log on hppa says this:

```
=================================================
   alsa-utils 1.1.9: axfer/test/test-suite.log
=================================================

# TOTAL: 2
# PASS:  0
# SKIP:  0
# XFAIL: 0
# FAIL:  2
# XPASS: 0
# ERROR: 0

.. contents:: :depth: 2

FAIL: container-test
====================

container-test: container-test.c:53: test_builder: Assertion `err == 0' failed.
FAIL container-test (exit status: 134)

FAIL: mapper-test
=================

Invalid argument
FAIL mapper-test (exit status: 1)
```

The errors are similar on sparc. Does that depend on specific kernel features to be enabled? Also note that both architectures are big endian, which may or may not be related.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/23
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
