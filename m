Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506BF59236C
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:21:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39A81FA;
	Sun, 14 Aug 2022 18:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39A81FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494078;
	bh=KbyObKk7cSByvvXNFKtPxO7zqzi0cCyZ20ssVNoXFdQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DOkhav5FwupQHkJiOJthSxe3WuBDTqHA3sGxaAJXwK53FBvoHVK67bmQjdCLgjCH5
	 W3DVIqdkT6q7Q4PnGGCANTCkYoIbnGeJLsneTvCNlTTQjIyZ+OMrvfh6Qp9E5KcJeU
	 aYTq4D7U4uVXjcTU+vBahXbe7EiO1KEEegMiOUtk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED5CF804C1;
	Sun, 14 Aug 2022 18:20:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8596F804C1; Sun, 14 Aug 2022 18:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5D355F800B8
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5D355F800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fElOJ2s7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED76760B4E;
 Sun, 14 Aug 2022 16:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F88C433C1;
 Sun, 14 Aug 2022 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494007;
 bh=KbyObKk7cSByvvXNFKtPxO7zqzi0cCyZ20ssVNoXFdQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fElOJ2s75zrPaFl7JONGQKtvBK1oqlr4q8F0YwsFB2B0zyHnDCoV0wBFO5VaH19X8
 p5TmUhBXEQ7KvK7WJVTKhU08PuaDnog9Pa7XdeZrCjubMuUBWw8cFUSRbp/TFC5OBC
 tv+Iw3ibqF/b06JA4ypwMOBLBKR5CcMeV6UQN/Bhp8jlW5dIqkcviuqoISXQeilI8X
 C7ogCB7xXJ8OldQiqB6F2G3AjSdvwm9Vp007bbkrk+P7m1lF5IobamYgX0czmqM0sp
 mkBFJHIIyx6hbRmm+JlAVXzhd+wFcBe/eVeg9GcRWZSamU3kT9GPkw/h95sElv7wlI
 B5x+hZE+eY1Zw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 09/48] ASoC: Intel: avs: Set max DMA segment size
Date: Sun, 14 Aug 2022 12:19:02 -0400
Message-Id: <20220814161943.2394452-9-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814161943.2394452-1-sashal@kernel.org>
References: <20220814161943.2394452-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, peter.ujfalusi@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 8544eebc78c96f1834a46b26ade3e7ebe785d10c ]

Apparently it is possible for code to allocate large buffers which may
cause warnings as reported in [1]. This was fixed for HDA, SOF and
skylake in patchset [2], fix it also for avs driver.

[1] https://github.com/thesofproject/linux/issues/3430
[2] https://lore.kernel.org/all/20220215132756.31236-1-tiwai@suse.de/

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Link: https://lore.kernel.org/r/20220707124153.1858249-8-cezary.rojewski@intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 3a0997c3af2b..cf373969bb69 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -445,6 +445,7 @@ static int avs_pci_probe(struct pci_dev *pci, const struct pci_device_id *id)
 		dma_set_mask(dev, DMA_BIT_MASK(32));
 		dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
 	}
+	dma_set_max_seg_size(dev, UINT_MAX);
 
 	ret = avs_hdac_bus_init_streams(bus);
 	if (ret < 0) {
-- 
2.35.1

