Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F7C47C7D9
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Dec 2021 20:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9CF4188A;
	Tue, 21 Dec 2021 20:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9CF4188A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640116552;
	bh=yhn6WQmUA81wyAMAKB6mbRPDx/jK9o1Yl12H3z/zEUo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3ngiGDctP6vAoJ5l84XIlmBw2TGwmxZ2H8tlPIxBeRDu2W+1YQUU2g0STjlDyZue
	 y0ne5tgRTWYGdQLocnYni8zLtgj0Ywcq5VQ9hJ4riqm/K3ph4NLZiVSIFD/Cg3nM+8
	 hcvn9OgjvfxZUASJKl95E2RqWIOlcHATNFA9hVGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E0C5F8032B;
	Tue, 21 Dec 2021 20:55:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACA3DF8012E; Tue, 21 Dec 2021 20:54:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4E8DCF80084
 for <alsa-devel@alsa-project.org>; Tue, 21 Dec 2021 20:54:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E8DCF80084
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640116487287379980-webhooks-bot@alsa-project.org>
References: <1640116487287379980-webhooks-bot@alsa-project.org>
Subject: [WIP][RFC] Nhlt plugin and simple plugin interface
Message-Id: <20211221195458.ACA3DF8012E@alsa1.perex.cz>
Date: Tue, 21 Dec 2021 20:54:58 +0100 (CET)
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

alsa-project/alsa-utils pull request #129 was opened from juimonen:

Initial something... I need to figure out:

- where to specify which plugins to load/run (nhlt now hard coded)
- where to install the plugins
- how to get the to-be-loaded plugin names and where
- is the "hidden-visibility" gcc flag ok to hide other than .so entrypoint

Request URL   : https://github.com/alsa-project/alsa-utils/pull/129
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/129.patch
Repository URL: https://github.com/alsa-project/alsa-utils
