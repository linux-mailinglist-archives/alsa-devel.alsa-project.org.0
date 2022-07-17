Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95C57780D
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Jul 2022 21:54:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B73D51738;
	Sun, 17 Jul 2022 21:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B73D51738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1658087698;
	bh=OkbJb52x+c9rSWvpYHIxZ0b+iCx514vghYjCEnGtWMk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+JGUIV3WEfIHpc3BLu7oz8UJgZrPWGaDDLT5kwp9QVYkRqJkoKgj0ydF0QszA1DX
	 5iB2X2mm7M8VvfAQ0okdgfBWUMoeuqBEE5gvUYp17bXMr2sjPgRTWzEw/0yVipm1NH
	 EjvlyxusRbPQisRERNmCIWSW2TZimiR/p4DTYWFM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46138F804D8;
	Sun, 17 Jul 2022 21:53:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483D0F801D5; Sun, 17 Jul 2022 21:53:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id DA487F800F5
 for <alsa-devel@alsa-project.org>; Sun, 17 Jul 2022 21:53:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA487F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1658087604414271116-webhooks-bot@alsa-project.org>
References: <1658087604414271116-webhooks-bot@alsa-project.org>
Subject: Audio interface unable to be loaded in 1.2.7.2
Message-Id: <20220717195327.483D0F801D5@alsa1.perex.cz>
Date: Sun, 17 Jul 2022 21:53:27 +0200 (CEST)
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

alsa-project/alsa-ucm-conf issue #190 was edited from KevHg:

I upgraded from 1.2.6.1 to 1.2.7.2 and found that pulseaudio no longer detects my Motu M2 interface.

Main error log seems to be:
`module-alsa-card.c: Failed to find a working profile.`
`failed to load module module-alsa-card`

I'm new to debugging Linux issues, let me know what other info I can provide to help out on this topic.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/190
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
