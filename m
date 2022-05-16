Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B957528169
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA9AE1687;
	Mon, 16 May 2022 12:04:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA9AE1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652695537;
	bh=Roci/Ld+P6cEXh6JcQrkI/gmeigQ41mdYu/uLQ4ho6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vUXAkQy6pYKNPaFJ3TD0oK2qyUMsGiIR6xR376rZgNemevDI4Y+NtzuygdiopRPie
	 8q7PamtR/nLWhmeg7BPYNunOMLuayqV/7lFe4rErgPsC73i4gHI7oOROeiAFnv2mgh
	 hEI71H5yknRY3aNY+F76dRIAcrcQ9d4qirFXCD0c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4263EF80557;
	Mon, 16 May 2022 12:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F390BF8052F; Mon, 16 May 2022 12:02:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E1C3F8052D
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E1C3F8052D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="VlJLdAiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652695337; x=1684231337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Roci/Ld+P6cEXh6JcQrkI/gmeigQ41mdYu/uLQ4ho6Y=;
 b=VlJLdAiT8ZiROrFNRqZ6yYyzKrH6uknNvQu6wvsmTGrmiS+zgzLFo5Cz
 Or+l4UHH4u9WxiGLTf8RnkPhur1p0xNEMsbcZcHDyuXzxoIQpuC1GN2KS
 ekPoE2t/xj/HMOY3OkgIfUE/U/67JC7gFMS4eIfpOEtckoV7v5llP7G1m
 YdayBrrS3XtXP7cZL8iImKJpcLG+gNPfXaGQ+LVkdHXh6SdLKNmKL6oWK
 rX5+fELueFpVpDzt9irEk+4YIh7YATn6exKdD7CFpg4CUi+K7J7Z+cgsr
 cn2quf8Iz3Q/kT+PooMSWUVJcdIi0o+dvvkC1Ge9qAd+GlYtMH7jY/s+m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333846346"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333846346"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:02:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="522382657"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 16 May 2022 03:02:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 10/15] ASoC: Intel: avs: Replace link_mask usage with
 i2s_link_mask
Date: Mon, 16 May 2022 12:11:11 +0200
Message-Id: <20220516101116.190192-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220516101116.190192-1-cezary.rojewski@intel.com>
References: <20220516101116.190192-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 rad@semihalf.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com,
 Piotr Maziarz <piotrx.maziarz@linux.intel.com>, cujomalainey@chromium.org,
 lma@semihalf.com
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

From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>

'link_mask' field is intended for SoundWire, I2S should use
'i2s_link_mask' instead.

Signed-off-by: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/topology.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/topology.c b/sound/soc/intel/avs/topology.c
index 4ea799658ed9..0d11cc8aab0b 100644
--- a/sound/soc/intel/avs/topology.c
+++ b/sound/soc/intel/avs/topology.c
@@ -381,11 +381,11 @@ static int parse_link_formatted_string(struct snd_soc_component *comp, void *ele
 	 * Dynamic naming - string formats, e.g.: ssp%d - supported only for
 	 * topologies describing single device e.g.: an I2S codec on SSP0.
 	 */
-	if (hweight_long(mach->link_mask) != 1)
+	if (hweight_long(mach->mach_params.i2s_link_mask) != 1)
 		return avs_parse_string_token(comp, elem, object, offset);
 
 	snprintf(val, SNDRV_CTL_ELEM_ID_NAME_MAXLEN, tuple->string,
-		 __ffs(mach->link_mask));
+		 __ffs(mach->mach_params.i2s_link_mask));
 
 	return 0;
 }
@@ -1350,8 +1350,8 @@ static int avs_route_load(struct snd_soc_component *comp, int index,
 	u32 port;
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
-	if (hweight_long(mach->link_mask) == 1) {
-		port = __ffs(mach->link_mask);
+	if (hweight_long(mach->mach_params.i2s_link_mask) == 1) {
+		port = __ffs(mach->mach_params.i2s_link_mask);
 
 		snprintf(buf, len, route->source, port);
 		strncpy((char *)route->source, buf, len);
@@ -1382,10 +1382,10 @@ static int avs_widget_load(struct snd_soc_component *comp, int index,
 	mach = dev_get_platdata(comp->card->dev);
 
 	/* See parse_link_formatted_string() for dynamic naming when(s). */
-	if (hweight_long(mach->link_mask) == 1) {
+	if (hweight_long(mach->mach_params.i2s_link_mask) == 1) {
 		kfree(w->name);
 		/* w->name is freed later by soc_tplg_dapm_widget_create() */
-		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->link_mask));
+		w->name = kasprintf(GFP_KERNEL, dw->name, __ffs(mach->mach_params.i2s_link_mask));
 		if (!w->name)
 			return -ENOMEM;
 	}
-- 
2.25.1

