Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE32C6735
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Nov 2020 14:50:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94D83183F;
	Fri, 27 Nov 2020 14:49:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94D83183F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606485032;
	bh=SlIlzrlHhecpiJh1B2GKYrsUvdmLv5LkZJJvutHKAV4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uZfdERY0g3f66T4IJqeGromwY6M+9L1gjX4BhAqgDaeW6/w3hi2gZ/usVbDOrV18+
	 VsrOayP5VARAbUmVDg731Hflc9xgeCcqSirWexJVnv7wBvl891N0+apdpWpdTw0ckt
	 6TB68Te3yifIKMJeeYIyUfPGS1FpAEZjQ2HV4ujs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F1F2BF800E0;
	Fri, 27 Nov 2020 14:48:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD9B9F8019D; Fri, 27 Nov 2020 14:48:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 84D47F800E0
 for <alsa-devel@alsa-project.org>; Fri, 27 Nov 2020 14:48:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84D47F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Lw7Qcpme"
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 09EBC20B1F;
 Fri, 27 Nov 2020 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606484924;
 bh=SlIlzrlHhecpiJh1B2GKYrsUvdmLv5LkZJJvutHKAV4=;
 h=From:To:Cc:Subject:Date:From;
 b=Lw7Qcpme+NXlG7H8WwO+nROagJ/htyVplHgqwSmC6zghTHjTxIMn2ScULFqEHJrGt
 AUSM/XOQc7RdHydbJA2glpNJbCyXTu6RjeXSDtxdoBXT+kdsn3hm7/2pmzcTS/DGwy
 3G35yvo5ob3pCokJvFBwXjxpt3psdG0DlueUJGEs=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.10-rc5
Date: Fri, 27 Nov 2020 13:48:05 +0000
Message-Id: <20201127134844.09EBC20B1F@mail.kernel.org>
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
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

The following changes since commit 879ee8b6f2bae0cc4a25536f8841db1dbc969523:

  ASOC: Intel: kbl_rt5663_rt5514_max98927: Do not try to disable disabled clock (2020-11-18 17:59:23 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.10-rc5

for you to fetch changes up to aa4cb898b80a28a610e26d1513e6dd42d995c225:

  ASoC: rt5682: change SAR voltage threshold (2020-11-26 13:06:18 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.10

A small set of driver specific fixes, plus a new platform quirk from
Hans.

----------------------------------------------------------------
Hans de Goede (1):
      ASoC: Intel: bytcr_rt5640: Fix HP Pavilion x2 Detachable quirks

Luo Meng (1):
      ASoC: wm_adsp: fix error return code in wm_adsp_load()

Shuming Fan (1):
      ASoC: rt5682: change SAR voltage threshold

Srinivasa Rao Mandadapu (1):
      ASoC: qcom: Fix enabling BCLK and LRCLK in LPAIF invalid state

 sound/soc/codecs/rt5682.c             |  1 +
 sound/soc/codecs/wm_adsp.c            |  1 +
 sound/soc/intel/boards/bytcr_rt5640.c | 17 ++++++++--
 sound/soc/qcom/lpass-cpu.c            | 62 +++++++++++++++++------------------
 sound/soc/qcom/lpass-lpaif-reg.h      |  7 ++++
 sound/soc/qcom/lpass-platform.c       | 20 +++++++++--
 sound/soc/qcom/lpass.h                |  1 +
 7 files changed, 73 insertions(+), 36 deletions(-)
