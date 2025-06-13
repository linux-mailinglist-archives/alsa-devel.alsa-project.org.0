Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB52DAD82ED
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jun 2025 08:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40936601BC;
	Fri, 13 Jun 2025 08:08:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40936601BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749794897;
	bh=gR/UJyItAOd8a/gn82DrN/xjhmxzuz7OIN7PO8gr2Uc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oPals1FRNzBCiY1aG8PHdK5HmY6j5Ucg/Oceie5geLn7nrIUOAczLlrBBuxRY8gIT
	 Rw+40+VGlOwdTeT8NZrqn0p/mO8L0/do5bRz8RnqlrA6iM6GZPpPhShX/S3HmrSz1a
	 ED/Al/KKcCHOVyaYm19migeLyBHZELQVjD/4UNY4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B65BF805BF; Fri, 13 Jun 2025 08:07:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 684A3F805C2;
	Fri, 13 Jun 2025 08:07:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C761EF80424; Fri, 13 Jun 2025 08:07:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 192F3F8013D
	for <alsa-devel@alsa-project.org>; Fri, 13 Jun 2025 08:07:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 192F3F8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18488527356e3e00-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/580@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/580@alsa-project.org>
Subject: ucm2: sof-soundwire: add rt712+rt1320 amplifier
Date: Fri, 13 Jun 2025 08:07:40 +0200 (CEST)
Message-ID-Hash: SOUYARPEWODY4KPQHY2MIVHGDOFJVCC3
X-Message-ID-Hash: SOUYARPEWODY4KPQHY2MIVHGDOFJVCC3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SOUYARPEWODY4KPQHY2MIVHGDOFJVCC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #580 was opened from shumingfan:

This patch makes SpeakerCodec could get rt712+rt1320 string from spk:rt712+rt1320 component string. 
According to the control name, we will know that one or two amplifiers exist.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/580
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/580.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
