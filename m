Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC767A75871
	for <lists+alsa-devel@lfdr.de>; Sun, 30 Mar 2025 05:13:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18742601F0;
	Sun, 30 Mar 2025 05:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18742601F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1743304406;
	bh=U0zvs93Y7BZryqVUy/dlEFBGxSxlAgUNZd4HVpsENos=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=WuaIT75owCTc9DK4MPJ/768v6ygf7KaQJChKEvv2AedvuGUbcW/2qfsGR7Q2c8ANF
	 OdSTlt6bYBt1NVzeHU1p4PW9rceDG0fMNVrnxwP0sJ4Cqr3HP1JJ+ibvn8NoBhrM8E
	 9Hm8M8dDTcbbnChbvJSWYrdLZYUEcpc339Hxyw+M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E14C6F805B0; Sun, 30 Mar 2025 05:12:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94B83F8001D;
	Sun, 30 Mar 2025 05:12:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93C45F802DB; Sun, 30 Mar 2025 05:12:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id C1250F80095
	for <alsa-devel@alsa-project.org>; Sun, 30 Mar 2025 05:12:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1250F80095
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub pull_request - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <1831761536a9c200-webhooks-bot@alsa-project.org>
In-Reply-To: <alsa-project/alsa-ucm-conf/pr/538@alsa-project.org>
References: <alsa-project/alsa-ucm-conf/pr/538@alsa-project.org>
Subject: USB-Audio: Add Focusrite Scarlett 18i20 Lineup
Date: Sun, 30 Mar 2025 05:12:46 +0200 (CEST)
Message-ID-Hash: 4DAXGXOW3WT3QR6SBSCDXLKPKDK4UWOC
X-Message-ID-Hash: 4DAXGXOW3WT3QR6SBSCDXLKPKDK4UWOC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4DAXGXOW3WT3QR6SBSCDXLKPKDK4UWOC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf pull request #538 was opened from ScarletRav3n:

Other solutions exist to add full mixing and routing with these devices. This PR adds basic functionality in an out-of-the-box style for 2nd gen, 3rd gen, and 4th gen. 1st gen is not supported with this iteration of PR.

I/O includes all XLR, Line, S/PDIF, ADAT, and Headphone ports.

Request URL   : https://github.com/alsa-project/alsa-ucm-conf/pull/538
Patch URL     : https://github.com/alsa-project/alsa-ucm-conf/pull/538.patch
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
