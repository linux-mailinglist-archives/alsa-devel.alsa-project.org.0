Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBE8CFF27
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:46:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98ED71660;
	Tue,  8 Oct 2019 18:45:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98ED71660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553198;
	bh=rjZIpyNDhNK0gjs5GZtujQyB8sZyDEY5HI5yqvYN0WM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SIlOfAmbYPPXplTtJvJ3qlqwbCIaxv1wD7kQ0H5jgjRzlspexOVfZ3qhLgiWo5OeR
	 NAU9VmG5M+OpGnQyv1yGLLk3SWj9OhvpR/vAmsa3ZexpuesEz5+k21TfbrVQ24uvRm
	 1BTM/Kudnt7oALPOLgvWv6SP/KyYIZBLA9mxBVAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93F61F805FA;
	Tue,  8 Oct 2019 18:44:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1D67F800BF; Tue,  8 Oct 2019 18:44:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E79FF800BF
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E79FF800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338316"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:45 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:34 -0500
Message-Id: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 0/9] ASoC: SOF updates for Intel/i.MX
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Small set of updates for Intel and NXP platforms.

On the Intel side, the code is now aligned with the HDaudio legacy
with the sync_write. OEMs reported concerns with mute LEDs not
supported with SOF/UCM, we can now tie a topology-defined control with
a mute LED. Note that the large set of differences in the topology is
largely due to code move, the new functionality is minimal in size.

On the i.MX side, add topology support for ESAI parameters. This
reflects on-going work on the firmware side.

And last add debug module parameters for ACPI and PCI modules. For now
the only flag used is for PM runtime, e.g. to measure the
suspend-resume latencies of child devices without dealing with DSP
reinitialization or keep the parent active while testing the SoundWire
clock-stop-mode.

Daniel Baluta (2):
  ASoC: SOF: imx: Describe ESAI parameters to be sent to DSP
  ASoC: SOF: imx: Read ESAI parameters and send them to DSP

Jaska Uimonen (3):
  ASoC: SOF: enable dual control for pga
  AsoC: SOF: refactor control load code
  ASoC: SOF: acpi led support for switch controls

Kai Vehmanen (2):
  ASoC: SOF: enable sync_write in hdac_bus
  Revert "ASoC: SOF: Force polling mode on CFL and CNL"

Pierre-Louis Bossart (2):
  ASoC: SOF: acpi: add debug module param
  ASoC: SOF: pci: add debug module param

 include/sound/sof/dai-imx.h     |  34 +++
 include/sound/sof/dai.h         |   2 +
 include/uapi/sound/sof/abi.h    |   2 +-
 include/uapi/sound/sof/tokens.h |   7 +-
 sound/soc/sof/control.c         |  32 +++
 sound/soc/sof/intel/hda.c       |   8 +-
 sound/soc/sof/pcm.c             |   8 +
 sound/soc/sof/sof-acpi-dev.c    |  12 +-
 sound/soc/sof/sof-pci-dev.c     |  12 +-
 sound/soc/sof/sof-priv.h        |   9 +
 sound/soc/sof/topology.c        | 401 +++++++++++++++++++-------------
 11 files changed, 354 insertions(+), 173 deletions(-)
 create mode 100644 include/sound/sof/dai-imx.h

-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
