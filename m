Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7BD2B5A0C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 08:07:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 242171746;
	Tue, 17 Nov 2020 08:06:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 242171746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605596829;
	bh=5/8AVPd5cmiGKsFDcVLFS4Qqdsc16f2eT1P6bmhue7E=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XLWbnc854x/V37wGAlRYt6W40ALYbs2KZ7dCHO0Z6wJ7qH8YW9rvUaRVg9EKxYFRu
	 B4PpYTE0djyXRV5L011bABt24RmxpZiXDkjhvpV31Zf1DR8M/5N+dEKAhArBPtTmE1
	 lLTi1xGGbuzO2txadGD7dAs4q2dCYLtvCRkS0C8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8842F801F5;
	Tue, 17 Nov 2020 08:05:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EF6BF801F5; Tue, 17 Nov 2020 08:05:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 15CFFF800E2
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 08:05:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15CFFF800E2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605596725358174086-webhooks-bot@alsa-project.org>
References: <1605596725358174086-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: various fixes
Message-Id: <20201117070534.8EF6BF801F5@alsa1.perex.cz>
Date: Tue, 17 Nov 2020 08:05:34 +0100 (CET)
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

alsa-project/alsa-gobject pull request #56 was opened from takaswie:

This patchset includes various fixes toward v0.2.0 release.

```
Takashi Sakamoto (10):
  timer: device_id: fix function comment
  timer: user_instance: fix function comment
  rawmidi: stream_pair: update function comment for error reporting
  hwdep: query: fix usage of uninitialized value
  rawmidi: query: fix usage of uninitialized value
  ctl: query: fulfil comment about GError
  timer: query: fulfil comment about GError
  seq: query: fulfil comment about GError
  hwdep: query: fulfil comment about GError
  rawmidi: query: fulfil comment about GError

 src/ctl/query.c           |  8 ++++----
 src/hwdep/query.c         | 10 +++++-----
 src/rawmidi/query.c       | 12 ++++++------
 src/rawmidi/stream-pair.c | 23 ++++++++++++++---------
 src/seq/query.c           | 26 +++++++++++++-------------
 src/timer/device-id.c     |  2 +-
 src/timer/query.c         | 14 +++++++-------
 src/timer/user-instance.c | 22 +++++++++++-----------
 8 files changed, 61 insertions(+), 56 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/56
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/56.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
