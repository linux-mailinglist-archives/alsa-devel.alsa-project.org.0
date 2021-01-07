Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B42ECA5A
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Jan 2021 07:10:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BF411676;
	Thu,  7 Jan 2021 07:10:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BF411676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609999854;
	bh=EruplcA1WdKocWEnpWIZex79mz29x6dctFxv+vyR9LA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8YA3RCri+e73FL+LjyK56h1vNfXsWbj8Py86+44WITh3PPTDYcsWxvPt9fE/tmuu
	 uO8GcQXUUwXllSxnkjK2dTGEAWA7fsbqUlttozMFlMHaQeeLSPSK262gWt+9wWCnCE
	 6xZpQhwWwaH9/i57Vb83+J/OfSOmHfDyqDGGoOpI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 56D56F80268;
	Thu,  7 Jan 2021 07:09:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 87DD4F80258; Thu,  7 Jan 2021 07:09:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 75207F80096
 for <alsa-devel@alsa-project.org>; Thu,  7 Jan 2021 07:09:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75207F80096
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1609999751912015915-webhooks-bot@alsa-project.org>
References: <1609999751912015915-webhooks-bot@alsa-project.org>
Subject: build fails using -flto=auto
Message-Id: <20210107060919.87DD4F80258@alsa1.perex.cz>
Date: Thu,  7 Jan 2021 07:09:19 +0100 (CET)
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

alsa-project/alsa-lib issue #110 was edited from shoober420:

When compiling alsa-lib with -flto=auto, the build will fail. Here are the logs.

64bit:
[alsa-lib-git-1.2.4-1-x86_64-build.log](https://github.com/alsa-project/alsa-lib/files/5779850/alsa-lib-git-1.2.4-1-x86_64-build.log)

32bit:
[lib32-alsa-lib-minimal-git-1.2.4-1-x86_64-build.log](https://github.com/alsa-project/alsa-lib/files/5779853/lib32-alsa-lib-minimal-git-1.2.4-1-x86_64-build.log)

64bit --with-versioned:
[alsa-lib-git-1.2.4-1-x86_64-build.log](https://github.com/alsa-project/alsa-lib/files/5779857/alsa-lib-git-1.2.4-1-x86_64-build.log)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/110
Repository URL: https://github.com/alsa-project/alsa-lib
