Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63E92C6D8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jul 2024 02:03:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65E86A4B;
	Wed, 10 Jul 2024 02:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65E86A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720569813;
	bh=MGJ5tYzTrlZgCqbf13SEuNASYO9yLaiR7YiFyxqat2o=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HRpSqpl0VMGiJ6QtcSweAhb7KazHY5OF53MrxpYVIGjnv0XUdZKPDjyVO1Xs49jKM
	 Rlfn3uUVJUHa5ZLMuhhBdEqMCobBTrC5gkgYwtar+5Usn9+icxNr2mHCcixYzU9Yi/
	 fY19/4UG7UWic9Qx3JsjDOwsyfNH/dvJu3wFN2is=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2494BF805AD; Wed, 10 Jul 2024 02:03:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A57E6F805AE;
	Wed, 10 Jul 2024 02:03:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00E98F801F5; Wed, 10 Jul 2024 02:02:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id C1AACF80074
	for <alsa-devel@alsa-project.org>; Wed, 10 Jul 2024 02:02:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1AACF80074
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1720569773460662842-webhooks-bot@alsa-project.org>
References: <1720569773460662842-webhooks-bot@alsa-project.org>
Subject: I have the MPG Z690 Edge Wifi DDR4 motherboard,
 and no sound in front panel or back panel
Message-Id: <20240710000257.00E98F801F5@alsa1.perex.cz>
Date: Wed, 10 Jul 2024 02:02:57 +0200 (CEST)
Message-ID-Hash: UOILFQ5C3AGVGHZC6O2ZFZWEE54WJNC5
X-Message-ID-Hash: UOILFQ5C3AGVGHZC6O2ZFZWEE54WJNC5
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOILFQ5C3AGVGHZC6O2ZFZWEE54WJNC5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #432 was opened from angelbearuk:

I'm using Linux Mint 21, and am very frustrated.  Not being able to hear any sound just kills the Linux experience for me.  I had no issues with sound on Windows 10.  Please help me.  I'm a Linux newbie.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/432
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
