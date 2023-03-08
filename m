Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD66B117F
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Mar 2023 19:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D58A61863;
	Wed,  8 Mar 2023 19:56:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D58A61863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678301811;
	bh=0HUKRygxQsAuz9jNy17fMEI4VFSiKj6RA4x3QBwj3HU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sPTOsXurcnBsUGNGr80lvU0/h3sOasZL5hu4AhQovTJwRBHqJ/NhoQ+jRyTksXhKH
	 T6Rmpd/APs5dENpbaceEE1Oi/wNz2NcpFubi3nm2koTJwzYciCHAWeQzZNP66INao2
	 I2yglVzsBCDqhRwI4itDIiKWiQ7OQs5sf0yU55Ms=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64853F80236;
	Wed,  8 Mar 2023 19:56:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81601F8042F; Wed,  8 Mar 2023 19:55:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D914EF8007E
	for <alsa-devel@alsa-project.org>; Wed,  8 Mar 2023 19:55:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D914EF8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1678301744827406883-webhooks-bot@alsa-project.org>
References: <1678301744827406883-webhooks-bot@alsa-project.org>
Subject: Use case for the Arturia Minifuse 4 Audiointerface
Message-Id: <20230308185557.81601F8042F@alsa1.perex.cz>
Date: Wed,  8 Mar 2023 19:55:57 +0100 (CET)
Message-ID-Hash: AOGA3AZE3742EJMJU47OTLUK5AOUBPRZ
X-Message-ID-Hash: AOGA3AZE3742EJMJU47OTLUK5AOUBPRZ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AOGA3AZE3742EJMJU47OTLUK5AOUBPRZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #287 was opened from bernsnf:

Use case for the Arturia Minifuse 4 Audiointerface 
https://www.arturia.com/products/audio/minifuse/minifuse4

Based on the existing Minifuse 2 Profile.
#145 

I created a separate file because of the additional input- and output-Pairs result in different loopback channels.

Without the usecase outputs threated as surround channels.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/287
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/287.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
