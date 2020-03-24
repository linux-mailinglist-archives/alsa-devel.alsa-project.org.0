Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4EC1905F9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Mar 2020 08:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD851654;
	Tue, 24 Mar 2020 07:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD851654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585033213;
	bh=MmeP/Liqq9QxncDpAFT3ifqliNWQgcWK89WA8BRiS88=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJsJ70McvOYATUk3jA/iMBNUXhldCUkXzsjRnq49QIkdHOVKe7kv2RWAnY78m0w67
	 M8XH4bG/XRUK3VSz+BXYhY+pYFF0G/o31zddMqan7Gnz6ZZNman8yrbN2RKe69uQ24
	 Gki2yiWqM47UmkdcYXI7dPbvZZ1DGssZyBLHMOzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8D6EF80095;
	Tue, 24 Mar 2020 07:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7274CF801F9; Tue, 24 Mar 2020 07:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8AA6FF80095
 for <alsa-devel@alsa-project.org>; Tue, 24 Mar 2020 07:58:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AA6FF80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1585033106797276020-webhooks-bot@alsa-project.org>
References: <1585033106797276020-webhooks-bot@alsa-project.org>
Subject: sound: update header to v0.2.0
Message-Id: <20200324065830.7274CF801F9@alsa1.perex.cz>
Date: Tue, 24 Mar 2020 07:58:30 +0100 (CET)
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

alsa-project/tinycompress pull request #4 was opened from vinodkoul:

Kernel has upgraded compress headers with support for WMA, ALAC and APE
and bumped version to 0.2.0, so update this header as well

Signed-off-by: Vinod Koul <vkoul@kernel.org>

Request URL   : https://github.com/alsa-project/tinycompress/pull/4
Patch URL     : https://github.com/alsa-project/tinycompress/pull/4.patch
Repository URL: https://github.com/alsa-project/tinycompress
