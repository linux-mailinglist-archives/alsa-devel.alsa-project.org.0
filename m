Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C345421976
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 23:51:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1BD89166A;
	Mon,  4 Oct 2021 23:50:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1BD89166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633384297;
	bh=FnOu6IgnDFnkcDFVWpcb6AyKu2zBwg0aj5sNiL/t8kk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9syZL9J1XTBRY8GYES1vQ0GT/tvXoKgdVaZYkP8JEFVXaP1UdHgMbtaVJ05ae4X4
	 mJWoxi+Z/XiK3TyN55F3ZPGzCLFNZU1EhzmGSy5aLyy82iAQlU+QYKUhYwss8wpvsM
	 A0o4mxh5IE3yE3jdOwKV3vNbgHZBxo6NfY0wiOZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9AD7F8010B;
	Mon,  4 Oct 2021 23:50:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 832FBF80240; Mon,  4 Oct 2021 23:50:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id EEBC8F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 23:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEBC8F8010B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1633384203713594913-webhooks-bot@alsa-project.org>
References: <1633384203713594913-webhooks-bot@alsa-project.org>
Subject: MIDI 2.0 support in ALSA
Message-Id: <20211004215019.832FBF80240@alsa1.perex.cz>
Date: Mon,  4 Oct 2021 23:50:19 +0200 (CEST)
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

alsa-project/alsa-lib issue #180 was opened from robertwu1:

Hi, now that USB MIDI 2.0 is officially out (https://www.midi.org/specifications/midi-2-0-specifications), are there any updates for support in USB MIDI 2.0 in ALSA?

https://github.com/alsa-project/alsa-lib/issues/24 was closed in February of 2020 but it's been over a year and a half. There seems to be quite a bit of interest in the issue since it had been closed.

Thanks!

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/180
Repository URL: https://github.com/alsa-project/alsa-lib
