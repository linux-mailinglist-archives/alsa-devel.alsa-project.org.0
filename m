Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A7521A4C2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jul 2020 18:27:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE9801674;
	Thu,  9 Jul 2020 18:26:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE9801674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594312056;
	bh=1ZmAm7X8/NyBnbWIcnH8DlIoZrRM85vBDwY/AcVhSh4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgkSlP1I5jnrhD13nqhKW61pwqvHXGShgxMSzip+EB5pyGHW0TJqIeNXXJMjEiB8R
	 1Z4NYwallQ376AF4E6xZoSmUUhnwzGpYItDpPhQ9kKRIN5SwIqp6+kalLkm3rt3Tms
	 oYRADoV9kt4IN+28VuN8skxQ1XVvdvOfGiU2LFgo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68958F802E0;
	Thu,  9 Jul 2020 18:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5FB5AF802C2; Thu,  9 Jul 2020 18:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE753F80255
 for <alsa-devel@alsa-project.org>; Thu,  9 Jul 2020 18:23:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE753F80255
IronPort-SDR: sf4bkBN0nfLaA/0/2Z2kvwzH2zN09cDCw4LlPoaEGy4S5UhqxOzpwXFSdevxRtfKAaH5LVyhLE
 WC9fQWOIg52g==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="149515623"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="149515623"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:47 -0700
IronPort-SDR: 7M/IjOs4vMcHmD2Fn3KPLM6GFnojEObAH9GKgFvIPoLMhdGwtqFlUCx7IYLE4NXPqTewOoviBw
 72LyqxJptXTw==
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="280352985"
Received: from mdcoakle-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.231.43])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 09:23:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v4 03/10] ASoC: sunxi: sun4i-i2s: add missing clock and format
 arguments in kernel-doc
Date: Thu,  9 Jul 2020 11:23:20 -0500
Message-Id: <20200709162328.259586-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
References: <20200709162328.259586-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marcus Cooper <codekipper@gmail.com>, tiwai@suse.de,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
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

Fix W=1 warnings - missing fields in description

sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or
 member 'bclk_dividers' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'num_bclk_dividers' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'mclk_dividers' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'num_mclk_dividers' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'get_bclk_parent_rate' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'get_sr' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'get_wss' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'set_chan_cfg' not described in 'sun4i_i2s_quirks'
sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member
'set_fmt' not described in 'sun4i_i2s_quirks'

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrea Venturi <be17068@iperbole.bo.it>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d0a8d5810c0a..f23ff29e7c1d 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -128,13 +128,21 @@ struct sun4i_i2s;
 
 /**
  * struct sun4i_i2s_quirks - Differences between SoC variants.
- *
  * @has_reset: SoC needs reset deasserted.
  * @reg_offset_txdata: offset of the tx fifo.
  * @sun4i_i2s_regmap: regmap config to use.
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
  * @field_fmt_wss: regmap field to set word select size.
  * @field_fmt_sr: regmap field to set sample resolution.
+ * @bclk_dividers: bit clock dividers array
+ * @num_bclk_dividers: number of bit clock dividers
+ * @mclk_dividers: mclk dividers array
+ * @num_mclk_dividers: number of mclk dividers
+ * @get_bclk_parent_rate: callback to get bclk parent rate
+ * @get_sr: callback to get sample resolution
+ * @get_wss: callback to get word select size
+ * @set_chan_cfg: callback to set channel configuration
+ * @set_fmt: callback to set format
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
-- 
2.25.1

