Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E71357F5BC4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 10:57:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 674BBDF6;
	Thu, 23 Nov 2023 10:57:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 674BBDF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700733436;
	bh=c/E0Qa7E8G+LfMJZ/HHiy+vIMgF7AnQYc32VYJ8kfls=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CH+Jf3DN4/x3K1B8R/UYA5qLgWdeJrBK4aywscy84433JQh0KPUazbsktkq066uYx
	 vfA6M/pAy3ZT/vPypjNj28k2ueQWEGPs9N4Tgvn5ZRLDsvIw0Npm6zW/BdDxGTuD5x
	 Ukt4Ucj4zy2Geaur4ePEHgI/sbdIYzy8yFYAHgGw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8ED0F80567; Thu, 23 Nov 2023 10:56:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A396AF80570;
	Thu, 23 Nov 2023 10:56:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3D09F802E8; Thu, 23 Nov 2023 10:56:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4FD0FF80249
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 10:56:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FD0FF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m3KZAOdP
Received: by mail.gandi.net (Postfix) with ESMTPSA id 78824C0007;
	Thu, 23 Nov 2023 09:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700733387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GU8Gw1SmMIgiO+M24mi6HQAA6719PUVcAqYOHoNvvWM=;
	b=m3KZAOdPXOgv5o3913EaX280yQcEpQ8qx8PFMHDAEWILDJsPNW0FZN1QqAfBtzSQEZhJN7
	qNsK+rbbv0hqOyjCxMpOuHvnWN6u8TbIr/G6Lam/1+HCgP4VaQNTqdKWtsnM0/uC7xF/TH
	NmLUR1V/Jx4STlCnkmM2nBdsZtyjleG1qWjM6X0MYHd7Fr6tQLoxvwAVIJya0eeoeR7Lls
	rEzx6yqtkOLFDf+x4dScPQGefPV2jTnZenX4FExWHZX8QGSJopwcIPvInt2DwrYUDc5dFP
	bH7ePz0nzCeZnYfcNwYuxWwVri4wMYRzMbLko+2Nh354WGgAvBISYEZDUVFpEQ==
Date: Thu, 23 Nov 2023 10:56:22 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Qiang
 Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang
 <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam
 <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Simon Horman <horms@kernel.org>, Christophe
 JAILLET <christophe.jaillet@wanadoo.fr>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v9 00/27] Add support for QMC HDLC, framer
 infrastructure and PEF2256 framer
Message-ID: <20231123105622.6a09b58d@bootlin.com>
In-Reply-To: <20231115144007.478111-1-herve.codina@bootlin.com>
References: <20231115144007.478111-1-herve.codina@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: T42ODFQIZ5FDKTCMBUMCATP6BJGMCH2H
X-Message-ID-Hash: T42ODFQIZ5FDKTCMBUMCATP6BJGMCH2H
X-MailFrom: herve.codina@bootlin.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T42ODFQIZ5FDKTCMBUMCATP6BJGMCH2H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Li, Qiang,

This series is waiting for some feedback from your side in order to be merged.
This block the entire series.

The patches related to the PowerPC QUICC ENGINE QMC and TSA are:
- patches 1 to 6
- patches 9 to 19

The patch 7 is a HDLC driver that uses the QMC and the patch 20 improves this
HDLC driver.

Can you provide some review on these patches ?
Further more, do you mind if this series and so patches related to QMC and TSA
are merged on a net branch ?

Best regards,
Hervé

