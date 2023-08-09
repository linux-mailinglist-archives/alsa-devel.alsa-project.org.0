Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952D7760C6
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 15:29:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DFA70210;
	Wed,  9 Aug 2023 15:28:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DFA70210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691587768;
	bh=5VPzzzous60I4oYPuDk73ilW3MxtzYMFAJv7tVfF67U=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=K88UGaunvKXVGSBZG/fO/3ElOMTUsxFNxCHFyohbgNsb9QaXBnhD83kPpEp9yUj3h
	 2aRP25rqgdIPEZX4zTjnRbyY11BBMkZ/jREmPVfWyUOPLrYt7ZYpNhXZnGpBfHt3E1
	 ULONgTuSfyFpDXDgUpP6iquXGCa9zQ5zejsGi+rg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67A05F8016E; Wed,  9 Aug 2023 15:28:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 028C3F80557;
	Wed,  9 Aug 2023 15:28:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DEF08F8055C; Wed,  9 Aug 2023 15:28:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C0A7F80552
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 15:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0A7F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LyZSb2/u
Received: by mail.gandi.net (Postfix) with ESMTPA id 11C0C40011;
	Wed,  9 Aug 2023 13:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691587684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9cjlq/zwQrmKUAS3zYVvxoX1uV9/pFKvxKnNDYT4XWc=;
	b=LyZSb2/u7t9J62n1di31TlSDbh35HQPxpitgOxiAIaFgIfbk0Z1bS0gX2mgi7B49aOiP14
	UZCP7CxBbxVgfDeANnRvnhLPC5Vxw5nCVmvIZTcbgFfEXcDmGS+brMVkEPBggy6CA0J2Dw
	u3ftP+ZY7H1RLFP/5ZLljIG9s62+eXp2NRleU+I5oVcYvE0nDOl/V8QErgH4IbJsbmAgd8
	8yyEsgJj1msjnKTJkzhk0boBxgkcWS7XXVInK1Ywc5xthL+2bgHO2qsDT70vh0mwRsvKG5
	Am/1V5h+mU9SwC6gmcbCVUdnaJn8uRQ4UbdlikGsIyrrwyi+N3RiqIyvLhg/0Q==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v3 00/28] Add support for QMC HDLC,
 framer infrastruture and PEF2256 framer
Date: Wed,  9 Aug 2023 15:27:27 +0200
Message-ID: <20230809132757.2470544-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: KDD5POGS7B7OZ3Y7JMXYK4T3GOFS3VV5
X-Message-ID-Hash: KDD5POGS7B7OZ3Y7JMXYK4T3GOFS3VV5
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KDD5POGS7B7OZ3Y7JMXYK4T3GOFS3VV5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

I have a system where I need to handle an HDLC interface and some audio
data.

The HDLC data are transferred using a TDM bus on which a PEF2256
(E1/T1 framer) is present. The PEF2256 transfers data from/to the TDM
bus to/from the E1 line. This PEF2256 is connected to a PowerQUICC SoC
for the control path and the TDM is connected to the SoC (QMC component)
for the data path.

>From the QMC HDLC driver, I need to handle HDLC data using the QMC,
carrier detection using the PEF2256 (E1 line carrier) and set/get some
PEF2256 configuration.

The QMC HDLC driver considers the PEF2256 as a generic framer.
It performs operations that involve the PEF2256 through the generic
framer API.

The audio data are exchanged with the PEF2256 using a CPU DAI connected
to the TDM bus through the QMC and the PEF2256 needs to be seen as a
codec in order to be linked to the CPU DAI.
The codec handles the carrier detection using the PEF2256 and reports
the carrier state to the ALSA subsystem using the ASoC jack detection.

The codec, even if instantiated by the PEF2256 driver, considers the
PEF2256 as a generic framer.

The generic framer has:
 - 2 consumers (QMC HDLC drv and codec)
 - 1 provider (PEF2256)

