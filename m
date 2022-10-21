Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FE4607B91
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 17:54:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3DFB890AB;
	Fri, 21 Oct 2022 17:53:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3DFB890AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666367682;
	bh=Iua4MWv/I7FjEjxxcLwibfXrlpvZCHWx4u2bLaB1zHI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DyWiCV06Zc2p/Uke8GjSPnPx6varihrTyic2tyU7UcBq56xv9SwBR9PoPrWY4arMw
	 2mb35TXUUX4J/Lrpfz7MrMNiG7ZRrtvt9JPQJsazAWKiesywI1dC+89tD6+XSHF7Dz
	 lrDhkTQT760nUW3L1YJyLBYy9f+51Qr2A86P40VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 994DDF800B5;
	Fri, 21 Oct 2022 17:53:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 478AAF8021D; Fri, 21 Oct 2022 17:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id F3C71F80134
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 17:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3C71F80134
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1666367623135313034-webhooks-bot@alsa-project.org>
References: <1666367623135313034-webhooks-bot@alsa-project.org>
Subject: ucm2: Add initial support for AMD Vangogh (acp5x) on Steam Deck
Message-Id: <20221021155346.478AAF8021D@alsa1.perex.cz>
Date: Fri, 21 Oct 2022 17:53:46 +0200 (CEST)
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

alsa-project/alsa-ucm-conf pull request #233 was opened from cristicc:

This has been tested on a Valve Steam Deck EV2 unit, using kernel v6.1-rc1.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/233
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/233.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
