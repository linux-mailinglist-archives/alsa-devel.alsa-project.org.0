Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD671BA4F6
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Apr 2020 15:41:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55BC168F;
	Mon, 27 Apr 2020 15:40:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55BC168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587994888;
	bh=y+ClY3/qt+uQByypwWxU1QaxnQvkkLS65s7lYd4s4Y0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a+3UROqwmY+GUsPrtquLDTUPwfQNRBgy+iBXQLvDFSjRSApMVIeSbAk9piODfFZf6
	 3o3qctRdvJ1PgP7IRIGHfLxj2fpOLXykBfFJG3nSu8CRQZqk1X3BT5BTX/g7zwiEmI
	 LVukG+6zzC0EHdSqa8h79GOv7svhbKg1458p/FHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9229F8022B;
	Mon, 27 Apr 2020 15:39:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28F0CF8022B; Mon, 27 Apr 2020 15:39:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1E6E7F80112
 for <alsa-devel@alsa-project.org>; Mon, 27 Apr 2020 15:39:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E6E7F80112
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587994776588638067-webhooks-bot@alsa-project.org>
References: <1587994776588638067-webhooks-bot@alsa-project.org>
Subject: pcm: Fix memory leak at snd_pcm_new when THREAD_SAVE_API is defined
Message-Id: <20200427133943.28F0CF8022B@alsa1.perex.cz>
Date: Mon, 27 Apr 2020 15:39:42 +0200 (CEST)
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

alsa-project/alsa-lib pull request #42 was opened from chunxuxiao:

The pthread_mutexattr_t object should be destroyed by calling
pthread_mutexattr_destroy(), otherwise it may cause a potential
memory leak due to the different implement of pthread_mutexattr_init()

Signed-off-by: chunxu.li <chunxuxiao@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/42
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/42.patch
Repository URL: https://github.com/alsa-project/alsa-lib
