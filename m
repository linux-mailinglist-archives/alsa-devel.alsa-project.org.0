Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F43AEB15
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 16:21:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7939F6;
	Mon, 21 Jun 2021 16:20:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7939F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624285281;
	bh=MGik1kdn89njY4hoyQQBQ1V7Dlu9mX52fHJ40QwM/oU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MczZr/DekYOfbrcQEDist9V6ks/kSks/vGa5oPaFsjugUdgWZ4kZESJT7iV27fOtd
	 h0qQJTmcSeLlyzzD3/f1i6WdWmp1RtVm7wNVLRSWM5YpCZvAlV6Ns5/GPJvE4pqwX+
	 FQznJrylLBkBbZXaxQ5W+V0OvRFZCsoQyfCP/ymI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1535F8016D;
	Mon, 21 Jun 2021 16:19:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81400F8016B; Mon, 21 Jun 2021 16:19:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id CF189F80163
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 16:19:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF189F80163
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1624285185330276012-webhooks-bot@alsa-project.org>
References: <1624285185330276012-webhooks-bot@alsa-project.org>
Subject: A52 documentation in need of updates.
Message-Id: <20210621141950.81400F8016B@alsa1.perex.cz>
Date: Mon, 21 Jun 2021 16:19:50 +0200 (CEST)
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

alsa-project/alsa-plugins issue #29 was opened from quequotion:

[a52.txt](https://github.com/alsa-project/alsa-plugins/blob/4219f4b3fded74d7b07a54c3ba8661d7a18c3b6c/doc/a52.txt) hasn't been changed in fifteen years.

In that time, [a preconfiguration has been supplied that ends up getting merged into a dysfunctional mess if users add a manual configuration to their asound.conf without prepending an exclamation point to override it](https://github.com/alsa-project/alsa-lib/issues/154#issuecomment-859799234), and more recently [more sample formats have been added](https://github.com/alsa-project/alsa-plugins/commit/f11e7a8994111f971bc881d4069f768472452f4f).

This file needs some attention.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/29
Repository URL: https://github.com/alsa-project/alsa-plugins
