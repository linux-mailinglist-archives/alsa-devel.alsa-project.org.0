Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D53677E04EF
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Nov 2023 15:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0A5A823;
	Fri,  3 Nov 2023 15:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0A5A823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699022908;
	bh=eXB9NLHqYbHOoPu9YIT1HxeVpCyIVd4KaBg+xYvgpfw=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Gx/ntkR8ZuE292OsvaZ7KLxzIbh+jhlvMG5sL2dqYzvqjanyz6hu3loW8lTrFYwgm
	 RLK3PKlghpNJtwJwQJLNSCUxZdufd3dEmgpSIxJyO2+jiiojRxzAALQI95qp9UnBXB
	 UtrJyz5d0U73PfGQmcua2BR4V6KixTPstKI1wIqk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 213BCF80557; Fri,  3 Nov 2023 15:47:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B7351F8020D;
	Fri,  3 Nov 2023 15:47:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D388FF80290; Fri,  3 Nov 2023 15:47:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 37F03F8016D
	for <alsa-devel@alsa-project.org>; Fri,  3 Nov 2023 15:47:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37F03F8016D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1699022850774952650-webhooks-bot@alsa-project.org>
References: <1699022850774952650-webhooks-bot@alsa-project.org>
Subject: seq: chrome web-MIDI issues since 1.2.10
Message-Id: <20231103144732.D388FF80290@alsa1.perex.cz>
Date: Fri,  3 Nov 2023 15:47:32 +0100 (CET)
Message-ID-Hash: SZ64QSSENKNM57UP6STUXG6FI4GTUSCD
X-Message-ID-Hash: SZ64QSSENKNM57UP6STUXG6FI4GTUSCD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ64QSSENKNM57UP6STUXG6FI4GTUSCD/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #360 was opened from nodens:

Hi,

not sure how to qualify this issue exactly, it's probably unrelated to web MIDI, but that's how I can test and reproduce it in my setup.

I own an Expert Sleepers ES-9 interface that uses a web MIDI interface for its configuration (https://www.expert-sleepers.co.uk/webapps/es9_config_tool_1.3.html). The page send and receive sysex messages from the device.

Since 1.2.10, it seems to only receive (or send) a fraction of the messages. I can sometimes (not every time) get the result of a sample rate request, but there is never any response on configuration dump request or version request. using aseqdump to see the messages shows nothing: there is no message seen at all.

Downgrading alsa-lib to 1.2.9 resolves the issue. I'm not sure how to debug further, but it is plausibly related to the recent seq changes.

Just to be sure, I also tried with latest HEAD, which doesn't change the behaviour.

Cheers,

nodens

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/360
Repository URL: https://github.com/alsa-project/alsa-lib
