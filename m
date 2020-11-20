Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F19F2BA4AA
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 09:32:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FED716F7;
	Fri, 20 Nov 2020 09:31:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FED716F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605861137;
	bh=CHJj/A5PWTqgqrwEMSIubqpetyVEL6A7AErVkE6qnbI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dpJ+UY/R7KOUsX7FflPAWk3VSPdYSyVb1VZNoaH2RmdRubTipDE5UBLbDzrBQvWCm
	 q5VMY7GzikvkpyDlUnZbGJ+6XnsLv/XRGs9AQAfIjaJphydPxk/TELlN6g1EO8lX/8
	 TA53/78Bh1YezTAiI77naUqSyeNMt19Pd0M+gQsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02216F800C5;
	Fri, 20 Nov 2020 09:30:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 588EFF8016C; Fri, 20 Nov 2020 09:30:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F0A17F80166
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 09:30:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0A17F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605861031748018026-webhooks-bot@alsa-project.org>
References: <1605861031748018026-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/4] alsa-gobject: bump project version up to v0.2.0 for new
 release
Message-Id: <20201120083042.588EFF8016C@alsa1.perex.cz>
Date: Fri, 20 Nov 2020 09:30:42 +0100 (CET)
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

alsa-project/alsa-gobject pull request #58 was opened from takaswie:

This patchset is a preparation for new release, including slight changes.

```
Takashi Sakamoto (4):
  hwdep: fix metadata and documentation for the type of interface
  upgrade CI operationg system to Ubuntu 20.04 LTS amd64
  upgrade CI operationg system to Fedora 33
  bump version up to 0.2.0 to release

 .github/workflows/build.yml      |  4 ++--
 README.rst                       |  7 ++++---
 meson.build                      |  2 +-
 src/hwdep/alsahwdep-enum-types.h | 22 +++++++++++++---------
 4 files changed, 20 insertions(+), 15 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/58
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/58.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
