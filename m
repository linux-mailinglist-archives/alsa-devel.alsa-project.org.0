Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1499741E02
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 04:11:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4298B7F4;
	Thu, 29 Jun 2023 04:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4298B7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688004719;
	bh=SWJzNxXHnpHMr3bubGPKSzyKDtFHo0s14dihzyxOMa4=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NmDz0tZlPXCX1ec3M1Ly/PusDELT/beK9QB74uvTs7lyjZam+RfkrbyuwECXcSavo
	 m0rweFE6wcFQT884M9t+5a24iEvmOQHQ5MwzLOb6EvRuURWol/9iZibrylAT+OgBll
	 V0DzJ0wHM6sLA8+8VEqXz4ZGfaFXy3dbgO6cX0X4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 54DA5F80557; Thu, 29 Jun 2023 04:10:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0184F80535;
	Thu, 29 Jun 2023 04:10:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 443BDF8053B; Thu, 29 Jun 2023 04:10:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2420AF80093
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 04:10:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2420AF80093
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 75EE61A0D8D;
	Thu, 29 Jun 2023 04:10:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E24D1A0D8C;
	Thu, 29 Jun 2023 04:10:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 7BE20181D0E5;
	Thu, 29 Jun 2023 10:10:30 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: tfiga@chromium.org,
	m.szyprowski@samsung.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/6] Add audio support in v4l2 framework
Date: Thu, 29 Jun 2023 09:37:47 +0800
Message-Id: <1688002673-28493-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: GHZMHP5F3T7XZIOJP4MS4UFX37W2IDRD
X-Message-ID-Hash: GHZMHP5F3T7XZIOJP4MS4UFX37W2IDRD
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHZMHP5F3T7XZIOJP4MS4UFX37W2IDRD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio signal processing has the requirement for memory to
memory similar as Video.

This patch is to add this support in v4l2 framework, defined
new buffer type V4L2_BUF_TYPE_AUDIO_CAPTURE and
V4L2_BUF_TYPE_AUDIO_OUTPUT, defined new format v4l2_audio_format
for audio case usage.

The created audio device is named "/dev/audioX".

And add memory to memory support for two kinds of i.MX ASRC
module


Shengjiu Wang (6):
  media: v4l2: Add audio capture and output support
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc: Add memory to memory driver
  ASoC: fsl_asrc: enable memory to memory function
  ASoC: fsl_easrc: enable memory to memory function

 .../media/common/videobuf2/videobuf2-v4l2.c   |   4 +
 drivers/media/v4l2-core/v4l2-dev.c            |  17 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |  52 ++
 include/media/v4l2-dev.h                      |   2 +
 include/media/v4l2-ioctl.h                    |  34 +
 include/uapi/linux/videodev2.h                |  19 +
 sound/soc/fsl/Kconfig                         |  13 +
 sound/soc/fsl/Makefile                        |   2 +
 sound/soc/fsl/fsl_asrc.c                      | 175 +++-
 sound/soc/fsl/fsl_asrc.h                      |   2 +
 sound/soc/fsl/fsl_asrc_common.h               |  54 ++
 sound/soc/fsl/fsl_asrc_m2m.c                  | 878 ++++++++++++++++++
 sound/soc/fsl/fsl_asrc_m2m.h                  |  48 +
 sound/soc/fsl/fsl_easrc.c                     | 255 ++++-
 sound/soc/fsl/fsl_easrc.h                     |   6 +
 15 files changed, 1557 insertions(+), 4 deletions(-)
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.c
 create mode 100644 sound/soc/fsl/fsl_asrc_m2m.h

-- 
2.34.1

