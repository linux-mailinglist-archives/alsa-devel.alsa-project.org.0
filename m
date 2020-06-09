Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9BF1F48F5
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 23:41:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 452081676;
	Tue,  9 Jun 2020 23:40:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 452081676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591738880;
	bh=3v0+Zz5JcGIVyfTZ8qZd1mfyo+V1hVqmE0yPNmr2iaE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JUdoavbtLx7N9L8vyqoXG0iF+27Z7vayUz09urvG9ymC7UyNg4VnmTcOIH2fVbW2+
	 W0FAKF/jXeBwBWRjkoP91JyXjA/AueGI7qPwQnX8GiXEpWgevG0dEE+H+kot57+ruT
	 CCIe29m2SEBixId/udG42AQLLcwxloKoCJTdYJpc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6612F80278;
	Tue,  9 Jun 2020 23:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C833EF80291; Tue,  9 Jun 2020 23:39:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6BE8CF80278
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 23:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BE8CF80278
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1591738750243496895-webhooks-bot@alsa-project.org>
References: <1591738750243496895-webhooks-bot@alsa-project.org>
Subject: ALSA journalctl Error
Message-Id: <20200609213912.C833EF80291@alsa1.perex.cz>
Date: Tue,  9 Jun 2020 23:39:12 +0200 (CEST)
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

alsa-project/alsa-lib issue #57 was edited from danieloppenlander:

I ran across an error in my journalctl on Ubuntu 20.04. It said to report a bug. Here is my alsa-info.sh output: http://alsa-project.org/db/?f=6b505aa5138f2a974037ab5c3a89e1605807df97
Here is the journalctl message:

```
pulseaudio[11933]: We were woken up with POLLOUT set -- however a subsequent snd_pcm_avail() returned 0 or another value < min_avail.
pulseaudio[11933]: Most likely this is a bug in the ALSA driver 'snd_usb_audio'. Please report this issue to the ALSA developers.
pulseaudio[11933]: ALSA woke us up to write new data to the device, but there was actually nothing to write.
```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/57
Repository URL: https://github.com/alsa-project/alsa-lib
