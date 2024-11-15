Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA89CD4E5
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Nov 2024 02:11:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB318238F;
	Fri, 15 Nov 2024 02:11:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB318238F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1731633117;
	bh=xiVYOVJo9otYQ1PsP7SNEtr9AnQ+bfxRL330j3kcR6Q=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=DN9E4qGCjtvRddwX59VuMee/lkT7W0dn0xWk+fDgyJvqFdmUZiK/NixpAMw5xC5zk
	 BZxsXuM71Urt+HyIt+OcsJ74igTdaE7Iazl5T4UXjZYysANRqrBvlkfC4R2tEWHcEE
	 bqZn1mcUjn8e+32T8ipbS+aefGI0Y/4xO19r0slk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 20BE7F805B3; Fri, 15 Nov 2024 02:11:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4401F805B5;
	Fri, 15 Nov 2024 02:11:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E139F8058C; Fri, 15 Nov 2024 02:11:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A64AF80587
	for <alsa-devel@alsa-project.org>; Fri, 15 Nov 2024 02:11:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A64AF80587
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1731633078664793253-webhooks-bot@alsa-project.org>
References: <1731633078664793253-webhooks-bot@alsa-project.org>
Subject: Fix JackControl name
Message-Id: <20241115011121.0E139F8058C@alsa1.perex.cz>
Date: Fri, 15 Nov 2024 02:11:21 +0100 (CET)
Message-ID-Hash: B22ANH3MBTKGA66C47JRBVDEPSIOPFSH
X-Message-ID-Hash: B22ANH3MBTKGA66C47JRBVDEPSIOPFSH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B22ANH3MBTKGA66C47JRBVDEPSIOPFSH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #464 was opened from lbilli:

Not sure whether it makes a difference but that is the name reported by `amixer events`.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/464
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/464.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
