Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3B985E0F8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:25:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 579A41E2;
	Wed, 21 Feb 2024 16:24:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 579A41E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529103;
	bh=C4eam5B1/ua7yw+Vatsep/Lrr+vtYohYNHxWd27npZw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T+h07fhwkcrccRZIml44mGDWeuO37gvaNotnM7n6YxDSZ5DWMcJup9E8mNf8mXkCJ
	 TPCtBCoR1NHNIANsmn5ugl5xrqR3lhHrN42jhWgRoDw+oBop2NA+fjeTqo++ej1i++
	 1tM8IzUkCxmUlEosLmi9QnCdBGoMQQ9TMj9d2xlM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E1B2F805E4; Wed, 21 Feb 2024 16:24:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D36D3F805F7;
	Wed, 21 Feb 2024 16:24:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CA22F8057A; Wed, 21 Feb 2024 16:23:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4151F8047D
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4151F8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AfhXTYVU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529031; x=1740065031;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C4eam5B1/ua7yw+Vatsep/Lrr+vtYohYNHxWd27npZw=;
  b=AfhXTYVUQMRwIfdiyjjPBPfuuvocb+ws0A4SsS8/d+eYkOzKAA0NCfeX
   wVEN4S2csEKdym9fEElXMy6/C6yDP6+j/RYbOMErvkBq7oBCiXa4VOByp
   oaTJuxHHO0zgK9VE9E7mfDuqUaG1MEc9/AajUOkZUOpvxTmZg5EwsF/LV
   fBsO7PHE5aZ/xSTVacZgH7fNHsPOKtE5hXGJhZLAN2Sck5pJc0zeBs70L
   9F08RwRQs97zcdKkSTPqH+ylaX2XfagE8bJ3dkcxfGtUWYqz7o3sxE9Wl
   vbcA67oR+0+bvDX0UDkgTNEna8s9Dh1Do6EPbqAtQxze676lsFmydjbVb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104790"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374253"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:46 -0800
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
Subject: [PATCH 2/6] ASoC: codecs: nau8825: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:12 +0100
Message-Id: <20240221152516.852353-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3NELF7P37MG47SYS6HMEV3XQ2FIU6BZC
X-Message-ID-Hash: 3NELF7P37MG47SYS6HMEV3XQ2FIU6BZC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3NELF7P37MG47SYS6HMEV3XQ2FIU6BZC/>
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
 sound/soc/codecs/nau8825.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 5cb0de648bd3..cd30ad649bae 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2836,16 +2836,12 @@ static int nau8825_read_device_properties(struct device *dev,
 	if (nau8825->adc_delay < 125 || nau8825->adc_delay > 500)
 		dev_warn(dev, "Please set the suitable delay time!\n");
 
-	nau8825->mclk = devm_clk_get(dev, "mclk");
-	if (PTR_ERR(nau8825->mclk) == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (PTR_ERR(nau8825->mclk) == -ENOENT) {
+	nau8825->mclk = devm_clk_get_optional(dev, "mclk");
+	if (IS_ERR(nau8825->mclk))
+		return PTR_ERR(nau8825->mclk);
+	if (!nau8825->mclk)
 		/* The MCLK is managed externally or not used at all */
-		nau8825->mclk = NULL;
 		dev_info(dev, "No 'mclk' clock found, assume MCLK is managed externally");
-	} else if (IS_ERR(nau8825->mclk)) {
-		return -EINVAL;
-	}
 
 	return 0;
 }
-- 
2.25.1

