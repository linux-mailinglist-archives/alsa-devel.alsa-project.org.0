Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14303A60268
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Mar 2025 21:21:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FE0A603AC;
	Thu, 13 Mar 2025 21:20:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FE0A603AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741897267;
	bh=/RFjwBFW6jim5j1BfY1tZCTys9K+ksVBfOhNKlluev4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=dnYuWBcSAIe3QR6lueb2t1dzBKjpqP3pQobgwCjyBh9ParMvlgWu7aqnE2zu8OOY4
	 NAxzV3+LxET2WMjuKUcPuIQzQl3upPyOLzrNTeW9U/wsyZ/0JMRWHZBnCSl2x0Jh6z
	 HWaKLEKsRKegA2jmuM9W40HJ1dSnh1kLiuxRmmbI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76DC8F805B3; Thu, 13 Mar 2025 21:20:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EA41F805B2;
	Thu, 13 Mar 2025 21:20:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6749AF8026D; Thu, 13 Mar 2025 21:20:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id A992FF800D0
	for <alsa-devel@alsa-project.org>; Thu, 13 Mar 2025 21:20:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A992FF800D0
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182c764c99008100-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/520@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/520@alsa-project.org>
Subject: Split the GoXLR configuration into Full Device and Mini
Date: Thu, 13 Mar 2025 21:20:29 +0100 (CET)
Message-ID-Hash: ZTKTJBGP33675F27JWSTW7HSOU3P35GJ
X-Message-ID-Hash: ZTKTJBGP33675F27JWSTW7HSOU3P35GJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTKTJBGP33675F27JWSTW7HSOU3P35GJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #520 was opened from FrostyCoolSlug:

This commit splits the GoXLR and GoXLR Mini into separate configurations.

The GoXLR Mini will always (at this point) have 21 channels defined, where as the full sized GoXLR will have either 23 or 25 depending on Firmware (23 is FAR more common at this point, as the firmware with 25 channels is still in beta).

Separating out the two devices should at least partially solve the recent issue with Pipewire.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/520
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/520.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
