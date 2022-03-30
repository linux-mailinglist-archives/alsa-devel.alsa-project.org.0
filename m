Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 289284EBC3E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 10:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C258D169B;
	Wed, 30 Mar 2022 10:00:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C258D169B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648627288;
	bh=ZNTRw1XmiVk29kA+2/ap+EbX0iywIm4BDdKzn7Gjhvk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+l7RS8Pek9HhrUV5++150feTRPoGurZDV0VBVqEdrtZ37k2mOU8K02skCo1A2fx6
	 ZpWKn+Jhm4v7caUKLI6jecrlF0XOwLFX/eJCkeZlf262eaPnDmlDhgsvAY2dLYIghM
	 DjkzUDcIx9mgntr2/bv5IfeBDk1co48fJHF76V/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60F07F80253;
	Wed, 30 Mar 2022 10:00:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 37529F80254; Wed, 30 Mar 2022 10:00:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C3DFEF80155
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 10:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3DFEF80155
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1648627217330388069-webhooks-bot@alsa-project.org>
References: <1648627217330388069-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/2] rawmidi/meson: fix miscellaneous bugs
Message-Id: <20220330080020.37529F80254@alsa1.perex.cz>
Date: Wed, 30 Mar 2022 10:00:20 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #65 was opened from takaswie:

This patchset fixes unintended two items below.

 * argument name against convention in this project
 * line break inner identifier in meson.build

```
Takashi Sakamoto (2):
  rawmidi: fix argument names with suffix '_id'
  meson: fix unintended line break for identifier

 src/rawmidi/query.c | 12 ++++++------
 src/rawmidi/query.h |  2 +-
 src/seq/meson.build |  3 +--
 3 files changed, 8 insertions(+), 9 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/65
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/65.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
