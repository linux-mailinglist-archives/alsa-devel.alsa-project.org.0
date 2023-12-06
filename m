Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA7806AF2
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Dec 2023 10:44:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C894FDEB;
	Wed,  6 Dec 2023 10:44:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C894FDEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701855862;
	bh=KimLvig8svOu1guiULJc5W5x6JO2lvYi2KGgzsYwI60=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=eWSzdsL5hsm3g/6tRjVGDujZYtmNfeIMfxNISmteBXg9HbXisCBGXL0g3HdHURGbc
	 CYvyWMXLnHYSqWIjqTjvnHttK9n6fMIJNUYBBVuKa0d0uXmb12pCJlz5noQcMQ22jT
	 0QFApHEjFQe7MNIrW+EEpjtbP8JyHH5MiaAKiefM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD9B8F805BD; Wed,  6 Dec 2023 10:43:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13803F805BA;
	Wed,  6 Dec 2023 10:43:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0883F8024E; Wed,  6 Dec 2023 10:38:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E067F800F5
	for <alsa-devel@alsa-project.org>; Wed,  6 Dec 2023 10:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E067F800F5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1701855508876956463-webhooks-bot@alsa-project.org>
References: <1701855508876956463-webhooks-bot@alsa-project.org>
Subject: aplay: Add option for specifying subformat
Message-Id: <20231206093830.E0883F8024E@alsa1.perex.cz>
Date: Wed,  6 Dec 2023 10:38:30 +0100 (CET)
Message-ID-Hash: LQW3FR2AKDN7LCGRY7XODQLZAEDI6J4L
X-Message-ID-Hash: LQW3FR2AKDN7LCGRY7XODQLZAEDI6J4L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQW3FR2AKDN7LCGRY7XODQLZAEDI6J4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #228 was edited from crojewsk-intel:

Make subformat first-class citizen by allowing users to specify it just like it is the case for the format. Default to SND_PCM_SUBFORMAT_STD so they are no surprises.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/228
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/228.patch
Repository URL: https://github.com/alsa-project/alsa-utils
