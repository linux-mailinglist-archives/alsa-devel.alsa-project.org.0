Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2A0A79197
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Apr 2025 16:59:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C47F1601A7;
	Wed,  2 Apr 2025 16:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C47F1601A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743605967;
	bh=Bg17IGbCQE/0YNBXSyA2BYtEbF/p44fatIBiLOhKRBc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ejHoT58o8/C77Ls0NGMz+0ehqezckTQ2h5R4HkHZOIOlJ4/qVKm85oLRjn+hVym+d
	 1Cf058J+SbTYhooLKdxulvT4XBlPFGHTudjqajHs0kvZjgVNLXAfAIxOjTw16MX64N
	 UrbE/dlyuPmBDw9ohS++Yub8Rg878/bi1JYI/2XQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2AB5F800D2; Wed,  2 Apr 2025 16:58:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CC83F805AD;
	Wed,  2 Apr 2025 16:58:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E936EF80301; Wed,  2 Apr 2025 16:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EC48F800AC
	for <alsa-devel@alsa-project.org>; Wed,  2 Apr 2025 16:58:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EC48F800AC
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1832885a756f4b00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/448@alsa-project.org>
References: <alsa-project/alsa-lib/pr/448@alsa-project.org>
Subject: Delete alsalisp code
Date: Wed,  2 Apr 2025 16:58:49 +0200 (CEST)
Message-ID-Hash: V7VNSXENAVNS5RZAT6HPV2BZ7DOJ7A75
X-Message-ID-Hash: V7VNSXENAVNS5RZAT6HPV2BZ7DOJ7A75
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V7VNSXENAVNS5RZAT6HPV2BZ7DOJ7A75/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #448 was opened from fragglet:

Install of the alsalisp binary has been disabled since 2006 (in commit 8d382ccd), and building of it was disabled by default in 2018 (in commit 32ceab21), so it is reasonable to assume that nobody is using it.

Use within the alsa-lib project is limited to an aliases file that looks like it is intended as an example, plus some very small .alisp files associated with the SiS SI7018 PCI sound card which has not been manufactured in years. These too have not been installed since 2018 when commit 32ceab21 disabled building of the alsalisp binary.

In preparing this change, I searched the Github issue tracker for "lisp", "alisp" and "alsalisp", and found no complaints about the above changes. I also did a Github code search for projects that might be including the `alisp.h` header and found none. Therefore I think this code can be safely deleted and nobody is likely to object.

Request URL   : https://github.com/alsa-project/alsa-lib/pull/448
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/448.patch
Repository URL: https://github.com/alsa-project/alsa-lib
