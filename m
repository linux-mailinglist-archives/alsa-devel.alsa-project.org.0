Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B547321A4CA
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CDFA15E5;
	Thu,  9 Jul 2020 18:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CDFA15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312138;
	bh=quFN/HSq1LW3e7z3AaoyomYTgIOjRtb18lwycXqbR8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cdgoI8iFwUrYIuLzUc/oT81xyr2rYe01klJsYzQflIQBjMp3SM9p6JNifA6q3RcA0
	 U3976HJgjnpHkZrCosHdcBwWbUOM1Jxxzx3ZMZ4CfOqNUt1c4aJiru28L+iTZ6c1vy
	 3B9JI+iT57ssrM3IjanTEi3+T9DEP1+1BN27PBGk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3252AF802E9;
	Thu,  9 Jul 2020 18:24:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8FDAF801F9; Thu,  9 Jul 2020 18:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77C02F801F9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:23:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77C02F801F9
IronPort-SDR: astZsyFPKclbkD303vQOT3pXzvxdGHLAKeUwHgEpWe2mqBJ/G6TpyduJnOvDU/0NpJB7X1ieFx
 O60Eq5zDdw/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515628"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515628"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:50 -0700
IronPort-SDR: pswgdssBsdjhpR9s3EMfVR7eiHfvTqy2PUcikqR28hY441p0jAaWFdm3r9A6B1hTIc/wwfTA5w
 t2gU/2QN4d3w==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280353001"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 04/10] ASoC: sunxi: sun4i-spdif: Fix misspelling of
 'reg_dac_txdata' in kernel-doc
Date: Thu,  9 Jul 2020 11:23:21 -0500
Message-Id: <20200709162328.259586-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rob Herring <robh@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Stephen Boyd <sboyd@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 tiwai@suse.de, open list <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andrea Venturi <be17068@iperbole.bo.it>, Chen-Yu Tsai <wens@csie.org>,
 broonie@kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>,
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

From: Lee Jones <lee.jones@linaro.org>

Property name descriptions need to match exactly.

Fixes the following W=1 kernel build warning(s):

sound/soc/sunxi/sun4i-spdif.c:178: warning: Function parameter or
member 'reg_dac_txdata' not described in 'sun4i_spdif_quirks'

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrea Venturi <be17068@iperbole.bo.it>
Cc: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
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

