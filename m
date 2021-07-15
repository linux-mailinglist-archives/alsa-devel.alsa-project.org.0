Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 750323C9965
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 09:09:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE5AA1679;
	Thu, 15 Jul 2021 09:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE5AA1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626332975;
	bh=Kt11LtpWZ6fhJzEHMFwdEr5Ne0Z77qpTzitp0YhqWFM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nlZCll2T+pmwIk6ZH6iAn9eG2FQNhC4aLzVpFdH0rVDEpcCB4jJ9b5/y/0TYT9VtY
	 R0ufdEhy8n/OIOVVRCPWcBLNMtP+/951XS8xQ1is20kxy4qHwYUPKvXQh+vkiFGxKA
	 sphQ/4R4Jl906vf6wavOGDWuKTEpga9ikjJFLdF0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65EA2F80229;
	Thu, 15 Jul 2021 09:08:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DB22F80217; Thu, 15 Jul 2021 09:08:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 12B31F800D3
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12B31F800D3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1626332879318762064-webhooks-bot@alsa-project.org>
References: <1626332879318762064-webhooks-bot@alsa-project.org>
Subject: Added -T (timestamp) for --dump.
Message-Id: <20210715070806.5DB22F80217@alsa1.perex.cz>
Date: Thu, 15 Jul 2021 09:08:06 +0200 (CEST)
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

alsa-project/alsa-utils pull request #104 was opened from folkertvanheusden:

amidi could already trace/dump MIDI traffic (using --dump).
This patch adds a timestamp to that tracing.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/104
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/104.patch
Repository URL: https://github.com/alsa-project/alsa-utils
