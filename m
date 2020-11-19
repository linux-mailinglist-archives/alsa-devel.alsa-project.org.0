Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8F2B99E2
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 18:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D023E171D;
	Thu, 19 Nov 2020 18:46:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D023E171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605808026;
	bh=E1siASmWGkqZfDfhpRHqNeOf979CTiVukPZ9IklRqA0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J2iYAuMJ+MsG5zz88zdzhl4GihAF0kreDzjwy/jlfdkklx3P47neRaMnlv1kSzPTE
	 nAHnVeg82aMOG1Xk0Cz0clNckQ2aTV7dxRiqX3WJipeZkgS4RDY9D/BdGY5Z8VHW5N
	 UKYvYHEiGH9mNCnU0NBFMdwyEtWlT4wFYPZVDexk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B1C4F800C5;
	Thu, 19 Nov 2020 18:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAA94F801ED; Thu, 19 Nov 2020 18:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63758F8015A
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 18:45:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63758F8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ijm0b5up"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1CD921D7A;
 Thu, 19 Nov 2020 17:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605807920;
 bh=E1siASmWGkqZfDfhpRHqNeOf979CTiVukPZ9IklRqA0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ijm0b5upj0BozQrkADUpL+u/UeQCgcxQFVe12zGgiMLOXDxXinac9eLCvG+16gkza
 Xu2qeP4U2FZsFmfaOJR06ahokmwI/Xm3J4DP6AVfUz+wd97XEGlt5tUcT1msAw3JZf
 pXSOTtbHUnAxyEWdj973tdy/mbQZVR+jaiLb+UFM=
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.10-rc4
Date: Thu, 19 Nov 2020 17:44:58 +0000
Message-Id: <20201119174519.B1CD921D7A@mail.kernel.org>
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

The following changes since commit f9d7c6eb23f7e55e7a0ca5451da06909bdfdd0e4:

  ASoC: mchp-spdiftx: Do not set Validity bit(s) (2020-11-04 17:50:22 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.10-rc4

for you to fetch changes up to 879ee8b6f2bae0cc4a25536f8841db1dbc969523:

  ASOC: Intel: kbl_rt5663_rt5514_max98927: Do not try to disable disabled clock (2020-11-18 17:59:23 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.11

A collection of driver specific fixes, mostly for x86 systems (or CODECs
used mostly on x86) and all for relatively minor issues, the biggest one
being fixing S24_LE format on Keem Bay systems.

----------------------------------------------------------------
Cezary Rojewski (2):
      ASoC: Intel: catpt: Skip position update for unprepared streams
      ASoC: Intel: catpt: Correct clock selection for dai trigger

Guenter Roeck (1):
      ASOC: Intel: kbl_rt5663_rt5514_max98927: Do not try to disable disabled clock

Jack Yu (1):
      ASoC: rt1015: add delay to fix pop noise from speaker

Mark Brown (1):
      Merge Intel catpt DSP fixes into asoc-5.10

Michael Sit Wei Hong (1):
      ASoC: Intel: KMB: Fix S24_LE configuration

Shuming Fan (1):
      ASoC: rt1015: increase the time to detect BCLK

Srinivasa Rao Mandadapu (1):
      ASoC: qcom: lpass-platform: Fix memory leak

 Documentation/devicetree/bindings/sound/rt1015.txt |  6 ++++++
 include/sound/rt1015.h                             | 15 +++++++++++++++
 sound/soc/codecs/rt1015.c                          | 22 +++++++++++++++++++++-
 sound/soc/codecs/rt1015.h                          |  2 ++
 .../soc/intel/boards/kbl_rt5663_rt5514_max98927.c  |  2 ++
 sound/soc/intel/catpt/pcm.c                        |  9 ++++-----
 sound/soc/intel/keembay/kmb_platform.c             |  6 +++---
 sound/soc/qcom/lpass-platform.c                    |  5 ++++-
 8 files changed, 57 insertions(+), 10 deletions(-)
 create mode 100644 include/sound/rt1015.h
