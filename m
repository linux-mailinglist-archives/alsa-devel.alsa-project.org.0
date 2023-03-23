Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CEF6C6963
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 14:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838B1EC8;
	Thu, 23 Mar 2023 14:21:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838B1EC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679577732;
	bh=U+aO/1WbFg9gjoP6NN0VXa5FHeq5IJSCkTy67wGTISY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=cC4VkXKnM4gCetcEdeieenxPmeTRLXeSzA0NE0zthk/B/57Ke0Tr3yRfLI0YfsFnB
	 KOLsc4JIV7ayRgSmRq6D/nHx7iKqucWOUjMnoKtmIiovNnn9BPr5G2QHQ63nw2HLWj
	 5qXAHxsPHRle5Co+iRgenzJ1zHF/8gi5CTR5XOtk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EE539F80254;
	Thu, 23 Mar 2023 14:21:21 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 259FDF8027B; Thu, 23 Mar 2023 14:21:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EED0F800C9
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 14:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EED0F800C9
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1679577672557661295-webhooks-bot@alsa-project.org>
References: <1679577672557661295-webhooks-bot@alsa-project.org>
Subject: ALC4082 - Asus Crosshair x670E Hero
Message-Id: <20230323132118.259FDF8027B@alsa1.perex.cz>
Date: Thu, 23 Mar 2023 14:21:18 +0100 (CET)
Message-ID-Hash: YHRQKQ6URXFB3NV5ZS5LHHGGZZT6MQCM
X-Message-ID-Hash: YHRQKQ6URXFB3NV5ZS5LHHGGZZT6MQCM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YHRQKQ6URXFB3NV5ZS5LHHGGZZT6MQCM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #295 was opened from nitin88:

Hi,

I am using frontend Mic and Output of x670E Hero board.

Issues:
1. The mic volume is too low that I have to literally shout to record something.
2. Attached screenshot of Alsamixer (set everything to high)
![image](https://user-images.githubusercontent.com/4945664/227216525-095810ad-273c-4941-b881-b3b2467cdd86.png)
3. Copied latest master configurations

Was closely following this thread https://github.com/alsa-project/alsa-ucm-conf/issues/229 as this board uses same ALC4082 but from Asrock
I can help you debug/test every possible configuration with this board, any help to fix "sound recording" is appreciated.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/295
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
