Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEB2F69D6
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jan 2021 19:45:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C35B9169A;
	Thu, 14 Jan 2021 19:44:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C35B9169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610649916;
	bh=GtMaGUEOmB3/LbhwV5xEl19RUaC2L/5Us6Azka0lDZo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfGoF6gRXWVMBXTd4po5oTSRkj8dFF5MssGuwF//zqmhh8QitzjhDayuYBzInvXTW
	 VFlVPlFTRRm78lN3aKFgyL2Z9YVyb+O7sXcGh0DneUCddZR/V5lKFHzRU/0h0uR9G6
	 07v2EfVDZUDhnY7ktE41E72AajDXhGsHaeG+hlvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A68FF8026F;
	Thu, 14 Jan 2021 19:43:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E277DF8025E; Thu, 14 Jan 2021 19:43:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id E7CE8F80113
 for <alsa-devel@alsa-project.org>; Thu, 14 Jan 2021 19:43:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E7CE8F80113
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1610649815576633930-webhooks-bot@alsa-project.org>
References: <1610649815576633930-webhooks-bot@alsa-project.org>
Subject: USB-Audio/ALC1220: Bump analog Speaker priority over S/PDIF
Message-Id: <20210114184341.E277DF8025E@alsa1.perex.cz>
Date: Thu, 14 Jan 2021 19:43:41 +0100 (CET)
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

alsa-project/alsa-ucm-conf pull request #73 was opened from MarijnS95:

Suggestion from https://github.com/alsa-project/alsa-ucm-conf/pull/25#issuecomment-760141633

The `S/PDIF` port does not have any jack sensing, and with a priority higher than the `Speakers` it will always be selected by default instead of the `Speakers` even if unplugged.

Swapping the priorities around allows analog `Speakers` to be selected first, _if_ they are plugged in. Otherwise `S/PDIF` is used.

The sections are reordered to adhere to this priority, including some indentation fixes.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/73
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/73.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
