Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6040EB171A6
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Jul 2025 15:01:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAAA9601E3;
	Thu, 31 Jul 2025 15:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAAA9601E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1753966862;
	bh=d8e2uIkRjmv2L4zoy4Vznfofv9hJse41+E2Pqv33Xk4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sXaUYqXMUHfBMHGw1tRlDR0IOu9AQ+a1lv1UDfPhSfhyfGcCyZZpCrHTirgWX8pPu
	 DE/jv2jW/jt4wjZe3T7SKRyVdsqFhMwkpn7FHoy7DCY6vU2vPafi1tj2CxHFIVFeoN
	 kMUmm+mTBZJwqD9SsfuQfu/rQFeixIzM9OXRVdWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E80E2F805C5; Thu, 31 Jul 2025 15:00:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 949E9F805BF;
	Thu, 31 Jul 2025 15:00:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C406EF8025F; Thu, 31 Jul 2025 15:00:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A056F8016A
	for <alsa-devel@alsa-project.org>; Thu, 31 Jul 2025 14:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A056F8016A
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18575781691c7c00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/469@alsa-project.org>
References: <alsa-project/alsa-lib/pr/469@alsa-project.org>
Subject: pcm: add a loop to snd_pcm_avail_delay() to avoid bogus delay values
Date: Thu, 31 Jul 2025 15:00:00 +0200 (CEST)
Message-ID-Hash: BLM4KSV7VZADGRXQOIJ4IC4V6IBOQFPG
X-Message-ID-Hash: BLM4KSV7VZADGRXQOIJ4IC4V6IBOQFPG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BLM4KSV7VZADGRXQOIJ4IC4V6IBOQFPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #469 was opened from kv2019i:

snd_pcm_avail_delay() is expected to report avail and delay values in atomic fashion. However the function does two separate syscalls and it cannot guarantee the avail value is the same as was used to calculate the delay. This is a problem as the reported delay is always relative to avail frames value.

If application (like e.g. alsa_conformance_test) uses snd_pcm_avail_delay() to estimate the effective play position, it can observe bogus delay values (and effective play position going backwards) if snd_pcm_avail_delay() is called during a DMA burst where hw_ptr moves quickly.

This commit adds a loop similar to that used in snd_pcm_hw_htimestamp() to wait until we get a stable avail reading, and only then extract the delay. This will avoid bogus values if function is called during DMA bursts.

Closes: https://github.com/alsa-project/alsa-lib/issues/468

Request URL   : https://github.com/alsa-project/alsa-lib/pull/469
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/469.patch
Repository URL: https://github.com/alsa-project/alsa-lib
