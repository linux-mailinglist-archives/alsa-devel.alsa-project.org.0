Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 256BAACD8C1
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Jun 2025 09:42:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A427E601E9;
	Wed,  4 Jun 2025 09:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A427E601E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749022920;
	bh=/W5hhV+INIk8UfRt1Ufo4KHo2UgHYCkgb0nH7/L27k4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=sW4LscTKKF5hTkze72MHDrJp+msbpzRlky2kHQAY8Difblp1LPLvxDfjZa1E04Bfj
	 WFF7oBOv65fZQ7Wmxpc1Gj7qpWBAobUgUnYgO/1nxHNggvPGVncgKYdA4dGPVgoqST
	 UmGIgDJsux0dg35F7d3bUjgQkkgaow8JGFSbtG4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E14F805C9; Wed,  4 Jun 2025 09:41:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D0EA3F805BB;
	Wed,  4 Jun 2025 09:41:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E577F8028B; Wed,  4 Jun 2025 09:41:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 5ACA8F800FA
	for <alsa-devel@alsa-project.org>; Wed,  4 Jun 2025 09:41:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5ACA8F800FA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1845c70b1e624800-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-utils/pr/302@alsa-project.org>
References: <alsa-project/alsa-utils/pr/302@alsa-project.org>
Subject: alsaloop: only log xrun debug messages when verbose
Date: Wed,  4 Jun 2025 09:41:23 +0200 (CEST)
Message-ID-Hash: 66IEPD6SKCVBOCOACVZQ72BTBQQGXS6S
X-Message-ID-Hash: 66IEPD6SKCVBOCOACVZQ72BTBQQGXS6S
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/66IEPD6SKCVBOCOACVZQ72BTBQQGXS6S/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils pull request #302 was opened from jacmet:

Xruns can happen quite often (E.G. continuously when using alsaloop to/from the UAC gadget driver without a connected host), so only log the debug messages when verbose logging has been requested to not flood the logs.

Request URL   : https://github.com/alsa-project/alsa-utils/pull/302
Patch URL     : https://github.com/alsa-project/alsa-utils/pull/302.patch
Repository URL: https://github.com/alsa-project/alsa-utils
