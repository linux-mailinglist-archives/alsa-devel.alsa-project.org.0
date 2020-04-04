Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0119E302
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Apr 2020 07:25:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69CC01677;
	Sat,  4 Apr 2020 07:24:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69CC01677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585977933;
	bh=xThcSJZyV31SYcxUnDeoyYYshFPkmnXAo0y7k98hQfQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K0y3b6BxGdcUIHwaKnmIdD1PEuixZVDFmbq3cNqgp9MCAciWkZEY2XW8YMkYMYv+s
	 CproB9LXCLPsJwZgkEbwHa4tE66nU+BwAuIWw5nzPcYtplFE6DAWF3tNXbeKaag4FI
	 TSs4vl5JrCeb5WOuY45GCG3yhXm85+JUe+e2QVZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A06EF8014B;
	Sat,  4 Apr 2020 07:23:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53BA7F80058; Sat,  4 Apr 2020 07:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5C281F80058
 for <alsa-devel@alsa-project.org>; Sat,  4 Apr 2020 07:23:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C281F80058
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585977817176040888-webhooks-bot@alsa-project.org>
References: <1585977817176040888-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: normalize function signatures
Message-Id: <20200404052341.53BA7F80058@alsa1.perex.cz>
Date: Sat,  4 Apr 2020 07:23:41 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #11 was opened from takaswie:

The alsa-gobject project has a loose convention to have functions returning nothing. This pull
request refine according to it as well as fixes for some bugs.

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/11
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/11.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
