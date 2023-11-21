Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 079FA7F32D5
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Nov 2023 16:55:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 13CEBDF0;
	Tue, 21 Nov 2023 16:55:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 13CEBDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700582111;
	bh=dlMuUAJcrqLMajWv4/sYpOmPZ8gFG5DzNQAIaXe8Me4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=XMj2lpjcSuslKd5L6r7qSpvz9los6R3mUFP4R1vLcJU940QyOvZeL9D+NX+7GIOrh
	 +IUgN6bI1xx1WbFJXpn+P7FdqvjhYUaq0L6GanXuVZ4UCU9BDt9nzUwkRq28SIKNRL
	 NzMzuf4sgPjzeqZlq8/IJygcUtW1BsmWUCcp0zeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1173DF80571; Tue, 21 Nov 2023 16:54:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5EF5F80579;
	Tue, 21 Nov 2023 16:54:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5EB6F802E8; Tue, 21 Nov 2023 16:54:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E9884F80166
	for <alsa-devel@alsa-project.org>; Tue, 21 Nov 2023 16:54:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9884F80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1700582068474481344-webhooks-bot@alsa-project.org>
References: <1700582068474481344-webhooks-bot@alsa-project.org>
Subject: Fix incorrect usages of `strerror`
Message-Id: <20231121155433.D5EB6F802E8@alsa1.perex.cz>
Date: Tue, 21 Nov 2023 16:54:33 +0100 (CET)
Message-ID-Hash: ULY6W2WVY3A2XKKA6B4DRQ6LHEPWVTEP
X-Message-ID-Hash: ULY6W2WVY3A2XKKA6B4DRQ6LHEPWVTEP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ULY6W2WVY3A2XKKA6B4DRQ6LHEPWVTEP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #245 was opened from i-Pear:

`strerror` takes the `errno` directly as its argument, negating it will result in an "Unknown error".

This fixes such usages across multiple modules.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/245
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/245.patch
Repository URL: https://github.com/alsa-project/alsa-utils
