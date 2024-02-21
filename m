Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1AB85E0F4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:24:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 94C7993A;
	Wed, 21 Feb 2024 16:24:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 94C7993A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529091;
	bh=BXL7zP4AWoU74NVuXh75FzHEXhJzzz7hn04HPQZ5I4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=emagtmJ8GdgxA81kkVDzzU+3PTPDC+0XkD/TJYE2ubIWug6uKDVrulAORlR5Y2w3W
	 /Z83RBjh3sg4CLPvo7hym7VSASP7R7pQryXF514JaFNdogLPR3wgnF831nqm1WqRUs
	 utjkNRrxoMN997xCUpG3pYh+bUjWQQMjAULNRgd8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10A80F805AF; Wed, 21 Feb 2024 16:23:59 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F4EF805D2;
	Wed, 21 Feb 2024 16:23:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44D5EF804B0; Wed, 21 Feb 2024 16:23:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7037DF8019B
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7037DF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CzuB8Nx6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529030; x=1740065030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BXL7zP4AWoU74NVuXh75FzHEXhJzzz7hn04HPQZ5I4o=;
  b=CzuB8Nx6+uvST1ZvM6/l+A92BkeFdmyVMzEliAYHSOJU+AGN+0Z+Smpe
   g/zH7TIDhIxyf83Ar2gF0GH+7JDm2+hLL7cnsMotG23tb7mkvKGCKI0yx
   C3Gx2pvNI1ksSYQzg56uoPca5w9ZiLomMOHlsUEq7FuOPrjZtZp476w6+
   eMUeOERb0/YMJz+w+WZGq4hcdRJvBxPkpYcWaPxwT9dL76n51LOD+SwR6
   /GyV7+3spBka/dMU8m5jeC4xcdQz9+o7aAgUrKRfOdzACuSxJTINu+EeM
   nU3mAhe8bOJJ383RF0dKFfVmvDdeHyvqAHpXhHZOPzHgnd8+P9QK1qkIN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104778"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104778"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374243"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:44 -0800
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
Subject: [PATCH 1/6] ASoC: codecs: da7213: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:11 +0100
Message-Id: <20240221152516.852353-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BGUS3IDUCUQR64JGDEXL5G7ZQJSF26HB
X-Message-ID-Hash: BGUS3IDUCUQR64JGDEXL5G7ZQJSF26HB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGUS3IDUCUQR64JGDEXL5G7ZQJSF26HB/>
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
 sound/soc/codecs/da7213.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 0e5c527687a2..369c62078780 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2101,18 +2101,14 @@ static int da7213_probe(struct snd_soc_component *component)
 	pm_runtime_put_sync(component->dev);
 
 	/* Check if MCLK provided */
-	da7213->mclk = devm_clk_get(component->dev, "mclk");
-	if (IS_ERR(da7213->mclk)) {
-		if (PTR_ERR(da7213->mclk) != -ENOENT)
-			return PTR_ERR(da7213->mclk);
-		else
-			da7213->mclk = NULL;
-	} else {
+	da7213->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(da7213->mclk))
+		return PTR_ERR(da7213->mclk);
+	if (da7213->mclk)
 		/* Do automatic PLL handling assuming fixed clock until
 		 * set_pll() has been called. This makes the codec usable
 		 * with the simple-audio-card driver. */
 		da7213->fixed_clk_auto_pll = true;
-	}
 
 	/* Default infinite tone gen, start/stop by Kcontrol */
 	snd_soc_component_write(component, DA7213_TONE_GEN_CYCLES, DA7213_BEEP_CYCLES_MASK);
-- 
2.25.1