So, the design is the following:
                        +------------------+           +---------+
                        | QMC              | <- TDM -> | PEF2256 | <-> E1
     +---------+        |  +-------------+ |           |         |
     | CPU DAI | <-data--> | QMC channel | |           |         |
     +---------+        |  +-------------+ |           |         |
+--------------+        |  +-------------+ |           |         |
| QMC HDLC drv | <-data--> | QMC channel | |           |         |
+--------------+        |  +-------------+ |           |         |
     ^                  +------------------+           |         |
     |   +--------+     +-------------+                |         |
     +-> | framer | <-> | PEF2256 drv | <- local bus ->|         |
         |        |     |             |                +---------+
     +-> |        |     |             |
     |   +--------+     |  +-------+  |
     +-------------------> | codec |  |
                        |  +-------+  |
                        +-------------+

Further more, the TDM timeslots used by the QMC HDLC driver need to be
configured at runtime (QMC dynamic timeslots).

Several weeks ago, I sent two series related to this topic:
 - Add the Lantiq PEF2256 audio support [1]
 - RFC Add support for QMC HDLC and PHY [2]
This current series is a rework of these two series taking into account
feedbacks previously received.

In order to implement all of this, I do the following:
 1) Perform some fixes (patches 1, 2, 3, 4)
 2) Introduce the QMC HDLC driver (patches 5, 6, 7)
 3) Add QMC dynamic timeslot support (patches 8 - 18)
 4) Add timeslots change support in QMC HDLC (patch 19)
 5) Introduce framer infrastructure (patch 20)
 6) Add PEF2256 framer provider (patches 11, 22, 23, 24, 25)
 7) Add framer codec as a framer consumer (patch 26)
 8) Add framer support as a framer consumer in QMC HDLC (patch 27, 28)

The series contains the full story and detailed modifications.
If needed, the series can be split and/or commmits can be squashed.
Let me know.

Compare to the previous iteration
  https://lore.kernel.org/linux-kernel/20230726150225.483464-1-herve.codina@bootlin.com/
This v3 series mainly:
 - Fixes some implementation details.
 - Adds a new patch (patch 5) to remove existing inline keyword in the
   QMC driver.
 - Squashes patches related to the QMC HDLC binding together.

Best regards,
Hervé

[1]: https://lore.kernel.org/all/20230417171601.74656-1-herve.codina@bootlin.com/
[2]: https://lore.kernel.org/all/20230323103154.264546-1-herve.codina@bootlin.com/

Changes v2 -> v3

  - Patches 1, 2, 3, 4
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - New patch
    Remove inline keyword from the existing registers accessors helpers

  - Patch 6 (patches 5, 27 in v2)
    Update the binding title
    Squash patch 27

  - Patch 7 (patch 6 in v2)
    Remove the cast in netdev_to_qmc_hdlc()
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 8 (patch 7 in v2): No change

  - Patches 9, 10 (patches 8, 9 in v2)
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 11 (patch 10 in v2)
    Remove inline keyword from the introduced qmc_clrsetbits16() helper
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patches 12, 13, 14, 15, 16, 17, 18, 19, 20
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 21 (patch 20 in v2)
    Remove unneeded framer NULL pointer check
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 22 (patch 21 in v2)
    Change sclkr and sclkx clocks description
    Remove the framer phandle property from the framer subnodes
    (ie. from framer-codec nodes)

  - Patch 23 (patch 22 in v2)
    Initialize 'disabled' variable at declaration
    Fix commit log
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 24 (patch 23 in v2)
    Remove inline keyword from the existing registers accessors helpers
    Use dev_warn_ratelimited() in default interrupt handler
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 25 (patch 24 in v2)
    Replace #include "linux/bitfield.h" by #include <linux/bitfield.h>
    Fold the pinctrl anonymous struct into the struct pef2256_pinctrl
    Update commit log
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 26 (patch 25 in v2)
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 27 (patch 26 in v2)
    Fix error message
    Changed the ch.max computation in framer_dai_hw_rule_channels_by_format()
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

  - Patch 28
    Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'

