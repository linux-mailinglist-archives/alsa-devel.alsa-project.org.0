Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A399F59949A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 07:35:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 626071637;
	Fri, 19 Aug 2022 07:34:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 626071637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660887344;
	bh=Y6RdVhZQzd6KuSnNPq2t0JQAdrjv87P3ejF3BAORJFY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMBOrz+r1JVmRgIbZyPUKUpBILLkiMALXuYRE4s2DFVNu1AdG2LLzHjPmd6LfCvyR
	 GzqZx8aAqBha6bYrSn1rDnQxRNf8qnIDynHXYfk3mqAzkp1cqa8xYYro94ecuLyRQy
	 pH1l1w5W3ht+7FdKVSTLoqdlbpImE/TuNqNuOzXo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBE6F80217;
	Fri, 19 Aug 2022 07:34:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 857D6F801F7; Fri, 19 Aug 2022 07:34:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 4C4F8F800B5
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 07:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C4F8F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660887273841952085-webhooks-bot@alsa-project.org>
References: <1660887273841952085-webhooks-bot@alsa-project.org>
Subject: ucm2: Add intial acpes8336 support
Message-Id: <20220819053441.857D6F801F7@alsa1.perex.cz>
Date: Fri, 19 Aug 2022 07:34:41 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #200 was opened from yangxiaohua2009:

This add support for es8336 on AMD  Jadeite platform.

ASLAINFO http://alsa-project.org/db/?f=b5aae41350b63c40c7743ba43ff8a7178ee93229

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/200
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/200.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
