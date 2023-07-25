Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D67A762548
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 00:00:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE9F843;
	Tue, 25 Jul 2023 23:59:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE9F843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690322429;
	bh=lC6DpJGiHlfio4vD11UJZawx7PVzbbLwiD5gx9Madn4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nitzmnFGGmAAsc/2XThGR2wqkF0PDdUUYxKDi14r8dX7ySjST7ExCy9j5OrpvzQU+
	 3uj1D3Um6Xw1yP1Pz29ipxL0apJSnpJJ2iRrnCxIVW8Z5W+V5zdi81s/1fXNBNTziO
	 ZHowxzBbARzDiaIM5uifYb1u/4UCFSAGfFhiBB1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0F19F8019B; Tue, 25 Jul 2023 23:59:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 11ABCF801F5;
	Tue, 25 Jul 2023 23:59:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB390F80310; Tue, 25 Jul 2023 23:59:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 05EF8F8019B
	for <alsa-devel@alsa-project.org>; Tue, 25 Jul 2023 23:59:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05EF8F8019B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1690322370004374743-webhooks-bot@alsa-project.org>
References: <1690322370004374743-webhooks-bot@alsa-project.org>
Subject: MSI MAG X570S TOMAHAWK MAX WIFI - microphone + front audio panel not
 working - attempt 2
Message-Id: <20230725215931.AB390F80310@alsa1.perex.cz>
Date: Tue, 25 Jul 2023 23:59:31 +0200 (CEST)
Message-ID-Hash: BLOEMVFNJWORNPELEKVWFYDTZTVROLYI
X-Message-ID-Hash: BLOEMVFNJWORNPELEKVWFYDTZTVROLYI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLOEMVFNJWORNPELEKVWFYDTZTVROLYI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #337 was edited from motomyslen:

I tried with `alsa-ucm-conf-1.2.9` but microphone still not working. Front audio panel detects headphones but no sound and mic not working as well.

If I'm not wrong ID of my device is `0db0:a073` but it was not added in 1.2.9 or 1.2.8 as I checked in changelog.


[alsa-info.txt](https://github.com/alsa-project/alsa-ucm-conf/files/12165950/alsa-info.txt)

Related https://github.com/alsa-project/alsa-ucm-conf/issues/186

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/337
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
