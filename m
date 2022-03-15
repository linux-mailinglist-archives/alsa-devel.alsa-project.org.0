Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F784DA660
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 00:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D603174A;
	Wed, 16 Mar 2022 00:46:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D603174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647388024;
	bh=2ZTbU2Qv+iqfa8j+LwrZwrBS4y1e9yK4hys0uqgH7w8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aiVN9WMgEShaDEv6UeADjZW2WBx92WGZduS21j9TOg0UekeA1mgqMgQw02dlXeQGF
	 cfWSE9lpIMbYzDZs1vQHGxNxi4Pf8BRzcdM8ApRtzp98Vd1YX2emk1NM+k3gmo5Clv
	 +tngQSaOMaqXHBZBOldn+yvhLydDa0Q2f9g6X0Qo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B9E6F801F7;
	Wed, 16 Mar 2022 00:45:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDA31F80162; Wed, 16 Mar 2022 00:45:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6D3D3F80128
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 00:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D3D3F80128
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647387951409940004-webhooks-bot@alsa-project.org>
References: <1647387951409940004-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/3] fix v0.2.1
Message-Id: <20220315234555.CDA31F80162@alsa1.perex.cz>
Date: Wed, 16 Mar 2022 00:45:55 +0100 (CET)
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

alsa-project/alsa-gobject pull request #63 was opened from takaswie:

The v0.2.1 release includes misfunction of ALSACtl.Card.get_elem_id_list(). This patchset includes fix for it as well as arrangement for GLib 2.0 v2.68.

```
Takashi Sakamoto (3):
  ctl/hwdep/rawmidi: fix uninitialized warning
  ctl/timer/seq: optimization for GLib v2.68
  ctl: fix misfunction of alsactl_get_card_id_list()

 src/ctl/elem-id.c               | 10 +++++++++-
 src/ctl/query.c                 |  2 +-
 src/hwdep/query.c               |  2 +-
 src/rawmidi/query.c             |  2 +-
 src/seq/addr.c                  | 10 +++++++++-
 src/seq/event-data-connect.c    | 10 +++++++++-
 src/seq/event-data-ctl.c        | 10 +++++++++-
 src/seq/event-data-note.c       | 10 +++++++++-
 src/seq/event-data-queue.c      | 10 +++++++++-
 src/seq/event-data-result.c     | 10 +++++++++-
 src/seq/queue-timer-data-alsa.c | 10 +++++++++-
 src/seq/remove-filter.c         | 10 +++++++++-
 src/seq/tstamp.c                | 10 +++++++++-
 src/timer/device-id.c           | 10 +++++++++-
 src/timer/event-data-tick.c     | 10 +++++++++-
 src/timer/event-data-tstamp.c   | 10 +++++++++-
 src/timer/event.c               | 10 +++++++++-
 17 files changed, 129 insertions(+), 17 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/63
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/63.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
