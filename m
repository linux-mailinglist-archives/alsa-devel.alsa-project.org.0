Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED56537971
	for <lists+alsa-devel@lfdr.de>; Mon, 30 May 2022 12:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CA6C1A9B;
	Mon, 30 May 2022 12:50:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CA6C1A9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653907874;
	bh=WG3J+FVW69LkcqPJ5RYn2QVonnoVvfKzb9JaKyNZScs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NEWOfgmkOG4vyj/1n6IREQxpxz/7Kkakb4Uxy0hc5zZh+RazuOVCYdftmLyJ6+Ykj
	 h9YThWrEolN4jBsFr97zT45yK/PAzqjobHdDWzl6Dfi9r/6GhCjny9TCUXegMYK891
	 uu6CDfELzL1O/eEhUuScZs8+rUrsplzgm5wjeTtY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BBF6F801F5;
	Mon, 30 May 2022 12:50:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC4BEF8019D; Mon, 30 May 2022 12:50:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 52076F800E5
 for <alsa-devel@alsa-project.org>; Mon, 30 May 2022 12:50:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52076F800E5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1653907811198823929-webhooks-bot@alsa-project.org>
References: <1653907811198823929-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/15] rewrite public API according to convention of GNOME
 project
Message-Id: <20220530105014.AC4BEF8019D@alsa1.perex.cz>
Date: Mon, 30 May 2022 12:50:14 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #70 was opened from takaswie:

In GNOME convention for throw function which has an argument of GError to report failure, the function is programmed to return value of gboolean type to report whether the argument is filled with instance of GError. On the other hand, I wrote the throw functions to return nothing (void).

This patchset rewrite public API according to it. Unfortunately, it brings loss of backward compatibility.

```
Takashi Sakamoto (15):
  ctl: remove useless exposed symbols
  timer: user-instance: fix closure marshaller for event signal
  ctl: query: rewrite public API to return gboolean according to GNOME convention
  ctl: card: rewrite public API to return gboolean according to GNOME convention
  ctl: elem_info: rewrite public API to return gboolean according to GNOME convention
  rawmidi: query: rewrite public API to return gboolean according to GNOME convention
  rawmidi: stream_pair: rewrite public API to return gboolean according to GNOME convention
  hwdep: query: rewrite public API to return gboolean according to GNOME convention
  timer: query: rewrite public API to return gboolean according to GNOME convention
  timer: user_instance: rewrite public API to return gboolean according to GNOME convention
  timer: instance-params: rewrite public API to return gboolean according to GNOME convention
  seq: query: rewrite public API to return gboolean according to GNOME convention
  seq: user_client: rewrite public API to return gboolean according to GNOME convention
  seq: client_info: rewrite public API to return gboolean according to GNOME convention
  seq: event_cntr: rewrite public API to return gboolean according to GNOME convention

 samples/ctl                 |  21 +-
 samples/hwdep               |   8 +-
 samples/rawmidi             |  14 +-
 samples/seq                 |  37 +-
 samples/timer               |   9 +-
 src/ctl/alsactl.map         |  73 ++--
 src/ctl/card.c              | 322 +++++++++-------
 src/ctl/card.h              |  82 ++---
 src/ctl/elem-info.c         |  84 +++--
 src/ctl/elem-info.h         |  12 +-
 src/ctl/query.c             |  59 ++-
 src/ctl/query.h             |   8 +-
 src/hwdep/alsahwdep.map     |  13 +-
 src/hwdep/query.c           |  64 ++--
 src/hwdep/query.h           |  17 +-
 src/rawmidi/alsarawmidi.map |  37 +-
 src/rawmidi/privates.h      |   2 +-
 src/rawmidi/query.c         |  96 +++--
 src/rawmidi/query.h         |  37 +-
 src/rawmidi/stream-pair.c   | 163 +++++----
 src/rawmidi/stream-pair.h   |  31 +-
 src/seq/alsaseq.map         |  98 ++---
 src/seq/client-info.c       |  38 +-
 src/seq/client-info.h       |  16 +-
 src/seq/event-cntr.c        | 711 +++++++++++++++++++++---------------
 src/seq/event-cntr.h        | 203 +++++-----
 src/seq/query.c             | 298 +++++++++------
 src/seq/query.h             |  46 +--
 src/seq/user-client.c       | 413 +++++++++++++--------
 src/seq/user-client.h       | 140 +++----
 src/timer/alsatimer.map     |  44 ++-
 src/timer/instance-params.c |  30 +-
 src/timer/instance-params.h |   4 +-
 src/timer/query.c           | 163 ++++++---
 src/timer/query.h           |  23 +-
 src/timer/user-instance.c   | 192 ++++++----
 src/timer/user-instance.h   |  43 +--
 37 files changed, 2117 insertions(+), 1534 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/70
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/70.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
