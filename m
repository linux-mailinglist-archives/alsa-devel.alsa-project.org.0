Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBE4BECEE4
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Oct 2025 13:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EAE060236;
	Sat, 18 Oct 2025 13:58:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EAE060236
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1760788731;
	bh=l7P8vgL5pJ7GxVy8Nsi8UoZgOcV57M3R6XY5X0LFIb4=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=BsMHD9PCGdgqo7YsBnzLogWfIHy4I54MuAufpTV/IT54ss8RqiZBXorxcXgMzCQYh
	 o/2uIJ1CfaGYXp3oIYVhCPKKMzIelxYZyaXLgAW3PBYVyexP04pYB1uq49hzPKJjvX
	 ZPWFoUuLaoNUBripykijrCsZ8RMviJ/e3h1cfK9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B987F80678; Sat, 18 Oct 2025 13:57:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A552F80676;
	Sat, 18 Oct 2025 13:57:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C08AF805FA; Thu, 16 Oct 2025 19:04:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FC54F8016A
	for <alsa-devel@alsa-project.org>; Thu, 16 Oct 2025 19:04:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FC54F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=JZK6rCOq
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FDCD4397E;
	Thu, 16 Oct 2025 17:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 782DDC4CEFB;
	Thu, 16 Oct 2025 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760634252;
	bh=AZDRJ6u8NLAI0+WZkR6rDMpVycU/yadnAjlDLNNuHr0=;
	h=From:To:Cc:Subject:Date:From;
	b=JZK6rCOqkDBatvaz7ceUxcTjWF18bxZdN8TAriuKNVbfg788rDuv1iOZvcwMPww7w
	 UnPCP7e32BSY9j7tAlbHDG4TD/nonc2cAZ3N63KvbA7i8e0FxsngOZUfthcD66PfUY
	 6v+BQsBzAHjM1g0yeARelxGR6hP6j8q5rg55OEKFs4VVrw4fMGHxVwHwfFg0axqkp2
	 yVOxLxPYr180NGnz8hWoaPAOO7y6q8zX1EXIwve1KF1Pb7nrFiWyJI99dYyPXu9uw+
	 BOlqrg0aEZpsrTlrz5bvNwJa54LB/gDCRsX/Gp+LuZkAlMpQ/Lucy5iua7jMTqYZQe
	 uRIdRODiFcAhA==
Message-ID: <e26bc312636de276f8c7e46cba269b7f@kernel.org>
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
Subject: [GIT PULL] ASoC fixes for v6.18-rc1
Date: Thu, 16 Oct 2025 18:04:02 +0100
Message-ID-Hash: 23PB7E56FK2XRCE6CN57TC4OAQKLZBHN
X-Message-ID-Hash: 23PB7E56FK2XRCE6CN57TC4OAQKLZBHN
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
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.18-rc1

for you to fetch changes up to f1a450f9e17d341f69f8fb19f6d13ef9f1aa508b:

  ASoC: nau8821: Fix IRQ handling and improve jack (2025-10-16 12:41:35 +0100)

----------------------------------------------------------------
ASoC: Fixes for v6.18

A moderately large collection of driver specific fixes, plus a few new
quirks and device IDs.  The NAU8821 changes are a little large but more
in mechanical ways than in ways that are complex.

----------------------------------------------------------------
Baojun Xu (2):
      ASoC: tas2781: Support more newly-released amplifiers tas58xx in the driver
      ASoC: tas2781: Update ti,tas2781.yaml for adding tas58xx

Christophe Leroy (1):
      ASoC: codecs: Fix gain setting ranges for Renesas IDT821034 codec

Cristian Ciocaltea (5):
      ASoC: nau8821: Cancel jdet_work before handling jack ejection
      ASoC: nau8821: Generalize helper to clear IRQ status
      ASoC: nau8821: Consistently clear interrupts before unmasking
      ASoC: nau8821: Add DMI quirk to bypass jack debounce circuit
      ASoC: nau8821: Avoid unnecessary blocking in IRQ handler

Frank Li (1):
      ASoC: dt-bindings: Add compatible string fsl,imx-audio-tlv320

Le Qi (2):
      ASoC: dt-bindings: qcom,sm8250: Add QCS615 sound card
      ASoC: qcom: sc8280xp: Add support for QCS615

Li Qiang (1):
      ASoC: amd/sdw_utils: avoid NULL deref when devm_kasprintf() fails

Mark Brown (2):
      ASoC: Add QCS615 sound card support
      ASoC: nau8821: Fix IRQ handling and improve jack

Sharique Mohammad (1):
      ASoC: max98090/91: fixed max98091 ALSA widget powering up/down

Shuming Fan (1):
      ASoC: sdw_utils: add rt1321 part id to codec_info_list

Srinivas Kandagatla (1):
      ASoC: codecs: wcd938x-sdw: remove redundant runtime pm calls

 .../devicetree/bindings/sound/fsl-asoc-card.yaml   |   1 +
 .../devicetree/bindings/sound/qcom,sm8250.yaml     |   1 +
 .../devicetree/bindings/sound/ti,tas2781.yaml      |  43 ++++++-
 include/sound/tas2781.h                            |   3 +
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |   2 +-
 sound/soc/codecs/idt821034.c                       |  12 +-
 sound/soc/codecs/max98090.c                        |   6 +-
 sound/soc/codecs/nau8821.c                         | 129 +++++++++++++--------
 sound/soc/codecs/nau8821.h                         |   2 +-
 sound/soc/codecs/tas2781-i2c.c                     |  21 +++-
 sound/soc/codecs/wcd938x-sdw.c                     |  20 +---
 sound/soc/qcom/sc8280xp.c                          |   1 +
 sound/soc/sdw_utils/soc_sdw_utils.c                |  20 ++++
 13 files changed, 177 insertions(+), 84 deletions(-)
_______________________________________________
Alsa-devel mailing list -- alsa-devel@alsa-project.org
To unsubscribe send an email to alsa-devel-leave@alsa-project.org
