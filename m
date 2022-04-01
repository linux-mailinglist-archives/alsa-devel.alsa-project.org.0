Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A44A4EE58C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Apr 2022 03:06:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2013F18A0;
	Fri,  1 Apr 2022 03:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2013F18A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648775217;
	bh=YUrasn1FgxdUNw4JxzSoOr6Wy/ZMaHL12dBIlgDQFN8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gygsWWmOIuk5sU+ozN5gCQ3+IXt4RBGle3CdLmR0otZORRWZht5R1i45Ioq+dH5jC
	 6UYd5YuwSztmVa1An0yIBwh9X/mF3qW3ElzWl2zKRHpv7vZTJHPe94H2ogXnhDzByN
	 l4sDhwOOb6d5KkI/EICkS6BD5rIgraL5dIsU9J9o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86EACF800E4;
	Fri,  1 Apr 2022 03:05:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F672F8020D; Fri,  1 Apr 2022 03:05:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 11C68F800B8
 for <alsa-devel@alsa-project.org>; Fri,  1 Apr 2022 03:05:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11C68F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648775142388217926-webhooks-bot@alsa-project.org>
References: <1648775142388217926-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/6] add internal static library to include common utilities
Message-Id: <20220401010547.6F672F8020D@alsa1.perex.cz>
Date: Fri,  1 Apr 2022 03:05:47 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #67 was opened from takaswie:

Current implementation of included libraries have duplicated codes
to operate over sysfs by libudev and so. It's inconvenient in a point of
maintenance.

This patchset adds internal static library to include such codes.

```
Takashi Sakamoto (6):
  utils: build internal static library including common utilities
  utils: add utility to compute integer value from string literal
  utils: add utilities to allocate string information for device
  utils: add utilitiy to generate list of sysnum by prefix of sysname
  utils: add utilities to request control ioctl
  utils: add utility macros to generate GError with file domain

 src/ctl/card.c            |   5 +-
 src/ctl/meson.build       |   2 +-
 src/ctl/query.c           | 261 ++----------------------------
 src/hwdep/meson.build     |   2 +-
 src/hwdep/query.c         | 306 +++--------------------------------
 src/meson.build           |   1 +
 src/rawmidi/meson.build   |   2 +-
 src/rawmidi/query.c       | 324 ++++----------------------------------
 src/rawmidi/stream-pair.c |   5 +-
 src/seq/meson.build       |   2 +-
 src/seq/query.c           |  87 ++--------
 src/seq/user-client.c     |   5 +-
 src/timer/meson.build     |   2 +-
 src/timer/query.c         | 105 +++---------
 src/timer/user-instance.c |   5 +-
 src/utils/ioctl.c         |  45 ++++++
 src/utils/meson.build     |  23 +++
 src/utils/string.c        |  47 ++++++
 src/utils/sysfs.c         | 176 +++++++++++++++++++++
 src/utils/utils.h         | 176 +++++++++++++++++++++
 20 files changed, 578 insertions(+), 1003 deletions(-)
 create mode 100644 src/utils/ioctl.c
 create mode 100644 src/utils/meson.build
 create mode 100644 src/utils/string.c
 create mode 100644 src/utils/sysfs.c
 create mode 100644 src/utils/utils.h
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/67
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/67.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
