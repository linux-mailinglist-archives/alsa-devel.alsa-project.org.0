Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B793941B1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 13:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C39016DC;
	Fri, 28 May 2021 13:18:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C39016DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622200788;
	bh=6LV5vzdns847H0HI2bMifyczUPzFTpgH5LJ+VHXvQbQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oRJ55BjEmeHCpi1YQhk/ZghC+fGyKhULM0wioamOtKuItFDD4N+I9uW/TIvIZ1AUb
	 evd2g63diHuXg3atEhSlP7df/8b5KIUyCo67ZCEDV3mm/a54TDKs65q3qpTyHs2W02
	 mA3wlwBAQkwvN2Z8nOlpHVJZJL5fxiYyW5oPmJ+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1399AF8049E;
	Fri, 28 May 2021 13:18:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3085F8049C; Fri, 28 May 2021 13:18:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id BEB1EF802BE
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 13:18:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEB1EF802BE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622200692393044949-webhooks-bot@alsa-project.org>
References: <1622200692393044949-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/2] alsa-gobject: misc fixes
Message-Id: <20210528111818.A3085F8049C@alsa1.perex.cz>
Date: Fri, 28 May 2021 13:18:18 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #59 was opened from takaswie:

This patchset fixes some bugs below:

 * Ubuntu 19.10/i386 is EOL and no release is available for i386 architecture in Ubuntu project
 * Wrong command is in install section of README

```
Takashi Sakamoto (2):
  correct install section in README
  fix workflow according to EOF of i386 ubuntu distribution

 .github/workflows/build.yml | 81 +++++++++++++++++++------------------
 README.rst                  |  2 +-
 2 files changed, 42 insertions(+), 41 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/59
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/59.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
