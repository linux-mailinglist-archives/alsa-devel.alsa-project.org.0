Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A47285E0FD
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Feb 2024 16:25:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A217683E;
	Wed, 21 Feb 2024 16:25:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A217683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708529118;
	bh=8gAZLk1t2SE3VLe9M+fDd8kW9V6hhS05RvORX1PQ8q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZNxqxUm/fOsY4qugKRr37h1EilAUnFqd5C6Z+DkIg9w6eqMgLGgiGGB94VDQqVDIg
	 MqNLlX/weecFcjC1dLLTSPSniaRW4Akxn5Ju27JuqJNaLpimXEhDbs0fmUR2JxplYK
	 G9LAepaC9Acf7hvn0va9tYRbw4lGKmlPpJSrmbo4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 52EB6F80613; Wed, 21 Feb 2024 16:24:06 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D9EF80608;
	Wed, 21 Feb 2024 16:24:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 135A8F805D7; Wed, 21 Feb 2024 16:23:59 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A0108F800ED
	for <alsa-devel@alsa-project.org>; Wed, 21 Feb 2024 16:23:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0108F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VPmpn+u0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708529036; x=1740065036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8gAZLk1t2SE3VLe9M+fDd8kW9V6hhS05RvORX1PQ8q8=;
  b=VPmpn+u0ySt09n7ZnCpybz9CYBZ0wJi3/uL491kzeWkyxRAnjucumccm
   Cy3koTu4xuE4hvxkPElMMTglVwT9j/1iQ7qZFRFnHs4hTCleriPsxQzEW
   79VrZo+27dOtmT/arqa5qNojFEHH5xwBPK2PcJcwvkaU9ac5gbI3+gj0d
   SPIWujqBWElBfbn/BBtcRv1z6AIZz/dDpUqpK6NhsAoENTvZzDnVs54kr
   Kbn9Y6tHpbevW+cyoLZ5G+2NBS7tCPITLudlTylG+M5dRcscNaKc+49HB
   05IKKg+38cncniSc+NYJ6a06Wm286X2rM7ASH5q14QO5DtY2NX9RfuLlv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14104802"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="14104802"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 07:23:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000";
   d="scan'208";a="5374265"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa006.fm.intel.com with ESMTP; 21 Feb 2024 07:23:48 -0800
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
Subject: [PATCH 3/6] ASoC: codecs: rt5514: Simplify mclk initialization
Date: Wed, 21 Feb 2024 16:25:13 +0100
Message-Id: <20240221152516.852353-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240221152516.852353-1-cezary.rojewski@intel.com>
References: <20240221152516.852353-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O2KUM2W3G3YAMPEQOISEGM7Q6D22QPSP
X-Message-ID-Hash: O2KUM2W3G3YAMPEQOISEGM7Q6D22QPSP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O2KUM2W3G3YAMPEQOISEGM7Q6D22QPSP/>
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
 sound/soc/codecs/rt5514.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 43fc7814fdde..a8cdc3d6994d 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1054,9 +1054,6 @@ static int rt5514_set_bias_level(struct snd_soc_component *component,
 
 	switch (level) {
 	case SND_SOC_BIAS_PREPARE:
-		if (IS_ERR(rt5514->mclk))
-			break;
-
 		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_ON) {
 			clk_disable_unprepare(rt5514->mclk);
 		} else {
@@ -1097,9 +1094,9 @@ static int rt5514_probe(struct snd_soc_component *component)
 	struct platform_device *pdev = container_of(component->dev,
 						   struct platform_device, dev);
 
-	rt5514->mclk = devm_clk_get(component->dev, "mclk");
-	if (PTR_ERR(rt5514->mclk) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	rt5514->mclk = devm_clk_get_optional(component->dev, "mclk");
+	if (IS_ERR(rt5514->mclk))
+		return PTR_ERR(rt5514->mclk);
 
 	if (rt5514->pdata.dsp_calib_clk_name) {
 		rt5514->dsp_calib_clk = devm_clk_get(&pdev->dev,
-- 
2.25.1

