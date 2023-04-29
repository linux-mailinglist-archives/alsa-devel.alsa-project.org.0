Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8306F228A
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Apr 2023 05:05:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569E11572;
	Sat, 29 Apr 2023 05:04:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569E11572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682737527;
	bh=vNdG7ePgovSKPT44dueCy84HPLtiuUphfVkjEqb5veU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=NDSSekhOqJq0QIbc6650HVNhHqTWkdPIqB2bPZ4GAmRRf9kUHkla6rAxLT1vF0re4
	 X59GadRA5Jg5VRsFo80F3pWEdI+i7GxZZ9o0Q69llkOVl2iNglNZ/AGhIiZL5BvUF1
	 UOx7XNwD8qqsuIEYTrnHib3Db5fNPiEcydAoNRz4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6357F80236;
	Sat, 29 Apr 2023 05:04:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2BE2F8025E; Sat, 29 Apr 2023 05:04:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 947D9F80137
	for <alsa-devel@alsa-project.org>; Sat, 29 Apr 2023 05:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 947D9F80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682737460563930511-webhooks-bot@alsa-project.org>
References: <1682737460563930511-webhooks-bot@alsa-project.org>
Subject: reduce execs by four, and eliminate a logic bug
Message-Id: <20230429030431.E2BE2F8025E@alsa1.perex.cz>
Date: Sat, 29 Apr 2023 05:04:31 +0200 (CEST)
Message-ID-Hash: YGZZZE433JQZTEABYYJBNHBKRTLPKSEF
X-Message-ID-Hash: YGZZZE433JQZTEABYYJBNHBKRTLPKSEF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YGZZZE433JQZTEABYYJBNHBKRTLPKSEF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #207 was opened from wileyhy:

Per `info uname`, uname always prints its data in the same order. Also, from [SC2015](https://www.shellcheck.net/wiki/SC2015), 

> "Note that A && B || C is not if-then-else. C may run when A is true."

`set -x; read -r KERNEL_VERSION < <(uname -v); smp=x; [[ "$KERNEL_VERSION" = SMP ]] && { smp=y; readonly smp; false;} || smp=n; set -`

Request URL   : https://github.com/alsa-project/alsa-utils/pull/207
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/207.patch
Repository URL: https://github.com/alsa-project/alsa-utils
