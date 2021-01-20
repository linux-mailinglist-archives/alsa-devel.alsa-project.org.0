Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F822FCF15
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 12:22:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54ACC183B;
	Wed, 20 Jan 2021 12:21:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54ACC183B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611141715;
	bh=Y6ltMCGQ7VLx9Ulj+0vr4nT7icHsPfDkSe5doyH1fwE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njUr4Zbean+jP0TiXPv9IO4aXWdqXTFEuqWWM6i2NYKfev6zntMJOCtucSRWVKelS
	 +8Xh1G3lgAdU0J824Zj+438MaglDsShbt+JbdS0MoO0wpbUXWAkRl3vDFpoLOHJbiu
	 RrnD0W9VkmRkfBq8cif3GkxCgpU8EVgqBK3K4r2o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAF63F8019B;
	Wed, 20 Jan 2021 12:20:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0E8F0F8016E; Wed, 20 Jan 2021 12:20:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CEAA3F80164
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 12:20:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEAA3F80164
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1611141610455234051-webhooks-bot@alsa-project.org>
References: <1611141610455234051-webhooks-bot@alsa-project.org>
Subject: Add jack2 as test
Message-Id: <20210120112021.0E8F0F8016E@alsa1.perex.cz>
Date: Wed, 20 Jan 2021 12:20:21 +0100 (CET)
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

alsa-project/alsa-utils pull request #74 was opened from bengan:

Jack2 been around for a long time. It should be included in the test.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/74
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/74.patch
Repository URL: https://github.com/alsa-project/alsa-utils
