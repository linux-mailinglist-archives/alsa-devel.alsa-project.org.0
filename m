Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOpWMr85oGmagwQAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Feb 2026 13:17:03 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CF1A59EA
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Feb 2026 13:17:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5D9601B2;
	Thu, 26 Feb 2026 13:16:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5D9601B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772108221;
	bh=7BAdmPyOKJ1QEM3M9r0UGakTNfKtugYYuFz2Cro/YVs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=chHJi9UzR6Q+0H/Uu51XGtu/3hXv+m+1pg7T028e3U52JPUwvL4p4Uwmm0tnhTobc
	 4me0d4b0dCS9n8Sh5ipyHaQSjF4Or8HBBNuH9SrtjbkMmbJhiRIRqX2Mi9xl9hBjpd
	 WGa6Njyt5l1a27hGd92p13IuIGcRly3TIPwgbBwQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57CBFF805ED; Thu, 26 Feb 2026 13:16:39 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5B86F805D7;
	Thu, 26 Feb 2026 13:16:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A6E7F8051E; Thu, 26 Feb 2026 13:13:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDCDFF802DB
	for <alsa-devel@alsa-project.org>; Thu, 26 Feb 2026 13:13:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDCDFF802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i93GaD4x
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3068C442E4;
	Thu, 26 Feb 2026 12:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD15CC116C6;
	Thu, 26 Feb 2026 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772108023;
	bh=7BAdmPyOKJ1QEM3M9r0UGakTNfKtugYYuFz2Cro/YVs=;
	h=From:To:Cc:Subject:Date:From;
	b=i93GaD4x5JDXwPzqxpRulW598AKfONVUkIVk5TtsfABMJnWqjHSHF7iWRneVhNOUu
	 cE4kWZwKgqMisCRFWUdD8nR2WIB5VsL8ValIFPRcZ9bqt9udnRJTGbqU2LBkuki0w2
	 cC6FrZs5N51WgpWl1vhEBQajkSErE+jzZUnO4jPpz8xID8QZ11eodE2rW43I8kG8xe
	 zV2FhevD0YfRUfhh7P2/+rVP5u3dxiX4jmq0Z0pR1Gw56YNSzBCzfRLTCDhn2qF/mO
	 znOVoPGzyId1LCJPGsN8/3iEYiDWM9sVu14X7FiUn5meVZay7+Yw4rtOv/+47v9lnu
	 DTU0mO+TKMrug==
Message-ID: <de64faa8c22aa935fb62b898f33f7f58@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc1
Date: Thu, 26 Feb 2026 12:13:35 +0000
Message-ID-Hash: Y46PVWARF35NRTCIQHHF7CBKFZ5REPIA
X-Message-ID-Hash: Y46PVWARF35NRTCIQHHF7CBKFZ5REPIA
X-MailFrom: broonie@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y46PVWARF35NRTCIQHHF7CBKFZ5REPIA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[alsa-project.org:s=default,kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,alsa-project.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[alsa-devel@alsa-project.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FORGED_RECIPIENTS(0.00)[m:tiwai@suse.de,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:alsa-devel@alsa-project.org,m:broonie@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[alsa-project.org:+,kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:16019, ipnet:77.48.128.0/17, country:CZ];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa0.perex.cz:helo,alsa0.perex.cz:rdns];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 606CF1A59EA
X-Rspamd-Action: no action

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc1

for you to fetch changes up to 32fc4168fa56f6301d858c778a3d712774e9657e:

  ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table (2026-02-23 14:52:11 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0

One quirk and a fix for handling of exotic peripherals on cs42l43.

----------------------------------------------------------------
Azamat Almazbek uulu (1):
      ASoC: amd: yc: Add ASUS EXPERTBOOK BM1503CDA to quirk table

Charles Keepax (1):
      ASoC: cs42l43: Report insert for exotic peripherals

 sound/soc/amd/yc/acp6x-mach.c   | 7 +++++++
 sound/soc/codecs/cs42l43-jack.c | 1 +
 2 files changed, 8 insertions(+)
