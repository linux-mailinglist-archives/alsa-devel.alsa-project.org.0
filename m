Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB164DABCF
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 08:27:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BDF81743;
	Wed, 16 Mar 2022 08:26:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BDF81743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647415649;
	bh=oGuKi8Ne9yMyAWhV9d9KKyb6DB0590Vu+6/ed0Bm7vE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tS3gx5B5/Dd2q3LRmV5iYohnZzYak7RlogdwXWkBDvFZlkIfYVyahgXSZ9GoxhZfj
	 MlrgF0BzyuzqsB9H9o3tVtHHj9+Dvz1t0mqVLp4gYGtlZkpExe1lrw5QvqyFjgLdf9
	 z2R8kU4GkMsd2djBJWFfku2ZZhWqeUDVrralr0m8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA65FF801F5;
	Wed, 16 Mar 2022 08:26:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F262AF8019D; Wed, 16 Mar 2022 08:26:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 759F8F80087
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 08:26:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 759F8F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647415572388787985-webhooks-bot@alsa-project.org>
References: <1647415572388787985-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/19] migrate to gi docgen
Message-Id: <20220316072619.F262AF8019D@alsa1.perex.cz>
Date: Wed, 16 Mar 2022 08:26:19 +0100 (CET)
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

alsa-project/alsa-gobject pull request #64 was opened from takaswie:

This patcset is to migrate to gi-docgen, which is used by the latest GNOME applications to generate documentation. Additionally, some headers are installed as entry for the other headers in each library.

