Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D567B55A655
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Jun 2022 05:36:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78B6C1775;
	Sat, 25 Jun 2022 05:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78B6C1775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656128174;
	bh=tFVhiJ/SsE9Swja6Fwd5UI95obvFquWsHnINdlPXF3o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BKAxecBErhPfDSTDHfGZXHHUitHlfAC8XrYrM99yWls7CgzldzhvYH4Ht1VpBWHG1
	 nIid80ocD0DSoZp+OP6zB0jgMF3DX75UPlsaQruKpMwb33/PoLULhQVIgJi9MkH1pW
	 JJJRvDkSmws/ZzkW2ALg7canMbk/x5SzU9Ry6doM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0265F8016C;
	Sat, 25 Jun 2022 05:35:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5CF1F80162; Sat, 25 Jun 2022 05:35:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CAB77F8010B
 for <alsa-devel@alsa-project.org>; Sat, 25 Jun 2022 05:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAB77F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1656128107659384966-webhooks-bot@alsa-project.org>
References: <1656128107659384966-webhooks-bot@alsa-project.org>
Subject: [PATCH 00/11] ctl: elem-value: rewrite getter methods
Message-Id: <20220625033512.B5CF1F80162@alsa1.perex.cz>
Date: Sat, 25 Jun 2022 05:35:12 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #79 was opened from takaswie:

This patchset rewrites getter methods of ALSACtl.ElemValue so that they just return
pointer of internal storage instead of copying to user buffer.

```
Takashi Sakamoto (11):
  timer: fix entry in exported symbol map
  ctl: elem-value: clear value field at setter method
  ctl: elem-value: rewrite getter for boolean values
  ctl: elem-value: rewrite getter for 32 bit signed integer values
  ctl: elem-value: rewrite getter for enumeration index values
  ctl: elem-value: rewrite getter for 8 bit unsigned integer values
  ctl: elem-value: rewrite getter for IEC 60958 channel status
  ctl: elem-value: rewrite getter for IEC 60958 user data
  ctl: elem-value: rewrite getter for 64 bit signed integer values
  ctl: elem-value: update class description
  update README with compatibility note

 README.rst              | 124 ++++++++++++++++++++++++++++++--
 samples/ctl             |  11 ++-
 src/ctl/alsactl.map     |  15 ++--
 src/ctl/elem-value.c    | 152 +++++++++++++++++++++-------------------
 src/ctl/elem-value.h    |  14 ++--
 src/timer/alsatimer.map |   3 +-
 6 files changed, 218 insertions(+), 101 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/79
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/79.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
