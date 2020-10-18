Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B5F291569
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Oct 2020 05:36:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CACBE17F3;
	Sun, 18 Oct 2020 05:35:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CACBE17F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602992161;
	bh=EUjkVWR3b+l5nNhA6mB1AtIevCqK1J74I2H74RF/Fwg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O3dMsd6Nu+oCIepbBUEzKhBqXIgw7MSTGXfHZddO4h2auDsrboiQzSimgVJtG+vI0
	 vXE8gQ58JQ7O3rLtiCgQK47G7e3TjRS9HwaIXKY5Q0/GLsMkRX/Am6/LLQ2BFbdPMN
	 +Uh5j/NTB4Hfa08dCWl2ZAKS5KWHQYs60gveCdsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87159F8024A;
	Sun, 18 Oct 2020 05:35:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2AA8BF8024A; Sun, 18 Oct 2020 05:35:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A13B9F80111
 for <alsa-devel@alsa-project.org>; Sun, 18 Oct 2020 05:35:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A13B9F80111
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1602992104416914940-webhooks-bot@alsa-project.org>
References: <1602992104416914940-webhooks-bot@alsa-project.org>
Subject: =?utf-8?q?arecord/aplay_man_page_should_separate_the_options_into_three_l?=
 =?utf-8?b?aXN0c+KApg==?=
Message-Id: <20201018033507.2AA8BF8024A@alsa1.perex.cz>
Date: Sun, 18 Oct 2020 05:35:07 +0200 (CEST)
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

alsa-project/alsa-utils issue #65 was edited from jidanni:

The arecord/aplay man page should perhaps separate the options into three lists
1. ones that affect recording,
2. ones that affect playing,
2. and ones that affect both.

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/65
Repository URL: https://github.com/alsa-project/alsa-utils