```
Takashi Sakamoto (19):
  meson: infer library soname for .pc file
  meson: obsolete usage of deprecated meson.build_dir()
  meson: minor code refactoring for include directories
  meson: code refactoring to remove useless assignments for include headers
  ctl: add entry header to aggregate header inclusion
  hwdep: add entry header to aggregate header inclusion
  rawmidi: add entry header to aggregate header inclusion
  timer: add entry header to aggregate header inclusion
  seq: add entry header to aggregate header inclusion
  ci: remove outdated actions
  meson: rename gtk_doc option
  ci: update build environment to use gi-docgen
  meson: minor code refactoring for option of documentation
  ctl: migrate to gi-docgen from gtk-doc
  hwdep: migrate to gi-docgen from gtk-doc
  rawmidi: migrate to gi-docgen from gtk-doc
  timer: migrate to gi-docgen from gtk-doc
  seq: migrate to gi-docgen from gtk-doc
  doc: install HTML file for index page

 .github/workflows/build.yml                | 90 ++--------------------
 README.rst                                 |  8 +-
 doc/ctl/alsactl.toml.in                    | 34 ++++++++
 doc/ctl/meson.build                        | 27 +++++++
 doc/ctl/overview.md                        |  5 ++
 doc/ctl/urlmap.js                          |  4 +
 doc/hwdep/alsahwdep.toml.in                | 34 ++++++++
 doc/hwdep/meson.build                      | 27 +++++++
 doc/hwdep/overview.md                      |  7 ++
 doc/hwdep/urlmap.js                        |  4 +
 doc/index.html.in                          | 19 +++++
 doc/meson.build                            | 28 ++++++-
 doc/rawmidi/alsarawmidi.toml.in            | 34 ++++++++
 doc/rawmidi/meson.build                    | 27 +++++++
 doc/rawmidi/overview.md                    |  6 ++
 doc/rawmidi/urlmap.js                      |  4 +
 doc/reference/ctl/alsactl-docs.xml         | 51 ------------
 doc/reference/ctl/alsactl.types            | 10 ---
 doc/reference/ctl/meson.build              | 10 ---
 doc/reference/hwdep/alsahwdep-docs.xml     | 47 -----------
 doc/reference/hwdep/alsahwdep.types        |  1 -
 doc/reference/hwdep/meson.build            | 10 ---
 doc/reference/meson.build                  | 14 ----
 doc/reference/rawmidi/alsarawmidi-docs.xml | 49 ------------
 doc/reference/rawmidi/alsarawmidi.types    |  6 --
 doc/reference/rawmidi/meson.build          | 10 ---
 doc/reference/seq/alsaseq-docs.xml         | 65 ----------------
 doc/reference/seq/alsaseq.types            | 37 ---------
 doc/reference/seq/meson.build              | 10 ---
 doc/reference/timer/alsatimer-docs.xml     | 56 --------------
 doc/reference/timer/alsatimer.types        | 18 -----
 doc/reference/timer/meson.build            | 10 ---
 doc/reference/version.xml.in               |  1 -
 doc/seq/alsaseq.toml.in                    | 40 ++++++++++
 doc/seq/meson.build                        | 28 +++++++
 doc/seq/overview.md                        |  6 ++
 doc/seq/urlmap.js                          |  5 ++
 doc/timer/alsatimer.toml.in                | 34 ++++++++
 doc/timer/meson.build                      | 27 +++++++
 doc/timer/overview.md                      |  6 ++
 doc/timer/urlmap.js                        |  4 +
 meson.build                                |  6 +-
 meson_options.txt                          |  2 +-
 src/ctl/alsactl-enum-types.h               |  2 -
 src/ctl/alsactl.h                          | 24 ++++++
 src/ctl/card-info.h                        |  3 +-
 src/ctl/card.c                             |  2 -
 src/ctl/card.h                             | 10 +--
 src/ctl/elem-id.h                          |  7 +-
 src/ctl/elem-info.h                        |  7 +-
 src/ctl/elem-value.h                       |  5 +-
 src/ctl/meson.build                        | 45 +++++------
 src/ctl/privates.h                         | 12 +--
 src/ctl/query.c                            |  1 -
 src/ctl/query.h                            |  3 +-
 src/hwdep/alsahwdep-enum-types.h           |  1 -
 src/hwdep/alsahwdep.h                      | 17 ++++
 src/hwdep/device-info.h                    |  5 +-
 src/hwdep/meson.build                      | 55 ++++++-------
 src/hwdep/privates.h                       |  4 +-
 src/hwdep/query.c                          |  1 -
 src/hwdep/query.h                          |  5 +-
 src/meson.build                            |  2 +
 src/rawmidi/alsarawmidi-enum-types.h       |  2 -
 src/rawmidi/alsarawmidi.h                  | 21 +++++
 src/rawmidi/meson.build                    | 44 +++++------
 src/rawmidi/privates.h                     | 11 +--
 src/rawmidi/query.c                        |  1 -
 src/rawmidi/query.h                        |  6 +-
 src/rawmidi/stream-pair.c                  |  2 -
 src/rawmidi/stream-pair.h                  |  8 +-
 src/rawmidi/substream-info.h               |  5 +-
 src/rawmidi/substream-params.h             |  3 +-
 src/rawmidi/substream-status.h             |  3 +-
 src/seq/addr.c                             |  2 +-
 src/seq/addr.h                             |  5 +-
 src/seq/alsaseq-enum-types.h               |  2 -
 src/seq/alsaseq.h                          | 38 +++++++++
 src/seq/client-info.h                      |  5 +-
 src/seq/client-pool.h                      |  3 +-
 src/seq/event-cntr.h                       | 12 +--
 src/seq/event-data-connect.c               |  2 +-
 src/seq/event-data-connect.h               |  7 +-
 src/seq/event-data-ctl.c                   |  2 +-
 src/seq/event-data-ctl.h                   |  7 +-
 src/seq/event-data-note.c                  |  2 +-
 src/seq/event-data-note.h                  |  5 +-
 src/seq/event-data-queue.c                 |  2 +-
 src/seq/event-data-queue.h                 |  7 +-
 src/seq/event-data-result.c                |  2 +-
 src/seq/event-data-result.h                |  7 +-
 src/seq/meson.build                        | 46 +++++------
 src/seq/port-info.h                        |  6 +-
 src/seq/privates.h                         | 18 +----
 src/seq/query.c                            |  1 -
 src/seq/query.h                            | 11 +--
 src/seq/queue-info.h                       |  3 +-
 src/seq/queue-status.h                     |  3 +-
 src/seq/queue-tempo.h                      |  3 +-
 src/seq/queue-timer-data-alsa.c            |  2 +-
 src/seq/queue-timer-data-alsa.h            |  6 +-
 src/seq/queue-timer.c                      |  4 +-
 src/seq/queue-timer.h                      |  6 +-
 src/seq/remove-filter.c                    |  1 -
 src/seq/remove-filter.h                    |  8 +-
 src/seq/subscribe-data.h                   |  6 +-
 src/seq/system-info.h                      |  3 +-
 src/seq/tstamp.c                           |  2 +-
 src/seq/tstamp.h                           |  5 +-
 src/seq/user-client.c                      |  2 -
 src/seq/user-client.h                      | 13 +---
 src/timer/alsatimer-enum-types.h           |  2 -
 src/timer/alsatimer.h                      | 28 +++++++
 src/timer/device-id.c                      |  2 +-
 src/timer/device-id.h                      |  7 +-
 src/timer/device-info.h                    |  5 +-
 src/timer/device-params.h                  |  5 +-
 src/timer/device-status.h                  |  3 +-
 src/timer/event-data-tick.c                |  1 -
 src/timer/event-data-tick.h                |  5 +-
 src/timer/event-data-tstamp.c              |  1 -
 src/timer/event-data-tstamp.h              |  7 +-
 src/timer/event.c                          |  2 +-
 src/timer/event.h                          |  6 +-
 src/timer/instance-info.h                  |  5 +-
 src/timer/instance-params.c                |  3 -
 src/timer/instance-params.h                |  5 +-
 src/timer/instance-status.c                |  4 +-
 src/timer/instance-status.h                |  3 +-
 src/timer/meson.build                      | 38 +++++----
 src/timer/privates.h                       |  9 +--
 src/timer/query.c                          |  2 -
 src/timer/query.h                          | 10 +--
 src/timer/user-instance.c                  |  2 -
 src/timer/user-instance.h                  |  9 +--
 tests/meson.build                          |  4 +-
 136 files changed, 738 insertions(+), 927 deletions(-)
 create mode 100644 doc/ctl/alsactl.toml.in
 create mode 100644 doc/ctl/meson.build
 create mode 100644 doc/ctl/overview.md
 create mode 100644 doc/ctl/urlmap.js
 create mode 100644 doc/hwdep/alsahwdep.toml.in
 create mode 100644 doc/hwdep/meson.build
 create mode 100644 doc/hwdep/overview.md
 create mode 100644 doc/hwdep/urlmap.js
 create mode 100644 doc/index.html.in
 create mode 100644 doc/rawmidi/alsarawmidi.toml.in
 create mode 100644 doc/rawmidi/meson.build
 create mode 100644 doc/rawmidi/overview.md
 create mode 100644 doc/rawmidi/urlmap.js
 delete mode 100644 doc/reference/ctl/alsactl-docs.xml
 delete mode 100644 doc/reference/ctl/alsactl.types
 delete mode 100644 doc/reference/ctl/meson.build
 delete mode 100644 doc/reference/hwdep/alsahwdep-docs.xml
 delete mode 100644 doc/reference/hwdep/alsahwdep.types
 delete mode 100644 doc/reference/hwdep/meson.build
 delete mode 100644 doc/reference/meson.build
 delete mode 100644 doc/reference/rawmidi/alsarawmidi-docs.xml
 delete mode 100644 doc/reference/rawmidi/alsarawmidi.types
 delete mode 100644 doc/reference/rawmidi/meson.build
 delete mode 100644 doc/reference/seq/alsaseq-docs.xml
 delete mode 100644 doc/reference/seq/alsaseq.types
 delete mode 100644 doc/reference/seq/meson.build
 delete mode 100644 doc/reference/timer/alsatimer-docs.xml
 delete mode 100644 doc/reference/timer/alsatimer.types
 delete mode 100644 doc/reference/timer/meson.build
 delete mode 100644 doc/reference/version.xml.in
 create mode 100644 doc/seq/alsaseq.toml.in
 create mode 100644 doc/seq/meson.build
 create mode 100644 doc/seq/overview.md
 create mode 100644 doc/seq/urlmap.js
 create mode 100644 doc/timer/alsatimer.toml.in
 create mode 100644 doc/timer/meson.build
 create mode 100644 doc/timer/overview.md
 create mode 100644 doc/timer/urlmap.js
 create mode 100644 src/ctl/alsactl.h
 create mode 100644 src/hwdep/alsahwdep.h
 create mode 100644 src/rawmidi/alsarawmidi.h
 create mode 100644 src/seq/alsaseq.h
 create mode 100644 src/timer/alsatimer.h

-- 
2.34.1
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/64
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/64.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
