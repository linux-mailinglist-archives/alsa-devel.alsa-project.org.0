Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FA72B44E7
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Nov 2020 14:44:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6871A16E6;
	Mon, 16 Nov 2020 14:43:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6871A16E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605534253;
	bh=x7FvolylYJUeQ5plvppdf1SPkKEZG/cgAXKPGybtkuk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dc1ua053EcpulxzAhBlolR7b5RVdd3l8sZ54Exw+IP4Vsj0BQtXLB9Iyuktfgv6Eu
	 a6sfLd/SM6lNr8XE4nR10OIcbr8Xhjc1mWE1kgeuFrgBUsb6i4416TUnY16x86Gahz
	 cD/2J/gsoS3bj28YKuxPPJzPoQxIMPoJnoLhsmIo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C73F8016C;
	Mon, 16 Nov 2020 14:42:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84C3DF80168; Mon, 16 Nov 2020 14:42:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A7108F8014A
 for <alsa-devel@alsa-project.org>; Mon, 16 Nov 2020 14:42:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7108F8014A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605534150200311899-webhooks-bot@alsa-project.org>
References: <1605534150200311899-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/2] alsa-gobject: rawmidi: fix to select substream
Message-Id: <20201116134237.84C3DF80168@alsa1.perex.cz>
Date: Mon, 16 Nov 2020 14:42:37 +0100 (CET)
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

alsa-project/alsa-gobject pull request #54 was opened from takaswie:

This patchset fixes #53 .

ALSARawmidi.StreamPair.open() has `subdevice_id` argument to select
one of substreams supported by the Rawmidi device. However, this
parameter is ignored and the first substream is always selected.

In ALSA rawmidi core, private structure associated to file descriptor
to control character device assists selection of rawmidi substream.
It requires to keep the file descriptor until the selected substream
is actually attached by open rawmidi character device.

Current implementation of libalsarawmidi is to close the file descriptor
before opening rawmidi character device. This is the cause of the issue.

This commit fixes the bug by keeping the file descriptor till opening
rawmidi character device.

```
Takashi Sakamoto (2):
  rawmidi: query: allow caller to take ownership of file descriptor for control character device
  rawmidi: stream_pair: fix to select substream

 src/rawmidi/privates.h    |  2 +-
 src/rawmidi/query.c       | 16 ++++++++++------
 src/rawmidi/stream-pair.c |  4 +++-
 3 files changed, 14 insertions(+), 8 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/54
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/54.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
