Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7189112406
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 09:00:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CA1A165E;
	Wed,  4 Dec 2019 08:59:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CA1A165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575446419;
	bh=3h/gKSyk8K3lX0wSbz0jvnS0vrSSN3jveHEWRdJtKUI=;
	h=From:To:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IH62Q6iRWwmlr/ykdY9Dj827R9WzjdnpAS0FTf4p0sAS82yw2Fw2DNLyOuP0hBoSk
	 NqVeM6cxhJb7bykANN/4+zA042LkpbosiK1TkCr/x04iRtNqIYpnqj5US4jn64VXvY
	 SQ0LyJm8eJ9Z7fCdlsPdy+KMGYFBaOnNZ17EGL5o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF625F80216;
	Wed,  4 Dec 2019 08:58:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 787C8F801EC; Wed,  4 Dec 2019 08:58:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2221BF800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 08:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2221BF800F0
MIME-Version: 1.0
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1575446303412102938-webhooks-bot@alsa-project.org>
References: <1575446303412102938-webhooks-bot@alsa-project.org>
Message-Id: <20191204075832.787C8F801EC@alsa1.perex.cz>
Date: Wed,  4 Dec 2019 08:58:32 +0100 (CET)
Subject: [alsa-devel] utils/alsa.m4: fix atopology detection without alsatest
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

alsa-project/alsa-lib pull request #16 was opened from ffontaine:

Since commit 75d393a563efb578c79364a277087c6326267f52, alsa-utils fails
to build with --disable-alsatest because atopology is not detected

Fixes:
 - http://autobuild.buildroot.org/results/d0fb760669b02b813115af04adcf24530d35f4e1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/16
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/16.patch
Repository URL: https://github.com/alsa-project/alsa-lib
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
