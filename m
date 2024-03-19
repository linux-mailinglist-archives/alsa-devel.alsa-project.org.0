Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B3F880063
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 16:16:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 44EE82BA9;
	Tue, 19 Mar 2024 16:16:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 44EE82BA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710861383;
	bh=f4vi6qNMMFMd+j4wRF1nC7s6KSGBEyuZXzNBvECPtlk=;
	h=Date:From:Subject:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=M6lwcrYuNffpCgWABa3Mt3n0h+xziTAxUxdo0b6QpKznoOroG4OJ90ZMUW8RIKs4A
	 cm0/X+R8sYcwBoqn1StdKhAN6iSD/e131W2ZH/A2uKo8gY/0G/eEHP7ewGBGGRrSo4
	 j/n7QY7Lu90hSqgStCFELbT/FdkENfp4A3jrpsaU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C063F80088; Tue, 19 Mar 2024 16:15:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98410F80578;
	Tue, 19 Mar 2024 16:15:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDBC9F804E7; Tue, 19 Mar 2024 16:15:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CBCDEF80088
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 16:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CBCDEF80088
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 301C160DFC;
	Tue, 19 Mar 2024 15:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E8AC433C7;
	Tue, 19 Mar 2024 15:15:37 +0000 (UTC)
Message-ID: <369cc35b-9625-4512-bb7a-7d5ccfe28e5c@xs4all.nl>
Date: Tue, 19 Mar 2024 16:15:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v6.10] Add imx-asrc m2m audio rate control driver
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: OIN2J5VPCVQ3CS3PHZHJI2FZLUKPF7YF
X-Message-ID-Hash: OIN2J5VPCVQ3CS3PHZHJI2FZLUKPF7YF
X-MailFrom: SRS0=kK+l=KZ=xs4all.nl=hverkuil@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OIN2J5VPCVQ3CS3PHZHJI2FZLUKPF7YF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Mauro,

This adds support for the imx-asrc m2m audio rate control driver. Most of these
patches add support for the new v4l-audioX device nodes and related types,
and adding support for fixed point control types.

The ASoC patches have been acked by Mark Brown.

It also adds a vim2m-audio test driver so we can test the v4l-audio infrastructure.

Since V4L2 is fourcc-based all the way, directly using snd_pcm_format_t values
is not an option: fourcc's are expected to be printable characters, and it is
pretty much certain that there are applications that show it like that to the
end-user. The utilities in v4l-utils certainly do, and it is in fact a
perfectly reasonable thing to do. So instead we map the snd_pcm_format_t value
to a fourcc with v4l2_audfmt_to_fourcc and map it back with v4l2_fourcc_to_audfmt.

This PR is using v15 of the patch series:

https://patchwork.linuxtv.org/project/linux-media/list/?series=12460

And the corresponding v4l-utils patch series is here:

https://patchwork.linuxtv.org/user/todo/linux-media/?series=12074

Regards,

	Hans

The following changes since commit b14257abe7057def6127f6fb2f14f9adc8acabdb:

  media: rcar-isp: Disallow unbind of devices (2024-03-07 16:35:13 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-audio

for you to fetch changes up to af06c8792653c42d1f126505ec9180255091d94e:

  media: vim2m-audio: add virtual driver for audio memory to memory (2024-03-19 15:55:38 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      media: v4l2-ctrls: add support for fraction_bits

Shengjiu Wang (15):
      ASoC: fsl_asrc: define functions for memory to memory usage
      ASoC: fsl_easrc: define functions for memory to memory usage
      ASoC: fsl_asrc: move fsl_asrc_common.h to include/sound
      ASoC: fsl_asrc: register m2m platform device
      ASoC: fsl_easrc: register m2m platform device
      media: uapi: Add V4L2_CAP_AUDIO_M2M capability flag
      media: v4l2: Add audio capture and output support
      media: uapi: Define audio sample format fourcc type
      media: uapi: Add V4L2_CTRL_CLASS_M2M_AUDIO
      media: uapi: Add audio rate controls support
      media: uapi: Declare interface types for Audio
      media: uapi: Add an entity type for audio resampler
      media: vivid: add fixed point test controls
      media: imx-asrc: Add memory to memory driver
      media: vim2m-audio: add virtual driver for audio memory to memory

 Documentation/userspace-api/media/mediactl/media-types.rst    |   11 +
 Documentation/userspace-api/media/v4l/buffer.rst              |    6 +
 Documentation/userspace-api/media/v4l/common.rst              |    1 +
 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst   |   71 +++
 Documentation/userspace-api/media/v4l/devices.rst             |    1 +
 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst |   59 +++
 Documentation/userspace-api/media/v4l/pixfmt-audio.rst        |  100 ++++
 Documentation/userspace-api/media/v4l/pixfmt.rst              |    1 +
 Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst     |    2 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |    4 +
 Documentation/userspace-api/media/v4l/vidioc-g-fmt.rst        |    4 +
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst     |    3 +
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |   11 +-
 Documentation/userspace-api/media/videodev2.h.rst.exceptions  |    3 +
 MAINTAINERS                                                   |   17 +
 drivers/media/common/videobuf2/videobuf2-v4l2.c               |    4 +
 drivers/media/platform/nxp/Kconfig                            |   13 +
 drivers/media/platform/nxp/Makefile                           |    1 +
 drivers/media/platform/nxp/imx-asrc.c                         | 1256 +++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/test-drivers/Kconfig                            |   10 +
 drivers/media/test-drivers/Makefile                           |    1 +
 drivers/media/test-drivers/vim2m-audio.c                      |  793 ++++++++++++++++++++++++++++++++
 drivers/media/test-drivers/vivid/vivid-core.h                 |    2 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c                |   26 ++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c                 |    9 +
 drivers/media/v4l2-core/v4l2-ctrls-api.c                      |    1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                     |   93 +++-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                     |   10 +
 drivers/media/v4l2-core/v4l2-dev.c                            |   21 +
 drivers/media/v4l2-core/v4l2-ioctl.c                          |   66 +++
 drivers/media/v4l2-core/v4l2-mem2mem.c                        |   13 +-
 include/media/v4l2-ctrls.h                                    |   13 +-
 include/media/v4l2-dev.h                                      |    2 +
 include/media/v4l2-ioctl.h                                    |   34 ++
 {sound/soc/fsl => include/sound}/fsl_asrc_common.h            |   60 +++
 include/uapi/linux/media.h                                    |    2 +
 include/uapi/linux/v4l2-controls.h                            |    9 +
 include/uapi/linux/videodev2.h                                |   50 +-
 sound/soc/fsl/fsl_asrc.c                                      |  144 ++++++
 sound/soc/fsl/fsl_asrc.h                                      |    4 +-
 sound/soc/fsl/fsl_asrc_dma.c                                  |    2 +-
 sound/soc/fsl/fsl_easrc.c                                     |  233 ++++++++++
 sound/soc/fsl/fsl_easrc.h                                     |    6 +-
 43 files changed, 3145 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/dev-audio-mem2mem.rst
 create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-audio-m2m.rst
 create mode 100644 Documentation/userspace-api/media/v4l/pixfmt-audio.rst
 create mode 100644 drivers/media/platform/nxp/imx-asrc.c
 create mode 100644 drivers/media/test-drivers/vim2m-audio.c
 rename {sound/soc/fsl => include/sound}/fsl_asrc_common.h (60%)
