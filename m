Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D36CAB335
	for <lists+alsa-devel@lfdr.de>; Sun, 07 Dec 2025 10:36:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 825676019D;
	Sun,  7 Dec 2025 10:36:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 825676019D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1765100214;
	bh=z2zn94rHewFcQeuB/sotxPx4q8g3CY+uBby+Rn125g0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d/lzOYxUdAcQKsReVJTwP7WnIENlvfeKhu3hOnjUW6TypqYbCMIAgB75Xs9y+x+B1
	 HXAOzi8Ziqx+LgUlUKaU7dpKycBateWZZWcEBU4kg5YcAaQYSUoBY+KnYfGE9uACe9
	 SjhtW0w/Twav9ObNjvlRqNUEFijhjBzUPUZeVNZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13F81F805C7; Sun,  7 Dec 2025 10:36:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BBF0BF805CA;
	Sun,  7 Dec 2025 10:36:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 76FFCF80494; Sun,  7 Dec 2025 10:36:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 077E3F800BF
	for <alsa-devel@alsa-project.org>; Sun,  7 Dec 2025 10:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 077E3F800BF
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187ee53d4567e500-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/524@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/524@alsa-project.org>
Subject: [for alsa-lib-1.2.15]: USB-Audio: GoXLR: enable detection of beta
 firmware (25 channels)
Date: Sun,  7 Dec 2025 10:36:06 +0100 (CET)
Message-ID-Hash: 74HGSAAKLPBF3ZIUZ4PAZJLCEMMGPJPT
X-Message-ID-Hash: 74HGSAAKLPBF3ZIUZ4PAZJLCEMMGPJPT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/74HGSAAKLPBF3ZIUZ4PAZJLCEMMGPJPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #524 was edited from perexg:

'Syntax 8' is required (alsa-lib 1.2.14+)

Fixes: 17f9b4f ("USB-Audio: GoXLR - fix the channel detection for mini, cleanups")
Link: https://github.com/alsa-project/alsa-ucm-conf/issues/444

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/524
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/524.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
