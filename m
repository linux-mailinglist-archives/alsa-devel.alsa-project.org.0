Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E33A5FA1
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 12:03:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B08179D;
	Mon, 14 Jun 2021 12:02:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B08179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623664993;
	bh=Q3nSpBvxFYjvfzZDAZtA4/mxERsrKMdOoe96jGDmHRE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c6wWV6HUN+zTQyrnGsfxQLZJDBmGpN7ysKlmB2lkwP68mrTc2MZlvLeCkZwRgJ7Om
	 g/TittfziEIoUpLPi9FBY4lqCsQv6w907hBmN7iIpxtGLGj4+Ax5s6yxXOPIqTLiw1
	 h2ih+lw3+Gi8ouoSrjoLqPl6X8pyrGp+c/ssrJ0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6614CF800DD;
	Mon, 14 Jun 2021 12:01:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2627F8023C; Mon, 14 Jun 2021 12:01:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 88BBAF8021C
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 12:01:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88BBAF8021C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - reopened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1623664900589035034-webhooks-bot@alsa-project.org>
References: <1623664900589035034-webhooks-bot@alsa-project.org>
Subject: added an option to aseqnet to optionally set the midi process name
Message-Id: <20210614100143.E2627F8023C@alsa1.perex.cz>
Date: Mon, 14 Jun 2021 12:01:43 +0200 (CEST)
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

alsa-project/alsa-utils pull request #95 was reopened from BrainDamage:

This option allows to run multiple instances of aseqnet without having
to double check the assigned port number, since each one can get spawned
with a unique name.

The patch is pretty minimal and clean, thopefully here shouldn't be troubles 
merging it.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/95
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/95.patch
Repository URL: https://github.com/alsa-project/alsa-utils
