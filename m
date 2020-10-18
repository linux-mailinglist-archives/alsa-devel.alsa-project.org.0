Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210129171D
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Oct 2020 13:06:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90EA717F4;
	Sun, 18 Oct 2020 13:06:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90EA717F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603019210;
	bh=xJcCJQjzEmSJDZ3mOP7TrmOpzueyHoyTwfoT8fSRJzk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h/BuwC8MeNgmGLGlE43W01IjvNQfwIbKXBzoa+SyUKXawnQU5uyaT6JhnCzxXlt7j
	 XP5PoClrUMTT9UA8nyWvjXdbsg8Q2mSxJ77xlYImYf3y+z/cjrIQ1jH27tZYajpGm/
	 4jH/igEwLGTScwgmNlsdJNfZkYw03DenxMNVvvZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23C92F80115;
	Sun, 18 Oct 2020 13:05:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB59AF8024A; Sun, 18 Oct 2020 13:05:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 75C5EF80225
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 13:05:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75C5EF80225
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603019117287308931-webhooks-bot@alsa-project.org>
References: <1603019117287308931-webhooks-bot@alsa-project.org>
Subject: Add amixer --view, to filter playback, capture or all
Message-Id: <20201018110519.BB59AF8024A@alsa1.perex.cz>
Date: Sun, 18 Oct 2020 13:05:19 +0200 (CEST)
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

alsa-project/alsa-utils issue #67 was edited from jidanni:

alsamixer has
```
       -V, --view <mode>
              Select the starting view mode, either playback, capture or all.
```

Perhaps amixer could also have something similar,
e.g., so that
```
$ amixer --view capture
```
would only dump the capture related settings.
Currently one could say that
```
$ amixer --view all
```
is the default.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/67
Repository URL: https://github.com/alsa-project/alsa-utils
