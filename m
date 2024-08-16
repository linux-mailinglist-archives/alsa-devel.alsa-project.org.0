Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C4F954E48
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Aug 2024 17:55:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE0D42C14;
	Fri, 16 Aug 2024 17:55:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE0D42C14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723823750;
	bh=eRpribolsbXeIXpIuizDGboVNKXIHp9yhhNEjM0r3Z0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uhEw0yzPEHbNGmUPCvDQ9bwo6PWP9rNMFaWDARFABh+qTeAE8s92wn9CLo46o+pvQ
	 3nIAl24/qH0WFcz6nDcfaCIUhppOGQoZfq1CNHyJxvhRuaPhLd4dMmNJHmuveetrEc
	 azOtIs1ASARRbwFRdV5kDW+E5+ug6NuEGwfYrLzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2CEAF805AE; Fri, 16 Aug 2024 17:55:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FD2BF805AE;
	Fri, 16 Aug 2024 17:55:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75EC9F80423; Fri, 16 Aug 2024 17:55:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D98EF80107
	for <alsa-devel@alsa-project.org>; Fri, 16 Aug 2024 17:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D98EF80107
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723823709856508732-webhooks-bot@alsa-project.org>
References: <1723823709856508732-webhooks-bot@alsa-project.org>
Subject: Use PyBytes and not Unicode strings for IEC958 values
Message-Id: <20240816155512.75EC9F80423@alsa1.perex.cz>
Date: Fri, 16 Aug 2024 17:55:12 +0200 (CEST)
Message-ID-Hash: O2EAINPUNN34VWRGFPILPGWY5YEHOYKX
X-Message-ID-Hash: O2EAINPUNN34VWRGFPILPGWY5YEHOYKX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2EAINPUNN34VWRGFPILPGWY5YEHOYKX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-python pull request #14 was edited from tormodvolden:

Suggested fix for #13.

- the first commit is not strictly related but also needed to avoid hctltest1.py crashing with my audio devices, where some have info.count = 0. Let me know if more information is needed. I don't know if this is expected or if a warning should be issued.

- I went for PyBytes instead of PyByteArray
 
- for setting values, if the provided PyBytes value is shorter than the value, it will be zero-padded.
  - if it is too long, it will be silently truncated
 
- following the existing code style, no empty lines were inserted, but this could help readability

- the third commit is not for fixing the crash, but for fixing set_tuple() to actually do anything for IEC958

Request URL   : https://github.com/alsa-project/alsa-python/pull/14
Patch URL     : https://github.com/alsa-project/alsa-python/pull/14.patch
Repository URL: https://github.com/alsa-project/alsa-python
