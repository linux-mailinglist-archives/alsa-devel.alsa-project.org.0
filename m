Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE28C5BCE
	for <lists+alsa-devel@lfdr.de>; Tue, 14 May 2024 21:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C57B284D;
	Tue, 14 May 2024 21:49:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C57B284D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715716164;
	bh=moKZybtts9XsLb8LOKyjGq3JgkLx12g+VrF777wQixI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EDQTunC2FnHVNUdj7Zm/NcWwo02g77br3WY6Fu6+fK8U9zjNfvBotxON+2wvW7iWB
	 YUl1q4mpvqcgtou5pIlwSLSLDTJBGQU1JcsbYEJ3zpDfTgqX7cUILY96th2KGIXJK5
	 PvGM9f7wF8v1AN82RD9cU3lecCb6fUZlzyh8IqUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08BF1F8057D; Tue, 14 May 2024 21:48:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B65CF8057C;
	Tue, 14 May 2024 21:48:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F20F80224; Tue, 14 May 2024 21:48:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B535F800E9
	for <alsa-devel@alsa-project.org>; Tue, 14 May 2024 21:48:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B535F800E9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1715716126585637331-webhooks-bot@alsa-project.org>
References: <1715716126585637331-webhooks-bot@alsa-project.org>
Subject: HCtl event callback gives "Fatal Python error: drop_gil: drop_gil:
 GIL is not locked"
Message-Id: <20240514194848.85F20F80224@alsa1.perex.cz>
Date: Tue, 14 May 2024 21:48:48 +0200 (CEST)
Message-ID-Hash: EEVTWZHFJT4PXFYDIXG33ADNIPAWKWCE
X-Message-ID-Hash: EEVTWZHFJT4PXFYDIXG33ADNIPAWKWCE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EEVTWZHFJT4PXFYDIXG33ADNIPAWKWCE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python issue #11 was edited from HEnquist:

I'm running the [hctltest2.py](https://github.com/alsa-project/alsa-python/blob/master/test/hctltest2.py) test.

Then change one of the controls, I tried the "Z Test Volume" that gets numid 4:
`amixer -D hw:0 cset numid=4 5`

This generates and event, which runs the callback function. That results in the test script crashing, with:

```
Fatal Python error: drop_gil: drop_gil: GIL is not locked
Python runtime state: initialized

Thread 0x00007cae1adbc740 (most recent call first):
  File "/home/henrik/repos/camilladsp-controller/hctltest2.py", line 25 in event_callback

Current thread 0x00007cae1adbc740 (most recent call first):
  File "/home/henrik/repos/camilladsp-controller/hctltest2.py", line 63 in <module>

Extension modules: pyalsa.alsahcontrol (total: 1)
Aborted (core dumped)
```

Tested on manjaro with python 3.11, and latest alsa-python.

Also tested on Python 3.8.19, using the latest alsa-python code directly from this repo, with the same result.

Issue URL     : https://github.com/alsa-project/alsa-python/issues/11
Repository URL: https://github.com/alsa-project/alsa-python
