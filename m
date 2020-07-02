Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB4212AB4
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:02:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BC8516D4;
	Thu,  2 Jul 2020 19:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BC8516D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593709328;
	bh=Wv+LE0MC1NCQqZ74KV2mM6DDgZ3XwTVSN3ApvgZdyZE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gnn4mHU6hy72Qen3wWhjb53TxO1NiLuK+NGT7oGohafjRpbQTcv+DTQ6YVMUE9Mvz
	 G4NcwJz4OukEVhKcHeDxLHrfs25zYFY4qAoDQJ9QFIzms1jP0lgoksSUKAsD0z6Ma9
	 61/48kV+7PXCxBgtGm2z1znVFQFaFFvzpcDLfy18=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 05296F802D2;
	Thu,  2 Jul 2020 18:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C2C4AF8028F; Thu,  2 Jul 2020 18:59:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8BBFF8022D
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8BBFF8022D
IronPort-SDR: wKWsKtUVG7LMdbjufHhd46E4K8/f9cqaAdiHxwzYJZMsOPa3lFoSkQ47qp/x/a+aXeYBeC6uBy
 A9g5nCdxDwiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126583265"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126583265"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:15 -0700
IronPort-SDR: uiBN9wJ+3Vg0Zh/63HkAJd10woYM7Pd3v1HC2SoBFuwWsmwQh3oo2JRX5r7fjfU8ArriGJHpKB
 W0xze70NEZWA==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426014849"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: samsung: spdif: fix kernel-doc
Date: Thu,  2 Jul 2020 11:58:55 -0500
Message-Id: <20200702165901.164100-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Sangbeom Kim <sbkim73@samsung.com>, broonie@kernel.org
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

Fix W=1 warnings - typos with structure fields

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/spdif.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index 759fc6644329..4ae7ff623b82 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -70,9 +70,9 @@
  * @clk_rate: Current clock rate for calcurate ratio.
  * @pclk: The peri-clock pointer for spdif master operation.
  * @sclk: The source clock pointer for making sync signals.
- * @save_clkcon: Backup clkcon reg. in suspend.
- * @save_con: Backup con reg. in suspend.
- * @save_cstas: Backup cstas reg. in suspend.
+ * @saved_clkcon: Backup clkcon reg. in suspend.
+ * @saved_con: Backup con reg. in suspend.
+ * @saved_cstas: Backup cstas reg. in suspend.
  * @dma_playback: DMA information for playback channel.
  */
 struct samsung_spdif_info {
-- 
2.25.1

