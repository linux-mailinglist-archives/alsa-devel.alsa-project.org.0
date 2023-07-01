Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE76744AB4
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Jul 2023 19:17:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6788D846;
	Sat,  1 Jul 2023 19:16:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6788D846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688231859;
	bh=i1EqBeoK+A4xq9Kve2qUW8CoFRtItBAoYdEAjiCJtjw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qDjlsiKM//dOWyBC1Z+6QfZaDiGkZJ7yAyyNRDMaeyNsr4ofWcUMGcLJcj/083Mr4
	 6TNHXC8KRskNsjJAc63co5jdVkoyI1xgJyt9vTFoil02tAkiKpectwhZK5vh1OKWPy
	 0dYynKrECXkPZH/PaO+kLmTk0fiYekrJ7lPCniLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 678D8F80551; Sat,  1 Jul 2023 19:16:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00FEDF80548;
	Sat,  1 Jul 2023 19:16:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EEF6F80549; Sat,  1 Jul 2023 19:16:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8749EF80535
	for <alsa-devel@alsa-project.org>; Sat,  1 Jul 2023 19:16:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8749EF80535
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1688231769527839422-webhooks-bot@alsa-project.org>
References: <1688231769527839422-webhooks-bot@alsa-project.org>
Subject: ucm: mark internal functions static
Message-Id: <20230701171611.0EEF6F80549@alsa1.perex.cz>
Date: Sat,  1 Jul 2023 19:16:11 +0200 (CEST)
Message-ID-Hash: IMNLFHHLPU5QNNNGLMKTURR7LDHZH6JY
X-Message-ID-Hash: IMNLFHHLPU5QNNNGLMKTURR7LDHZH6JY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMNLFHHLPU5QNNNGLMKTURR7LDHZH6JY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #335 was edited from neobrain:

I've ran into build issues in a project that links against both libalsa and libxkbcommon, which both export a function called `parse_string`. Changing internal functions to internal linkage (`static`) prevents this kind of problem.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/335
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/335.patch
Repository URL: https://github.com/alsa-project/alsa-lib
