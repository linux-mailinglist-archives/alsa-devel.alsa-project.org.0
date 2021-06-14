Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1033A5CAC
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 07:58:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 754D7178A;
	Mon, 14 Jun 2021 07:57:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 754D7178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623650325;
	bh=mJTwYxykIiuT2oYtY6BSQRdtSCKfaTnLj2bKIMJDr14=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kaPI2nydyi2KpPxvl3Fa5RxbBJ4Ta7yY5hcRFU8DtO/NGIMNVFraTvfIdxiW9C7gy
	 WK4V4vleuuTyY+K/UJqlbwWtPQh6NEfqJE4RCZgC1epzqXsovcqjLUBobPdSepFJ1A
	 7HmdWpZuZhPxnxcOhJHU1Lk6e1fLBDO1xPvBTAxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC6E4F8025A;
	Mon, 14 Jun 2021 07:57:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E4D15F8023C; Mon, 14 Jun 2021 07:57:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 82ACEF8021C
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 07:57:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82ACEF8021C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623650226380218983-webhooks-bot@alsa-project.org>
References: <1623650226380218983-webhooks-bot@alsa-project.org>
Subject: Android porting patches
Message-Id: <20210614055715.E4D15F8023C@alsa1.perex.cz>
Date: Mon, 14 Jun 2021 07:57:15 +0200 (CEST)
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

alsa-project/alsa-lib pull request #156 was opened from cwhuang:

This is a series of patches to make alsa-lib buildable with Android source tree. Test on with Android 8.1 and later.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/156
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/156.patch
Repository URL: https://github.com/alsa-project/alsa-lib
