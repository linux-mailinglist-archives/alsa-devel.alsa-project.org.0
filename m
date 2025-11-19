Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D4C6CFA9
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Nov 2025 07:49:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D81601BD;
	Wed, 19 Nov 2025 07:49:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D81601BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763534960;
	bh=YAXFJN9AHwXYWUAyEGR6o9I4OFT23hzPwTdUod/dEvE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Hu6zjDqZJ9G9EwmhKQQiyeUz3nLbMUMqEnsw9IVuMugTDy7ABK2360bFJXM/c1n7n
	 Xueg6dh/Qg+GINeF8oJwLwX00VSbwkwRc0JqeYfqiv1GJS9nV1XcBaIWyuGbeHqXjP
	 Ekqa25b0o6BPAsuoV4uE5WFBWt5BfpNL/L+Mif04=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B27D7F805CA; Wed, 19 Nov 2025 07:48:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96982F805CA;
	Wed, 19 Nov 2025 07:48:45 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D36CCF80171; Wed, 19 Nov 2025 07:48:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
	MISSING_DATE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C986F800B5
	for <alsa-devel@alsa-project.org>; Wed, 19 Nov 2025 07:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C986F800B5
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <187955a7f3aaf600-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-lib/pr/483@alsa-project.org>
References: <alsa-project/alsa-lib/pr/483@alsa-project.org>
Subject: fix typo in error.h to avoid compile error when gcc <= 2.95
Date: Wed, 19 Nov 2025 07:48:33 +0100 (CET)
Message-ID-Hash: 2NQKA7AI6A3NG7W3WGQUWIECH6A6J255
X-Message-ID-Hash: 2NQKA7AI6A3NG7W3WGQUWIECH6A6J255
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2NQKA7AI6A3NG7W3WGQUWIECH6A6J255/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib pull request #483 was opened from versaloon:

a typo in include/error.h

Request URL   : https://github.com/alsa-project/alsa-lib/pull/483
Patch URL     : https://github.com/alsa-project/alsa-lib/pull/483.patch
Repository URL: https://github.com/alsa-project/alsa-lib
