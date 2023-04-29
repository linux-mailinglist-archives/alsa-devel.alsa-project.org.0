Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5476F6F21BA
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Apr 2023 02:50:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924E51572;
	Sat, 29 Apr 2023 02:49:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924E51572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682729421;
	bh=vzTz8mocnqzLofHXvRLRcQEUrTguN4kZpcasT1NLlH4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qvNYn1jullSsp+Z+MO1SfDN+oU+Va/7qmzvh54gluXErb7qbz47Rpq/Scopl5e2xn
	 80You1xQs5PIN8XbvYBoJ+jNubcfWSqoMLqKdpNgBmRAhbATzAfQJRcyV9es7Avu3f
	 mDOw3MjzfzVmqtdDuEdMZGlCYU0ht1v9G9rfqscg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DFA26F80236;
	Sat, 29 Apr 2023 02:49:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D782F8025E; Sat, 29 Apr 2023 02:49:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5DA63F80137
	for <alsa-devel@alsa-project.org>; Sat, 29 Apr 2023 02:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DA63F80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682729362026524782-webhooks-bot@alsa-project.org>
References: <1682729362026524782-webhooks-bot@alsa-project.org>
Subject: reduce `exec`s by four, and eliminate logic bug
Message-Id: <20230429004927.2D782F8025E@alsa1.perex.cz>
Date: Sat, 29 Apr 2023 02:49:27 +0200 (CEST)
Message-ID-Hash: RGRDDNT65JKRQRMGKT435YBHNGCOMNJW
X-Message-ID-Hash: RGRDDNT65JKRQRMGKT435YBHNGCOMNJW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RGRDDNT65JKRQRMGKT435YBHNGCOMNJW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #205 was opened from wileyhy:

Per `info uname,` `uname` always prints its data in the same order.  Also, "note that A && B || C is not if-then-else. C may run when A is true." https://www.shellcheck.net/wiki/SC2015 

  set -x; read -r KERNEL_VERSION < <(uname -v); smp=x; [[ "$KERNEL_VERSION" = *SMP* ]] && { smp=y; readonly smp; false;} || smp=n; set -

Request URL   : https://github.com/alsa-project/alsa-utils/pull/205
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/205.patch
Repository URL: https://github.com/alsa-project/alsa-utils
