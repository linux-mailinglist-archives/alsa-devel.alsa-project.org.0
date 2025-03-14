Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B2AA60DFE
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Mar 2025 10:55:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D6B660180;
	Fri, 14 Mar 2025 10:55:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D6B660180
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741946124;
	bh=fn0GJFXekps8WhzqpeVCmGshZl8DbNr6ce47cTzk9Hw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rYlnjsCWe6tkwCykVxDZbNUzfjscgkvu6MbqTcLnLbYrcV2eDQA0Tw0rJgRAr00Hg
	 FBg7aU2BWuTLn9F2WzxKq2ipBQWwsiTcnVfONnMwx3X29veEOuWVkr3ce22JZgrLgc
	 ScCnc9RSrwM+6SJ34JxyBB6oT6c3c7JiToYtvK6E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47994F805BB; Fri, 14 Mar 2025 10:54:50 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F820F80587;
	Fri, 14 Mar 2025 10:54:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4DB3EF80424; Fri, 14 Mar 2025 10:54:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E843F800D0
	for <alsa-devel@alsa-project.org>; Fri, 14 Mar 2025 10:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E843F800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182ca2bb658ac000-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/521@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/521@alsa-project.org>
Subject: USB-Audio: GoXLR - fix the channel detection for mini, cleanups
Date: Fri, 14 Mar 2025 10:54:44 +0100 (CET)
Message-ID-Hash: 2LFG6KXW6IBFXLOWVDQGBKB43H7F3NAX
X-Message-ID-Hash: 2LFG6KXW6IBFXLOWVDQGBKB43H7F3NAX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2LFG6KXW6IBFXLOWVDQGBKB43H7F3NAX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #521 was opened from perexg:

Note that detection for 25 channels requires commit [1] (alsa-lib 1.2.14+).

[1] https://github.com/alsa-project/alsa-lib/commit/7fbd47ce797939862025ef424865570dcdc2565b

BugLink: https://github.com/alsa-project/alsa-ucm-conf/issues/444

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/521
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/521.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
