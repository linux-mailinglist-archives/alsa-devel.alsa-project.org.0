Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C05B885E103
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:25:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65776E7D;
	Wed, 21 Feb 2024 16:25:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65776E7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529153;
	bh=v2OUrfB05ibruSdwef5/iHstmtFCVpEQra9U5EyAw3w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NKt+ESIe20TtCSp2iqhZdrcQUDD/VSrnImJe4oC1joUAIrqtv8txhYA6J9nD3inKr
	 a4TrpxNaCKeAJSTUKBYwOpqZFGF6MTPATnQ/5OVhuLYPg4TEC5f6CNQpVVeo0HMEry
	 7fxPXNnMUpxn2RsZyGBo0ilPZpvckqVQqgbmqMFU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11666F80678; Wed, 21 Feb 2024 16:24:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1A24F8067E;
	Wed, 21 Feb 2024 16:24:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EA09F805FE; Wed, 21 Feb 2024 16:24:03 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 9393BF805D6
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9393BF805D6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B7qLGgtw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529039; x=1740065039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v2OUrfB05ibruSdwef5/iHstmtFCVpEQra9U5EyAw3w=;
  b=B7qLGgtwa8BCGiLGAHZVmcLMYNAc0aMuF1xfp/Tu9JidPGKkiowyd39n
   PWhsJSmJee1wJHtrmt4HbFjwvh6PxibpYm7HoxFksWfYvmqFAMiCjBqom
   DI0jiFkuC4qEkrjtvrj4HcAfnOAZUReKZRKyijQp/5kAY4Qt5s9QIG1AD
   n2b0W9wilnG8C45QGqkqq9xVbjj8sidQw1IYuLmFRm14m0VPCIAx2RXO9
   htA940T6yb2bY+U9IhoRQ47nBOnU/AEEj5eVAuhMxskpetaqFvotXauEv
   YoAuzvCSQVcMUji3Ry4Q1TjiTZ+kC0ikfZboPSThoHqzi+ZGKyNgAQhV5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104826"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104826"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374285"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:53 -0800
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
Subject: [PATCH 5/6] ASoC: codecs: rt5640: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:15 +0100
Message-Id: <20240221152516.852353-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LFSA3FK5IX3MQVLVGDQU6DHKCJC37BQV
X-Message-ID-Hash: LFSA3FK5IX3MQVLVGDQU6DHKCJC37BQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LFSA3FK5IX3MQVLVGDQU6DHKCJC37BQV/>
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

rt5640_set_dai_sysclk() is an example of that - clk_set_rate() is not
guarded by IS_ERR().

By utilizing _optional() variant of devm_clk_get() the driver code is
both simplified and more robust. There is no need to remember about
IS_ERR(clk) checks each time mclk is accessed.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/codecs/rt5640.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index c60894327296..c579ead0deec 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -1949,9 +1949,6 @@ static int rt5640_set_bias_level(struct snd_soc_component *component,
 		 * away from ON. Disable the clock in that case, otherwise
 		 * enable it.
 		 */
-		if (IS_ERR(rt5640->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5640->mclk);
 		} else {
@@ -2661,9 +2658,9 @@ static int rt5640_probe(struct snd_soc_component *component)
 	u32 val;
 
 	/* Check if MCLK provided */
-	rt5640->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(rt5640->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5640->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5640->mclk))
+		return PTR_ERR(rt5640->mclk);
 
 	rt5640->component = component;
 
-- 
2.25.1

