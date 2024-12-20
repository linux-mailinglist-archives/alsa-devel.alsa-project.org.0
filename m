Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE439F9847
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Dec 2024 18:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCAB46023E;
	Fri, 20 Dec 2024 18:40:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCAB46023E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734716426;
	bh=CfOFa/5wpWIijHxyUrLjjOgkMZyJ+l7m9iiZGY1Qk4c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ajTcxoSsXs83Pwbn88fkhZ0yvcZPBx+BdkCoWvjfj4IPfLtY7nEWtdkPl/SBdwYq2
	 /NwJTt7gFQC5aRLkdOz4I9+15cM4mvLWPzpp3zxxTWVQToWfvhGE402L39OHUUE9vj
	 hHoJU23LJmJiJBfSnJb1K81M0goFwZBXv7yehgeM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 01090F805C0; Fri, 20 Dec 2024 18:39:47 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D43FF805BB;
	Fri, 20 Dec 2024 18:39:47 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08AE1F80508; Fri, 20 Dec 2024 18:39:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4209DF8003C
	for <alsa-devel@alsa-project.org>; Fri, 20 Dec 2024 18:39:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4209DF8003C
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734716379551697493-webhooks-bot@alsa-project.org>
References: <1734716379551697493-webhooks-bot@alsa-project.org>
Subject: API memory allocator
Message-Id: <20241220173942.08AE1F80508@alsa1.perex.cz>
Date: Fri, 20 Dec 2024 18:39:42 +0100 (CET)
Message-ID-Hash: 7B74QSL3XHYYEKT4NEBQIDOQVYS74IVS
X-Message-ID-Hash: 7B74QSL3XHYYEKT4NEBQIDOQVYS74IVS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7B74QSL3XHYYEKT4NEBQIDOQVYS74IVS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #429 was opened from sylware:

If I recall properly some data returned from the alsa lib API must be free using the C runtime free().

Would it be appropriate to move away from the C allocator to an API install-able memory allocator (like vulkan3D)?

Backward compatibility would be achieved since the "default memory allocator" would be the C one, if the C runtime is around.

Unless that part of the API is already deprecated (and I should not have used it).

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/429
Repository URL: https://github.com/alsa-project/alsa-lib
