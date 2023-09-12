Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C54E679D9B5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 21:42:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D299886;
	Tue, 12 Sep 2023 21:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D299886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694547763;
	bh=7/Ht4pa7b5DuLyGXYR6RFnWBWkCxjjWTBlkJIWeIYF0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=K/JUSltbVaAODtj18cDZ90bXvyM3+x7sLhtK8ZSPjRnEu4kVjde7/rFC8cfgf9IR2
	 MOZtHW14kaTGiqxJRtC33JH5UqSzPpwu8prntCDXYtDgGHtL/uGfMv/Cj8OBbyZ6Ym
	 dngtMqZVctSnt0Qp0ictg21w6rIzznTw+KkBVzEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CDADF8007C; Tue, 12 Sep 2023 21:41:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A1E6FF80246;
	Tue, 12 Sep 2023 21:41:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82F9DF80425; Tue, 12 Sep 2023 21:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id CF7CAF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 21:41:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF7CAF8007C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1694547703313141346-webhooks-bot@alsa-project.org>
References: <1694547703313141346-webhooks-bot@alsa-project.org>
Subject: Remove optional dependency on GTK 2
Message-Id: <20230912194146.82F9DF80425@alsa1.perex.cz>
Date: Tue, 12 Sep 2023 21:41:46 +0200 (CEST)
Message-ID-Hash: 6UHC2V2R6LJ27KZ2FTIQ4LYFMHH7BHOY
X-Message-ID-Hash: 6UHC2V2R6LJ27KZ2FTIQ4LYFMHH7BHOY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UHC2V2R6LJ27KZ2FTIQ4LYFMHH7BHOY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #18 was opened from ChaseKnowlden:

GTK 2 is not maintained since December 2020.

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/18
Repository URL: https://github.com/alsa-project/alsa-tools
