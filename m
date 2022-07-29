Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D33584C3E
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Jul 2022 08:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0DFD6165D;
	Fri, 29 Jul 2022 08:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0DFD6165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659077862;
	bh=pLmbe28GxkzFqVHDl+cg97UQBXMzwVNEYR8q1t7iiJw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JTWafu8vioZnApzTf3lHHTeMvzYIQcvUTpQwpZsJO7SpRE2Bv1lSq4jBCVZV6R9Fs
	 0XcNaoDDhuiol/PkOUUh4P13Y2NjESM1RCaWLriK6JZvd6n8l3zKGyLwaGJ228tbR7
	 Kgg7gcCs8gLLFo3cX+BC3KPUJXYqaEM4GgW2TRS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B2C2F800BD;
	Fri, 29 Jul 2022 08:56:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 278EFF8049C; Fri, 29 Jul 2022 08:56:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EFD6BF8015B
 for <alsa-devel@alsa-project.org>; Fri, 29 Jul 2022 08:56:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD6BF8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1659077796309905052-webhooks-bot@alsa-project.org>
References: <1659077796309905052-webhooks-bot@alsa-project.org>
Subject: Mega r1.1
Message-Id: <20220729065640.278EFF8049C@alsa1.perex.cz>
Date: Fri, 29 Jul 2022 08:56:40 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #195 was opened from 13r0ck:

requires https://github.com/pop-os/linux/pull/167

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/195
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/195.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
