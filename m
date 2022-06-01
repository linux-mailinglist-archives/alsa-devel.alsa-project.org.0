Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C32CB539B70
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jun 2022 05:05:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA961A40;
	Wed,  1 Jun 2022 05:04:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA961A40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654052717;
	bh=6vheTv1FUJnYOdOhgpkBM2poxBrCsdofFUjkcwjw024=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNqPdKLWTFWwBtsagSGUdkhy4BN4cCbnWatrDOsuJ5DUOrQiontjEfaEej2g9Jmkt
	 W/rLmKxo5XpTB8HUiL0Pjol3kffbf1qzxlMF8x4mcXLX4vMuWityu/eoHVLpkf2vYy
	 00vsO6wbPSzA11qBapZxtvzlYDxN3p+t30rUlXeE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA5FF800BD;
	Wed,  1 Jun 2022 05:04:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FA3AF80238; Wed,  1 Jun 2022 05:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 09F9BF80149
 for <alsa-devel@alsa-project.org>; Wed,  1 Jun 2022 05:04:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09F9BF80149
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1654052652574862003-webhooks-bot@alsa-project.org>
References: <1654052652574862003-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/13] ctl: add interfaces for element information
Message-Id: <20220601030417.7FA3AF80238@alsa1.perex.cz>
Date: Wed,  1 Jun 2022 05:04:17 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #71 was opened from takaswie:

Current implementation uses function of ElemInfo to express variants of element
information, however it's not enough convenient in the case of language bindings.
The usage of GObject.Value in object property is expected to be supported widely
instead.

This patchset uses object classes derived from GObject to express the variants.
The common properties are expressed by two interfaces; ElemInfoCommon and
ElemInfoSingleArray. All of classes implement the former, and the latter is
implemented except for IEC60958 element information.

```
Takashi Sakamoto (13):
  ctl: card: fix indentation
  fix missing usage of declaration macro
  ctl: card: add error path when generating name list at element addition
  ctl: elem-info-common: add common interface for element information
  ctl: elem-info-iec60958: add class for element information of IEC60958 type
  ctl: elem-info-single-array: add interface for single array element information
  ctl: elem-info-boolean: add class for element information of boolean type
  ctl: elem-info-bytes: add class for element information of bytes type
  ctl: elem-info-integer: add class for element information of integer type
  ctl: elem-info-integer64: add class for element information of integer64 type
  ctl: elem-info-enumerated: add class for element information of enumerated type
  ctl: card: use ALSACtl.ElemInfoCommon instead of ElemInfo
  ctl: elem-info: remove unused classes

 samples/ctl                                   |  56 +--
 src/ctl/alsactl-enum-types.h                  |   4 +
 src/ctl/alsactl.h                             |  10 +-
 src/ctl/alsactl.map                           |  30 +-
 src/ctl/card.c                                | 156 ++++---
 src/ctl/card.h                                |   6 +-
 src/ctl/elem-info-boolean.c                   |  90 +++++
 src/ctl/elem-info-boolean.h                   |  22 +
 src/ctl/elem-info-bytes.c                     |  89 ++++
 src/ctl/elem-info-bytes.h                     |  21 +
 src/ctl/elem-info-common.c                    | 135 +++++++
 src/ctl/elem-info-common.h                    |  20 +
 src/ctl/elem-info-enumerated.c                | 137 +++++++
 src/ctl/elem-info-enumerated.h                |  22 +
 src/ctl/elem-info-iec60958.c                  |  80 ++++
 src/ctl/elem-info-iec60958.h                  |  22 +
 src/ctl/elem-info-integer.c                   | 162 ++++++++
 src/ctl/elem-info-integer.h                   |  22 +
 src/ctl/elem-info-integer64.c                 | 162 ++++++++
 src/ctl/elem-info-integer64.h                 |  22 +
 src/ctl/elem-info-single-array.c              |  68 ++++
 src/ctl/elem-info-single-array.h              |  20 +
 src/ctl/elem-info.c                           | 379 ------------------
 src/ctl/elem-info.h                           |  30 --
 src/ctl/meson.build                           |  18 +-
 src/ctl/privates.h                            |  54 ++-
 src/hwdep/alsahwdep-enum-types.h              |   4 +
 src/rawmidi/alsarawmidi-enum-types.h          |   4 +
 src/seq/alsaseq-enum-types.h                  |   4 +
 src/timer/alsatimer-enum-types.h              |   4 +
 ...tl-elem-info => alsactl-elem-info-boolean} |  10 +-
 tests/alsactl-elem-info-bytes                 |  26 ++
 tests/alsactl-elem-info-enumerated            |  27 ++
 tests/alsactl-elem-info-iec60958              |  25 ++
 tests/alsactl-elem-info-integer               |  29 ++
 tests/alsactl-elem-info-integer64             |  29 ++
 tests/meson.build                             |   7 +-
 37 files changed, 1492 insertions(+), 514 deletions(-)
 create mode 100644 src/ctl/elem-info-boolean.c
 create mode 100644 src/ctl/elem-info-boolean.h
 create mode 100644 src/ctl/elem-info-bytes.c
 create mode 100644 src/ctl/elem-info-bytes.h
 create mode 100644 src/ctl/elem-info-common.c
 create mode 100644 src/ctl/elem-info-common.h
 create mode 100644 src/ctl/elem-info-enumerated.c
 create mode 100644 src/ctl/elem-info-enumerated.h
 create mode 100644 src/ctl/elem-info-iec60958.c
 create mode 100644 src/ctl/elem-info-iec60958.h
 create mode 100644 src/ctl/elem-info-integer.c
 create mode 100644 src/ctl/elem-info-integer.h
 create mode 100644 src/ctl/elem-info-integer64.c
 create mode 100644 src/ctl/elem-info-integer64.h
 create mode 100644 src/ctl/elem-info-single-array.c
 create mode 100644 src/ctl/elem-info-single-array.h
 delete mode 100644 src/ctl/elem-info.c
 delete mode 100644 src/ctl/elem-info.h
 rename tests/{alsactl-elem-info => alsactl-elem-info-boolean} (68%)
 create mode 100644 tests/alsactl-elem-info-bytes
 create mode 100644 tests/alsactl-elem-info-enumerated
 create mode 100644 tests/alsactl-elem-info-iec60958
 create mode 100644 tests/alsactl-elem-info-integer
 create mode 100644 tests/alsactl-elem-info-integer64
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/71
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/71.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
