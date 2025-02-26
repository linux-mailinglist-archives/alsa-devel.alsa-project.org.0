Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1FA46883
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Feb 2025 18:52:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60EF7602F9;
	Wed, 26 Feb 2025 18:52:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60EF7602F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1740592378;
	bh=l/dt0XXYtUHPecqXESYX6DG3CC6kjXubsGIR5xB/3PY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=YZaGJnx7MHAbgRGmQGWlJsoxorWZl6ixSlTyTEEjSv0OSmbD4OM9XGk8tQEcHdAKi
	 YfPR4+6yTidpjxVjVfwWlLQ5ns0ggZVYZp9ZtQKp8s/VaY/gzH1gbrusPpiGrA8oXy
	 MivuDGFEkE5r1yQEc/ft0EFu7zw+eME64Ss+/vW0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F0B9F805B3; Wed, 26 Feb 2025 18:52:25 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1E47F8016D;
	Wed, 26 Feb 2025 18:52:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D20A5F8016E; Wed, 26 Feb 2025 18:52:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EECBF800D2
	for <alsa-devel@alsa-project.org>; Wed, 26 Feb 2025 18:52:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9EECBF800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1740592331221439600-webhooks-bot@alsa-project.org>
References: <1740592331221439600-webhooks-bot@alsa-project.org>
Subject: ucm2: MediaTek: mt8390-evk: Add support for SOF
Message-Id: <20250226175219.D20A5F8016E@alsa1.perex.cz>
Date: Wed, 26 Feb 2025 18:52:19 +0100 (CET)
Message-ID-Hash: HPCXS26KECQCKUATS7JL3NFSOQ6ZDYHM
X-Message-ID-Hash: HPCXS26KECQCKUATS7JL3NFSOQ6ZDYHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPCXS26KECQCKUATS7JL3NFSOQ6ZDYHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #513 was opened from nfraprado:

Add support for MT8390 EVK with the SOF enabled. The only differences compared to the UCM with SOF disabled is the device number for playback and capture, which uses the PCMs for the SOF instead, and the number of channels for capture, which is stereo rather than mono.

Define those parameters as variables for each case, with and without SOF, and move the common intialization to an init.conf, so the UCM can be shared by both.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/513
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/513.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