On Wed, 15 Nov 2023 15:39:36 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> I have a system where I need to handle an HDLC interface and some audio
> data.
> 
> The HDLC data are transferred using a TDM bus on which a PEF2256
> (E1/T1 framer) is present. The PEF2256 transfers data from/to the TDM
> bus to/from the E1 line. This PEF2256 is connected to a PowerQUICC SoC
> for the control path and the TDM is connected to the SoC (QMC component)
> for the data path.
> 
> From the QMC HDLC driver, I need to handle HDLC data using the QMC,
> carrier detection using the PEF2256 (E1 line carrier) and set/get some
> PEF2256 configuration.
> 
> The QMC HDLC driver considers the PEF2256 as a generic framer.
> It performs operations that involve the PEF2256 through the generic
> framer API.
> 
> The audio data are exchanged with the PEF2256 using a CPU DAI connected
> to the TDM bus through the QMC and the PEF2256 needs to be seen as a
> codec in order to be linked to the CPU DAI.
> The codec handles the carrier detection using the PEF2256 and reports
> the carrier state to the ALSA subsystem using the ASoC jack detection.
> 
> The codec, even if instantiated by the PEF2256 driver, considers the
> PEF2256 as a generic framer.
> 
> The generic framer has:
>  - 2 consumers (QMC HDLC drv and codec)
>  - 1 provider (PEF2256)
> 
> So, the design is the following:
>                         +------------------+           +---------+
>                         | QMC              | <- TDM -> | PEF2256 | <-> E1
>      +---------+        |  +-------------+ |           |         |
>      | CPU DAI | <-data--> | QMC channel | |           |         |
>      +---------+        |  +-------------+ |           |         |
> +--------------+        |  +-------------+ |           |         |
> | QMC HDLC drv | <-data--> | QMC channel | |           |         |
> +--------------+        |  +-------------+ |           |         |
>      ^                  +------------------+           |         |
>      |   +--------+     +-------------+                |         |
>      +-> | framer | <-> | PEF2256 drv | <- local bus ->|         |
>          |        |     |             |                +---------+
>      +-> |        |     |             |
>      |   +--------+     |  +-------+  |
>      +-------------------> | codec |  |
>                         |  +-------+  |
>                         +-------------+
> 
> Further more, the TDM timeslots used by the QMC HDLC driver need to be
> configured at runtime (QMC dynamic timeslots).
> 
> Several weeks ago, I sent two series related to this topic:
>  - Add the Lantiq PEF2256 audio support [1]
>  - RFC Add support for QMC HDLC and PHY [2]
> This current series is a rework of these two series taking into account
> feedbacks previously received.
> 
> In order to implement all of this, I do the following:
>  1) Perform some fixes (patches 1, 2, 3, 4, 5 )
>  2) Introduce the QMC HDLC driver (patches 6, 7, 8)
>  3) Add QMC dynamic timeslot support (patches 9 - 19)
>  4) Add timeslots change support in QMC HDLC (patch 20)
>  5) Introduce framer infrastructure (patch 21)
>  6) Add PEF2256 framer provider (patches 22, 23, 24, 25)
>  7) Add framer codec as a framer consumer (patch 26)
>  8) Add framer support as a framer consumer in QMC HDLC (patch 27)
> 
> The series contains the full story and detailed modifications.
> If needed, the series can be split and/or commits can be squashed.
> Let me know.
> 
> Compare to the previous iteration
>   https://lore.kernel.org/linux-kernel/20231011061437.64213-1-herve.codina@bootlin.com/
> This v9 series:
>  - Removes some patches already applied
>  - Adds some 'Acked-by' tags
> 
> Best regards,
> Hervé
> 
> [1]: https://lore.kernel.org/all/20230417171601.74656-1-herve.codina@bootlin.com/
> [2]: https://lore.kernel.org/all/20230323103154.264546-1-herve.codina@bootlin.com/
> 
> Changes v8 -> v9
> 
>    - Removed Patches 6, 7 and 8 (patches applied)
> 
>    - Patches 7, 20, 21, 23 (patches 10, 23, 24, 26 in v8)
>      Add 'Acked-by: Jakub Kicinski <kuba@kernel.org>'
> 
> Changes v7 -> v8
> 
>   - Patch 10
>     Fix a race condition when stopping the queue in qmc_hdlc_close()
> 
>   - Patch 24
>     Move to menuconfig and hide CONFIG_GENERIC_FRAMER
>     Remove unneeded check (defensive programming)
>     Remove unneeded variable assignment
> 
>   - Patch 25
>     Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
> 
>   - Patch 26
>     Use array notation for 'audio_devs'
> 
> Changes v6 -> v7
> 
>   - Patch 8
>     Move the 'compatible' property to the first property.
>     Add device/SoC specific compatible strings.
>     Add 'Reviewed-by: Rob Herring <robh@kernel.org>'
> 
>   - Patch 25
>     Remove '$ref' from the lantiq,data-rate-bps property. '-bps' is now
>     a standard suffix.
> 
> Changes v5 -> v6
> 
>   - All patches
>     Remove 'Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
>     These Sob were added by Christophe when he sent the v4 while I was
>     on vacation.
>     https://lore.kernel.org/linux-kernel/992a2b31-e21f-eee3-8bfc-a65b69fe5bd7@csgroup.eu/
> 
>   - Patch 6, 7
>     Add 'Acked-by: Conor Dooley <conor.dooley@microchip.com>'
>     Add 'Acked-by: Rob Herring <robh@kernel.org>'
> 
>   - Patch 8
>     Add a constraint on fsl,framer.
> 
>   - Patch 25
>     Fix clocks description (inconsistent capitalisation)
>     Use '8-bit' instead of '8bit'
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Removed patch 26 (patch applied)
> 
>   - Patch 26 (patch 27 in v5)
>     Add 'Reviewed-by: Linus Walleij <linus.walleij@linaro.org>'
> 
>   - Patch 27 (patch 28 in v5)
>     Move registers definition to .c file and remove .h file
>     Add 'select PINCONF' in Kconfig
>     Use dev_err_probe()
>     Add 'Reviewed-by: Linus Walleij <linus.walleij@linaro.org>'
> 
>   - Patch 28 (patch 29 in v5)
>     Remove .h file
> 
> Changes v4 -> v5
> 
>   - Patches 1 to 5
>     No changes
> 
>   - Patch 6 (new in v5)
>     Fix QMC binding example
> 
>   - Patch 7 (new in v5)
>     Add missing 'additionalProperties: false'
> 
>   - Patch 8 (new in v5, replace v4 patch 6)
>     Add QMC HDLC properties in the QMC channel node
>     Renamed the 'framer' property to 'fsl,framer'
> 
>   - Patch 9 (new in v5)
>     Add support for QMC child devices
> 
>   - Patch 10 (patch 7 in v4)
>     No changes
> 
>   - Patch 11 (patch 8 in v4)
>     Remove fsl,qmc-hdlc.yaml (no more existing file)
> 
>   - Patches 12 to 22 (patches 9 to 19 in v4)
>     No changes
> 
>   - Patch 23 (patch 20 in v4)
>     Remove unused variable initializations
>     Remove extra space
> 
>   - Patch 24 (patch 21 in v4)
>     Improve Kconfig help text
>     Fix variable declaration (reverse xmas tree)
>     Fix typos and extra spaces
>     Fix documentation issues raised by 'kernel-doc -none'
>     Move of_node_put() and kfree() out of the mutex
>     Replace ida_simple_{get,remove}() by ida_{alloc,free}()
>     Support framer device-tree nodes without '#framer-cells' property
> 
>   - Patch 25 (patch 22 in v4)
>     Fix $ref in the pinctrl subnode
>     Remove '#framer-cells' property
>     Add needed '|'
> 
>   - Patch 26 (patch 23 in v4)
>     Fix a typo in the commit subject
> 
>   - Patches 27, 28, 29 (patch 24, 25, 26 in v4)
>     No changes
> 
>   - Patch 30 (patch 27 in v4)
>     Fix a typo in the commit log
> 
>   - Patch 31 (patch 28 in v4)
>     Used 'fsl,framer' property name instead of 'framer'
> 
> Changes v3 -> v4
> 
>   - Patch 21
>     Fixes build failure with CONFIG_MODULES
> 
> Changes v2 -> v3
> 
>   - Patches 1, 2, 3, 4
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - New patch
>     Remove inline keyword from the existing registers accessors helpers
> 
>   - Patch 6 (patches 5, 27 in v2)
>     Update the binding title
>     Squash patch 27
> 
>   - Patch 7 (patch 6 in v2)
>     Remove the cast in netdev_to_qmc_hdlc()
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 8 (patch 7 in v2): No change
> 
>   - Patches 9, 10 (patches 8, 9 in v2)
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 11 (patch 10 in v2)
>     Remove inline keyword from the introduced qmc_clrsetbits16() helper
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patches 12, 13, 14, 15, 16, 17, 18, 19, 20
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 21 (patch 20 in v2)
>     Remove unneeded framer NULL pointer check
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 22 (patch 21 in v2)
>     Change sclkr and sclkx clocks description
>     Remove the framer phandle property from the framer subnodes
>     (ie. from framer-codec nodes)
> 
>   - Patch 23 (patch 22 in v2)
>     Initialize 'disabled' variable at declaration
>     Fix commit log
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 24 (patch 23 in v2)
>     Remove inline keyword from the existing registers accessors helpers
>     Use dev_warn_ratelimited() in default interrupt handler
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 25 (patch 24 in v2)
>     Replace #include "linux/bitfield.h" by #include <linux/bitfield.h>
>     Fold the pinctrl anonymous struct into the struct pef2256_pinctrl
>     Update commit log
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 26 (patch 25 in v2)
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 27 (patch 26 in v2)
>     Fix error message
>     Changed the ch.max computation in framer_dai_hw_rule_channels_by_format()
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
>   - Patch 28
>     Add 'Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>'
> 
> Changes v1 -> v2
>   - Patches 1, 2 (New in v2)
>     Fix __iomem addresses declaration
> 
>   - Patch 19 (17 in v1)
>     Fix a compilation warning
> 
>   - Patch 26 (24 in v1)
>     Fix a typo in Kconfig file
>     Fix issues raised by sparse (make C=1)
> 
> Herve Codina (27):
>   soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
>   soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
>   soc: fsl: cpm1: qmc: Fix rx channel reset
>   soc: fsl: cpm1: qmc: Extend the API to provide Rx status
>   soc: fsl: cpm1: qmc: Remove inline function specifiers
>   soc: fsl: cpm1: qmc: Add support for child devices
>   net: wan: Add support for QMC HDLC
>   MAINTAINERS: Add the Freescale QMC HDLC driver entry
>   soc: fsl: cpm1: qmc: Introduce available timeslots masks
>   soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
>   soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
>   soc: fsl: cpm1: qmc: Remove no more needed checks from
>     qmc_check_chans()
>   soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
>   soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
>   soc: fsl: cpm1: qmc: Split Tx and Rx TSA entries setup
>   soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
>   soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and
>     stop()
>   soc: fsl: cpm1: qmc: Remove timeslots handling from setup_chan()
>   soc: fsl: cpm1: qmc: Introduce functions to change timeslots at
>     runtime
>   wan: qmc_hdlc: Add runtime timeslots changes support
>   net: wan: Add framer framework support
>   dt-bindings: net: Add the Lantiq PEF2256 E1/T1/J1 framer
>   net: wan: framer: Add support for the Lantiq PEF2256 framer
>   pinctrl: Add support for the Lantic PEF2256 pinmux
>   MAINTAINERS: Add the Lantiq PEF2256 driver entry
>   ASoC: codecs: Add support for the framer codec
>   net: wan: fsl_qmc_hdlc: Add framer support
> 
>  .../bindings/net/lantiq,pef2256.yaml          | 213 +++++
>  MAINTAINERS                                   |  15 +
>  drivers/net/wan/Kconfig                       |  14 +
>  drivers/net/wan/Makefile                      |   3 +
>  drivers/net/wan/framer/Kconfig                |  41 +
>  drivers/net/wan/framer/Makefile               |   7 +
>  drivers/net/wan/framer/framer-core.c          | 882 ++++++++++++++++++
>  drivers/net/wan/framer/pef2256/Makefile       |   8 +
>  drivers/net/wan/framer/pef2256/pef2256-regs.h | 250 +++++
>  drivers/net/wan/framer/pef2256/pef2256.c      | 880 +++++++++++++++++
>  drivers/net/wan/fsl_qmc_hdlc.c                | 820 ++++++++++++++++
>  drivers/pinctrl/Kconfig                       |  15 +
>  drivers/pinctrl/Makefile                      |   1 +
>  drivers/pinctrl/pinctrl-pef2256.c             | 358 +++++++
>  drivers/soc/fsl/qe/qmc.c                      | 592 +++++++++---
>  drivers/soc/fsl/qe/tsa.c                      |  22 +-
>  include/linux/framer/framer-provider.h        | 194 ++++
>  include/linux/framer/framer.h                 | 205 ++++
>  include/linux/framer/pef2256.h                |  31 +
>  include/soc/fsl/qe/qmc.h                      |  27 +-
>  sound/soc/codecs/Kconfig                      |  15 +
>  sound/soc/codecs/Makefile                     |   2 +
>  sound/soc/codecs/framer-codec.c               | 413 ++++++++
>  sound/soc/fsl/fsl_qmc_audio.c                 |   2 +-
>  24 files changed, 4873 insertions(+), 137 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
>  create mode 100644 drivers/net/wan/framer/Kconfig
>  create mode 100644 drivers/net/wan/framer/Makefile
>  create mode 100644 drivers/net/wan/framer/framer-core.c
>  create mode 100644 drivers/net/wan/framer/pef2256/Makefile
>  create mode 100644 drivers/net/wan/framer/pef2256/pef2256-regs.h
>  create mode 100644 drivers/net/wan/framer/pef2256/pef2256.c
>  create mode 100644 drivers/net/wan/fsl_qmc_hdlc.c
>  create mode 100644 drivers/pinctrl/pinctrl-pef2256.c
>  create mode 100644 include/linux/framer/framer-provider.h
>  create mode 100644 include/linux/framer/framer.h
>  create mode 100644 include/linux/framer/pef2256.h
>  create mode 100644 sound/soc/codecs/framer-codec.c
> 



-- 
Hervé Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
