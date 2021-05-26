Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAEE391083
	for <lists+alsa-devel@lfdr.de>; Wed, 26 May 2021 08:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23D13174A;
	Wed, 26 May 2021 08:17:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23D13174A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622009905;
	bh=J9m2tubiiJiNjgre6istikaXSmioMxBkMPNdzDo9GjU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYQTeXDg4V3B9pi7M8PmyBzljht+8fWEJGQKxO5LhQdzkQAFMza1KRDlb8jxMLC+8
	 1KjmvE6nspjAsfWDCSGYciqd0Okf/seRMm/deavgz5dnBUGucrvUAEnbFHqv56UCc5
	 RmOTBtUGuQHzLyjul86ZPuZP2ZPpnapazEYM+mIg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85AE8F80158;
	Wed, 26 May 2021 08:16:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB645F80157; Wed, 26 May 2021 08:16:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C1026F8011B
 for <alsa-devel@alsa-project.org>; Wed, 26 May 2021 08:16:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1026F8011B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622009805951775074-webhooks-bot@alsa-project.org>
References: <1622009805951775074-webhooks-bot@alsa-project.org>
Subject: topology/pcm.c: remove duplicated AC97 hw format
Message-Id: <20210526061653.DB645F80157@alsa1.perex.cz>
Date: Wed, 26 May 2021 08:16:53 +0200 (CEST)
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

alsa-project/alsa-lib pull request #138 was opened from aiChaoSONG:

Remove the second occurrence of AC97 hardware format
from audio hardware format array.

Signed-off-by: Chao Song <chao.song@linux.intel.com>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/138
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/138.patch
Repository URL: https://github.com/alsa-project/alsa-lib
