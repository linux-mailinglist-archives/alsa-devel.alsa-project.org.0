Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BFB14A42
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Jul 2025 10:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01E6D6022C;
	Tue, 29 Jul 2025 10:38:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01E6D6022C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753778336;
	bh=ly/WlObtLnWVrEu733SA9BqcYN/lBF64PqAqXD1M5KU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=JXJKrTcD9dGRjvxq7F0e1dQuQeqYAeTY3jFTntfJHc4bIxvT85mbH0tDuurgYiWL2
	 Q8i8653pOy+4nT9cXpCcod9GV2oKED3el0iwKEib1fLZVoaKKohtCG1d45fJJr1hFc
	 ztpb4ks2YPxc3xraQs7GHI7hXINcS4gamApNzcTs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7368FF805C4; Tue, 29 Jul 2025 10:38:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E0CF805B5;
	Tue, 29 Jul 2025 10:38:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 998C0F8028B; Tue, 29 Jul 2025 10:38:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BCBCF80217
	for <alsa-devel@alsa-project.org>; Tue, 29 Jul 2025 10:38:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BCBCF80217
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1856ac0ebb0d9f00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/467@alsa-project.org>
References: <alsa-project/alsa-lib/pr/467@alsa-project.org>
Subject: Support ohos build
Date: Tue, 29 Jul 2025 10:38:08 +0200 (CEST)
Message-ID-Hash: LWY5X6ZSMREP6PLBW7IUNGAPTJZRPBG7
X-Message-ID-Hash: LWY5X6ZSMREP6PLBW7IUNGAPTJZRPBG7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LWY5X6ZSMREP6PLBW7IUNGAPTJZRPBG7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #467 was opened from wyjstrong:

https://github.com/alsa-project/alsa-lib/issues/466

Request URL   : https://github.com/alsa-project/alsa-lib/pull/467
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/467.patch
Repository URL: https://github.com/alsa-project/alsa-lib
