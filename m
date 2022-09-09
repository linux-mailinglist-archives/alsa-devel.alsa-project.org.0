Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6B75B39EB
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Sep 2022 15:55:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5FC6168D;
	Fri,  9 Sep 2022 15:54:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5FC6168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662731745;
	bh=mbDXsHU3CppGv24/hXW6qrSCP36epzccwYo5HDBOt2w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IYfUXg6Ce0Xb7firSNgEB5Ol5XK+eWKshYi0YcPGxDh24hkALHga7HCWly542leNh
	 zeDSz7Q2sHxYeeeheKQSZWvzeFFTDdSCI8banuaaFHwte2M3xrIgvnNP4swez1LPUx
	 xn+elQn1j5tojVwhCd0lgusFWOJ4Wfq7l1P/ibbE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B0BDF8016C;
	Fri,  9 Sep 2022 15:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93032F8016C; Fri,  9 Sep 2022 15:54:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RDNS_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from hutie.ust.cz (unknown [IPv6:2a03:3b40:fe:f0::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CD8EF8016C
 for <alsa-devel@alsa-project.org>; Fri,  9 Sep 2022 15:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CD8EF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=cutebit.org header.i=@cutebit.org
 header.b="ik+mdjOb"
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
 t=1662731675; bh=vvgm+GqZsmNcWfwWCumfisqYaU3KbPkkcPy5f1+JRsw=;
 h=From:To:Cc:Subject:Date;
 b=ik+mdjObq086ky4rULYWxtQ2Myx3k5g3QjA05uzvdcWTyisZsJXvfIy8VSneJwOVu
 jKHxKkeGroY6LtViBsL1/1mkDu8Qls/mDEx6P/fGMSOOrSqopSxeoNHbjDXw0rMCLs
 WBrTKlv2dagBj+RpfKz6s88bzz5LWebeWdkFrumI=
To: James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 00/10] Support for CS42L83 on Apple machines
Date: Fri,  9 Sep 2022 15:53:24 +0200
Message-Id: <20220909135334.98220-1-povik+lin@cutebit.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 - <patches@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 asahi@lists.linux.dev, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matt Flax <flatmax@flatmax.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi all,

there's a CS42L83 headphone jack codec found in Apple computers (in the
recent 'Apple Silicon' ones as well as in earlier models, one example
[1]). The part isn't publicly documented, but it appears almost
identical to CS42L42, for which we have a driver in kernel. This series
adapts the CS42L42 driver to the new part, and makes one change in
anticipation of a machine driver for the Apple computers.

Patch 1 adds new compatible to the cs42l42 schema.

Patches 2 to 7 are taken from Richard's recent series [2] adding
soundwire support to cs42l42. They are useful refactorings to build on
in later patches, and also this way our work doesn't diverge. I made
one fix: I added a call of common_remove at the end of i2c_probe should
the cs42l42_init call fail (both before and after the split to
cs42l42-i2c.c). Also s/Soundwire/SoundWire/ in the changelogs.

Patch 8 exports some regmap-related symbols from cs42l42.c so they can
be used to create cs42l83 regmap in cs42l83-i2c.c later.

Patch 9 is the cs42l83 support proper.

Patch 10 implements 'set_bclk_ratio' on the cs42l42 core. This will be
called by the upcoming ASoC machine driver for 'Apple Silicon' Macs.
(We have touched on this change to be made in earlier discussion, see
 [3] and replies.)

Best,
Martin

[1] https://www.ifixit.com/Teardown/MacBook+Pro+13-Inch+Touch+Bar+2018+Teardown/111384
[2] https://lore.kernel.org/alsa-devel/20220819125230.42731-1-rf@opensource.cirrus.com/T/#mc05cc6898be2c23fe2e7c8bb4ea4e4a00c1912a7
[3] https://lore.kernel.org/asahi/8961DDD2-93FF-4A18-BCA2-90FCE298F517@cutebit.org/


Martin Povišer (5):
  ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
  ASoC: cs42l42: Split probe() and remove() into stages
  ASoC: cs42l42: Export regmap elements to the core namespace
  ASoC: cs42l83: Extend CS42L42 support to new part
  ASoC: cs42l42: Implement 'set_bclk_ratio'

Richard Fitzgerald (5):
  ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
  ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
  ASoC: cs42l42: Split cs42l42_resume into two functions
  ASoC: cs42l42: Pass component and dai defs into common probe
  ASoC: cs42l42: Split I2C identity into separate module

 .../bindings/sound/cirrus,cs42l42.yaml        |   1 +
 MAINTAINERS                                   |   1 +
 include/sound/cs42l42.h                       |   1 +
 sound/soc/codecs/Kconfig                      |  15 +-
 sound/soc/codecs/Makefile                     |   6 +-
 sound/soc/codecs/cs42l42-i2c.c                | 112 ++++++++
 sound/soc/codecs/cs42l42.c                    | 256 +++++++++---------
 sound/soc/codecs/cs42l42.h                    |  24 +-
 sound/soc/codecs/cs42l83-i2c.c                | 248 +++++++++++++++++
 9 files changed, 538 insertions(+), 126 deletions(-)
 create mode 100644 sound/soc/codecs/cs42l42-i2c.c
 create mode 100644 sound/soc/codecs/cs42l83-i2c.c

-- 
2.33.0

