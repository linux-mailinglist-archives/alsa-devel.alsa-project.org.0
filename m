Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1774B564B
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 17:32:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AA5A1916;
	Mon, 14 Feb 2022 17:32:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AA5A1916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644856374;
	bh=QNaH9DHQfq++09BsyMzYodlUaQSdzUrh1YzbC0uwMoE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Fge2ohvYCCBXHcch+92T+dwB4T2Mf3XSXN5IL0XsSlxP9dGxQoETVtEIsm756D73+
	 FxzOuomRTFry0Xbs0HgdU0nc3OzkCeC0oJ3TseHx7UVt6sxgfgPF31S0y8oKFmEMuM
	 j79npWCDTdlS4baNNqtWREzuWKXOvQCeZGkA/O+U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 728EAF800C0;
	Mon, 14 Feb 2022 17:31:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5EFEF80310; Mon, 14 Feb 2022 17:31:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CEF2F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 17:31:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CEF2F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g1wA4Ocr"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D0A760B7E;
 Mon, 14 Feb 2022 16:31:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99082C340E9;
 Mon, 14 Feb 2022 16:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644856296;
 bh=QNaH9DHQfq++09BsyMzYodlUaQSdzUrh1YzbC0uwMoE=;
 h=From:To:Cc:Subject:Date:From;
 b=g1wA4OcrAxYFN6OPxa0bpJBB8F4AK9TXIQYz/7lYq3E/OKw8UgJxWrG9/acLjDUQH
 yK9ZL6vn0glJDmbJf0fPIIXSza9LOJLTa2i+EeXeVrXXk3SjkOlxJyqFfbSaD3mm00
 fkq8WvRBHRVU6XlmX9/GB9XjPLPawWR1LnF4j4WGy9d3kzG0ybkBo01y5TFPHNapwG
 gpAPKSBZVCuwFYOo5FEN4u0UUWA42KQILlM9t7ZzMFbJudc4enIZAA8fh27YXq2gG+
 8QcObwTu5DxMhvb/Em8YWkoupaoYkzIjjVoLdIe0LSYr4o5ur0LdxEUxRBXkILALU+
 2lzY8SZ0GDaYg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.17-rc4
Date: Mon, 14 Feb 2022 16:31:25 +0000
Message-Id: <20220214163135.99082C340E9@smtp.kernel.org>
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

The following changes since commit a4f399a1416f645ac701064a55b0cb5203707ac9:

  Input: wm97xx: Simplify resource management (2022-01-31 13:17:24 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.17-rc4

for you to fetch changes up to a887f9c7a4d37a8e874ba8415a42a92a1b5139fc:

  ASoC: wm_adsp: Correct control read size when parsing compressed buffer (2022-02-10 17:26:43 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.18

More fixes that have arrived in the past few -rcs, plus a MAINTAINERS
update.  The biggest update here is the fix for control change
notifications in ASoC generic controls found by mixer-test.

----------------------------------------------------------------
Charles Keepax (1):
      ASoC: wm_adsp: Correct control read size when parsing compressed buffer

Guenter Roeck (1):
      ASoC: Revert "ASoC: mediatek: Check for error clk pointer"

Kai Vehmanen (3):
      ASoC: rt5682s: do not block workqueue if card is unbound
      ASoC: rt5668: do not block workqueue if card is unbound
      ASoC: rt5682: do not block workqueue if card is unbound

Mark Brown (5):
      ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw()
      ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_sx()
      ASoC: ops: Fix stereo change notifications in snd_soc_put_volsw_range()
      ASoC: ops: Fix stereo change notifications in snd_soc_put_xr_sx()
      ASoC: ops: Fix stereo change notifications

Martin Povišer (1):
      ASoC: tas2770: Insert post reset delay

Stephen Boyd (1):
      ASoC: qcom: Actually clear DMA interrupt register for HDMI

Tzung-Bi Shih (1):
      MAINTAINERS: update cros_ec_codec maintainers

V sujith kumar Reddy (1):
      ASoC: amd: acp: Set gpio_spkr_en to None for max speaker amplifer in machine driver

 .../bindings/sound/google,cros-ec-codec.yaml       |  1 +
 MAINTAINERS                                        |  1 +
 drivers/soc/mediatek/mtk-scpsys.c                  | 15 +++-----
 sound/soc/amd/acp/acp-mach.h                       |  1 -
 sound/soc/amd/acp/acp-sof-mach.c                   |  4 +--
 sound/soc/codecs/rt5668.c                          | 12 ++++---
 sound/soc/codecs/rt5682.c                          | 12 ++++---
 sound/soc/codecs/rt5682s.c                         | 12 ++++---
 sound/soc/codecs/tas2770.c                         |  7 +++-
 sound/soc/codecs/wm_adsp.c                         |  3 +-
 sound/soc/qcom/lpass-platform.c                    |  8 ++---
 sound/soc/soc-ops.c                                | 41 ++++++++++++++++------
 12 files changed, 72 insertions(+), 45 deletions(-)
