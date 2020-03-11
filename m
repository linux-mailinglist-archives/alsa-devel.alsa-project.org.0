Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF43180F6B
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 06:08:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3223E1669;
	Wed, 11 Mar 2020 06:08:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3223E1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583903335;
	bh=ABNP4ROWTN9z/areB67pq5mO92TPk/OQ6M+bE+8YnJs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8ctfNTmTO6ouLOvH6YdjT/Hb0Opav7wpHVqH3GHMmqBy7j63ZCJw1sSjpDP8p3NE
	 vEwHfD1GFbYatPVHRjsHmZG4llXgUj6dhn+83RctQuDHeaGgK6hNLxZ7Bw8OQpNrRh
	 Z+OdpvuM4LPLSXi28Oz7ufMsdL5EW5jYihwA+aek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D3D0F801A3;
	Wed, 11 Mar 2020 06:07:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE93F801EB; Wed, 11 Mar 2020 06:07:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtprelay.hostedemail.com (smtprelay0047.hostedemail.com
 [216.40.44.47])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5668F800BE
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 06:07:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5668F800BE
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay04.hostedemail.com (Postfix) with ESMTP id B96DA1802DA5B;
 Wed, 11 Mar 2020 05:07:06 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: force30_20c217ad3c02e
X-Filterd-Recvd-Size: 2686
Received: from joe-laptop.perches.com (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf16.hostedemail.com (Postfix) with ESMTPA;
 Wed, 11 Mar 2020 05:07:04 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Jun Nie <jun.nie@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH -next 012/491] ARM/ZTE ARCHITECTURE: Use fallthrough;
Date: Tue, 10 Mar 2020 21:51:26 -0700
Message-Id: <cb3feec0548088c3c2485965194c6fb09e7c0e3d.1583896348.git.joe@perches.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <cover.1583896344.git.joe@perches.com>
References: <cover.1583896344.git.joe@perches.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
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

Convert the various uses of fallthrough comments to fallthrough;

Done via script
Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/

Signed-off-by: Joe Perches <joe@perches.com>
---
 sound/soc/zte/zx-i2s.c   | 4 ++--
 sound/soc/zte/zx-spdif.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/zte/zx-i2s.c b/sound/soc/zte/zx-i2s.c
index 568cde6..1c1a44 100644
--- a/sound/soc/zte/zx-i2s.c
+++ b/sound/soc/zte/zx-i2s.c
@@ -294,7 +294,7 @@ static int zx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			zx_i2s_rx_dma_en(zx_i2s->reg_base, true);
 		else
 			zx_i2s_tx_dma_en(zx_i2s->reg_base, true);
-	/* fall thru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		if (capture)
@@ -308,7 +308,7 @@ static int zx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			zx_i2s_rx_dma_en(zx_i2s->reg_base, false);
 		else
 			zx_i2s_tx_dma_en(zx_i2s->reg_base, false);
-	/* fall thru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		if (capture)
diff --git a/sound/soc/zte/zx-spdif.c b/sound/soc/zte/zx-spdif.c
index a3a07c0..b4168bd 100644
--- a/sound/soc/zte/zx-spdif.c
+++ b/sound/soc/zte/zx-spdif.c
@@ -218,7 +218,7 @@ static int zx_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 		val = readl_relaxed(zx_spdif->reg_base + ZX_FIFOCTRL);
 		val |= ZX_FIFOCTRL_TX_FIFO_RST;
 		writel_relaxed(val, zx_spdif->reg_base + ZX_FIFOCTRL);
-	/* fall thru */
+		fallthrough;
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		zx_spdif_cfg_tx(zx_spdif->reg_base, true);
-- 
2.24.0

