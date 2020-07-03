Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C397A213097
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 02:49:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D4F016C0;
	Fri,  3 Jul 2020 02:48:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D4F016C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593737341;
	bh=4XrwAFyEm3vDB30SlAVDeq/hxWsE5hxdhG8Q2xJznmQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EAi90Igp2F3dnWb7tbnp990sAsnR5/wMpxAxAuB5pB/SOiHavTyInSZtYdPCm6jnd
	 iZzevAuUtLTHVZppXtFCF8VXuRWpffGv9Shpz7rf1879OYTYVVqb2rujUA8XYZBKAq
	 qoH584DDsGhTrdqmRkoZKz1oqqI2y1YuTCADKDiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 731DDF80245;
	Fri,  3 Jul 2020 02:47:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2466F8022D; Fri,  3 Jul 2020 02:47:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E09B9F800ED
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 02:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E09B9F800ED
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1593737229610528946-webhooks-bot@alsa-project.org>
References: <1593737229610528946-webhooks-bot@alsa-project.org>
Subject: alsa-lib: ctl: improve documentation for identifier of control element
Message-Id: <20200703004716.F2466F8022D@alsa1.perex.cz>
Date: Fri,  3 Jul 2020 02:47:16 +0200 (CEST)
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

alsa-project/alsa-lib pull request #66 was opened from takaswie:

In documentation, there are two ways relevant to the identifier of control
element. However, the case of combination has the lack of parameters.

This commit improves documentation in this point.

Fixes: f3c24de8c0df ("ctl: add an overview for design of ALSA control interface")
Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-lib/pull/66
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/66.patch
Repository URL: https://github.com/alsa-project/alsa-lib
