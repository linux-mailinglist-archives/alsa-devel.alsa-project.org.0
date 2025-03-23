Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37332A6CE78
	for <lists+alsa-devel@lfdr.de>; Sun, 23 Mar 2025 10:13:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 321F1601FC;
	Sun, 23 Mar 2025 10:13:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 321F1601FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1742721214;
	bh=mHrauabd8mMfLlWKtlsU+CWqtgPxh0SaaHn7HxQq890=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=lmCsMRKSQLCzTInXi5I4rkXYPFRuGfkXL+FwIRNUzEm9I5RAgSlbOyTTA6rDl+iWd
	 6/PSZsBtHm4bpe4Z3m1/lnDlZCkhJv8ooX/0Qg7NNAwcb1x+NiVx/XZi1r18RtdLAz
	 HvT8pIRuFyKAuJhbbFZUi0rRbAd+a58orpbNPcj0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73C64F80495; Sun, 23 Mar 2025 10:12:58 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D0C0F805BE;
	Sun, 23 Mar 2025 10:12:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36753F80301; Sun, 23 Mar 2025 10:12:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E581F800B6
	for <alsa-devel@alsa-project.org>; Sun, 23 Mar 2025 10:12:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E581F800B6
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <182f63abb60a3700-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-tools/pr/28@alsa-project.org>
References: <alsa-project/alsa-tools/pr/28@alsa-project.org>
Subject: envy24control: fix spdif output settings
Date: Sun, 23 Mar 2025 10:12:52 +0100 (CET)
Message-ID-Hash: PQIUTIH6UZIZF7V52OEY4VQJYB5APWOQ
X-Message-ID-Hash: PQIUTIH6UZIZF7V52OEY4VQJYB5APWOQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PQIUTIH6UZIZF7V52OEY4VQJYB5APWOQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-tools pull request #28 was opened from andreas56:

The S/PDIF Output Settings in envy24control had some bugs: wrong bits were set when user changed "Stream" under "Professional" or any of the the settings under "Consumer".

Request URL   : https://github.com/alsa-project/alsa-tools/pull/28
Patch URL     : https://github.com/alsa-project/alsa-tools/pull/28.patch
Repository URL: https://github.com/alsa-project/alsa-tools
