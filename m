Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7442B2ABC
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Nov 2020 03:01:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2625A18C7;
	Sat, 14 Nov 2020 03:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2625A18C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605319304;
	bh=awtJk2yN29GtGxjdWt64UNFlOwSbelDvdddBaYAMUao=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LbbGgHOF6VXkYgttPKAMCrmt5Dl7x3RlPw+wxGPVrs/Yfc6COFYU/sOEu8PV5lya4
	 BGDgkuboWX2fmxRnakU1Di+u/8YxNYOHq0t5XxjIQpxbqPS8MnPYpIweQOmAdlw3hr
	 pLuDDYr2AkyeAsyOJw0vS214KsARhnTsUgURMFOc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A14AF8022B;
	Sat, 14 Nov 2020 03:00:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11FF1F8020C; Sat, 14 Nov 2020 03:00:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B25C9F80086
 for <alsa-devel@alsa-project.org>; Sat, 14 Nov 2020 03:00:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B25C9F80086
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605319200597511053-webhooks-bot@alsa-project.org>
References: <1605319200597511053-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/16] alsa-gobject: timer: enhancement for error reporting
Message-Id: <20201114020008.11FF1F8020C@alsa1.perex.cz>
Date: Sat, 14 Nov 2020 03:00:08 +0100 (CET)
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

alsa-project/alsa-gobject pull request #49 was opened from takaswie:

The patchset is a part of work about #47.

Current implementation uses library-wide error domain to report error. this
is partly against rule of GError usage. Furthermore, the error delivers
information just about errno and hard to know the cause of error.

This patchset enhances error reporting. The library-wide error domain is
obsoleted. A new error domain is added just for ALSATimer.UserInstance.
The error domain delivers information about the cause of error.

```
Takashi Sakamoto (16):
  timer: user_instance: fix function comment
  timer: skip check of return value from g_malloc()
  timer: check whether method argument for GError is available
  timer: add checks for method arguments
  timer: instance-params: add checks for method arguments
  timer: user_instance: just return when character device is not opened
  timer: add GLib enumeration to report type of error for ALSATimer.UserInstance
  timer: user_instance: add GQuark to report error for ALSATimer.UserInstance
  timer: user_instance: report error due to ioctl failure
  timer: user_instance: report error due to open system call
  timer: user_instance: report error for timer instance not found
  timer: user_instance: report error for unattached timer instance
  timer: user_instance: report error for timer already attached
  timer: query: use GFileError to report error
  timer: query: code refactoring to unify open function
  timer: obsolete library-wide GQuark for error reporting

 src/timer/alsatimer-enum-types.h |  18 ++++
 src/timer/alsatimer.map          |   5 +
 src/timer/instance-params.c      |  20 ++--
 src/timer/instance-status.c      |   3 +-
 src/timer/privates.h             |   6 --
 src/timer/query.c                | 127 ++++++++++++------------
 src/timer/user-instance.c        | 165 +++++++++++++++++++++++--------
 src/timer/user-instance.h        |   4 +
 tests/alsatimer-enums            |   8 ++
 9 files changed, 231 insertions(+), 125 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/49
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/49.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
