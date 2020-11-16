Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4F2B3B8F
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 03:56:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B71D1797;
	Mon, 16 Nov 2020 03:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B71D1797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605495397;
	bh=itw23dt0/s3QPodsHQd9VUFHQvfz6nIHig74Aqskff0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XlTuc1OV6mifaoNQwL5xHmSqdsxThi8i9oPh8zHOmW1QmpJANrs5v1SBxw65VAiB+
	 c6Mc5E5kNj+tG0sgVTEuVUM8uxxdD44Vp/Qq8qCfWWkpOmZdKhb4vm/6Q8pR5qWgAn
	 KlVXcRiRjhnPz9MZturBFqdTsV0L/GKkRMUTTfgk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84EA0F80168;
	Mon, 16 Nov 2020 03:55:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49106F80168; Mon, 16 Nov 2020 03:55:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C8E62F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 03:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8E62F8014A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605495297316016912-webhooks-bot@alsa-project.org>
References: <1605495297316016912-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/15] alsa-gobject: rawmidi: enhancement for error reporting
Message-Id: <20201116025502.49106F80168@alsa1.perex.cz>
Date: Mon, 16 Nov 2020 03:55:02 +0100 (CET)
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

alsa-project/alsa-gobject pull request #52 was opened from takaswie:

The patchset is the part of work about #47.

Current implementation uses library-wide error domain to report error. this
is partly against rule of GError usage. Furthermore, the error delivers
information just about errno and hard to know the cause of error.

This patchset enhances error reporting. The library-wide error domain is
obsoleted. A new error domain is added just for ALSARawmidi.StreamPair.
The error domain delivers information about the cause of error

```
Takashi Sakamoto (15):
  timer: user_instance: fix code for GFileError
  seq: user_client: fix code for GFileError
  rawmidi: skip check of return value from g_malloc()
  rawmidi: check whether method argument for GError is available
  rawmidi: add checks for method arguments
  rawmidi: stream_pair: just return when character device is not opened
  rawmidi: query: simplify count check
  rawmidi: add GLib enumerations for error reporting
  rawmidi: stream-pair: add GQuark to report error for ALSARawmidi.StreamPair
  rawmidi: report error for ioctl
  rawmidi: report open/read/write/fcntl error
  rawmidi: report error for card disconnection state
  rawmidi: stream_pair: report error about write-only file descriptor
  rawmidi: query: use GFileError to report error
  rawmidi: obsolete library-wide GQuark for error reporting

 src/rawmidi/alsarawmidi-enum-types.h |  14 +++
 src/rawmidi/alsarawmidi.map          |   5 +
 src/rawmidi/privates.h               |   6 -
 src/rawmidi/query.c                  | 117 ++++++++----------
 src/rawmidi/stream-pair.c            | 172 +++++++++++++++++++++------
 src/rawmidi/stream-pair.h            |   4 +
 src/seq/user-client.c                |   6 +-
 src/timer/user-instance.c            |   2 +-
 tests/alsarawmidi-enums              |   6 +
 9 files changed, 216 insertions(+), 116 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/52
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/52.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
