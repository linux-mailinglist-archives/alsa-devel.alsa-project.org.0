Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCF2571D2A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 16:44:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5E9316B9;
	Tue, 12 Jul 2022 16:43:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5E9316B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657637079;
	bh=S6KmLA5Szxb3QY4NoPKwW3FlLDkSxZ2KdD/1+jygRJw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l22dxs+UqUBs+X/BSzj3XNMtMKlWdyc/FUfCQv+8vse/+DQl2TmsIi5n8qfIccKEU
	 +0nArKB4GRl7clpUOl37+h6lwzlVchAV4rRoQydm3zXcegowd747VqUW5xelmhrC8o
	 RRIXphSo7reRUFkAKL1Wi0wqWiAV7B+l9iz/W0JM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA36AF80557;
	Tue, 12 Jul 2022 16:43:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DCBEF80543; Tue, 12 Jul 2022 16:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 856C2F80543
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 16:43:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 856C2F80543
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657636996929972887-webhooks-bot@alsa-project.org>
References: <1657636996929972887-webhooks-bot@alsa-project.org>
Subject: Add profile for Behringer UMC202HD
Message-Id: <20220712144320.2DCBEF80543@alsa1.perex.cz>
Date: Tue, 12 Jul 2022 16:43:20 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #188 was opened from Eiseiche:

Edited #128 for UMC202HD support (thx @brndd for initial work).

[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9094061/alsa-info.txt)
[spa-acp-tool.txt](https://github.com/alsa-project/alsa-ucm-conf/files/9094064/spa-acp-tool.txt)

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/188
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/188.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
