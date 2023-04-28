Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF586F2021
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Apr 2023 23:31:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51AC214EA;
	Fri, 28 Apr 2023 23:30:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51AC214EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682717496;
	bh=xUUJ+1Jc9ZfDJH3SUQv5GVAfCMPKDwuYhntS7dTkWco=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o0WdG26Wsar4T4HAoLzXXlNYCdVrRcgCxR9MmNIiwnWEboLL2gS2sJUefRho2aFMT
	 bC4/WMiUSMrxh/2thoGoJMOggfSnh/MV6NLSOwwy7TyrX3b7Ah0ezuFDTUYMsEGNCw
	 vcaW8/gE7o+BslxtoV5XGbuyAbzk0HTNowKVz6+8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA14F80236;
	Fri, 28 Apr 2023 23:30:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 549FAF8025E; Fri, 28 Apr 2023 23:30:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id A2E99F80137
	for <alsa-devel@alsa-project.org>; Fri, 28 Apr 2023 23:30:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2E99F80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682717433521668673-webhooks-bot@alsa-project.org>
References: <1682717433521668673-webhooks-bot@alsa-project.org>
Subject: in a compound `test` command, change '-o' to '||'
Message-Id: <20230428213038.549FAF8025E@alsa1.perex.cz>
Date: Fri, 28 Apr 2023 23:30:38 +0200 (CEST)
Message-ID-Hash: QTKL5GNYMDOB5SM3ERWDDCSWQBEFTRTB
X-Message-ID-Hash: QTKL5GNYMDOB5SM3ERWDDCSWQBEFTRTB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QTKL5GNYMDOB5SM3ERWDDCSWQBEFTRTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #202 was opened from wileyhy:

Per a shellcheck warning
https://www.shellcheck.net/wiki/SC1139

Request URL   : https://github.com/alsa-project/alsa-utils/pull/202
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/202.patch
Repository URL: https://github.com/alsa-project/alsa-utils
