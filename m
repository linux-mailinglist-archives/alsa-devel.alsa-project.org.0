Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 32ED54ED1B4
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 04:26:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B421118F2;
	Thu, 31 Mar 2022 04:26:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B421118F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648693617;
	bh=iWPNMw9W12xpP6KHeikmbn0F77oR3uTYshL6+jB2dc8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IVs8OBfcfqPYHQnISop/QYH3ENwUwVMNoNcq0L74Gr/ABnauHxmz+xC8eHkkrfNPh
	 sVtw4xGAja8Sp6QsJw4aOV1ZaspORkzeOq906KHFsHf5UNKz8QKaeXJZ94rUTmp0GB
	 s66J2wHDOxVgu3VjYGkzUyDHD82t7MqHuXhsPDOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 305DEF80238;
	Thu, 31 Mar 2022 04:25:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FEEAF80227; Thu, 31 Mar 2022 04:25:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C9209F800B8
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 04:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9209F800B8
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648693541401184082-webhooks-bot@alsa-project.org>
References: <1648693541401184082-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/7] meson: refactor common part of configuration
Message-Id: <20220331022548.8FEEAF80227@alsa1.perex.cz>
Date: Thu, 31 Mar 2022 04:25:48 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #66 was opened from takaswie:

In this project, meson configuration for included libraries consists of
two parts; common and specific. During development, the common part
gains differences between libraries. This patchset refactors meson
configuration to increase the same expression in the common part.

```
Takashi Sakamoto (7):
  timer: code refactoring for search path of alsatimer header
  meson: aggregate dependency declaration on glib/gobject and libudev
  meson: aggregate module imports
  meson: fulfill missing sources for gir scanner which are blank
  meson: move pkg-config description to metadata part
  meson: aggregate and move extra gir to metadata part
  meson: move path to top header to metadata part

 meson.build             |  2 --
 src/ctl/meson.build     | 37 +++++++++++++++-------------------
 src/hwdep/meson.build   | 39 ++++++++++++++++--------------------
 src/meson.build         | 15 ++++++++++++++
 src/rawmidi/meson.build | 38 ++++++++++++++++-------------------
 src/seq/meson.build     | 44 ++++++++++++++++++-----------------------
 src/timer/meson.build   | 40 +++++++++++++++++--------------------
 7 files changed, 102 insertions(+), 113 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/66
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/66.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
