Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EB25FF9A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 18:35:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A41717CC;
	Mon,  7 Sep 2020 18:34:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A41717CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599496515;
	bh=58wy6+NLVtxqoBa6LJfUWGbvwTcc7WuVJSuHWnbCVhw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dT2AidTdduJfrfxHxLavtlID4AFBurbBb/XjdvqpKKtQnoPiw8FWj8gIuMREYKJDA
	 8CfwXtxyj2l1jUxn/bJap0OMx69kld+qTU53vWvqYd6DbRafas1KKiBLRa/lPUxLt5
	 FTPDK5UAcFccG93JaIq6duIPjXAUMP2fxnGSgji8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47B45F802C3;
	Mon,  7 Sep 2020 18:32:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B793F80256; Mon,  7 Sep 2020 18:32:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78F9DF8021C
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 18:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78F9DF8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZBkz5tnd"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 75109218AC;
 Mon,  7 Sep 2020 16:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599496356;
 bh=58wy6+NLVtxqoBa6LJfUWGbvwTcc7WuVJSuHWnbCVhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZBkz5tndOsWLCklhjnhiTod6ZxxExhjS93XnIfCyTVxinlIyhE/prn1lPJHLSz/v3
 kuJOemtdwWbRVM58SOpTm2g9SBei63fN/RdF/cbm8xK1SK5lVAo9AXoaASEwWT3szT
 i20sabq0HjAfE/lhydlUNgBNvMTDpVv36t2QO3LI=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 12/53] ALSA: hda/tegra: Program WAKEEN register
 for Tegra
Date: Mon,  7 Sep 2020 12:31:38 -0400
Message-Id: <20200907163220.1280412-12-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907163220.1280412-1-sashal@kernel.org>
References: <20200907163220.1280412-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.de>, Sameer Pujar <spujar@nvidia.com>,
 linux-tegra@vger.kernel.org, Mohan Kumar <mkumard@nvidia.com>
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

From: Mohan Kumar <mkumard@nvidia.com>

[ Upstream commit 23d63a31d9f44d7daeac0d1fb65c6a73c70e5216 ]

The WAKEEN bits are used to indicate which bits in the
STATESTS register may cause wake event during the codec
state change request. Configure the WAKEEN register for
the Tegra to detect the wake events.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Acked-by: Sameer Pujar <spujar@nvidia.com>
Link: https://lore.kernel.org/r/20200825052415.20626-3-mkumard@nvidia.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 0cc5fad1af8a9..ae40ca3f29837 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -179,6 +179,10 @@ static int __maybe_unused hda_tegra_runtime_suspend(struct device *dev)
 	struct hda_tegra *hda = container_of(chip, struct hda_tegra, chip);
 
 	if (chip && chip->running) {
+		/* enable controller wake up event */
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) |
+			   STATESTS_INT_MASK);
+
 		azx_stop_chip(chip);
 		azx_enter_link_reset(chip);
 	}
@@ -200,6 +204,9 @@ static int __maybe_unused hda_tegra_runtime_resume(struct device *dev)
 	if (chip && chip->running) {
 		hda_tegra_init(hda);
 		azx_init_chip(chip, 1);
+		/* disable controller wake up event*/
+		azx_writew(chip, WAKEEN, azx_readw(chip, WAKEEN) &
+			   ~STATESTS_INT_MASK);
 	}
 
 	return 0;
-- 
2.25.1

