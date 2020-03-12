Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80D183391
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:46:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 197761721;
	Thu, 12 Mar 2020 15:45:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 197761721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024385;
	bh=MHqlYKBvhGucJEhqbUSBwrPDXsbZfvw+eLHH0K+XEJQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZ68gJGKwajiFOwGZJt2kangCpPFVsBK3uvLwacUOfulCRk8h4Fl6pgO4Beu5JFoQ
	 JxwG5PwWUWejlTXBLl2zke4Q8RP9YBN61p9uOJxH4VpxdXp4U9/cHioUkFywGzjcrP
	 9WXUpRx49wLaR5NycLoeM5tGvtP6XmECACWsITE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D5B3F8021C;
	Thu, 12 Mar 2020 15:44:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA9BFF8021C; Thu, 12 Mar 2020 15:44:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A641F8013E;
 Thu, 12 Mar 2020 15:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A641F8013E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957395"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:31 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 00/14] ASoC: SOF DSP virtualisation
Date: Thu, 12 Mar 2020 15:44:15 +0100
Message-Id: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

This patch series extends the SOF driver to add support for DSP
virtualisation to ASoC. It is built on top of VirtIO, contains a
guest driver and a vhost in-kernel guest driver. This version
supports a single playback and a single capture interface on the
guest. The specific guest audio topology is supplied by the host
from a file, specified on the QEMU command line. This solution is
designed to use advanced DSP functionality, available on the host.
In case no DSP is available on the host, a fall-back should be
provided in the future to the pure audio virtualisation standard,
currently developed by OASIS.

Extensive documentation is available at [1].

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

[1] https://thesofproject.github.io/latest/developer_guides/virtualization/virtualization.html

Guennadi Liakhovetski (14):
  ASoC: add function parameters to enable forced path pruning
  ASoC: SOF: extract firmware-related operation into a function
  ASoC: SOF: VirtIO: make a function global
  vhost: convert VHOST_VSOCK_SET_RUNNING to a generic ioctl
  ASoC: SOF: support IPC with immediate response
  ASoC: SOF: add a power status IPC
  ASoC: SOF: add two helper lookup functions
  ASoC: SOF: fix uninitialised "work" with VirtIO
  ASoC: SOF: add a VirtIO DSP driver
  ASoC: SOF: add a vhost driver: sound part
  vhost: add an SOF DSP driver
  ASoC: SOF: VirtIO: check guest component IDs
  ASoC: SOF: VirtIO: free guest pipelines upon termination
  ASoC: SOF: VirtIO: enable simultaneous playback and capture

 drivers/vhost/Kconfig            |    7 +
 drivers/vhost/Makefile           |    5 +
 drivers/vhost/dsp.c              |  731 ++++++++++++++++++++++
 include/sound/soc-dpcm.h         |   28 +-
 include/sound/soc-topology.h     |    3 +
 include/sound/sof.h              |    4 +
 include/sound/sof/header.h       |    3 +
 include/sound/sof/topology.h     |    1 +
 include/sound/sof/virtio.h       |  206 +++++++
 include/uapi/linux/vhost.h       |    9 +-
 include/uapi/linux/vhost_types.h |    7 +
 include/uapi/linux/virtio_ids.h  |    1 +
 sound/soc/soc-compress.c         |    2 +-
 sound/soc/soc-dapm.c             |    8 +-
 sound/soc/soc-pcm.c              |   98 ++-
 sound/soc/sof/Kconfig            |    8 +
 sound/soc/sof/Makefile           |    8 +
 sound/soc/sof/core.c             |  114 ++--
 sound/soc/sof/ipc.c              |   39 +-
 sound/soc/sof/loader.c           |    4 +
 sound/soc/sof/ops.h              |   10 +-
 sound/soc/sof/pcm.c              |   17 +-
 sound/soc/sof/pm.c               |    4 +
 sound/soc/sof/sof-audio.c        |   33 +
 sound/soc/sof/sof-audio.h        |   21 +
 sound/soc/sof/sof-priv.h         |   54 ++
 sound/soc/sof/topology.c         |   76 ++-
 sound/soc/sof/vhost-be.c         | 1248 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/virtio-fe.c        |  922 ++++++++++++++++++++++++++++
 29 files changed, 3560 insertions(+), 111 deletions(-)
 create mode 100644 drivers/vhost/dsp.c
 create mode 100644 include/sound/sof/virtio.h
 create mode 100644 sound/soc/sof/vhost-be.c
 create mode 100644 sound/soc/sof/virtio-fe.c

-- 
1.9.3

