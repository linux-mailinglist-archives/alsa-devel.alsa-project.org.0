Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463A6F216A
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Apr 2023 01:55:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B9B81566;
	Sat, 29 Apr 2023 01:54:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B9B81566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682726100;
	bh=mSDXFAu7hbB0mAqSXwBgwV3jSkr6uUBwqFeaGyMRQIk=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=BDxKm7SjVrQkegrwHV6Cny0KcBrhN40f/Z/WhaVZqZ7fLqPntGYjr5ARupyYbt4Hx
	 POhWMr5jofALOHE0hJSNmGZL38BLCnudFXHT/PY6Nc+OTtA2jnW/y9faw8ZrEm5wNQ
	 3b7VWRm1Sepu+0W7eU9ynO8xmS6dsDjTZtR8Sd70=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B13EAF80236;
	Sat, 29 Apr 2023 01:54:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006F5F8025E; Sat, 29 Apr 2023 01:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id DC707F80137
	for <alsa-devel@alsa-project.org>; Sat, 29 Apr 2023 01:54:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC707F80137
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1682726044524734974-webhooks-bot@alsa-project.org>
References: <1682726044524734974-webhooks-bot@alsa-project.org>
Subject: change '-o' in a `test` command to `|| test`
Message-Id: <20230428235407.006F5F8025E@alsa1.perex.cz>
Date: Sat, 29 Apr 2023 01:54:06 +0200 (CEST)
Message-ID-Hash: U7KY6YGY65I5HIPXY4EMSLOOTWPXZAAT
X-Message-ID-Hash: U7KY6YGY65I5HIPXY4EMSLOOTWPXZAAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U7KY6YGY65I5HIPXY4EMSLOOTWPXZAAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #204 was opened from wileyhy:

this syntax functions locally

Request URL   : https://github.com/alsa-project/alsa-utils/pull/204
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/204.patch
Repository URL: https://github.com/alsa-project/alsa-utils
