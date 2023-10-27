Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D57D9637
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Oct 2023 13:15:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20840A4C;
	Fri, 27 Oct 2023 13:14:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20840A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698405336;
	bh=s9HWliWtftg4+bKn+CWaYdfa7oPrVcMgpc7mTziTlBw=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ORPc1BTPOY6poFNk3mNAVLgPJTlKMNDRRJfgsC9aHuphZT6WasJo3fFZpJo1I/8fO
	 sQOrfSOcE+n0ilgFHAXn+zgKz64EOJiXROO+Ltr81Yj4LYb4APA1cCs3EDbLzg4Zi8
	 g0O1PosuKz97e3rvLbhjyqzz8WNdA/oYF5mmpWPY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C492F80568; Fri, 27 Oct 2023 13:14:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E263CF80557;
	Fri, 27 Oct 2023 13:14:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 006B5F8028D; Fri, 27 Oct 2023 13:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71680F8010B
	for <alsa-devel@alsa-project.org>; Fri, 27 Oct 2023 13:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71680F8010B
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id B1BA91A0967;
	Fri, 27 Oct 2023 13:14:32 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 277F81A0791;
	Fri, 27 Oct 2023 13:14:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id ED07B180031E;
	Fri, 27 Oct 2023 19:14:29 +0800 (+08)
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
Subject: [RFC PATCH v8 00/13] Add audio support in v4l2 framework
Date: Fri, 27 Oct 2023 18:35:35 +0800
Message-Id: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: BJ45YSCH7TMTAWGRYPEKNGAZ3ZFAF33E
X-Message-ID-Hash: BJ45YSCH7TMTAWGRYPEKNGAZ3ZFAF33E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJ45YSCH7TMTAWGRYPEKNGAZ3ZFAF33E/>
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

changes in v8:
- refine V4L2_CAP_AUDIO_M2M to be 0x00000008
- update doc for FIXED_POINT
- address comments for imx-asrc

changes in v7:
- add acked-by from Mark
- separate commit for fixed point, m2m audio class, audio rate controls
- use INTEGER_MENU for rate,  FIXED_POINT for rate offset
- remove used fmts
- address other comments for Hans

changes in v6:
- use m2m_prepare/m2m_unprepare/m2m_start/m2m_stop to replace
  m2m_start_part_one/m2m_stop_part_one, m2m_start_part_two/m2m_stop_part_two.
- change V4L2_CTRL_TYPE_ASRC_RATE to V4L2_CTRL_TYPE_FIXED_POINT
- fix warning by kernel test rebot
- remove some unused format V4L2_AUDIO_FMT_XX
- Get SNDRV_PCM_FORMAT from V4L2_AUDIO_FMT in driver.
- rename audm2m to viaudm2m.

changes in v5:
- remove V4L2_AUDIO_FMT_LPCM
- define audio pixel format like V4L2_AUDIO_FMT_S8...
- remove rate and format in struct v4l2_audio_format.
- Add V4L2_CID_ASRC_SOURCE_RATE and V4L2_CID_ASRC_DEST_RATE controls
- updata document accordingly.

changes in v4:
- update document style
- separate V4L2_AUDIO_FMT_LPCM and V4L2_CAP_AUDIO_M2M in separate commit

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

Shengjiu Wang (13):
  ASoC: fsl_asrc: define functions for memory to memory usage
  ASoC: fsl_easrc: define functions for memory to memory usage
  ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
  ASoC: fsl_asrc: register m2m platform device
  ASoC: fsl_easrc: register m2m platform device
  media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
  media: v4l2: Add audio capture and output support
  media: uapi: Define audio sample format fourcc type
  media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
  media: uapi: Add V4L2_CTRL_TYPE_FIXED_POINT
  media: uapi: Add audio rate controls support
  media: imx-asrc: Add memory to memory driver
  media: vim2m_audio: add virtual driver for audio memory to memory

 .../userspace-api/media/v4l/buffer.rst        |    6 +
 .../userspace-api/media/v4l/common.rst        |    1 +
 .../media/v4l/dev-audio-mem2mem.rst           |   71 +
 .../userspace-api/media/v4l/devices.rst       |    1 +
 .../media/v4l/ext-ctrls-audio-m2m.rst         |   41 +
 .../userspace-api/media/v4l/pixfmt-audio.rst  |   87 ++
 .../userspace-api/media/v4l/pixfmt.rst        |    1 +
 .../media/v4l/vidioc-enum-fmt.rst             |    2 +
 .../media/v4l/vidioc-g-ext-ctrls.rst          |   17 +-
 .../userspace-api/media/v4l/vidioc-g-fmt.rst  |    4 +
 .../media/v4l/vidioc-querycap.rst             |    3 +
 .../media/v4l/vidioc-queryctrl.rst            |    9 +-
 .../media/videodev2.h.rst.exceptions          |    4 +
 .../media/common/videobuf2/videobuf2-v4l2.c   |    4 +
 drivers/media/platform/nxp/Kconfig            |   12 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/imx-asrc.c         | 1186 +++++++++++++++++
 drivers/media/test-drivers/Kconfig            |    9 +
 drivers/media/test-drivers/Makefile           |    1 +
 drivers/media/test-drivers/vim2m_audio.c      |  680 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c      |    5 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c     |    2 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   16 +
 drivers/media/v4l2-core/v4l2-dev.c            |   17 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   66 +
 include/media/v4l2-dev.h                      |    2 +
 include/media/v4l2-ioctl.h                    |   34 +
 .../fsl => include/sound}/fsl_asrc_common.h   |   60 +
 include/uapi/linux/v4l2-controls.h            |    9 +
 include/uapi/linux/videodev2.h                |   42 +
 sound/soc/fsl/fsl_asrc.c                      |  144 ++
 sound/soc/fsl/fsl_asrc.h                      |    4 +-
 sound/soc/fsl/fsl_asrc_dma.c                  |    2 +-
 sound/soc/fsl/fsl_easrc.c                     |  233 ++++
 sound/soc/fsl/fsl_easrc.h                     |    6 +-
 35 files changed, 2771 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
 create mode 100644 drivers/media/platform/nxp/imx-asrc.c
 create mode 100644 drivers/media/test-drivers/vim2m_audio.c
 rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)

-- 
2.34.1

