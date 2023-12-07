Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8145809570
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Dec 2023 23:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D3A6206;
	Thu,  7 Dec 2023 23:34:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D3A6206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701988470;
	bh=lpuPhI2tpB9IQsCXtoONYV6zah6M9dPvl1Rlo707E0M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qrrrZxmKqZHbihjCJnhM/AOC2XlsRALMES3+5FT2DciUv7YJMziyRc9ZON4U2SNas
	 PxmagkCCEFVsQfmPRl3Og8qWep9rN84KGfzDsW3Y5Iuh5jD1EUphpK/DxyIvyQYllb
	 w32BaQ2V4jUzeMWEFbUH/oo+f50dbhDstmkyXHfE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66F6EF80603; Thu,  7 Dec 2023 23:31:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2DADF805F3;
	Thu,  7 Dec 2023 23:31:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 939F8F8025F; Thu,  7 Dec 2023 23:31:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9842CF800E4
	for <alsa-devel@alsa-project.org>; Thu,  7 Dec 2023 23:30:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9842CF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Br5c612U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988228; x=1733524228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lpuPhI2tpB9IQsCXtoONYV6zah6M9dPvl1Rlo707E0M=;
  b=Br5c612UU/VMw7kPAgk77kQZ3owCxOYTc0BEoOjgybhY0/xBqjoGKVHC
   gZbwjlSsDMEvciondP/1+b9Nmd69TgdjGmkyaJivGNdTJEkLkTDn2gcWo
   AyQpSWItLDemuOlaoP//SR8mqvu1NeQ4YjRHPLKauwYiqHQN2DTEjqQWo
   NXiH6OsFq25S9HGTSDQ+gXpC7D9wV4InszZjdMuoszJz1viwQLGl5l56t
   THCUCdAnbNSOk9lK6zWc5j73XeWhwDRpl409XnLxIICyfT61a+UBO7mCf
   jMAFs9Xa1lU22CcrFepM8QafTs6BG3GGF1shYqO/UYWRi2uUuksDBVHJW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516715"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="480516715"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307523"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600";
   d="scan'208";a="895307523"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 14:30:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 16/16] ASoC: rt711-sdca: add DP0 support
Date: Thu,  7 Dec 2023 16:29:44 -0600
Message-Id: <20231207222944.663893-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U6S4ZTVJ6MJONIVZK3V5WAWBO6LJRHCS
X-Message-ID-Hash: U6S4ZTVJ6MJONIVZK3V5WAWBO6LJRHCS
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6S4ZTVJ6MJONIVZK3V5WAWBO6LJRHCS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

DP0 is required for BPT/BRA transport.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 935e597022d3..583c839e0e49 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -225,6 +225,14 @@ static int rt711_sdca_read_prop(struct sdw_slave *slave)
 		j++;
 	}
 
+	prop->dp0_prop = devm_kzalloc(&slave->dev, sizeof(*prop->dp0_prop),
+				      GFP_KERNEL);
+	if (!prop->dp0_prop)
+		return -ENOMEM;
+
+	prop->dp0_prop->simple_ch_prep_sm = true;
+	prop->dp0_prop->ch_prep_timeout = 10;
+
 	/* set the timeout values */
 	prop->clk_stop_timeout = 700;
 
-- 
2.39.2

