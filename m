Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5CDA62E5F
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Mar 2025 15:47:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF8F06038D;
	Sat, 15 Mar 2025 15:47:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF8F06038D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742050034;
	bh=Ex+NowpeaJZbmU4k7+VqP66w+eSxO1fIwPdLCxpBKD8=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=rZsqE/9/z4IgN23LTRVBTSrAypLtxd+FM3PjK9GRDjiSwGenfwuYQWMLzyciFX0ie
	 99UIiDg5Fv1YrfDriVNYnc2Mu7F1NoUTul5omCkqO+/GYsciownP/5M6Gpnym2K9mz
	 S//nOdZoeeHAWXeViVdE9zUSJSvAZhPWKBAYvoO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62A42F805BB; Sat, 15 Mar 2025 15:46:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C7C5F8023A;
	Sat, 15 Mar 2025 15:46:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7E67F8023A; Sat, 15 Mar 2025 15:45:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 95D51F800FA
	for <alsa-devel@alsa-project.org>; Sat, 15 Mar 2025 15:45:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95D51F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182d01309aee1c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/523@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/523@alsa-project.org>
Subject: GoXLR: Add 'Broadcast Stream Mix 2' to Capture if channels are
 available
Date: Sat, 15 Mar 2025 15:45:44 +0100 (CET)
Message-ID-Hash: 6TJMTDNZAN6G3QW54RC4NZEPFQVMC5WX
X-Message-ID-Hash: 6TJMTDNZAN6G3QW54RC4NZEPFQVMC5WX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6TJMTDNZAN6G3QW54RC4NZEPFQVMC5WX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #523 was opened from FrostyCoolSlug:

Fixes: #444

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/523
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/523.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
