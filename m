Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3CFAE29FD
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Jun 2025 17:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 012FC60187;
	Sat, 21 Jun 2025 17:51:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 012FC60187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1750521084;
	bh=l5VqUepQA/Q2IeSVnLJTqVILkmbuT4oFyVJ6agQN2mA=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=VTM6h6ohTZkI7t/yNovCJQkqu6/oO3k2zDxeZiQ4Dxb0zNSb6Enu3o/4PivtfPm1j
	 7uEOOY4M3JZJSpZ16F7U2IehM08UhbfFD/Ewf1j0Xs9Ban5Nji8wQACA+jWcmmyKF6
	 KC+U/DD2Ofp903x1YfY/A9L1oNIfBNODv5LxyW1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29296F805D2; Sat, 21 Jun 2025 17:50:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F1F0F805BA;
	Sat, 21 Jun 2025 17:50:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 971D9F80269; Sat, 21 Jun 2025 17:50:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA3BF801F7
	for <alsa-devel@alsa-project.org>; Sat, 21 Jun 2025 17:50:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDA3BF801F7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <184b199c940e4a00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/582@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/582@alsa-project.org>
Subject: ucm2: USB-Audio: Add Teufel CAGE PRO
Date: Sat, 21 Jun 2025 17:50:42 +0200 (CEST)
Message-ID-Hash: M4WND3J4AGXN2HEIYO7PMMVDGHYOJ6DL
X-Message-ID-Hash: M4WND3J4AGXN2HEIYO7PMMVDGHYOJ6DL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M4WND3J4AGXN2HEIYO7PMMVDGHYOJ6DL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #582 was opened from hsitter:

two stereo outputs: one for "game" and one for "chat". one mono input

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/582
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/582.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
