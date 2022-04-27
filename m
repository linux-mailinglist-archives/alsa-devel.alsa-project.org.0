Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB9B511C94
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Apr 2022 19:24:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8209851;
	Wed, 27 Apr 2022 19:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8209851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651080284;
	bh=O1C3wz0v+40b5yXXg4u7V2qc5joxrwsgfocX3I+6k1s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SyqL4eUdSQMzatDtOteXhwECgnqgoEpP7MuTvGHifTZEvnGjdyK6lxb2S6eKxaswS
	 IeD4K3/AnnBkSnXp9rqBM19BfI3h+rhvMuYgErqXZNPImWGo8KFRG0IGHBVbVSreLH
	 xAE1tB6lUlW7tH6fJsa5t30ctvEKfBfWsqj1XxL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37270F80256;
	Wed, 27 Apr 2022 19:23:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AECCBF8016E; Wed, 27 Apr 2022 19:23:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C874F800AE
 for <alsa-devel@alsa-project.org>; Wed, 27 Apr 2022 19:23:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C874F800AE
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651080220480698109-webhooks-bot@alsa-project.org>
References: <1651080220480698109-webhooks-bot@alsa-project.org>
Subject: Fix typo in error in aplay.c
Message-Id: <20220427172344.AECCBF8016E@alsa1.perex.cz>
Date: Wed, 27 Apr 2022 19:23:44 +0200 (CEST)
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

alsa-project/alsa-utils pull request #143 was opened from mb720:

Hi and thanks a lot for ALSA!

I'd like to provide a fix for a typo I just came across while using arecord.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/143
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/143.patch
Repository URL: https://github.com/alsa-project/alsa-utils
