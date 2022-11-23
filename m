Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7ED63654A
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Nov 2022 17:05:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B23D71689;
	Wed, 23 Nov 2022 17:05:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B23D71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669219558;
	bh=QbzQeVg805h8yCMZe5taHsPzrslzEhkZRfNk/xeB04A=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GN08huvrebsvNmn7jJkLeau1BSZrVbG4eNjSnzh1BX9rjq1OV/OkNKx/HMaPlqynZ
	 Qo8kOr05fkqMSDIxDlLWYbhyk1IBsOlrv1AfmXHVlZht5ggfB/dk2TJi3fOUrDMUDc
	 eg1yXRrlYi3UHR7xbdBKa1I6Cm8juKIpvWSTRyuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45108F8030F;
	Wed, 23 Nov 2022 17:05:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55147F8025D; Wed, 23 Nov 2022 17:05:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E31DDF80149
 for <alsa-devel@alsa-project.org>; Wed, 23 Nov 2022 17:04:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E31DDF80149
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="aagZZGFt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7796BCE2471;
 Wed, 23 Nov 2022 16:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37957C433C1;
 Wed, 23 Nov 2022 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669219493;
 bh=QbzQeVg805h8yCMZe5taHsPzrslzEhkZRfNk/xeB04A=;
 h=From:To:Cc:Subject:Date:From;
 b=aagZZGFtUesSmOK20pbnMGwZ5dwg76e880aQmF+e6OIcyMdDDRW1jDyYqjDUtl8hS
 tNZ1ELM7vVcVmJltvqFlX9tKdemujSOTgvMwI3h9V3GJ0M8brIMjm5ndikHqIOF7xe
 48V4XL1/vkVtUeBTNHHCEDkGp5qKAj7S2AAMyVT6HCMU3H1OKc/Oi6WFnG5qsuqiXL
 JdzMF2FkRe/051XFQgi7tS/s9rcCdCBw9N/wL2a+YP92GfuoxIQq89njfA25KHL3vI
 0wVH+lzlLhgAEuNcc8NPUgiLSuentSvNhjt10eLsLux/vDV5kWeGosQ4SRHYFxvutC
 e3ajC4KX2GBuQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v6.1-rc6
Date: Wed, 23 Nov 2022 16:04:44 +0000
Message-Id: <20221123160453.37957C433C1@smtp.kernel.org>
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

The following changes since commit 7d945b046be3d2605dbb1806e73095aadd7ae129:

  ASoC: stm32: dfsdm: manage cb buffers cleanup (2022-11-09 17:56:37 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v6.1-rc6

for you to fetch changes up to db8f91d424fe0ea6db337aca8bc05908bbce1498:

  ASoC: soc-pcm: Add NULL check in BE reparenting (2022-11-22 12:23:00 +0000)

----------------------------------------------------------------
ASoC: Fixes for v6.1

A clutch of small fixes that have come in in the past week, people seem
to have been unusually active for this late in the release cycle.  The
most critical one here is the fix to renumber the SOF DAI types in order
to restore ABI compatibility which was broken by the addition of AMD
support.

----------------------------------------------------------------
Chancel Liu (1):
      ASoC: wm8962: Wait for updated value of WM8962_CLOCKING1 register

Detlev Casanova (1):
      ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove

Jiasheng Jiang (1):
      ASoC: max98373: Add checks for devm_kcalloc

Junxiao Chang (1):
      ASoC: hdac_hda: fix hda pcm buffer overflow issue

Olivier Moysan (1):
      ASoC: stm32: i2s: remove irqf_oneshot flag

Pierre-Louis Bossart (1):
      ASoC: SOF: dai: move AMD_HS to end of list to restore backwards-compatibility

Richard Fitzgerald (1):
      ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()

Shuming Fan (1):
      ASoC: rt711-sdca: fix the latency time of clock stop prepare state machine transitions

Srinivasa Rao Mandadapu (1):
      ASoC: soc-pcm: Add NULL check in BE reparenting

 include/sound/sof/dai.h           | 2 +-
 sound/soc/codecs/hdac_hda.h       | 4 ++--
 sound/soc/codecs/max98373-i2c.c   | 4 ++++
 sound/soc/codecs/rt711-sdca-sdw.c | 2 +-
 sound/soc/codecs/sgtl5000.c       | 1 +
 sound/soc/codecs/wm8962.c         | 8 ++++++++
 sound/soc/soc-pcm.c               | 7 ++-----
 sound/soc/stm/stm32_i2s.c         | 2 +-
 8 files changed, 20 insertions(+), 10 deletions(-)
