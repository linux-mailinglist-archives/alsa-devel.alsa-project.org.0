Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F71B8DBA3
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Sep 2025 15:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2ADDE601FA;
	Sun, 21 Sep 2025 15:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2ADDE601FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758460713;
	bh=N9GJ+tOdIk5pHH7gA54atRKC/tuvBX02HnMSP1YXrzI=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=FQOJWXKdi0uKHDwtANyYEneEyzrymwgUU0/07z47s972IuCowJd9nC7zDn2JBZobe
	 ncbWaBHIxcWipRiBY7KQa5fg6zINSLFQtlLmweZVKB6MW/7CTMh4GSXnqCMdsfl0rn
	 nk25FfPStzvcURX/WVSUl3FGUPyx2DbaqFbSsAys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BE7C4F805D4; Sun, 21 Sep 2025 15:17:57 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 574A7F805C2;
	Sun, 21 Sep 2025 15:17:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99A98F80494; Sun, 21 Sep 2025 15:17:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 14528F8016E
	for <alsa-devel@alsa-project.org>; Sun, 21 Sep 2025 15:17:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14528F8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18674ea2c55be400-webhooks-bot@alsa-project.org>
In-Reply-To: <18674ea2c34fa000-webhooks-bot@alsa-project.org>
References: <18674ea2c34fa000-webhooks-bot@alsa-project.org>
Subject: ASUS Proart P16 - Realtek ALC285 not detected properly after kernel
 6.15 - worked perfectly with earlier kernels
Date: Sun, 21 Sep 2025 15:17:23 +0200 (CEST)
Message-ID-Hash: W4YEL3Z3NEKTKDPPSVQNNE4FSSGBR2SD
X-Message-ID-Hash: W4YEL3Z3NEKTKDPPSVQNNE4FSSGBR2SD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4YEL3Z3NEKTKDPPSVQNNE4FSSGBR2SD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #615 was opened from SneakyLittleman:

Hey there, as [reported in the arch forums](https://bbs.archlinux.org/viewtopic.php?id=307540), the ALC285 (and Cirrus Logic amp CS35L56) are not detected properly after kernel 6.15. Anything below 6.14.9 works perfectly fine.

The chip reverts to the "proaudio" profile, with no other option, and the command "alsaucm listcards" returns an empty list.

With older kernels, the command returned:
` 0: hw:1
    HDA NVidia at 0xdd080000 irq 143
  1: hw:2
    HD-Audio Generic at 0xdd7c8000 irq 144
  2: hw:3
    HD-Audio Generic at 0xdd7c0000 irq 145
  3: hw:4
    ASUSTeKCOMPUTERINC.-ProArtP16H7606WI_H7606WI-1.0-H7606WI`

and I had access to the correct audio profiles with pipewire.

Willing to submit anything that might help, to fix this. Cheers.

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/615
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
