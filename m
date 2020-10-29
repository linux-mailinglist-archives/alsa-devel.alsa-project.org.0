Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CB129E39B
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Oct 2020 07:59:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAD21612;
	Thu, 29 Oct 2020 07:59:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAD21612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603954795;
	bh=eNqhsd4/KszbC9N7KkEJK5gwnRec7EFD+lUYBln5IwQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WtQe7zY8v+IC3F18coSZy71fGEEDVnql/PfhZRU4cDH4NbbeOyJLNms8mJoYQ8NEM
	 XAPV3eMJ4ew3DfWYJ0O/hPanbMHlOTg5zqN+UMKdlN4z//E60APCZavdItMS19r9xG
	 hI62GYuLbSkRxWZyPKvAokhkCGa7t6GLkHj6uGek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C31DF801D8;
	Thu, 29 Oct 2020 07:58:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0E4CF8020D; Thu, 29 Oct 2020 07:58:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A25C7F80095
 for <alsa-devel@alsa-project.org>; Thu, 29 Oct 2020 07:58:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A25C7F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1603954693201121092-webhooks-bot@alsa-project.org>
References: <1603954693201121092-webhooks-bot@alsa-project.org>
Subject: ucm: return error if boot_list is empty
Message-Id: <20201029065820.B0E4CF8020D@alsa1.perex.cz>
Date: Thu, 29 Oct 2020 07:58:20 +0100 (CET)
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

alsa-project/alsa-lib pull request #94 was opened from jason77-wang:

If bootlist is empty, that means there is no BootSequence defined
in the ucm for this sound card, let set_boot_user() return error,
then alsactl could have chance to use non-ucm ways to initialize the
sound card.

Signed-off-by: Hui Wang <hui.wang@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/94
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/94.patch
Repository URL: https://github.com/alsa-project/alsa-lib
