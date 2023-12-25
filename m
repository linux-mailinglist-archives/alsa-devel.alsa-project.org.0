Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9619A81E20E
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Dec 2023 19:56:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC78E10;
	Mon, 25 Dec 2023 19:56:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC78E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703530610;
	bh=mILSrLiqQmpvWSs/LTwrv+ybfNFZUdruNP41MbM2U5k=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uejZkuhyA2Ctoa1qFGx1EPCv/1OnUZWfinbIcXaZMUKKJlKnUWILdPfhaNC9MheZf
	 HcDSMurvNNFNs3RBzOjtX588PfF/uxrrNxrGachND+pHMzATPx7k/ovicN4b3ecznC
	 jsQ+Apg7fXbaCcvVOxmxs7Tt1BmSBvRyJ4QBkWLk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B330F8057B; Mon, 25 Dec 2023 19:56:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BF56F800BD;
	Mon, 25 Dec 2023 19:56:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1097F80169; Mon, 25 Dec 2023 19:53:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A4EFF800BD
	for <alsa-devel@alsa-project.org>; Mon, 25 Dec 2023 19:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A4EFF800BD
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1703530311592423439-webhooks-bot@alsa-project.org>
References: <1703530311592423439-webhooks-bot@alsa-project.org>
Subject: Possible wrong priority in the Behringer UMC configs
Message-Id: <20231225185321.B1097F80169@alsa1.perex.cz>
Date: Mon, 25 Dec 2023 19:53:21 +0100 (CET)
Message-ID-Hash: CBD7CYXCEZAFORJQQ5752QNZINQBX7CH
X-Message-ID-Hash: CBD7CYXCEZAFORJQQ5752QNZINQBX7CH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CBD7CYXCEZAFORJQQ5752QNZINQBX7CH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #372 was opened from Zelaf:

I noticed that whenever I plug my UMC404HD in that the default output always sets to Line B and that Input 4 always get selected as the Input. 

I looked at the UMC404HD config and noticed that the priority gets increased by 100 with Line B having a priority of 100 and Line A having a priority of 200.

The inputs have from Input 4 to Input 1 have a priority of 100, 200, 300 and 400 respectively.

I'm thinking, wouldn't the correct priority be reversed? I think my PipeWire/WirePlumber configuration reads the priority with the lower taking higher priority and I'm unsure if that's the correct way to read the config according to ALSA standards or if my configuration is the odd one.

I'll happily make a PR to fix this if that's the case.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/372
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
