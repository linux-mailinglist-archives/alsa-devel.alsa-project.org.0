Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44026E4F09
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Apr 2023 19:17:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56A1BDEF;
	Mon, 17 Apr 2023 19:16:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56A1BDEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681751827;
	bh=zrvZDj4S3svJi7DLQgytPjpMw4rzAAaNrhk2ePuptuQ=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=PLCo6Kr/esXybtqXLDqLCAFdaLpQ+ks1PJCkkOHLMClQzTZNZj67Y0c3zurIklG2O
	 rVIIniJSK96ioYgCnx6hkTcl+8KYmD6pcn2+HXQAFMuuqexDaIusCjwoKjEtxUv8tl
	 p16LU/vQqYYgqbG8ARTHNrAj672Wcy2z8ivK7cc8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C24A6F8049C;
	Mon, 17 Apr 2023 19:16:16 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 0/7] Add the Lantiq PEF2256 audio support
Date: Mon, 17 Apr 2023 19:15:54 +0200
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2X6T4JLE5LVWLJY6PWJ6X7GSXRJLIEM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168175177637.26.11828831600205191393@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60F50F80269; Mon, 17 Apr 2023 19:16:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF6DDF800E2
	for <alsa-devel@alsa-project.org>; Mon, 17 Apr 2023 19:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF6DDF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=R0l6tW2u
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 571D9C0005;
	Mon, 17 Apr 2023 17:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681751765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DSRYetUsIC3ZsZsN/yMuI55iJENgHW3YhTcg2JkySqE=;
	b=R0l6tW2uRGsTry7Ij4GE3fEQjRiGJI3YvGJYrwlBbUo/X8YMAxFQRMvIRK8hPqGoQo//NZ
	yhsonadzgs1cnJyBA7kRBpEXQx47+2E4AKZg3u0cO3GEZ7td3SBikPZpFHTvL7nA2V1k0h
	p5HZoVWNVDPB4ye3mFpmrAXGhsESiJ+AwezvLPNHTJ495ZJZjetRMyD8m3p9E8aEXYnBYb
	IekFEO+pcht1Gz69ZaRKxmhKZ7VQmo/qieU7mUwYdbjPdeix24x0PW7uX3leDXmaYAicH9
	2oQr8vtNZDj+rKvJpnlJ+WbrNsfPLR6xQAaluX03zpGJoOmCCeDnB8RdOf7tFQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6 0/7] Add the Lantiq PEF2256 audio support
Date: Mon, 17 Apr 2023 19:15:54 +0200
Message-Id: <20230417171601.74656-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2X6T4JLE5LVWLJY6PWJ6X7GSXRJLIEM7
X-Message-ID-Hash: 2X6T4JLE5LVWLJY6PWJ6X7GSXRJLIEM7
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2X6T4JLE5LVWLJY6PWJ6X7GSXRJLIEM7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series adds support for audio using the Lantiq PEF2256 framer.

The Lantiq PEF2256 is a framer and line interface component designed to
fulfill all required interfacing between an analog E1/T1/J1 line and the
digital PCM system highway/H.100 bus.

The first part of this series (patches 1 to 4) adds the Lantiq PEF2256
driver core fixing a MFD core issue at patch 2.
The patch 5 adds the PEF2256 pinmux support.
The patch 6 adds the audio support using the Lantiq PEF2256 driver core.
The last patch adds myself as the PEF2256 maintainer.

The consumer/provider relation between the codec and the driver core
allows to use the PEF2256 framer for other purpose than audio support.

Compared to the previous iteration
  https://lore.kernel.org/all/20230328092645.634375-1-herve.codina@bootlin.com/
This v6 series mainly:
  - Use regmap
  - Move the pinmux part to the pinctrl subsystem
  - Move register definitions to header files.
  - Split pef2256_setup_e1() in several parts.
  - Fixed issues raised by checkpatch.pl.
  - Removed debug prints.

Best regards,
Herve Codina

Changes v5 -> v6
  - Patch 1
    Add 'Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>'

  - Patch 2
    New patch added fixing an MFD core issue.

  - Patch 3 (patch 2 in v5)
    Remove the pinmux part.
    Move registers definition to a header file and rework the
    definition.
    Use a regmap for register accesses
    Various minor fixes (typos, comments, ...)
    Fixed issues raised by checkpatch.pl --strict
    Removed debug prints.

  - Patch 4 (patch 3 in v5)
    No changes

  - Patch 5
    New patch adding the PEF2256 pinmux part in the pinctrl subsystem.

  - Patch 6 (patch 4 in v5)
    Fixed issues raised by checkpatch.pl --strict

  - Patch 7 (patch 5 in v5)
    Updated according to files creation and move.

