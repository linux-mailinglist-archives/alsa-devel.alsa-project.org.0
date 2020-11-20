Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8F02BA1E7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Nov 2020 06:26:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E79D516FD;
	Fri, 20 Nov 2020 06:26:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E79D516FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605850016;
	bh=F50uSOiFZp52q9aCyLnxKeikohtAFo3ncMNeLmkm6Tc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IiPNmYW3wZoMPdHiM4PebN6Fugarp2KEnZkyoJ4paGF2GDznhdcR6posNin3XPbO0
	 syWzMhxlv2Oz2M0Pq1RWjy/Kyjs19h681TJZDgizfs0xKQjz2U+tDpR9t/abhGjT5d
	 pno3Dc/MizesntgbxiVHfQV3c8UqDcTF4j1LX9NY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A5CCF800F3;
	Fri, 20 Nov 2020 06:25:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5BB0CF8016C; Fri, 20 Nov 2020 06:25:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2C3D9F800C5
 for <alsa-devel@alsa-project.org>; Fri, 20 Nov 2020 06:25:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3D9F800C5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1605849913300170898-webhooks-bot@alsa-project.org>
References: <1605849913300170898-webhooks-bot@alsa-project.org>
Subject: [PATCH 0/3] alsa-gobject: buildable in kernel 4.5 or later
Message-Id: <20201120052520.5BB0CF8016C@alsa1.perex.cz>
Date: Fri, 20 Nov 2020 06:25:20 +0100 (CET)
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

alsa-project/alsa-gobject pull request #57 was opened from takaswie:

Some users would like to build alsa-gobject in former versions of Linux kernel.

https://sourceforge.net/p/alsa/mailman/alsa-user/thread/d95fce3f-5244-0e5f-4a5f-fece9b853307%40sakamocchi.jp/#msg35839069

This patchset use some macro from Linux kernel for conditional build

```
Takashi Sakamoto (3):
  seq: client_info: conditional build for Linux kernel v4.6 or later
  hwdep: conditional build for Linux kernel v4.9 or later
  hwdep: conditional build for Linux kernel 4.12 or later

 src/hwdep/alsahwdep-enum-types.h | 16 +++++++++++++---
 src/seq/client-info.c            |  9 +++++++--
 2 files changed, 20 insertions(+), 5 deletions(-)
```

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/57
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/57.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
