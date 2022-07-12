Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC3B570F23
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 02:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD5A084B;
	Tue, 12 Jul 2022 02:56:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD5A084B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657587411;
	bh=R9OqCNNlI9KWtBH7l0bnOqRv94NYDb0VVo8zUL5ldIU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lN5RMepkO0nHo4LZoLJ4pZH+keAOjyYsvPf8xTCsJWNEraIp65lhefw1EWtjx6KdO
	 GtzFAEeq9TDXbV4kMIjDlz0563Zek6o+SC2hEinz8pIyfOoqQDM64yeD0Ln1xGKcNu
	 UfNn/L2TGd0cVJtAMfc+mthSCW9yzm2okL1f4yq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FE21F800E1;
	Tue, 12 Jul 2022 02:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68023F80163; Tue, 12 Jul 2022 02:55:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 8B72BF800E1
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 02:55:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B72BF800E1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1657587341914959908-webhooks-bot@alsa-project.org>
References: <1657587341914959908-webhooks-bot@alsa-project.org>
Subject: axfer: fix typo in manual
Message-Id: <20220712005550.68023F80163@alsa1.perex.cz>
Date: Tue, 12 Jul 2022 02:55:50 +0200 (CEST)
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

alsa-project/alsa-utils pull request #156 was opened from takaswie:

The spelling of 'aborted' was 'aboeted' in the manual. This commit fixes
it.

Fixes: a37703614a90 ("axfer: fulfill manual section for libffado backend")
Reported-by: Chao Song chao.song@linux.intel.com
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-utils/pull/156
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/156.patch
Repository URL: https://github.com/alsa-project/alsa-utils
