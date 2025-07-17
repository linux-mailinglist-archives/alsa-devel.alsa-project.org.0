Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31000B08CF9
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jul 2025 14:33:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75CAE60173;
	Thu, 17 Jul 2025 14:33:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75CAE60173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1752755618;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gP8PWTsFBX6LfWcZM4EEVNH/9J66nuigjQ08/xsX0+fTFRj0yTRxMU/RyGXfroB4W
	 MTDSe77EQVPWW9MhmIK70aXzW95SN3SdH9gQDv6MsgUxwbBoIG2Qf8MsCll/59UZsT
	 jJlJOUoWimIobPSjBmXcdhrhlhSqigCSJqS0vQP8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7F15F805C0; Thu, 17 Jul 2025 14:33:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96875F805C3;
	Thu, 17 Jul 2025 14:33:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE55CF80217; Thu, 17 Jul 2025 14:32:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PP_MIME_FAKE_ASCII_TEXT,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 62254F800F3
	for <alsa-devel@alsa-project.org>; Thu, 17 Jul 2025 14:32:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62254F800F3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Cw/DxDhV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 63C6BA578DB;
	Thu, 17 Jul 2025 12:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F18C4CEE3;
	Thu, 17 Jul 2025 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752755562;
	bh=DW8ZX5jR8T9jfhyWJl3ToBeKvu6TzfqYWQoW2sx+CB8=;
	h=From:To:Cc:Subject:Date:From;
	b=Cw/DxDhV4ajCwPtyxeqOpUiU8UWlKE4YSZG/HD2TFDxyAR7nhTWvJOovloGQWa9LJ
	 LsJBjWDS0ELxdTOtZActzyx88np+lksDFR1lhWDJSIgUYq7kg0L5AVEnPQ0SIC9j+P
	 ehkNdvWn0dXc5jMPQLoYlQf7o/HZh6lC5Ms5uFYr0HAadFIQXQ1IWJ72VVyhGjdtEy
	 fN2FObdKLfYL9tvLTbJXGLHcoeEqC2pj4AwCIj7uKiDHfZPZHwqtU6YtGjxKVR4DQu
	 VthvU2zbQB3PLK1UFFWuTF//yEz7CzpFfhZMPJJF+Np2KfVm7171KvRkXAotfi8ShU
	 bKY/1BqFxXA2Q==
Message-ID: <1814b1eaab5c1e3c09807b0e2862b706.broonie@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.16-rc5
Date: Thu, 17 Jul 2025 13:32:38 +0100
Message-ID-Hash: GAKERC6XTCB5NVQ2RBVKL5HXCCTUEYGK
X-Message-ID-Hash: GAKERC6XTCB5NVQ2RBVKL5HXCCTUEYGK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GAKERC6XTCB5NVQ2RBVKL5HXCCTUEYGK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 3b3312f28ee2d9c386602f8521e419cfc69f4823:

  ASoC: cs35l56: probe() should fail if the device ID is not recognized (2025-07-03 12:22:27 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.16-rc5

for you to fetch changes up to a609bd74b8680dba62c44f7e6d00d381ddb2d3c0:

  ASoC: Intel: avs: Fix NULL ptr deref on rmmod (2025-07-08 14:54:40 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.16

Two patches here, one quirk for an AMD system and a fix for an issue on
remove of the AVS driver.

----------------------------------------------------------------
Alexandru Andries (1):
      ASoC: amd: yc: add DMI quirk for ASUS M6501RM

Amadeusz Sławiński (1):
      ASoC: Intel: avs: Fix NULL ptr deref on rmmod

 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 sound/soc/intel/avs/pcm.c     | 4 +++-
 2 files changed, 10 insertions(+), 1 deletion(-)
