Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A241D212AC8
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 19:04:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AB1316E8;
	Thu,  2 Jul 2020 19:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AB1316E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593709467;
	bh=wqRtemSK63yWKf+bKI8+BOHbYmk8ppQRPlzCNQaa2sU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gpzcr9KAtznFsHtYn7IwUa5HU3QruVMKxKTTINk4UrJOJhjViu7DYOfaqBYnOV+0Y
	 IaY69udEL4XwkoiF/+CHSBKPDzPNjcMe994vWVSFR9PihQrq4yVlaVLCq8HXCqKCIJ
	 9P2ux42KDb2vupQUsUVyqPMX1dIWKTn+CDIeRGY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6984F802C4;
	Thu,  2 Jul 2020 18:59:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31666F802E2; Thu,  2 Jul 2020 18:59:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D263F800ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 18:59:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D263F800ED
IronPort-SDR: z4XJCKfS9xrvcG4jlKkffyZwbYzM81gFxmLFGOM/+J0Ozxnl6eMbagd42SoZEs3BgDSHb/W4RR
 XXWpJceRBkjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="126583306"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="126583306"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:22 -0700
IronPort-SDR: pzbZZcBN80J3dCNKD5PVu1O5ighELMNMf2O0sGtwLEpgGN4rb01n+bh9dvzjajtD43mdwoulcU
 jMZRFeWX8Q7g==
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; d="scan'208";a="426014892"
Received: from nzbastur-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.182])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 09:59:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 6/8] ASoC: sunxi: sun4i-spdif: fix kernel-doc
Date: Thu,  2 Jul 2020 11:58:59 -0500
Message-Id: <20200702165901.164100-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
References: <20200702165901.164100-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 broonie@kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

Fix W=1 warning - typo in field description

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 86779a99df75..326dd45e39da 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -167,7 +167,7 @@
 /**
  * struct sun4i_spdif_quirks - Differences between SoC variants.
  *
- * @reg_dac_tx_data: TX FIFO offset for DMA config.
+ * @reg_dac_txdata: TX FIFO offset for DMA config.
  * @has_reset: SoC needs reset deasserted.
  * @val_fctl_ftx: TX FIFO flush bitmask.
  */
-- 
2.25.1

