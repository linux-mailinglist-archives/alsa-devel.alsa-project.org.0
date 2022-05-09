Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8751F748
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 10:52:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98CB818E6;
	Mon,  9 May 2022 10:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98CB818E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652086353;
	bh=Roci/Ld+P6cEXh6JcQrkI/gmeigQ41mdYu/uLQ4ho6Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NZD/f+8Ux4bFWQ0Y2cuRk4wFH7bJjA57dzxpRQjhwot0mR9V7S1gFOydBdZg9qnQ5
	 647if9pylTZInDdXeTQszM8bN5szeawB9OKInZcaKD1k81GAvpgMUyeDdDBEt7uK9f
	 jbzJ0JrowVt8I94dAv2PdngTD6fc0CNxqeAl4GZA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F292F8056F;
	Mon,  9 May 2022 10:49:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E25AAF80567; Mon,  9 May 2022 10:49:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D12EF80533
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 10:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D12EF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jka6ObuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652086151; x=1683622151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Roci/Ld+P6cEXh6JcQrkI/gmeigQ41mdYu/uLQ4ho6Y=;
 b=jka6ObuGiTN5T+nWh2uqbtx3r8cvSQ/TOWOtnM2kwAaiARx6Tpr+lYz7
 ieS+4sS+Y7YmDRo9nuo231db42FORzWD3BEv2i2j2pReorPS4Cqlk5eKK
 xPwrqbSnPhZJ3XbQZP3sD4vlsxjBV7Ky0UvpQa7IaTFluObhMapWv5dz7
 N1D4MlxeofxqMbKTYuF8MjUG2PUXe9KYBghNk73vpQ/4v8ZN5pxVZErGx
 QmkQJfPDvlT+cUR88zkfcyGUoN/HR/m3gi0J7TxaylPQnhxbloIWnxVO5
 7+nZ4GNkCBfmliI8hvRracpfgRFRogutEPuCx1eH+XYy+5MWBpQ/nfDEM w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294208602"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="294208602"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 01:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; d="scan'208";a="738068436"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga005.jf.intel.com with ESMTP; 09 May 2022 01:49:05 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 10/15] ASoC: Intel: avs: Replace link_mask usage with
 i2s_link_mask
Date: Mon,  9 May 2022 10:58:16 +0200
Message-Id: <20220509085821.3852259-11-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509085821.3852259-1-cezary.rojewski@intel.com>
References: <20220509085821.3852259-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, upstream@semihalf.com,
 harshapriya.n@intel.com, rad@semihalf.com,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com,
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

