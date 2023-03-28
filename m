Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 136446CB89F
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Mar 2023 09:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E9C211F1;
	Tue, 28 Mar 2023 09:48:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E9C211F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679989766;
	bh=oQ8H0aykvgXZJ+OOQld7EFN2YQ/bOEvCDXmi3lYLiFo=;
	h=To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From:Reply-To:Cc:From;
	b=RJdNQBqn6z/broVI6AOJID+iJ8THp86Djown/iazrvdBE61oi7OTgZElb06erRks6
	 43/aUqlCQ0pLky/ZiKKA60Omb9/EU9N4ZSXXbozOc/jL3QRmrbT6Co9ROWwybvoNGI
	 AqpCrRv4itqq3wq5v+iGjjB4Q3bfNiPwadInkP5E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A1C7F80527;
	Tue, 28 Mar 2023 09:48:35 +0200 (CEST)
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 0/5] Add the Lantiq PEF2256 audio support
Date: Tue, 28 Mar 2023 09:48:06 +0200
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <167998971395.26.7273922447172425370@mailman-core.alsa-project.org>
From: Herve Codina via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DE9BF80527; Tue, 28 Mar 2023 09:48:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 09D18F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Mar 2023 09:48:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09D18F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MQn4hU2t
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id B1DDEC0015;
	Tue, 28 Mar 2023 07:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679989699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1ra6y+AOsjCKVGVTCm8CNnJ9h/NXXUDD/iFVgjYHCHU=;
	b=MQn4hU2tWWgcFfc/lYVz46alWMi4ypGTDGnZvq81m+vukUZdyWIEkHZWIfrWbt0gqrTQFj
	OoOfhDckgDPQwkd+/0nLCF6xgmzbAYitDbvq/f3SVZ3TP9/RdLMD/GJBtZFSxhiWx/FJO4
	y85kDZ/A0Is5pbuNa3P/TQnEb7jm51HUgk938/hpk7WeK9epKa4P2qHn76AEUHuYQWBV8N
	nt/ks7lCz1k0pmhxf5BlkBYebxGv2CQe12PcMGpCxNbq6mfzPuk134/eRFhyP/8Nr0bAjB
	hDVHtLR6F1LWAxFJwZXbexjYKu434w2+WCwyyKo6+KfjhS4Y9nFRjkuSuHZKiQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v4 0/5] Add the Lantiq PEF2256 audio support
Date: Tue, 28 Mar 2023 09:48:06 +0200
Message-Id: <20230328074811.594361-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MJBPXEQGC6PJPT4KTU57EMFT7EZRZY36
X-Message-ID-Hash: MJBPXEQGC6PJPT4KTU57EMFT7EZRZY36
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
Archived-At: <>
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

The first part of this series (patches 1 to 3) adds the Lantiq PEF2256
driver core.
The second part (patch 4) adds the audio support using the Lantiq
PEF2256 driver core.
The last patch adds myself as the PEF2256 maintainer.

The consumer/provider relation between the codec and the driver core
allows to use the PEF2256 framer for other purpose than audio support.

Compared to the previous iteration
  https://lore.kernel.org/linux-kernel/20230322134654.219957-1-herve.codina@bootlin.com/
This v4 series mainly:
  - Drops the of_match_ptr() usage
  - Fixes a kernel test robot error
  - Merge the codec sub-node binding into the pef2256 binding.
  - Use a more a complete DT example.

Best regards,
Herve Codina

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

Herve Codina (5):
  dt-bindings: mfd: Add the Lantiq  PEF2256 E1/T1/J1 framer
  mfd: Add support for the Lantiq PEF2256 framer
  Documentation: sysfs: Document the Lantiq PEF2256 sysfs entry
  ASoC: codecs: Add support for the Lantiq PEF2256 codec
  MAINTAINERS: Add the Lantiq PEF2256 driver entry

 .../sysfs-bus-platform-devices-pef2256        |   12 +
 .../bindings/mfd/lantiq,pef2256.yaml          |  270 ++++
 MAINTAINERS                                   |    9 +
 drivers/mfd/Kconfig                           |   17 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/pef2256.c                         | 1355 +++++++++++++++++
 include/linux/mfd/pef2256.h                   |   28 +
 sound/soc/codecs/Kconfig                      |   14 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/pef2256-codec.c              |  390 +++++
 10 files changed, 2098 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-devices-pef2256
 create mode 100644 Documentation/devicetree/bindings/mfd/lantiq,pef2256.yaml
 create mode 100644 drivers/mfd/pef2256.c
 create mode 100644 include/linux/mfd/pef2256.h
 create mode 100644 sound/soc/codecs/pef2256-codec.c

-- 
2.39.2

