Return-Path: <alsa-devel-bounces@alsa-project.org>
Delivered-To: lists+alsa-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHXWItCqqWlSBwEAu9opvQ
	(envelope-from <alsa-devel-bounces@alsa-project.org>)
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 17:09:52 +0100
X-Original-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D2D215293
	for <lists+alsa-devel@lfdr.de>; Thu, 05 Mar 2026 17:09:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523E9602B7;
	Thu,  5 Mar 2026 17:09:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523E9602B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1772726991;
	bh=n/jsFStn/BYXZr7Hl4JTiy1I1XD2nIItZjbkr2AYIH8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ocPgkR+e7BdavInUmr7RVkRbk8Z7MZfz1ikkBx+lnLl4fm8kL+odOjJ7HQBD3XII7
	 OO4bvzpFZWWX7P25B6zD25mfre6kqFNznPfHV50bIYJbKv/YETXxt4jWuKIPtbWQUA
	 GBOIle4zW+CNQvUuwYE80zqNmEKGN1fGI5MdLETY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E35A7F805F5; Thu,  5 Mar 2026 17:09:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80723F805EB;
	Thu,  5 Mar 2026 17:09:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 270DDF8025A; Thu,  5 Mar 2026 17:09:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,T_SPF_PERMERROR
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF97CF80087
	for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2026 17:09:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF97CF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FChNtr7D
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D95243CA6;
	Thu,  5 Mar 2026 16:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA49CC116C6;
	Thu,  5 Mar 2026 16:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772726945;
	bh=n/jsFStn/BYXZr7Hl4JTiy1I1XD2nIItZjbkr2AYIH8=;
	h=From:To:Cc:Subject:Date:From;
	b=FChNtr7DO383inpFtYOnrh36E+HBDUw3nvlpXt6r+3hBvwMpskf/Z+uorxTK+LGFT
	 +AN3+oKeIfxUGgs0QHkx0SQbjBZiyFAEqUGPy5Sn/T7vT9Ozx3InEMwPEZrTv3vdc5
	 OxFLZ938YzIbACA4UHZXf0j/xPXBxjQFPSngxDCEIe10p+A3B98XvSrQwbuWT45Zd0
	 CTUr8N2FUcSldD684SwUoVKsXaoPUiyeEL6TDZugGpS2uaQUjct4X7qoWz2BQPtE94
	 AQKGumMOAkaFDgy+lT+3GvEF6+lFFF9jZMeyLob5YLKXFG7rRNIqzawJ761fH+cL+B
	 e1vaMTzsshUhg==
Message-ID: <7ad7ff6760638a45f9d77f53a870e817@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v7.0-rc2
Date: Thu, 05 Mar 2026 16:08:54 +0000
Message-ID-Hash: MLASENR27SXTHPD56W6ELH2A4QLT5T4G
X-Message-ID-Hash: MLASENR27SXTHPD56W6ELH2A4QLT5T4G
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; emergency; member-moderation;
 nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size;
 news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MLASENR27SXTHPD56W6ELH2A4QLT5T4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
X-Rspamd-Queue-Id: 24D2D215293
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[alsa-project.org:dkim,alsa0.perex.cz:rdns,alsa0.perex.cz:helo];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,alsa-devel-bounces@alsa-project.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[alsa-devel@alsa-project.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[alsa-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v7.0-rc2

for you to fetch changes up to 325291b20f8a6f14b9c82edbf5d12e4e71f6adaa:

  ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA (2026-03-04 11:40:17 +0000)

----------------------------------------------------------------
ASoC: Fixes for v7.0

A moderately large pile of fixes, though none of them are  super major,
plus a few new quirks and device IDs.

----------------------------------------------------------------
Biju Das (1):
      ASoC: dt-bindings: renesas,rz-ssi: Document RZ/G3L SoC

Charles Keepax (1):
      ASoC: SDCA: Add allocation failure check for Entity name

Mark Brown (3):
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_put_bits()
      ASoC: fsl_easrc: Fix event generation in fsl_easrc_iec958_set_reg()
      ASoC: fsl_easrc: Fix control writes

Oliver Freyermuth (1):
      ASoC: Intel: sof_sdw: Add quirk for Alienware Area 51 (2025) 0CCD SKU

Richard Fitzgerald (2):
      ASoC: cs35l56: Only patch ASP registers if the DAI is part of a DAIlink
      ASoC: cs35l56: Suppress pointless warning about number of GPIO pulls

Sheetal (1):
      ASoC: dt-bindings: tegra: Add compatible for Tegra238 sound card

Shuming Fan (1):
      ASoC: rt1321: fix DMIC ch2/3 mask issue

Simon Trimmer (1):
      ASoC: amd: acp: Add ACP6.3 match entries for Cirrus Logic parts

Zhang Heng (1):
      ASoC: amd: yc: Add DMI quirk for ASUS EXPERTBOOK PM1503CDA

 .../sound/nvidia,tegra-audio-graph-card.yaml       |   1 +
 .../devicetree/bindings/sound/renesas,rz-ssi.yaml  |   1 +
 include/sound/cs35l56.h                            |   1 +
 sound/soc/amd/acp/amd-acp63-acpi-match.c           | 413 +++++++++++++++++++++
 sound/soc/amd/yc/acp6x-mach.c                      |   7 +
 sound/soc/codecs/cs35l56-shared.c                  |  16 +-
 sound/soc/codecs/cs35l56.c                         |  12 +-
 sound/soc/codecs/rt1320-sdw.c                      |   5 +-
 sound/soc/fsl/fsl_easrc.c                          |  14 +-
 sound/soc/intel/boards/sof_sdw.c                   |   8 +
 sound/soc/sdca/sdca_functions.c                    |   5 +-
 11 files changed, 473 insertions(+), 10 deletions(-)
