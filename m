Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB79DC59E42
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Nov 2025 21:01:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01203601A8;
	Thu, 13 Nov 2025 21:01:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01203601A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1763064083;
	bh=DgxwAHRpzhGKnOM66CN/pWdJ+seG7F0kvnk02SRFFEs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=aKkLd92Wpwa7vCVtj/xMVrBvgoffsNko8pruRjlEIqRMS3ns3ZVJNFkhJIeCfzZh0
	 8Z/RkpqrWbbR4zU2j7acDsMA/3Jx2ZMMLe20o2eL3USOa6zaECsL/G4RliTxX8OG28
	 nQ9O/M9+LyXr1w2Ou4p7B7LdPWLBjAMvZRvodhLE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D352AF805BD; Thu, 13 Nov 2025 21:00:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 902FBF805BF;
	Thu, 13 Nov 2025 21:00:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 862B1F80533; Thu, 13 Nov 2025 21:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6F089F80027
	for <alsa-devel@alsa-project.org>; Thu, 13 Nov 2025 20:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F089F80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fSIEKYTV
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E01E60121;
	Thu, 13 Nov 2025 19:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E49BC4CEFB;
	Thu, 13 Nov 2025 19:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763063964;
	bh=DgxwAHRpzhGKnOM66CN/pWdJ+seG7F0kvnk02SRFFEs=;
	h=From:To:Cc:Subject:Date:From;
	b=fSIEKYTVm2uY8XdWgVNLyUcl3hp6zcN8jm8B/BZokC28RCWq/4/mR90f+Vv8dSIWl
	 UHoKSbKS1eqQgd/Q90e1DsjlF2U12ddYyhTQA/gn7qbpVEf5kyNRADeQyBxDLFcs16
	 w4Y60hUqJ9Y2l+CcCaYFBlqu5JOl6m/wL6KbnNofNx/z+DgNCz4GN7eqQpDdiQyrbU
	 ItnaA+r5cEKRIx1Elfzwy7hKaQ328EHr+u86yMJI0y2e0vtrPpSoPlDr4WXs8Q/OFS
	 +xzOjo+813NyRVIsrbQ7qk2+gKiEsc63o3Ze7Lp8kOcat6EwP7SoiqmTgNlMdgXgaE
	 i9UhO1AiBp1JA==
Message-ID: <979d5936ff7b727be317ba6d8c3a5e36@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc5
Date: Thu, 13 Nov 2025 19:59:09 +0000
Message-ID-Hash: JAGJUZWVNP4UPRJVBT22D2K6ER636UPS
X-Message-ID-Hash: JAGJUZWVNP4UPRJVBT22D2K6ER636UPS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JAGJUZWVNP4UPRJVBT22D2K6ER636UPS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:

  Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc5

for you to fetch changes up to 360b3730f8eab6c4467c6cca4cb0e30902174a63:

  ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe() (2025-11-13 00:36:01 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A small collection of fixes, all driver specific and none especially
remarkable unless you have the hardware (many not even then).

----------------------------------------------------------------
Claudiu Beznea (1):
      ASoC: da7213: Use component driver suspend/resume

Haotian Zhang (3):
      ASoC: cs4271: Fix regulator leak on probe failure
      ASoC: codecs: va-macro: fix resource leak in probe error path
      ASoC: rsnd: fix OF node reference leak in rsnd_ssiu_probe()

Miaoqian Lin (1):
      ASoC: sdw_utils: fix device reference leak in is_sdca_endpoint_present()

Niranjan H Y (2):
      ASoC: tas2783A: Fix issues in firmware parsing
      ASoC: SDCA: bug fix while parsing mipi-sdca-control-cn-list

Richard Fitzgerald (1):
      ASoC: doc: cs35l56: Update firmware filename description for B0 silicon

Shenghao Ding (1):
      ASoC: tas2781: fix getting the wrong device number

 Documentation/sound/codecs/cs35l56.rst |  9 ++---
 sound/soc/codecs/cs4271.c              | 10 +++--
 sound/soc/codecs/da7213.c              | 69 ++++++++++++++++++++++------------
 sound/soc/codecs/da7213.h              |  1 +
 sound/soc/codecs/lpass-va-macro.c      |  2 +-
 sound/soc/codecs/tas2781-i2c.c         |  9 ++++-
 sound/soc/codecs/tas2783-sdw.c         | 20 +++++++++-
 sound/soc/renesas/rcar/ssiu.c          |  3 +-
 sound/soc/sdca/sdca_functions.c        |  3 +-
 sound/soc/sdw_utils/soc_sdw_utils.c    | 20 +++++++---
 10 files changed, 99 insertions(+), 47 deletions(-)
