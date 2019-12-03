Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB11103F6
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Dec 2019 19:04:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88B7E165F;
	Tue,  3 Dec 2019 19:03:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88B7E165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575396286;
	bh=0Kuf5uFXWCxrITcVsvjoZeUvEW7j5bcLOO1ncMUaxQA=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGawuZPng09oDd2n9jvNSN49fNGxxlubPA5GSjy+8DoO1wr9wpPa+m5A5F6A5eVyn
	 5pTq+eKNAgQBe6My3h46zifKfPNOurqnjucLjMj7ogmHiXCS/5g7l/nN8KRfFjCGMr
	 CtutYW4iHcbeNLuMOZu4gCdSVV8n2Enu9ZwBI0qs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8FF8F8015A;
	Tue,  3 Dec 2019 19:03:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C06EF80227; Tue,  3 Dec 2019 19:03:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F3BB9F800ED
 for <alsa-devel@alsa-project.org>; Tue,  3 Dec 2019 19:02:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3BB9F800ED
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1575396176864554882-webhooks-bot@alsa-project.org>
References: <1575396176864554882-webhooks-bot@alsa-project.org>
Message-Id: <20191203180300.7C06EF80227@alsa1.perex.cz>
Date: Tue,  3 Dec 2019 19:03:00 +0100 (CET)
Subject: [alsa-devel] src/ucm/main.c: fix build without mixer
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib pull request #15 was opened from ffontaine:

Commit 4ce38a5ff466d18039b2606938f866ea3a6c9f3c breaks the build without
mixer on:

  CCLD     libasound.la
/home/buildroot/autobuild/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld: ucm/.libs/libucm.a(main.o): in function `snd_use_case_set':
main.c:(.text+0x185c): undefined reference to `snd_mixer_selem_id_parse'

Fixes:
 - http://autobuild.buildroot.org/results/4d91c9f82a2a61c50c457a851073b85cc09ea345

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/15
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/15.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
