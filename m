Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A082C54F3D9
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 11:06:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 329C518E5;
	Fri, 17 Jun 2022 11:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 329C518E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655456776;
	bh=X2TyTGW1h7KM95fR18azlxYYqryjiBivwn1Y2noV83s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CREnhEHKqXG3Deu0Gs+0PR2Ghs0ImwI8SXRD25z7XPhrwVXTwF6Q92ZX0UJvZ0np3
	 9CTi0Rn8+C8FsF2B+7XWn/p1DQpa84K2cvaT1z7eDMUtqDgqD/zjwvimoRGPIuw3LX
	 f6jNeLIp0FGqFjanapYsNtx2W03k2C600yONsybA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF01F800B9;
	Fri, 17 Jun 2022 11:05:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9532F800B9; Fri, 17 Jun 2022 11:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B1B98F800B9
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 11:05:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B98F800B9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1655456709157319069-webhooks-bot@alsa-project.org>
References: <1655456709157319069-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/23] tests: refine test implementation
Message-Id: <20220617090515.C9532F800B9@alsa1.perex.cz>
Date: Fri, 17 Jun 2022 11:05:15 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #76 was opened from takaswie:

Current implementation of test just supports GObject-derived object,
enumerations, and flags. It's not possible to test the other types of
glib/gobject elements such as boxed structure.

This patchset refines test implementation. Some helper functions for
boxed structure and namespace/object functions are added. The existent
helper function is renamed as 'test_object' and rewritten to walk through
Python MRO hierarchy to check properties, virtual methods, and signals,
defined by both GObject-derived objects and interfaces.

I note that the tests are not done to execute actual symbols. They are just
to check they are available or not via interface described in metadata of
GObject Introspection.

