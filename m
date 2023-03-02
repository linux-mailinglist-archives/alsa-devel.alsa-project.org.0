Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 205966A8396
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Mar 2023 14:34:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 42908826;
	Thu,  2 Mar 2023 14:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 42908826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677764042;
	bh=bJ+PTzsDk9aD+w7oUg5CLL/UwF8pbO+0flLiAEfQw3I=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Q31SkUJLQ4vRWEWZh1sBeqt9wxJxUkj05AuBQHrpC7pAciR80cuaqS4zKWpz4C0zL
	 lX/43lGhcocZOUqhnjpPpt6UwDpPgNqEdoZuKJvAtdlNDqxnK1LWt6ccOwl5zqTArv
	 eVzcECPTRKNiG5LzckMGA7MocCRL1AoCkdHuqGLQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8F9DF8025A;
	Thu,  2 Mar 2023 14:33:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 937A9F80266; Thu,  2 Mar 2023 14:33:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A220F800DF
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 14:33:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A220F800DF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1677763985275869131-webhooks-bot@alsa-project.org>
References: <1677763985275869131-webhooks-bot@alsa-project.org>
Subject: X13s
Message-Id: <20230302133308.937A9F80266@alsa1.perex.cz>
Date: Thu,  2 Mar 2023 14:33:08 +0100 (CET)
Message-ID-Hash: KAOPBD47EEHLQEJOYS6QA2S7YRM25U7R
X-Message-ID-Hash: KAOPBD47EEHLQEJOYS6QA2S7YRM25U7R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KAOPBD47EEHLQEJOYS6QA2S7YRM25U7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #284 was opened from Srinivas-Kandagatla:

This patchset adds support for X13s ucm which includes support for Speakers, 2 DMICs on Panel and Headset with Mic.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/284
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/284.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
