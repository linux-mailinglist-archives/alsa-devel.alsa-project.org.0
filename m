Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F29C26FF457
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 16:31:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B491EBA;
	Thu, 11 May 2023 16:30:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B491EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683815483;
	bh=YM7cWgTlvx52PjaNex/qCp+x5IF8qY85bCXO3vRK12s=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=mw4ITPw7u/dI+NbiHiNE2H1+yp8+8V0w8v35gFM+ZbYH5m9lROUN3sxkRX+Zv+CCw
	 SGpvCbDZSUN5TQK8cNqRYGgGVwBDHoTox7lgzzxv2Z7sCzUMmFFAPtl6/jqxSiE/eb
	 3jYJTWREPfyyNw3XS2XMvol4c/208zHdYzxYfZcE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B269F80544; Thu, 11 May 2023 16:30:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3352F8032D;
	Thu, 11 May 2023 16:30:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4769F8052E; Thu, 11 May 2023 16:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E6CCF8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 16:29:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E6CCF8014C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1683815393513153791-webhooks-bot@alsa-project.org>
References: <1683815393513153791-webhooks-bot@alsa-project.org>
Subject: Newest Update for Fedora 37 (alsa-lib-1.2.9-1.fc37) causes crackling
 with device
Message-Id: <20230511142956.A4769F8052E@alsa1.perex.cz>
Date: Thu, 11 May 2023 16:29:56 +0200 (CEST)
Message-ID-Hash: 7EIITUHVFGPIXHMMN2JCZXB4OHIHXFF5
X-Message-ID-Hash: 7EIITUHVFGPIXHMMN2JCZXB4OHIHXFF5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EIITUHVFGPIXHMMN2JCZXB4OHIHXFF5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #314 was edited from ClaraCrazy:

First bug report here + not skilled with debugging, so please go easy on me :smile: 

OS: Fedora 37
Alsa-lib: 1.2.9-1
Issue: Audio crackling
Audio Device: `Logic3 TX101 5.1 Soundbar` connected via `Scarlett 2i2 3rd Gen audio interface (USB)`

Reverted lib back to `alsa-lib.1.2.8-2.fc37` (which in turn also downgraded alsa-ucm and alsa-utils again) and issues are fixed. I have no idea how to debug this, but would love to help in any way possible, sadly there was no issue template that would give me infos on what logs are useful / where to get those so uh.. please someone just point me in the right direction :)

Thanks for your time

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/314
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
