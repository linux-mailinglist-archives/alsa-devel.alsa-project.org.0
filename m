Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED57985E108
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:26:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E00074C;
	Wed, 21 Feb 2024 16:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E00074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529174;
	bh=gzcWGNL38cfVL/MuMfhSxMmLpqdQ1ceJameavm9K4g8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GnQe1TqyQl2tN10SwhvUbw/psqEq+DJo0Nb9TuOl4nLk9KQAphUiEFz3Jla2Z92Iw
	 kg4aC8Pkk8td1JPULfmiL6N3fimFBWXs1EdZP2O7xmQY5/aMZY+CWppxaZ0E5WaEC/
	 fziFlNRwWN7zxMRnfqyynjQf7anP6c1ixIiUWR1k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDFCBF806A1; Wed, 21 Feb 2024 16:24:28 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A0C1F80587;
	Wed, 21 Feb 2024 16:24:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D087F8057D; Wed, 21 Feb 2024 16:24:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3A104F805C5
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3A104F805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A32p+zMR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529040; x=1740065040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gzcWGNL38cfVL/MuMfhSxMmLpqdQ1ceJameavm9K4g8=;
  b=A32p+zMRl4AML/hFsoHdXFgwyTFnj+JdyB7te1astnfovk3a8OkllBmi
   cIY4JZf7SKOD4NLuWiLNNiDIalO2Tm04lNfQxDUAZG67CASt93r86mG6X
   1NJPXgAgCOzJclntOAocOlSIDfsCYKVQYTB5mlcdnBKLbKWAzW32zdHVo
   wUXDEHeZZYo2nv0mI+rQGqy76bO7wiQ//a7PGOmiyanD8PF8bzYQqrXDs
   5iShfr7kg88bi706E+zaPSkvM17jaP7ZndPNYmqt3Bq6/mt9sB29LPaZH
   p0jRjZKx7PSX4HM8q8lpxgxQzAdxVVfdHzK7jKImGaLVG6Y3ZrFUYmaJ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104833"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104833"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374293"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:55 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/6] ASoC: codecs: rt5660: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:16 +0100
Message-Id: <20240221152516.852353-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQLXL4TSKJ7XAJRP5FMLGM7TAA5IH2YQ
X-Message-ID-Hash: DQLXL4TSKJ7XAJRP5FMLGM7TAA5IH2YQ
X-MailFrom: cezary.rojewski@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DQLXL4TSKJ7XAJRP5FMLGM7TAA5IH2YQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Most of clk_xxx() functions do check if provided clk-pointer is
non-NULL. These do not check if the pointer is an error-pointer.
Providing such to a clk_xxx() results in a panic.

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5660.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 0cecfd602415..d5c2f0f2df98 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1079,9 +1079,6 @@ static int rt5660_set_bias_level(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5660_GEN_CTRL1,
 			RT5660_DIG_GATE_CTRL, RT5660_DIG_GATE_CTRL);
 
-		if (IS_ERR(rt5660->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5660->mclk);
 		} else {
@@ -1277,9 +1274,9 @@ static int rt5660_i2c_probe(struct i2c_client *i2c)
 		return -ENOMEM;
 
 	/* Check if MCLK provided */
-	rt5660->mclk = devm_clk_get(&i2c->dev, "mclk");
-	if (PTR_ERR(rt5660->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5660->mclk = devm_clk_get_optional(&i2c->dev, "mclk");
+	if (IS_ERR(rt5660->mclk))
+		return PTR_ERR(rt5660->mclk);
 
 	i2c_set_clientdata(i2c, rt5660);
 
-- 
2.25.1

