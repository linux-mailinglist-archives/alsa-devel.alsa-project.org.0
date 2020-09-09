Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16965262B7D
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Sep 2020 11:14:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A81016EE;
	Wed,  9 Sep 2020 11:13:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A81016EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599642859;
	bh=anpuKVZHlvdX7oFnqwE/ZDGiAO7aIafnPIHc9oBEKUM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JYnJWQ/vcX3Q+tdA7GWodPSLiI5uGhk3nN5TLuwDeboPyl9YVXqrtF4exWDWLREgV
	 ht4AyCtSahj+JqyP6yAWwoUiOj0Ho5dOb5aa9bokk/14dd769L/yUT1pKmr7Oz2t9r
	 c5wPHqA54Sp/4+ZcD/6tIqZQm3XCE1G8KUlQf1Tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0A6F80240;
	Wed,  9 Sep 2020 11:12:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC3BCF80227; Wed,  9 Sep 2020 11:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id D2844F8015F
 for <alsa-devel@alsa-project.org>; Wed,  9 Sep 2020 11:12:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2844F8015F
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1599642750133460999-webhooks-bot@alsa-project.org>
References: <1599642750133460999-webhooks-bot@alsa-project.org>
Subject: ucm2: USB-Audio: Add support for Lenovo ThinkStation P620 Rear Audio
Message-Id: <20200909091236.CC3BCF80227@alsa1.perex.cz>
Date: Wed,  9 Sep 2020 11:12:36 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #50 was opened from khfeng:

Add proper PCM assignment to Lenovo ThinkStation P620 Rear Audio.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/50
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/50.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