Changes v1 -> v2
  - Patches 1, 2 (New in v2)
    Fix __iomem addresses declaration

  - Patch 19 (17 in v1)
    Fix a compilation warning

  - Patch 26 (24 in v1)
    Fix a typo in Kconfig file
    Fix issues raised by sparse (make C=1)

Herve Codina (28):
  soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix rx channel reset
  soc: fsl: cpm1: qmc: Extend the API to provide Rx status
  soc: fsl: cpm1: qmc: Remove inline function specifiers
  dt-bindings: net: Add support for QMC HDLC
  net: wan: Add support for QMC HDLC
  MAINTAINERS: Add the Freescale QMC HDLC driver entry
  soc: fsl: cpm1: qmc: Introduce available timeslots masks
  soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
  soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
  soc: fsl: cpm1: qmc: Remove no more needed checks from
    qmc_check_chans()
  soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
  soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
  soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries setup
  soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
  soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and
    stop()
  soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
  soc: fsl: cpm1: qmc: Introduce functions to change timeslots at
    runtime
  wan: qmc_hdlc: Add runtime timeslots changes support
  net: wan: Add framer framework support
  dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
  mfd: core: Ensure disabled devices are skiped without aborting
  net: wan: framer: Add support for the Lantiq PEF2256 framer
  pinctrl: Add support for the Lantic PEF2256 pinmux
  MAINTAINERS: Add the Lantiq PEF2256 driver entry
  ASoC: codecs: Add support for the framer codec
  net: wan: fsl_qmc_hdlc: Add framer support

 .../devicetree/bindings/net/fsl,qmc-hdlc.yaml |  46 +
 .../bindings/net/lantiq,pef2256.yaml          | 219 +++++
 MAINTAINERS                                   |  17 +
 drivers/mfd/mfd-core.c                        |  17 +-
 drivers/net/wan/Kconfig                       |  14 +
 drivers/net/wan/Makefile                      |   3 +
 drivers/net/wan/framer/Kconfig                |  35 +
 drivers/net/wan/framer/Makefile               |   7 +
 drivers/net/wan/framer/framer-core.c          | 886 ++++++++++++++++++
 drivers/net/wan/framer/pef2256/Makefile       |   8 +
 drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
 drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
 drivers/net/wan/fsl_qmc_hdlc.c                | 820 ++++++++++++++++
 drivers/pinctrl/Kconfig                       |  14 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-pef2256-regs.h        |  65 ++
 drivers/pinctrl/pinctrl-pef2256.c             | 308 ++++++
 drivers/soc/fsl/qe/qmc.c                      | 501 ++++++++--
 drivers/soc/fsl/qe/tsa.c                      |  22 +-
 include/linux/framer/framer-provider.h        | 194 ++++
 include/linux/framer/framer.h                 | 199 ++++
 include/linux/framer/pef2256.h                |  31 +
 include/soc/fsl/qe/qmc.h                      |  25 +-
 sound/soc/codecs/Kconfig                      |  15 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/framer-codec.c               | 413 ++++++++
 sound/soc/fsl/fsl_qmc_audio.c                 |   2 +-
 27 files changed, 4872 insertions(+), 122 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/fsl,qmc-hdlc.yaml
 create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
 create mode 100644 drivers/net/wan/framer/Kconfig
 create mode 100644 drivers/net/wan/framer/Makefile
 create mode 100644 drivers/net/wan/framer/framer-core.c
 create mode 100644 drivers/net/wan/framer/pef2256/Makefile
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256-regs.h
 create mode 100644 drivers/net/wan/framer/pef2256/pef2256.c
 create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c
 create mode 100644 drivers/pinctrl/pinctrl-pef2256-regs.h
 create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
 create mode 100644 include/linux/framer/framer-provider.h
 create mode 100644 include/linux/framer/framer.h
 create mode 100644 include/linux/framer/pef2256.h
 create mode 100644 sound/soc/codecs/framer-codec.c

-- 
2.41.0

