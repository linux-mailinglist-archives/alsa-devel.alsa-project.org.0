Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 808181B4789
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 16:42:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0425516AF;
	Wed, 22 Apr 2020 16:41:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0425516AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587566539;
	bh=z1CnuEQAJidEWIVzn6kA9IJKeuFGMKe+jXQsGbFSGjc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D4e2SvUBwincNL95t+WLvCk4WMizQCirkijA1xG5gcl6GDfp6uQPoWhs6OdLL3GET
	 WDaObMxaiw09//Ud2QE7KCcBJfvMGUawO/bcXN2ufGjLAt8FUrAf4VDhXmRdvLAhYU
	 vFnIkRpgLx/zyrWzLiXx/Hl6l/GhGt5uO7EE3FKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29AE0F800F2;
	Wed, 22 Apr 2020 16:40:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CE6F801D9; Wed, 22 Apr 2020 16:40:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7676CF80108
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 16:40:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7676CF80108
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1587566427716154099-webhooks-bot@alsa-project.org>
References: <1587566427716154099-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: Revert "seq: tstamp: use wrapper structure instead
 of union"
Message-Id: <20200422144035.61CE6F801D9@alsa1.perex.cz>
Date: Wed, 22 Apr 2020 16:40:35 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #19 was opened from takaswie:

This reverts commit 20fdc2d893ccba609cc786ebac733bf6914f9874.

In the above commit, union type structure is wrapped with care of
language bindings in which union-compatible feature is not expected.
However, it's responsible for language bindings to parse gir and
the care is not necessarily required in shared library side. In first
place, ALSASeq.Tstamp is boxed type object.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/19
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/19.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