```
Takashi Sakamoto (23):
  tests: rename helper function to test object interface
  tests: add helper function to test enumerations and flags
  tests: add test script for ALSACtl.ElemId boxed structure
  tests: add test script for ALSATimer.DeviceId boxed structure
  tests: add test script for ALSATimer.TickEvent boxed structure
  tests: add test script for ALSATimer.TstampEvent boxed structure
  tests: add test script for ALSASeq.Addr boxed structure
  tests: add test script for ALSASeq.EventCntr boxed structure
  tests: add test script for ALSASeq.Event boxed structure
  tests: add test script for ALSASeq.EventDataConnect boxed object
  tests: add test script for ALSASeq.EventDataCtl boxed structure
  tests: add test script for ALSASeq.EventDataNote boxed structure
  tests: add test script for ALSASeq.EventDataQueue boxed structure
  tests: add test script for ALSASeq.EventDataResult boxed structure
  tests: add test script for ALSASeq.RemoveFilter boxed structure
  tests: test object type instead of its instance
  tests: refine helper function to test object
  tests: test virtual functions in object
  tests: add test script for ALSACtl.ElemInfoCommon interface
  tests: add test script for ALSACtl.ElemInfoSingleArray interface
  tests: add test script for ALSAHwdep.DeviceCommon interface
  tests: add test script for ALSASeq.QueueTimerCommon interface
  tests: add test scripts for namespace functions

 tests/alsactl-card                   |  8 ++--
 tests/alsactl-card-info              |  7 +--
 tests/alsactl-elem-id                | 14 +++---
 tests/alsactl-elem-info-boolean      |  8 ++--
 tests/alsactl-elem-info-bytes        |  8 ++--
 tests/alsactl-elem-info-common       | 24 +++++++++++
 tests/alsactl-elem-info-enumerated   | 10 +++--
 tests/alsactl-elem-info-iec60958     |  8 ++--
 tests/alsactl-elem-info-integer      | 14 +++---
 tests/alsactl-elem-info-integer64    | 14 +++---
 tests/alsactl-elem-info-single-array | 21 +++++++++
 tests/alsactl-elem-value             |  7 +--
 tests/alsactl-enums                  | 11 ++---
 tests/alsactl-functions              | 26 +++++++++++
 tests/alsahwdep-device-common        | 32 ++++++++++++++
 tests/alsahwdep-device-info          |  7 +--
 tests/alsahwdep-enums                | 11 ++---
 tests/alsahwdep-functions            | 27 ++++++++++++
 tests/alsarawmidi-enums              | 11 ++---
 tests/alsarawmidi-functions          | 27 ++++++++++++
 tests/alsarawmidi-stream-pair        |  8 ++--
 tests/alsarawmidi-substream-info     |  7 +--
 tests/alsarawmidi-substream-params   |  7 +--
 tests/alsarawmidi-substream-status   |  7 +--
 tests/alsaseq-addr                   | 21 +++++++++
 tests/alsaseq-client-info            |  7 +--
 tests/alsaseq-client-pool            |  7 +--
 tests/alsaseq-enums                  | 13 +++---
 tests/alsaseq-event                  | 61 ++++++++++++++++++++++++++
 tests/alsaseq-event-cntr             | 18 ++++++++
 tests/alsaseq-event-data-connect     | 21 +++++++++
 tests/alsaseq-event-data-ctl         | 23 ++++++++++
 tests/alsaseq-event-data-note        | 27 ++++++++++++
 tests/alsaseq-event-data-queue       | 33 ++++++++++++++
 tests/alsaseq-event-data-result      | 24 +++++++++++
 tests/alsaseq-functions              | 35 +++++++++++++++
 tests/alsaseq-port-info              |  7 +--
 tests/alsaseq-queue-info             |  7 +--
 tests/alsaseq-queue-status           |  7 +--
 tests/alsaseq-queue-tempo            |  7 +--
 tests/alsaseq-queue-timer-alsa       | 14 +++---
 tests/alsaseq-queue-timer-common     | 22 ++++++++++
 tests/alsaseq-remove-filter          | 21 +++++++++
 tests/alsaseq-subscribe-data         |  7 +--
 tests/alsaseq-system-info            |  7 +--
 tests/alsaseq-user-client            | 13 ++++--
 tests/alsatimer-device-id            | 18 +++-----
 tests/alsatimer-device-info          |  7 +--
 tests/alsatimer-device-params        |  7 +--
 tests/alsatimer-device-status        |  7 +--
 tests/alsatimer-enums                | 10 ++---
 tests/alsatimer-functions            | 29 +++++++++++++
 tests/alsatimer-instance-info        |  7 +--
 tests/alsatimer-instance-params      |  7 +--
 tests/alsatimer-instance-status      |  7 +--
 tests/alsatimer-tick-event           | 19 +++++++++
 tests/alsatimer-tstamp-event         | 20 +++++++++
 tests/alsatimer-user-instance        | 14 +++---
 tests/helper.py                      | 64 +++++++++++++++++++++++-----
 tests/meson.build                    | 22 ++++++++++
 60 files changed, 800 insertions(+), 164 deletions(-)
 create mode 100644 tests/alsactl-elem-info-common
 create mode 100644 tests/alsactl-elem-info-single-array
 create mode 100644 tests/alsactl-functions
 create mode 100644 tests/alsahwdep-device-common
 create mode 100644 tests/alsahwdep-functions
 create mode 100644 tests/alsarawmidi-functions
 create mode 100644 tests/alsaseq-addr
 create mode 100644 tests/alsaseq-event
 create mode 100644 tests/alsaseq-event-cntr
 create mode 100644 tests/alsaseq-event-data-connect
 create mode 100644 tests/alsaseq-event-data-ctl
 create mode 100644 tests/alsaseq-event-data-note
 create mode 100644 tests/alsaseq-event-data-queue
 create mode 100644 tests/alsaseq-event-data-result
 create mode 100644 tests/alsaseq-functions
 create mode 100644 tests/alsaseq-queue-timer-common
 create mode 100644 tests/alsaseq-remove-filter
 create mode 100644 tests/alsatimer-functions
 create mode 100644 tests/alsatimer-tick-event
 create mode 100644 tests/alsatimer-tstamp-event
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/76
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/76.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
