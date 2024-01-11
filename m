Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E17DB82B501
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Jan 2024 20:03:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6C6EBE;
	Thu, 11 Jan 2024 20:03:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6C6EBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704999815;
	bh=Ehy8M0qvCrR93SB9lL54jU2FhQd7n7DDWZnrHi5px5Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qp/w6nUdMFnau9wVbPwHW3LviBRyzIwsDsckPWZLMDnzVIGzQQhAYFtBZtIC1rcx+
	 oEzQDrLlJ1MZR1OhAgWbr+8P8SGfetYPGgxbx97FxigRCfZQzcmfF37nMQyfap9UkT
	 XKoYzFlln5JKz8aEdmMw/kXxFzWejvQL4T4zNLJU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49587F80588; Thu, 11 Jan 2024 20:03:03 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E28D8F8057F;
	Thu, 11 Jan 2024 20:03:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE1E1F80254; Thu, 11 Jan 2024 20:02:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id D4400F8003A
	for <alsa-devel@alsa-project.org>; Thu, 11 Jan 2024 20:02:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4400F8003A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1704999773278038025-webhooks-bot@alsa-project.org>
References: <1704999773278038025-webhooks-bot@alsa-project.org>
Subject: USB-Audio: add MOTU M6 config
Message-Id: <20240111190257.BE1E1F80254@alsa1.perex.cz>
Date: Thu, 11 Jan 2024 20:02:57 +0100 (CET)
Message-ID-Hash: SC22PX2RMHMZKJ45RD3R5UN3VEUYTOUL
X-Message-ID-Hash: SC22PX2RMHMZKJ45RD3R5UN3VEUYTOUL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SC22PX2RMHMZKJ45RD3R5UN3VEUYTOUL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #378 was opened from davide125:

This card shares the same ID as the MOTU M2 and M4, so we use the long card name to identify it.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/378
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/378.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
