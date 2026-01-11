Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC7CD0F3AF
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jan 2026 15:58:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D561E601EF;
	Sun, 11 Jan 2026 15:58:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D561E601EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1768143493;
	bh=4YsA7/ZoUCBdz4f64AIXIi5R6vVYZu6hz4am1YIC7ro=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Xp1vP3cg8gh2LwNv+urDu1k9NgTLRok8LsdsDV2a52rUNyDOXu+RaSiunUip+uZgs
	 6huX390kLo1rn0MU9ZVBiFQYLjOV7aiXKeZCYJrcR0/dOtHIhQSAtD9ZUR9lIVlQoW
	 SpWVwfOZUFlB7HxY0b31r/c7y5S/e94esJR1xhx4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DC76F805E1; Sun, 11 Jan 2026 15:57:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8332F80212;
	Sun, 11 Jan 2026 15:57:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A0B6F80149; Sun, 11 Jan 2026 15:55:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7974EF80038
	for <alsa-devel@alsa-project.org>; Sun, 11 Jan 2026 15:55:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7974EF80038
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1889b4f8ce467c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/684@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/684@alsa-project.org>
Subject: USB-Audio: Add support for UR24C firmware version channel
 differences, fix UR22C
Date: Sun, 11 Jan 2026 15:55:23 +0100 (CET)
Message-ID-Hash: DJDBKVMGHEZFPP4CNKXF2KBSQESWENWI
X-Message-ID-Hash: DJDBKVMGHEZFPP4CNKXF2KBSQESWENWI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DJDBKVMGHEZFPP4CNKXF2KBSQESWENWI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #684 was opened from jwlademann:

Steinberg UR24C has a similar change to the number of capture channels fot version 3 firmware. During implementation I found an issue with the condition used for UR22C which I fixed also.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/684
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/684.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
