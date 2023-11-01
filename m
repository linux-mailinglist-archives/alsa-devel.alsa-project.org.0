Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B777DDB78
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Nov 2023 04:24:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8972825;
	Wed,  1 Nov 2023 04:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8972825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698809044;
	bh=UK5e6EgSh+sxcY8Ls1hGdsHfTU+dzfglibawWzp70Po=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=kh6nLV8+DANcqCf8wVNTWzkYu+MhoNcYeg1npeP862/2AqqIW51duA7u2rHUqa+J3
	 aIRElwhdQ0n+fMKVtQVpEknG9fTbCHUekrSXq0lFi3I6ZUfnABiwkW7j6GvqTkynXA
	 UFnQeJ/5Ir0zMW/zP0ANa3/Zxuu956Iw6vW45SnI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64346F80558; Wed,  1 Nov 2023 04:23:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EE3BF8016D;
	Wed,  1 Nov 2023 04:23:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC5B7F8020D; Wed,  1 Nov 2023 04:22:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id E5D3CF80166
	for <alsa-devel@alsa-project.org>; Wed,  1 Nov 2023 04:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5D3CF80166
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1698808962502432585-webhooks-bot@alsa-project.org>
References: <1698808962502432585-webhooks-bot@alsa-project.org>
Subject: test: Add PCM interface tests
Message-Id: <20231101032256.CC5B7F8020D@alsa1.perex.cz>
Date: Wed,  1 Nov 2023 04:22:56 +0100 (CET)
Message-ID-Hash: HXBKXGVQZL6FR6Z26TQSJOKCQH6CE2RN
X-Message-ID-Hash: HXBKXGVQZL6FR6Z26TQSJOKCQH6CE2RN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXBKXGVQZL6FR6Z26TQSJOKCQH6CE2RN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #359 was opened from smelamud:

Add tests for various features of the PCM interface. The goal is to maximize coverage of the corresponding kernel code. The tests use a loopback device and require snd-aloop kernel module to be loaded.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/359
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/359.patch
Repository URL: https://github.com/alsa-project/alsa-lib
