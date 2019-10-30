Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91598E9554
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Oct 2019 04:34:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0207022FA;
	Wed, 30 Oct 2019 04:33:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0207022FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572406464;
	bh=GPgQmPwVbc5jyC22hS3xrJcN4qt9qEfZV2qvkYroZKU=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GplG60vm7BLhch41R1hm33XDwJJAGQCMlZdQrfZxxMNGZoTZPnNcoRY3lnyACrasv
	 qplkZeKw1WstGYuklo8qd546E7yIn99n77Bkv10uxR0kWjpelMlz7fhZkOGaIpKrpc
	 UJRVrdsSzhTWoKfw6QQluD3NM94oz0DIWPY1NMpE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C405F8044A;
	Wed, 30 Oct 2019 04:32:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 807D3F80361; Wed, 30 Oct 2019 04:32:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9AF0DF802A0
 for <alsa-devel@alsa-project.org>; Wed, 30 Oct 2019 04:32:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF0DF802A0
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1572406354427948952-webhooks-bot@alsa-project.org>
References: <1572406354427948952-webhooks-bot@alsa-project.org>
Message-Id: <20191030033238.807D3F80361@alsa1.perex.cz>
Date: Wed, 30 Oct 2019 04:32:38 +0100 (CET)
Subject: [alsa-devel] axfer: break transmission of audio data frame when
 transmission backend queues no PCM event within timeout
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

alsa-project/alsa-utils pull request #31 was opened from takaswie:

Axfer internally has the waiter abstraction for polling system call. This is used without explicit timeout for IRQ-based scheduling model. As a result, axfer process is corrupted to be blocked due to a call of polling system call when transmission backend has a bug to queue PCM event in I/O thread or hardware IRQ context.

This patchset implements error reporting for such buggy backend. When call of polling system call returns with timeout, axfer reports it as a bug. The timeout is equivalent to the size of buffer. Precisely it should be the size of period, however the larger size is used to stabilize runtime for existent PCM plugins.

```
Takashi Sakamoto (6):
  axfer: return the number of file descriptors for I/O events from select(2) waiter
  axfer: fix to return error code when a call of select(2) fails
  axfer: return ETIMEDOUT when no event occurs after waiter expiration
  axfer: handle -ETIMEDOUT before handle mmap I/O operation
  axfer: code refactoring for a helper function to wait for avail buffer space
  axfer: handle -ETIMEDOUT before non-block I/O operation

 axfer/waiter-select.c           |  4 +--
 axfer/xfer-libasound-irq-mmap.c | 19 +++++++++-
 axfer/xfer-libasound-irq-rw.c   | 62 +++++++++++++++++++--------------
 axfer/xfer-libasound.c          | 21 +++++++----
 4 files changed, 70 insertions(+), 36 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-utils/pull/31
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/31.patch
Repository URL: https://github.com/alsa-project/alsa-utils
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
