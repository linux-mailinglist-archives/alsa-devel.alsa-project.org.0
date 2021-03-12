Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B623433842D
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 03:55:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B52F16F6;
	Fri, 12 Mar 2021 03:55:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B52F16F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615517755;
	bh=Urmr8oCMNFQz2cCT5Y8QdjV8knXo9IbGM2hxM+4Vhzk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Ykhe4C+5agu12+srbdAy1yUZfKjjooubk3hQXYyUJZt6eNY0fLV4zrEUsgZZ402GP
	 OHfdkuyPlx8eNnBX37KV9Xh2EY8qpz7Pfqayhy0+yz5sAixR2h8aOpYdchb4wDcev+
	 Et7UcSDkIS2TjtU3FdunfgOqrGKNwevqc1rK0YR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33C2F802E7;
	Fri, 12 Mar 2021 03:54:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6068F801ED; Fri, 12 Mar 2021 03:54:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF922F8012A
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 03:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF922F8012A
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 067671A04F4;
 Fri, 12 Mar 2021 03:53:59 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4B75D1A04A3;
 Fri, 12 Mar 2021 03:53:52 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 754AC402A7;
 Fri, 12 Mar 2021 03:53:43 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5 0/6] Add audio driver base on rpmsg on i.MX platform
Date: Fri, 12 Mar 2021 10:38:39 +0800
Message-Id: <1615516725-4975-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

On Asymmetric multiprocessor, there is Cortex-A core and Cortex-M core,
Linux is running on A core, RTOS is running on M core.
The audio hardware device can be controlled by Cortex-M device,
So audio playback/capture can be handled by M core.

Rpmsg is the interface for sending and receiving msg to and from M
core, that we can create a virtual sound on Cortex-A core side.

A core will tell the Cortex-M core sound format/rate/channel,
where is the data buffer, what is the period size, when to start,
when to stop and when suspend or resume happen, each of this behavior
there is defined rpmsg command.

Especially we designed the low power audio case, that is to
allocate a large buffer and fill the data, then Cortex-A core can go
to sleep mode, Cortex-M core continue to play the sound, when the
buffer is consumed, Cortex-M core will trigger the Cortex-A core to
wakeup to fill data.

changes in v5:
- remove unneeded property in binding doc and driver
- update binding doc according to Rob's comments.
- Fix link issue reported by kernel test robot

changes in v4:
- remove the sound card node, merge the property to cpu dai node
  according to Rob's comments.
- sound card device will be registered by cpu dai driver.
- Fix do_div issue reported by kernel test robot

changes in v3:
- add local refcount for clk enablement in hw_params()
- update the document according Rob's comments

changes in v2:
- update codes and comments according to Mark's comments

Shengjiu Wang (6):
  ASoC: soc-component: Add snd_soc_pcm_component_ack
  ASoC: fsl_rpmsg: Add CPU DAI driver for audio base on rpmsg
  ASoC: dt-bindings: fsl_rpmsg: Add binding doc for rpmsg audio device
  ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio channel
  ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg
  ASoC: imx-rpmsg: Add machine driver for audio base on rpmsg

 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 108 +++
 include/sound/soc-component.h                 |   3 +
 sound/soc/fsl/Kconfig                         |  30 +
 sound/soc/fsl/Makefile                        |   6 +
 sound/soc/fsl/fsl_rpmsg.c                     | 279 ++++++
 sound/soc/fsl/fsl_rpmsg.h                     |  35 +
 sound/soc/fsl/imx-audio-rpmsg.c               | 140 +++
 sound/soc/fsl/imx-pcm-rpmsg.c                 | 918 ++++++++++++++++++
 sound/soc/fsl/imx-pcm-rpmsg.h                 | 512 ++++++++++
 sound/soc/fsl/imx-rpmsg.c                     | 150 +++
 sound/soc/soc-component.c                     |  14 +
 sound/soc/soc-pcm.c                           |   2 +
 12 files changed, 2197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
 create mode 100644 sound/soc/fsl/fsl_rpmsg.c
 create mode 100644 sound/soc/fsl/fsl_rpmsg.h
 create mode 100644 sound/soc/fsl/imx-audio-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.c
 create mode 100644 sound/soc/fsl/imx-pcm-rpmsg.h
 create mode 100644 sound/soc/fsl/imx-rpmsg.c

-- 
2.27.0

