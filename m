Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E67A682D2BD
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Jan 2024 01:33:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90DD6201;
	Mon, 15 Jan 2024 01:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90DD6201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705278798;
	bh=tE8AEtZISLUBjzSBwDd/wBwpgtrPWAIrK+a/8gU5zzg=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=MUo9798A+uW1BLnwGEGlsEnQYKfvG8Qp5RSA20GvQgW2UJ3IogbALufDwQUsRG63g
	 RkMzPwQANTgcc3HlIGEmk35uB+55mcHbC7itunfQa7KhPjcfHj1FIyZ2LSooYiOb5O
	 m74OtcMfLFgKq38mWD1Gy4D1vt05cG6dCjUalbTo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39D7DF805A0; Mon, 15 Jan 2024 01:32:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B603BF8055C;
	Mon, 15 Jan 2024 01:32:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40855F8028D; Mon, 15 Jan 2024 01:30:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DE2EF8014B
	for <alsa-devel@alsa-project.org>; Mon, 15 Jan 2024 01:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DE2EF8014B
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1705278641179410458-webhooks-bot@alsa-project.org>
References: <1705278641179410458-webhooks-bot@alsa-project.org>
Subject: USB-Audio Add support for MSI MEG Z690 ACE (ALC4082)
Message-Id: <20240115003049.40855F8028D@alsa1.perex.cz>
Date: Mon, 15 Jan 2024 01:30:49 +0100 (CET)
Message-ID-Hash: JZWLMSHJZS5PU2LFWW5NJYAXVBP6GBBU
X-Message-ID-Hash: JZWLMSHJZS5PU2LFWW5NJYAXVBP6GBBU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JZWLMSHJZS5PU2LFWW5NJYAXVBP6GBBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #381 was opened from mDuo13:

Tested this out on my motherboard and it fixed my problem with the onboard sound being treated as a generic USB device. Fixing it allowed me to record from line-in, among other things.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/381
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/381.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
