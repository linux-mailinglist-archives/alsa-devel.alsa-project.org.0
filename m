Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CD513A03
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:39:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D151616;
	Thu, 28 Apr 2022 18:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D151616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651163986;
	bh=w1xy+/3dsDxYjy2TQcb3M1DB/+mOq2z6DsuSaHmmwPw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tXvlUbmoBamV9reJ6rOokCXK05vbEJLzIAQ9heqBMW690OUBr0WnBUyC6N91+BhVk
	 1FLlPvPFR2b3t0rS0qtn2y7T9187TVxiEEiS/iqEFdbsjGYHy4kVTvGRjDrrCbx+Sa
	 CMrlHflR4ZgJZqW/q7yj8YkmkJY/pj8Rs/Jwcafw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3F03F800AE;
	Thu, 28 Apr 2022 18:38:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A7A5FF8020D; Thu, 28 Apr 2022 18:38:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 09E50F800F2
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E50F800F2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651163922796066999-webhooks-bot@alsa-project.org>
References: <1651163922796066999-webhooks-bot@alsa-project.org>
Subject: pcm: dmix: fix wrong scaling in 32bits pcm mixing
Message-Id: <20220428163845.A7A5FF8020D@alsa1.perex.cz>
Date: Thu, 28 Apr 2022 18:38:45 +0200 (CEST)
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

alsa-project/alsa-lib pull request #222 was edited from katsuster:

Generic mixing function for 32bits pcm has used 8bits right shift for
pre-scaling. But this is generating wrong result if pcm data is
negative value because return value type of bswap_32() is unsigned int.

This patch adds type cast bswap_32() result to signed int.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/222
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/222.patch
Repository URL: https://github.com/alsa-project/alsa-lib
