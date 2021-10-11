Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE02428CE6
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Oct 2021 14:18:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F5C5167D;
	Mon, 11 Oct 2021 14:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F5C5167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633954704;
	bh=+modbq7gFaHRS/C6O5N3bkBo6rlJ+wjLiM5wbHhSNwE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VLL+00DckVdq1nKtogX2s/t3P03YoZT3OnUU1R2f3388Mhb+cjuUXJZFxlSzVcHRJ
	 mcBlrSdeHuiMkyJJeRsyYNTXdpqbRHzrM6oC1aI7ekZulJA5+pCH8lxq9H0i9SCxcL
	 q7VAPrSLCXTiOSik56HYkZNvuqKlaUX+1Fw2jv/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 768F9F800C0;
	Mon, 11 Oct 2021 14:17:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8CB7F8016D; Mon, 11 Oct 2021 14:17:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.0 required=5.0 tests=MISSING_DATE,MISSING_MID,
 PRX_BODY_14,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 78C49F8016D
 for <alsa-devel@alsa-project.org>; Mon, 11 Oct 2021 14:16:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78C49F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633954615724216938-webhooks-bot@alsa-project.org>
References: <1633954615724216938-webhooks-bot@alsa-project.org>
Subject: When will we have a new release?
Message-Id: <20211011121702.E8CB7F8016D@alsa1.perex.cz>
Date: Mon, 11 Oct 2021 14:17:02 +0200 (CEST)
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

alsa-project/alsa-lib issue #185 was opened from leiserfg:

There was an issue in the last release that affects pipewire while using laptops with `Comet Lake PCH` that was solved in alsa after the release. I'm  currently using `master` via AUR but will love to be able to use a release version (so I don't have to re-build with every change on master)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/185
Repository URL: https://github.com/alsa-project/alsa-lib
