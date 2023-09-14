Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8B279FC13
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 08:34:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDF5A886;
	Thu, 14 Sep 2023 08:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDF5A886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694673277;
	bh=Xf9w9+pCbZU4uXTQbZmMSQnSgDzhBDcLmgnTsSiBRE4=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JP/K7oH/PLXodzzpBlMh/hddLZFmuZO0Zt02vFt4bh2C4nJHbFzmB9kflguFkXtlI
	 ua1MoMzHWkXOqc4tBY0w1Be5pQl7MOy6GqDtPwqphNKIvCGa2TdtbFDcZqnNWbpGqN
	 d7ArXh5J5h7Oa0+KTScmJIZkXzmFrQ0Km4sIzv64=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD15F80537; Thu, 14 Sep 2023 08:33:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3CB6F80212;
	Thu, 14 Sep 2023 08:33:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34818F8055B; Thu, 14 Sep 2023 08:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C978F80212
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 08:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C978F80212
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A8EA11A0638;
	Thu, 14 Sep 2023 08:30:39 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 45DC31A062C;
	Thu, 14 Sep 2023 08:30:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5F6141834869;
	Thu, 14 Sep 2023 14:30:37 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: hverkuil@xs4all.nl,
	sakari.ailus@iki.fi,
	tfiga@chromium.org,
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
Subject: [RFC PATCH v3 0/9] Add audio support in v4l2 framework
Date: Thu, 14 Sep 2023 13:53:56 +0800
Message-Id: <1694670845-17070-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: A7TY5G7BQPNSMKK3TI7KWVT5CF7ALSYV
X-Message-ID-Hash: A7TY5G7BQPNSMKK3TI7KWVT5CF7ALSYV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A7TY5G7BQPNSMKK3TI7KWVT5CF7ALSYV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Audio signal processing also has the requirement for memory to
memory similar as Video.

This asrc memory to memory (memory ->asrc->memory) case is a non
real time use case.

User fills the input buffer to the asrc module, after conversion, then asrc
sends back the output buffer to user. So it is not a traditional ALSA playback
and capture case.

It is a specific use case,  there is no reference in current kernel.
v4l2 memory to memory is the closed implementation,  v4l2 current
support video, image, radio, tuner, touch devices, so it is not
complicated to add support for this specific audio case.

Because we had implemented the "memory -> asrc ->i2s device-> codec"
use case in ALSA.  Now the "memory->asrc->memory" needs
to reuse the code in asrc driver, so the first 3 patches is for refining
the code to make it can be shared by the "memory->asrc->memory"
driver.

The main change is in the v4l2 side, A /dev/vl4-audioX will be created,
user applications only use the ioctl of v4l2 framework.

Other change is to add memory to memory support for two kinds of i.MX ASRC
module.

changes in v3:
- Modify documents for adding audio m2m support
- Add audio virtual m2m driver
- Defined V4L2_AUDIO_FMT_LPCM format type for audio.
- Defined V4L2_CAP_AUDIO_M2M capability type for audio m2m case.
- with modification in v4l-utils, pass v4l2-compliance test.

changes in v2:
- decouple the implementation in v4l2 and ALSA
- implement the memory to memory driver as a platfrom driver
  and move it to driver/media
- move fsl_asrc_common.h to include/sound folder

Shengjiu Wang (9):
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device
  media: v4l2: Add audio capture and output support
  media: uapi: Add V4L2_CID_USER_IMX_ASRC_RATIO_MOD control
  media: audm2m: add virtual driver for audio memory to memory
  media: imx-asrc: Add memory to memory driver

 .../userspace-api/media/v4l/audio-formats.rst |   15 +
 .../userspace-api/media/v4l/buffer.rst        |    6 +
 .../userspace-api/media/v4l/control.rst       |    5 +
 .../userspace-api/media/v4l/dev-audio.rst     |   63 +
 .../userspace-api/media/v4l/devices.rst       |    1 +
 .../media/v4l/pixfmt-aud-lpcm.rst             |   31 +
 .../userspace-api/media/v4l/pixfmt.rst        |    1 +
 .../media/v4l/vidioc-enum-fmt.rst             |    2 +
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
 .../media/v4l/vidioc-querycap.rst             |    3 +
 .../media/videodev2.h.rst.exceptions          |    2 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
 drivers/media/platform/nxp/Kconfig            |   12 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx-asrc.c         | 1058 +++++++++++++++++
 drivers/media/test-drivers/Kconfig            |    9 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/audm2m.c           |  767 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |    1 +
 drivers/media/v4l2-core/v4l2-dev.c            |   17 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   53 +
 include/media/v4l2-dev.h                      |    2 +
 include/media/v4l2-ioctl.h                    |   34 +
 .../fsl => include/sound}/fsl_asrc_common.h   |   54 +
 include/uapi/linux/v4l2-controls.h            |    1 +
 include/uapi/linux/videodev2.h                |   25 +
 sound/soc/fsl/fsl_asrc.c                      |  162 +++
 sound/soc/fsl/fsl_asrc.h                      |    4 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
 sound/soc/fsl/fsl_easrc.c                     |  239 ++++
 sound/soc/fsl/fsl_easrc.h                     |    8 +-
 31 files changed, 2584 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/audio-formats.rst
 create mode 100644 Documentation/userspace-api/media/v4l/dev-audio.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-aud-lpcm.rst
 create mode 100644 drivers/media/platform/nxp/imx-asrc.c
 create mode 100644 drivers/media/test-drivers/audm2m.c
 rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)

-- 
2.34.1

