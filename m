Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868A7FBC3D
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Nov 2023 15:09:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B21A7F8;
	Tue, 28 Nov 2023 15:08:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B21A7F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701180547;
	bh=JDEyEmvRW33gN/aJKJgnPsD9T7q8x/i0YZcYh0sLiRA=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fBdjAii3JzwKvY0sH8GCyevppMl7Afd8rFAd5yZMymPes7Ymh1ApbDmMvLqH6RyZV
	 MUguYeIcxFf7Tz+STYhJGbJWYAtYAYV9cWNCgje0QQ68ukKip8yRQm00L1JIP9+IiZ
	 UDXV/fR9csfOMFRX49e3jGWLjVclgq2nrFUSMINY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22DC1F80580; Tue, 28 Nov 2023 15:08:33 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 274B8F80579;
	Tue, 28 Nov 2023 15:08:33 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B301F80254; Tue, 28 Nov 2023 15:08:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B6B15F80114
	for <alsa-devel@alsa-project.org>; Tue, 28 Nov 2023 15:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6B15F80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PDZiuP0i
Received: by mail.gandi.net (Postfix) with ESMTPA id 7055560008;
	Tue, 28 Nov 2023 14:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=i7q8w6Mxbljh5af2HafEdvKbBOFPqmcN00tNKcl/Whw=;
	b=PDZiuP0iwt4HL5jAwOQe9/6sbhDuSvjOtiIVK89XjGPO9jvEVdXxLM1wLaXX628wjWek58
	VAuVOZzrZBHvLipMSyQz8uNDHSVCveYdH6w18M65MklIYK7qTRUilNJ8aYB07tFDST4OVf
	FDIZsZyBia9NFT5qbAm1DlknmHUqV8LCWnHAsM3Q+7n9QkmpXWkZhxbkMafTMeUTIp+W87
	h1QUpv4cAasc+n92FMUTw2DAAoNgneH4AQt68WJ84ID0WMQPV8SYGXFZ9FCA89jIKyrLB3
	2nLMEpVVVJOpLQ3GYUO9O0VTqemAY1R0XfuIHmgjLyEb0eN5znOYjUojFdsHLA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 00/17] Prepare the PowerQUICC QMC and TSA for the HDLC QMC
 driver
Date: Tue, 28 Nov 2023 15:07:59 +0100
Message-ID: <20231128140818.261541-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: 75N3I6IYCBM55TE22L5KYK2MNJVMJ2FZ
X-Message-ID-Hash: 75N3I6IYCBM55TE22L5KYK2MNJVMJ2FZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/75N3I6IYCBM55TE22L5KYK2MNJVMJ2FZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

This series updates PowerQUICC QMC and TSA drivers to prepare the
support for the QMC HDLC driver.

Patches were previously sent as part of a full feature series:
"Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]

The full feature series reached the v9 iteration.
The v1 was sent the 07/25/2023 followed by the other iterations
(07/26/2023, 08/09/2023, 08/18/2023, 09/12/2023, 09/22/2023, 09/28/2023,
10/11/23, 11/15/2023) and was ready to be merged in its v8.
  https://lore.kernel.org/linux-kernel/20231025123215.5caca7d4@kernel.org/

The lack of feedback from the Freescale SoC and the Quicc Engine
maintainers (i.e. drivers/soc/fsl/qe/ to which the QMC and TSA drivers
belong) blocks the entire full feature series.
These patches are fixes and improvements to TSA and QMC drivers.
These drivers were previously acked by Li Yang but without any feedback
from Li Yang nor Qiang Zhao the series cannot move forward.

In order to ease the review/merge, the full feature series has been
split and this series contains patches related to the PowerQUICC SoC
part (QMC and TSA).
 - Perform some fixes (patches 1 to 5)
 - Add support for child devices (patch 6)
 - Add QMC dynamic timeslot support (patches 7 to 17)

>From the original full feature series, a patches extraction without any
modification was done.

Best regards,
Hervé

[1]: https://lore.kernel.org/linux-kernel/20231115144007.478111-1-herve.codina@bootlin.com/

Patches extracted:
  - Patch 1..6 : full feature series patch 1..6
  - Patch 7..17 : full feature series patch 9..19

Herve Codina (17):
  soc: fsl: cpm1: tsa: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix __iomem addresses declaration
  soc: fsl: cpm1: qmc: Fix rx channel reset
  soc: fsl: cpm1: qmc: Extend the API to provide Rx status
  soc: fsl: cpm1: qmc: Remove inline function specifiers
  soc: fsl: cpm1: qmc: Add support for child devices
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

 drivers/soc/fsl/qe/qmc.c      | 592 +++++++++++++++++++++++++++-------
 drivers/soc/fsl/qe/tsa.c      |  22 +-
 include/soc/fsl/qe/qmc.h      |  27 +-
 sound/soc/fsl/fsl_qmc_audio.c |   2 +-
 4 files changed, 506 insertions(+), 137 deletions(-)

-- 
2.42.0

