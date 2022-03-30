Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B381B4EC2FF
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 14:07:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 549E41AAD;
	Wed, 30 Mar 2022 14:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 549E41AAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648642075;
	bh=QPwXx2AaC2FQDD/4//la61RxRaHJ5DohwLIQhvoQqTA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kKI7p87kENaXzn15xXbb/ANiuQ3bkHvABK+PqutizcqutZqgkEVhgud+KXu11mCE/
	 tR9iGeybBmKoY2bRPaIGkBhkYUqgJPwlSvRzXSYFwgGqPk+HDx2F9LlcwkLgHIXZKK
	 jAnufjkF08ABsVLXTi7of8yDxT/0LlFZgiZ6+E3o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C7B6F8051A;
	Wed, 30 Mar 2022 13:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A944BF80517; Wed, 30 Mar 2022 13:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 501E7F804B4
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 501E7F804B4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hUqFd10d"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DDC6461705;
 Wed, 30 Mar 2022 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9E3C34118;
 Wed, 30 Mar 2022 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648641435;
 bh=QPwXx2AaC2FQDD/4//la61RxRaHJ5DohwLIQhvoQqTA=;
 h=From:To:Cc:Subject:Date:From;
 b=hUqFd10draJQSCRhuKfj2julXT6ZVv+YVbcTdofTQpbULsx1aVBupaaIyBpjzipoQ
 3OfUl2eUFsE7IVGRvJj/csJMhoon1BSlRea7iQExvC433XAcuPDivg09Y2+4to1OWr
 xg0OCew1+lk7dp4VEIE0E9mqjO829gYjhLxAej1UaZedkC+Y3nZA5/GS+8t+ODIXAd
 3qHjh+tYOC/UOtq9gLQnHRkMPjIvEqIAElIoP1WbEKcfJZ+9K82B4TNWawZlbY7uFG
 RhHtva8f4SMoqBEkrNNWwQyoTvA0BLZ5u46fqYSrGgcbIyyPh/lsWCXtJ2SlwHgaH+
 r82G6KbTPvJzw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL] ASoC fixes for v5.18
Date: Wed, 30 Mar 2022 12:56:57 +0100
Message-Id: <20220330115714.7C9E3C34118@smtp.kernel.org>
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

The following changes since commit 49a24e9d9c740d3bd8b1200f225f67d45e3d68a5:

  Make the SOF control, PCM and PM code IPC agnostic (2022-03-18 20:11:08 +0000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git tags/asoc-fix-v5.18

for you to fetch changes up to 664d66dc0a64b32e60a5ad59a9aebb08676a612b:

  ASoC: SOF: Intel: Fix build error without SND_SOC_SOF_PCI_DEV (2022-03-25 16:09:28 +0000)

----------------------------------------------------------------
ASoC: Fixes for v5.18

A few fixes that came in during the merge window, all fairly routine.

----------------------------------------------------------------
Jiaxin Yu (1):
      ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs

Meng Tang (2):
      ASoC: fsl-asoc-card: Fix jack_event() always return 0
      ASoC: rockchip: i2s_tdm: Fixup config for SND_SOC_DAIFMT_DSP_A/B

Zheng Bin (1):
      ASoC: SOF: Intel: Fix build error without SND_SOC_SOF_PCI_DEV

 sound/soc/codecs/mt6358.c             |  4 ++++
 sound/soc/fsl/fsl-asoc-card.c         | 12 ++++--------
 sound/soc/rockchip/rockchip_i2s_tdm.c | 10 +++++-----
 sound/soc/sof/intel/Kconfig           |  1 +
 4 files changed, 14 insertions(+), 13 deletions(-)
