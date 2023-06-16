Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB3D7336CB
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jun 2023 18:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88CEE828;
	Fri, 16 Jun 2023 18:54:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88CEE828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686934541;
	bh=UDFKKOxIx/eNrXX8A+F90CLT9EuN82+a8wp2crJlpxs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=PLy7p+OphoMe3m1WKrNS/Lhg0DYw1HDu8ZjFsw1pcBuAg/5+M+fMN9pXAZ5CCijfg
	 5SIwZe/6PmYj4WHT0N5SSIt25AgvI7lRYGuzF6xNGD1BfqT/Uer7rhp0HZ5O4U5cN6
	 JaUN5rSYzSRdgmqbqPWebgCrA6Rm6chPmBmoiRuA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA177F80246; Fri, 16 Jun 2023 18:54:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66BCFF80132;
	Fri, 16 Jun 2023 18:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76BECF80149; Fri, 16 Jun 2023 18:54:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABD5F80130
	for <alsa-devel@alsa-project.org>; Fri, 16 Jun 2023 18:54:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABD5F80130
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1686934482317646265-webhooks-bot@alsa-project.org>
References: <1686934482317646265-webhooks-bot@alsa-project.org>
Subject: topology: nhlt: intel: support m/n divider and xtal/cardinal/pll
 clock source
Message-Id: <20230616165446.76BECF80149@alsa1.perex.cz>
Date: Fri, 16 Jun 2023 18:54:46 +0200 (CEST)
Message-ID-Hash: LKTXB6KW7OKFXKDVI4KYPTYMIRUQPQHN
X-Message-ID-Hash: LKTXB6KW7OKFXKDVI4KYPTYMIRUQPQHN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LKTXB6KW7OKFXKDVI4KYPTYMIRUQPQHN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #220 was opened from brentlu:

Current alsatplg supports only cardinal clock source without m/n divider. Code in SOF ssp driver is ported here to implement the clock source selection and divider function.

I tested the code on ADL brya device with following setting:
MCLK: 19.2MHz
BCLK: 3.072Mz (m 24 n 25)

Request URL   : https://github.com/alsa-project/alsa-utils/pull/220
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/220.patch
Repository URL: https://github.com/alsa-project/alsa-utils
