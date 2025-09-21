Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C20B4B8DBA6
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Sep 2025 15:23:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25202601F8;
	Sun, 21 Sep 2025 15:23:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25202601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1758460994;
	bh=PBNtAEIsVy3GzEFRsHgDWsfkCdSN5bh61qnURp0PZ7w=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=IH3X2xfTmFIHhxvY2wDjJayvAh9xBQZAXsP4jKCrQrnmOJ/o7Rs6ZBUDZpeMKaKLv
	 ckB3vmb7ZQtNKxIOIkIuZAD8IF7Ri0C81P8paN/AzFpyeBiefot6OSMgQfuQdr5bgH
	 WeB32+vD1j6CqQBNJyFMPsHa6KJS40IAWv+j12Y8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA139F805C9; Sun, 21 Sep 2025 15:22:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49D08F805C8;
	Sun, 21 Sep 2025 15:22:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A55BF80494; Sun, 21 Sep 2025 15:22:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,MISSING_DATE,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 55DFFF8016E
	for <alsa-devel@alsa-project.org>; Sun, 21 Sep 2025 15:22:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55DFFF8016E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
Message-Id: <18674ee80473c800-webhooks-bot@alsa-project.org>
In-Reply-To: <18674ee8046b3b00-webhooks-bot@alsa-project.org>
References: <18674ee8046b3b00-webhooks-bot@alsa-project.org>
Subject: ASUS Proart P16 - Realtek ALC245 not detected properly after kernel
 6.15 - worked perfectly with earlier kernels
Date: Sun, 21 Sep 2025 15:22:20 +0200 (CEST)
Message-ID-Hash: 6W5SLVJXA64TUEIPFWMAMO6I24U4PHXV
X-Message-ID-Hash: 6W5SLVJXA64TUEIPFWMAMO6I24U4PHXV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6W5SLVJXA64TUEIPFWMAMO6I24U4PHXV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-ucm-conf issue #615 was edited from SneakyLittleman:

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
