Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECB5660462
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Jan 2023 17:39:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E1E147FC;
	Fri,  6 Jan 2023 17:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E1E147FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673023140;
	bh=hWSgOSBpOgBan4Zg5FaI3QNSq8U/KLj4g3kDjeSzKIg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LNkLlCYJAdULsIKmBcvRurhJz6x4L+KZneitTqY/Ad6hCjF2sUtmWmwU1U9YUciLZ
	 1ccvERIDAqt/FXEtXJSDsdELE6qIHFScFc7jV4pbXQUQgHVuLcCygjDYXZVK62nFb9
	 aT4BtFe+8arg+GhSu+iP78bi7N5JXdSGvqQLlQ1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F3CAF8022B;
	Fri,  6 Jan 2023 17:38:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50412F8024E; Fri,  6 Jan 2023 17:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2BBFF800C0
 for <alsa-devel@alsa-project.org>; Fri,  6 Jan 2023 17:37:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2BBFF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o/IsLhnu
Received: (Authenticated sender: herve.codina@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 1AEA4100007;
 Fri,  6 Jan 2023 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1673023073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=wOlG0UFgwPyHibvWeKLz0mSVirAtrO9tROfk5VrpIi4=;
 b=o/IsLhnuzz4J7IXPyjgToH+TVV87KVOB9oVq/yOCwg8YQW/N5lo2nZPqNeEicVLH0eMV1H
 zDq1AKJXZyuesBSs/CeLdn9l6y4NTl8zMsqTQFxlkF7aP5Xuj1hZGDlBE2WYInDaNd7ylw
 31VZif0xxfQ/QADxsHUYFm+ayTZT7/cuVvR/+DFAfdvcHTuqETOo+iQzS0ioTKW8ZxrQbf
 SPllV1GWfvc1WxlkCgbPXonrIxWainYN2NsgiomhU6lxG/keik6Qss6p8PJj8BScMAV6bF
 pN19xO8A/S3ipyUnT33HEnWuWIraQAskoJx1KhsbUgsy50c3MGjQP3XPRlehIg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>, Li Yang <leoyang.li@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Qiang Zhao <qiang.zhao@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v2 00/10] Add the PowerQUICC audio support using the QMC
Date: Fri,  6 Jan 2023 17:37:36 +0100
Message-Id: <20230106163746.439717-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

This series adds support for audio using the QMC controller
available in some Freescale PowerQUICC SoCs.

This series contains three parts in order to show the different
blocks hierarchy and their usage in this support.

The first one is related to TSA (Time Slot Assigner).
The TSA handles the data present at the pin level (TDM with up
to 64 time slots) and dispatchs them to one or more serial
controller (SCC).

The second is related to QMC (QUICC Multichannel Controller).
The QMC handles the data at the serial controller (SCC) level
and splits again the data to creates some virtual channels.

The last one is related to the audio component (QMC audio).
It is the glue between the QMC controller and the ASoC
component. It handles one or more QMC virtual channels and
creates one DAI per QMC virtual channels handled.

Compared to the v1 series, this v2 series fixes errors raised
by the test kernel robot.

Best regards,
Herve Codina

Changes v1 -> v2:
  - patch 2 and 6
    Fix kernel test robot errors

  - other patches
    No changes

Herve Codina (10):
  dt-bindings: soc: fsl: cpm_qe: Add TSA controller
  soc: fsl: qe: Add support for TSA
  MAINTAINERS: add the Freescale TSA controller entry
  powerpc/8xx: Use a larger CPM1 command check mask
  dt-bindings: soc: fsl: cpm_qe: Add QMC controller
  soc: fsl: qe: Add support for QMC
  MAINTAINERS: add the Freescale QMC controller entry
  dt-bindings: sound: Add support for QMC audio
  ASoC: fsl: Add support for QMC audio
  MAINTAINERS: add the Freescale QMC audio entry

 .../bindings/soc/fsl/cpm_qe/fsl,qmc.yaml      |  167 ++
 .../bindings/soc/fsl/cpm_qe/fsl,tsa.yaml      |  262 +++
 .../bindings/sound/fsl,qmc-audio.yaml         |  110 ++
 MAINTAINERS                                   |   25 +
 arch/powerpc/platforms/8xx/cpm1.c             |    2 +-
 drivers/soc/fsl/qe/Kconfig                    |   23 +
 drivers/soc/fsl/qe/Makefile                   |    2 +
 drivers/soc/fsl/qe/qmc.c                      | 1493 +++++++++++++++++
 drivers/soc/fsl/qe/tsa.c                      |  783 +++++++++
 drivers/soc/fsl/qe/tsa.h                      |   43 +
 include/dt-bindings/soc/fsl-tsa.h             |   15 +
 include/soc/fsl/qe/qmc.h                      |   71 +
 sound/soc/fsl/Kconfig                         |    9 +
 sound/soc/fsl/Makefile                        |    2 +
 sound/soc/fsl/fsl_qmc_audio.c                 |  731 ++++++++
 15 files changed, 3737 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qmc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,tsa.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
 create mode 100644 drivers/soc/fsl/qe/qmc.c
 create mode 100644 drivers/soc/fsl/qe/tsa.c
 create mode 100644 drivers/soc/fsl/qe/tsa.h
 create mode 100644 include/dt-bindings/soc/fsl-tsa.h
 create mode 100644 include/soc/fsl/qe/qmc.h
 create mode 100644 sound/soc/fsl/fsl_qmc_audio.c

-- 
2.38.1

