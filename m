Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F663BC2EA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jul 2021 20:56:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A40816A5;
	Mon,  5 Jul 2021 20:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A40816A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625511366;
	bh=iA8rHjhgJ3eEz1t28c6tpg5ncb7oiLyD5lmwuxoY4Jk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phKX6L4XSZI/JjuXUZHxLc5BSUwX29wKgk4U6ETMLij+TuwbleA55IrjH6PHTEuTV
	 9VGzZj49gE1bvYgTDuxFdRHTVoBsU9HPeU7HdvUQW7S9/N7x0AWcF4zbGkixd828gK
	 nV8HsvoVrHMDqK3B/m+y/WjWkhYovEqUf+G15sVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4C26F8025C;
	Mon,  5 Jul 2021 20:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C837EF80134; Mon,  5 Jul 2021 20:54:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 3FC19F80134
 for <alsa-devel@alsa-project.org>; Mon,  5 Jul 2021 20:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3FC19F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1625511266191013098-webhooks-bot@alsa-project.org>
References: <1625511266191013098-webhooks-bot@alsa-project.org>
Subject: [RFC] Adjust appl_ptr for multi plugin on rewind/forward operations
Message-Id: <20210705185431.C837EF80134@alsa1.perex.cz>
Date: Mon,  5 Jul 2021 20:54:31 +0200 (CEST)
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

alsa-project/alsa-lib pull request #161 was opened from sava-j:

* When doing rewind or forward operations, application pointer needs to
  be properly adjusted, in the same way when doing commit/write
  operations.
* Introduce helper functions for manipulating the application pointer.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/161
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/161.patch
Repository URL: https://github.com/alsa-project/alsa-lib
