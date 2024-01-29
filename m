Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE688400E1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 10:06:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9B76826;
	Mon, 29 Jan 2024 10:06:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9B76826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706519204;
	bh=9RfKNChZ9qYEVq4PgURhqv5dyJcbC5wHxAuOq3+3g4w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rPat3ObMQZtwBYz5z75ybnCQqBmJm7DMb2SxZeSDWg2DKwSI0XMZp+uQxR0OwqDWD
	 JCz5BcaOctMDpM4cvC3n9aWcabJGgoJSSeosQwYI/DFCOSxi7rmCAbjEoNBWtA5kWq
	 eMPB41zd8tdqcXJ3KZYsJfYVYGRwkEhrmkmpBCns=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 512F5F805A9; Mon, 29 Jan 2024 10:06:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDCF0F80053;
	Mon, 29 Jan 2024 10:06:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A152F80310; Mon, 29 Jan 2024 10:06:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D33F800FB
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 10:06:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32D33F800FB
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1706519157987912893-webhooks-bot@alsa-project.org>
References: <1706519157987912893-webhooks-bot@alsa-project.org>
Subject: USB-Audio: ALC4080: Add support for MSI MPG B650 Carbon Wifi
 (0db0:70d3)
Message-Id: <20240129090606.2A152F80310@alsa1.perex.cz>
Date: Mon, 29 Jan 2024 10:06:06 +0100 (CET)
Message-ID-Hash: OCLMT3JSZ5BUSPQ56RYUVZJXDP2LPETF
X-Message-ID-Hash: OCLMT3JSZ5BUSPQ56RYUVZJXDP2LPETF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OCLMT3JSZ5BUSPQ56RYUVZJXDP2LPETF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #392 was opened from lngr:

This PR adds support for the MSI MPG B650 Carbon Wifi board. This makes the front headphone and microphone ports working (tested on my local hardware).  The microphone sound volume is a bit low compared to windows, [as mentioned previously](https://github.com/alsa-project/alsa-ucm-conf/pull/143/files#r845264949), but in general it works.

Fixes #359

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/392
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/392.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
