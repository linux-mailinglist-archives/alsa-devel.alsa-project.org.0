Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F06247AAB
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 00:49:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6889516FC;
	Tue, 18 Aug 2020 00:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6889516FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597704551;
	bh=kLLZuOItp7lmq+MfOP/sYg6TH7hauCI+MB43ZZD6MTs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gYCti2t4tb0750clr1Q3Eyq1CJelJVZrsGOI0sK1Ih4VthTAhb1j6FvE4TVvukdhu
	 MEJw9a5Hf9OfP75MowZ4oBVEG/HA1fSIlc0gVqtxkzRnUEKJ6jRbTEhyWwCfRFrZJE
	 E6yNoXs8zZu2pI8y6Xaw+iYQLQqXmf0nxRiBPv7M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B66AF800EF;
	Tue, 18 Aug 2020 00:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A08E7F80218; Tue, 18 Aug 2020 00:47:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F60CF800EF
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 00:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F60CF800EF
Received: from [82.43.126.140] (helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1k7nuK-0000uc-3W; Mon, 17 Aug 2020 22:47:12 +0000
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@xilinx.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] sound: remove duplicate "the the" phrase in Kconfig text
Date: Mon, 17 Aug 2020 23:47:06 +0100
Message-Id: <20200817224706.6139-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

There are a couple of occurrences of "the the" in the Kconfig
text. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/xilinx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/xilinx/Kconfig b/sound/soc/xilinx/Kconfig
index 1d3586b68db7..5bd2730aab76 100644
--- a/sound/soc/xilinx/Kconfig
+++ b/sound/soc/xilinx/Kconfig
@@ -9,14 +9,14 @@ config SND_SOC_XILINX_I2S
 	  encapsulates PCM in AES format and sends AES data.
 
 config SND_SOC_XILINX_AUDIO_FORMATTER
-	tristate "Audio support for the the Xilinx audio formatter"
+	tristate "Audio support for the Xilinx audio formatter"
 	help
 	  Select this option to enable Xilinx audio formatter
 	  support. This provides DMA platform device support for
 	  audio functionality.
 
 config SND_SOC_XILINX_SPDIF
-	tristate "Audio support for the the Xilinx SPDIF"
+	tristate "Audio support for the Xilinx SPDIF"
 	help
 	  Select this option to enable Xilinx SPDIF Audio.
 	  This provides playback and capture of SPDIF audio in
-- 
2.27.0

