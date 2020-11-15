Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 722BE2B320E
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 04:20:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E059F1898;
	Sun, 15 Nov 2020 04:20:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E059F1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605410459;
	bh=UNA7akrqjFlSyp7BxBV4APpbUw0NKHdzVD0yPKjK5jQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CYok4ybcwVYoye9MF9/bfQt38BDxOlyD6ZSVrSgqXpzl/apTBrnVAgdYgJ0GuVDZU
	 MpMpCWVgD90zowfKxlR7rOHTlVuoTMFbcBftSilgbYfwrP6ZgbZhHoVtZyBceSZnS3
	 NfW9vDHTbzzgVLPDjHDv8DySzz73iEA1Vfb2CNbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39CAAF801F9;
	Sun, 15 Nov 2020 04:19:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F56CF801F5; Sun, 15 Nov 2020 04:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id AB16BF800D8
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 04:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AB16BF800D8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605410360573412895-webhooks-bot@alsa-project.org>
References: <1605410360573412895-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/15] alsa-gobject: seq: enhancement for error reporting
Message-Id: <20201115031924.5F56CF801F5@alsa1.perex.cz>
Date: Sun, 15 Nov 2020 04:19:24 +0100 (CET)
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

alsa-project/alsa-gobject pull request #50 was opened from takaswie:

The patchset is the part of work about #47.

Current implementation uses library-wide error domain to report error. this
is partly against rule of GError usage. Furthermore, the error delivers
information just about errno and hard to know the cause of error.

This patchset enhances error reporting. The library-wide error domain is
obsoleted. A new error domain is added just for ALSASeq.UserClient.
The error domain delivers information about the cause of error.

```
Takashi Sakamoto (15):
  seq: skip check of return value from g_malloc()
  seq: check whether method argument for GError is available
  seq: add checks for method arguments
  seq: user_client: just return when character device is not opened
  seq: add GLib enumeration to report type of error for ALSASeq.UserClient
  seq: user_client: add GQuark to report error for ALSASeq.UserClient
  seq: user_client: report error for ioctl
  seq: user_client: report open/write error
  seq: user_client: report error for port access permission
  seq: user_client: report error for queue access permission
  seq: user_client: update function comment for error reporting
  seq: query: use GFileError to report error
  seq: query: code refactoring to unify code to open file descriptor
  seq: query: code refactoring for error path
  seq: obsolete library-wide error quark

 src/seq/alsaseq-enum-types.h |  14 ++
 src/seq/alsaseq.map          |   5 +
 src/seq/client-info.c        |  20 +-
 src/seq/event-cntr.c         | 341 +++++++++++++++++----------------
 src/seq/privates.h           |   6 -
 src/seq/query.c              | 356 +++++++++++++++--------------------
 src/seq/queue-status.c       |   4 +
 src/seq/queue-tempo.c        |   4 +
 src/seq/queue-timer.c        |   4 +
 src/seq/remove-filter.c      |  42 ++---
 src/seq/user-client.c        | 275 ++++++++++++++++++---------
 src/seq/user-client.h        |   4 +
 tests/alsaseq-enums          |   7 +
 13 files changed, 566 insertions(+), 516 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/50
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/50.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