Changes v4 -> v5
  - Patch 1
    Fix 'additionalProperties' and 'unevaluatedProperties' positions
    Fix sub-nodes names suffixes

Changes v3 -> v4
  - Patch 1
    Merge the codec sub-node description.
    Move the 'allOf' property after the 'required' property.
    Rework the example to be more complete.

  - Patches 2 and 5
    Drop of_match_ptr()

  - Patch 2
    Add 'depends on OF' as pinconf_generic_dt_node_to_map_pin() needs OF
    support to be compiled (error raised by the kernel test robot).

  - Patch 4
    Remove patch (merged in patch 1)

Changes v2 -> v3
  - Patch 1
    Remove unneeded 'allOf' and quotes.
    Add several 'additionalProperties: false'
    Fix example (node name, interrupts and reg properties)
    Replace the lantiq,sysclk-rate-hz property by sclkr and sclkx clocks.
    Define 'lantiq,frame-format' property in top level.
    Move to MFD

  - Patch 2
    Fix some #define.
    Compact the register accessor helpers.
    Rework pef2256_get_version().
    Merge v1.2 and v2.x GCM setup functions into one pef2256_setup_gcm().
    Update comments, avoid duplicates and change some conditionals.
    Remove the carrier spinlock and use atomic_t.
    Make exported symbol consistent and use EXPORT_SYMBOL_GPL.
    Remove the no more needed pef2256_get_byphandle() and
    devm_pef2256_get_byphandle().
    Replace the lantiq,sysclk-rate-hz property by sclkr and sclkx clocks.
    Move to MFD

  - Patch 4
    Remove, merged with patch 7

  - Patch 4 (patch 5 in v2)
    Update title and description.
    Remove incorrect SPI reference.
    Remove the 'lantiq,pef2256' phandle.
    Fix commit log

  - Patch 5 (patch 6 in v2)
    Remove devm_pef2256_get_byphandle().
    Fix commit log

  - Patch 6 (patch 7 in v2)
    Merge v2 patch 4. One entry only for PEF2256

Changes v1 -> v2
  - Patch 2
    Remove duplicate const qualifiers.
    Add HAS_IOMEM as a dependency

  - Patch 3
    Fix a "Block quote ends without a blank line; unexpected unindent"
    syntax issue.

Herve Codina (7):
  dt-bindings: mfd: Add the Lantiq  PEF2256 E1/T1/J1 framer
  mfd: core: Ensure disabled devices are skiped without aborting
  mfd: Add support for the Lantiq PEF2256 framer
  Documentation: sysfs: Document the Lantiq PEF2256 sysfs entry
  pinctrl: Add support for the Lantic PEF2256 pinmux
  ASoC: codecs: Add support for the Lantiq PEF2256 codec
  MAINTAINERS: Add the Lantiq PEF2256 driver entry

 .../sysfs-bus-platform-devices-pef2256        |  12 +
 .../bindings/mfd/lantiq,pef2256.yaml          | 267 +++++
 MAINTAINERS                                   |  12 +
 drivers/mfd/Kconfig                           |  16 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/mfd-core.c                        |  18 +-
 drivers/mfd/pef2256-regs.h                    | 250 +++++
 drivers/mfd/pef2256.c                         | 950 ++++++++++++++++++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h        |  65 ++
 drivers/pinctrl/pinctrl-pef2256.c             | 310 ++++++
 include/linux/mfd/pef2256.h                   |  52 +
 sound/soc/codecs/Kconfig                      |  14 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/pef2256-codec.c              | 390 +++++++
 16 files changed, 2369 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256
 create mode 100644 Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
 create mode 100644 drivers/mfd/pef2256-regs.h
 create mode 100644 drivers/mfd/pef2256.c
 create mode 100644 drivers/pinctrl/pinctrl-pef2256-regs.h
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
 create mode 100644 include/linux/mfd/pef2256.h
 create mode 100644 sound/soc/codecs/pef2256-codec.c

-- 
2.39.2

