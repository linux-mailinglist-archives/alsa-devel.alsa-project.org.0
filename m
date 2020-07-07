Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D012177CA
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:19:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB0CD167B;
	Tue,  7 Jul 2020 21:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB0CD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149550;
	bh=wqRtemSK63yWKf+bKI8+BOHbYmk8ppQRPlzCNQaa2sU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JtBY/e1TuKajcBRdoDyiidZ3Ge04BEzITf1iWreJ+r4fRRaIH0HHRTFWizEUxfo++
	 nHTGObpRJtW1YygdL6UpfIMKgXd6GKE92st3528FC1W3kCHeyFNYsIOuAUydjk+yXv
	 hsXV/U8MztI1XEN/VEl17YAHoZ8yOiYWPbIVnaQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B63AFF8011F;
	Tue,  7 Jul 2020 21:16:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AF78F802A9; Tue,  7 Jul 2020 21:16:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D114CF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:16:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D114CF801F9
IronPort-SDR: peWNZscaYMLyMGItm3zb0QuZCC4x36SH2H1E8vp1rvZMP2how5TSTVaJ5lyzsVOadfTwiR9fHg
 Z1nsXMviIngw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="147690679"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="147690679"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:16:34 -0700
IronPort-SDR: Mrh8mRHyFds+T1m32396SgIrB0QyGje5PilUBFte6R4jkDcYUEOJq5tmWWj2oQfBw036N6Ru6f
 SM09mqr0DF+Q==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="388601621"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:16:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3 03/10] ASoC: sunxi: sun4i-spdif: fix kernel-doc
Date: Tue,  7 Jul 2020 14:16:08 -0500
Message-Id: <20200707191615.98296-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 broonie@kernel.org, Lee Jones <lee.jones@linaro.org>,
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

