Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F3DAC0BBC
	for <lists+alsa-devel@lfdr.de>; Thu, 22 May 2025 14:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E1F601DD;
	Thu, 22 May 2025 14:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E1F601DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1747917553;
	bh=GqWBiKFp5Wi+Y5kN6jB5j4vt/hvyFKumXyqPTULUnMs=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WrA04lSQYTI3sXXcbDCPxjkF/rsZ9LZ7+zw9gYbyePlLJgqZQCIOH0pIhRknl6EEM
	 rQg2E3+NKaavJsWb5jglGr/OcaFEjxx4N2KZCxf/0CpU17efND7YWYdYTuRGO/gSCw
	 k43JWzGGljzA3kN0elwAhVJ4FamLAqlzvgfDSjWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE104F805B0; Thu, 22 May 2025 14:38:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4294F805A9;
	Thu, 22 May 2025 14:38:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39FA7F8056F; Thu, 22 May 2025 14:38:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AAD0F801F7
	for <alsa-devel@alsa-project.org>; Thu, 22 May 2025 14:38:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AAD0F801F7
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1841d9b815b42e00-webhooks-bot@alsa-project.org>
In-Reply-To: <1841d9b815ae3500-webhooks-bot@alsa-project.org>
References: <1841d9b815ae3500-webhooks-bot@alsa-project.org>
Subject: License
Date: Thu, 22 May 2025 14:38:37 +0200 (CEST)
Message-ID-Hash: WJWXTV2N3Q7MQZ6O6ZGFXVXF3Z6EQUJI
X-Message-ID-Hash: WJWXTV2N3Q7MQZ6O6ZGFXVXF3Z6EQUJI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WJWXTV2N3Q7MQZ6O6ZGFXVXF3Z6EQUJI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools issue #37 was opened from krl:

When looking to package parts of alsa-tools for guix, i noticed that there is no license information on the repo.

Can these projects be assumed to be under GPLv2, as is the case with alsa-utils?

Issue URL     : https://github.com/alsa-project/alsa-tools/issues/37
Repository URL: https://github.com/alsa-project/alsa-tools
