Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9121CEAF5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 04:48:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85681607;
	Tue, 12 May 2020 04:47:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85681607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589251715;
	bh=34PwPS99VyIcK9A2bm9xpOcGNPOKgDbIhynMS4v5Wls=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZVM7DNWPtGWmqRFuSAHEoZXpwNvXYSBZoRfxLfSRxwjTLlgurzBJhwdsCvbyclCzu
	 Fl5y5dkrhh1sUuep97PcuvTz0UVk4EwGgR/d6xBUGf8evW3qz2g4+xATUatBaeDcVW
	 1EMn18YHCDw37htQnp25ovwUGkcwp0BWJ4+idxLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 028ACF80112;
	Tue, 12 May 2020 04:46:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4683BF8014C; Tue, 12 May 2020 04:44:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 704D6F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 04:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 704D6F800AA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1589251439118243933-webhooks-bot@alsa-project.org>
References: <1589251439118243933-webhooks-bot@alsa-project.org>
Subject: alsa-gobject: seq: user_client: remove useless argument of
 delete_port()
Message-Id: <20200512024424.4683BF8014C@alsa1.perex.cz>
Date: Tue, 12 May 2020 04:44:24 +0200 (CEST)
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

alsa-project/alsa-gobject pull request #21 was opened from takaswie:

In implementation of ALSA sequencer core, the port owned by client can
be deleted by userspace applications which opens the client, therefore
it's necessary and sufficient to have an argument just for the numerical
ID of port.

This commit removes the useless argument for port information.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>

Request URL   : https://github.com/alsa-project/alsa-gobject/pull/21
Patch URL     : https://github.com/alsa-project/alsa-gobject/pull/21.patch
Repository URL: https://github.com/alsa-project/alsa-gobject
