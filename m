Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB247FDC3
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Dec 2021 15:09:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D27F1683;
	Mon, 27 Dec 2021 15:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D27F1683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640614150;
	bh=5YPDWXYSMmUDMvYmm2flDkboMfccs3BllP4Lvxwc/ho=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GZNPvIZ3lSev/itBJ60VG6MmxWHNyMndb7Xl14ilqQNZL3afdwvZB/G838rS1DoIx
	 90nl/yriJPBV98XvlBKmNaA59xIPWG9xQu/Zek53mhUnCFMfYdRCJai6mP2rttYm/v
	 jnjGlsLmHjCAOaRRHGoyViXEbmPXpYSAQR3y1gp4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BBE3F80161;
	Mon, 27 Dec 2021 15:08:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD917F80158; Mon, 27 Dec 2021 15:08:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 6AF11F800D3
 for <alsa-devel@alsa-project.org>; Mon, 27 Dec 2021 15:07:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AF11F800D3
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1640614072413722038-webhooks-bot@alsa-project.org>
References: <1640614072413722038-webhooks-bot@alsa-project.org>
Subject: a52: frozen pavumeter
Message-Id: <20211227140802.CD917F80158@alsa1.perex.cz>
Date: Mon, 27 Dec 2021 15:08:02 +0100 (CET)
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

alsa-project/alsa-plugins issue #42 was edited from quequotion:

I had been [thinking that pavumeter was just broken](https://github.com/nekohayo/pavumeter/issues/1), because this has been happening to me for a long time (well before the changes between 1.2.5 and 1.2.6), but now I realize that I hadn't tested against stereo mode in just as long.

When using the a52 plugin, pavumeter is frozen as soon as it opens: if audio was playing, levels will show at exactly where they were at that moment and never change; if audio was not playing, levels will never appear because the interface is frozen before there were any.

I am curious if this, #37 and #32 are not related.

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/42
Repository URL: https://github.com/alsa-project/alsa-plugins
