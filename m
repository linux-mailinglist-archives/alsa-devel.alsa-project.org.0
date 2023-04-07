Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFA16DA800
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Apr 2023 05:33:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D73F3EC3;
	Fri,  7 Apr 2023 05:33:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D73F3EC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680838434;
	bh=PfGKAKBrG+GjHn8xFk2tMGWJ7B8hj/Sm0d2srLZtHD8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=e7MBeNb13zM2gucQI0QXY8aOuDO60ad3iEaYEERFRKEt/8E1AMCJFDfSl37PuvdvY
	 Z9s69f/K/czd1Tl1uFxv3+fjx9DdukwkN6HL+HQA71frMTxHtP+XfcSWjBCEfJ1LTx
	 oDFxTlztU67YRvdaC3ksGVNefSeCj09JQA9xqRaA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 168B4F80249;
	Fri,  7 Apr 2023 05:33:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A122FF8026A; Fri,  7 Apr 2023 05:32:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 80B00F8015B
	for <alsa-devel@alsa-project.org>; Fri,  7 Apr 2023 05:32:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80B00F8015B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1680838368521046638-webhooks-bot@alsa-project.org>
References: <1680838368521046638-webhooks-bot@alsa-project.org>
Subject: [question] [ucm] how to manage the ucm and ucm2 for different kernels
Message-Id: <20230407033255.A122FF8026A@alsa1.perex.cz>
Date: Fri,  7 Apr 2023 05:32:55 +0200 (CEST)
Message-ID-Hash: JI77MFQX5LMXCZWB6ZTWTTG6L7ACO6HH
X-Message-ID-Hash: JI77MFQX5LMXCZWB6ZTWTTG6L7ACO6HH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JI77MFQX5LMXCZWB6ZTWTTG6L7ACO6HH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #312 was opened from leif1992:

I got a problem which confused me for a long time. Wish I can get a good answer from here.

I write the ucm and ucm2 files for my sound card which can work well with my driver. And I need to support both 4.19 kernel (which use the ucm) and the 5.4 kernel (which use the ucm2). They are all deployed in the /usr/share/alsa. However, I need to install to audio driver for both 4.19 and 5.4 (DKMS). The ucm and ucm2 were both deployed at the same time. When I switch the kernel to 5.4, my ubuntu can't load my UCM files normally, and if I removed the files in the usr/share/alsa/ucm and then reboot the OS. My ucm files in the usr/share/alsa/ucm2 can be loaded normally.

Would you please help me figure out this incompatibility problem?

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/312
Repository URL: https://github.com/alsa-project/alsa-lib
