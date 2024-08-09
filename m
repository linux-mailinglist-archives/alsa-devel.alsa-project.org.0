Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 340C594D73D
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 21:25:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BADFAEBE;
	Fri,  9 Aug 2024 21:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BADFAEBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723231558;
	bh=LOU7U0HfJJNfuFbfayTc/pgWuzCkzw+QEDvFvE/WScQ=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ErAy0uhB+BUQ2Ctn2d8OGMiVoJnjBJTeXZcrS1oMtmn1JKF8m5e00ry5bPPJkLT1F
	 YKrIhX+QhUhFqpFfkR4g+ZjjRwMep41Z6BYwyMZNmPYjrxPIW5YlIhB54t/fujKj7U
	 OuLpHDtnmtG0YzXiNA6kDh4C0mQYPArmMIg7I//A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288B1F805C8; Fri,  9 Aug 2024 21:25:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 04B9CF80589;
	Fri,  9 Aug 2024 21:25:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07418F8047C; Fri,  9 Aug 2024 21:22:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 50806F80588
	for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2024 21:20:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50806F80588
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1723231245055100441-webhooks-bot@alsa-project.org>
References: <1723231245055100441-webhooks-bot@alsa-project.org>
Subject: (Question) Difference between defaults.pcm.srate and
 defaults.pcm.rate
Message-Id: <20240809192202.07418F8047C@alsa1.perex.cz>
Date: Fri,  9 Aug 2024 21:22:02 +0200 (CEST)
Message-ID-Hash: JXAKZFDSOQ5FWDPQBG3TECEJKP3WLLZY
X-Message-ID-Hash: JXAKZFDSOQ5FWDPQBG3TECEJKP3WLLZY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXAKZFDSOQ5FWDPQBG3TECEJKP3WLLZY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #406 was opened from ViNi-Arco:

What is the difference between `defaults.pcm.srate` and `defaults.pcm.rate`?

I know there's `defaults.pcm.!rate`, but I couldn't find any information about defaults.pcm.srate

I'm asking because I was given this configuration:

![IMG](https://github.com/user-attachments/assets/84316655-2d44-4f54-a842-86bd60a780e3)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/406
Repository URL: https://github.com/alsa-project/alsa-lib
