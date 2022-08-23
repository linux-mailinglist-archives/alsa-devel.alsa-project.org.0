Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D9659DCE5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 14:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB04C857;
	Tue, 23 Aug 2022 14:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB04C857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661257524;
	bh=YR+CAZitNa4VSu6phFx+2p39AJC0L9b1Ziz7GPX/Iz0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UbrTT5D3nNnyK8rwt4erZ1toBjJ2OAnWN1RfxvL+FxKTnsBAO1tClhqUVrQgQT/Hw
	 Pbo5d3rcfqfQabWhfYA06Wx+hotvhsSJ4OAxR5vC+oLouVI8NqfUCaQTFUASL3uVU4
	 eXguQbv7YOOnelYsoCYmzY14h4AbgVcD+Q/fCOLI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20721F8027B;
	Tue, 23 Aug 2022 14:24:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B30D9F8020D; Tue, 23 Aug 2022 14:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 26635F800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 14:24:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26635F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GbLQkkqN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661257458; x=1692793458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YR+CAZitNa4VSu6phFx+2p39AJC0L9b1Ziz7GPX/Iz0=;
 b=GbLQkkqNDt5ooTUW1tiEyizegUuZS4riZvXP6mBZ5kOZoADyed+keZJ7
 4LqdmYOrch3FDfu6u3ppmI/W4fxczKUE32QIGWc40mI9fqtTOYOkLkCLc
 NFwSBCXpkGN4IcptgOmHkM5BWFykEE/1eL5oKyFUSEKge2/OP42/7B06m
 wLfVEQ4h4MFRWWTvP0x423DvtMQq4JU3RUxDMrbJhQUffScyQwU/8e6uU
 k+s4smhaBWT+7kCcqp0DH4XuwOo1axQvr0wE7C/s9U54Y9rVLYVZBSqcX
 ATaLz9TOGWw+/4uBYG1FBhvPfEvkn69tvUi9ERyMVfgG9jI4j3pCQ0dhC g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="292416599"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="292416599"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:24:14 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="609327424"
Received: from mjglynn-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.28.206])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 05:24:12 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: tiwai@suse.com, pierre-louis.bossart@linux.intel.com, perex@perex.cz,
 jaska.uimonen@linux.intel.com
Subject: [PATCH] ALSA: hda: intel-nhlt: Correct the handling of fmt_config
 flexible array
Date: Tue, 23 Aug 2022 15:24:05 +0300
Message-Id: <20220823122405.18464-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

The struct nhlt_format's fmt_config is a flexible array, it must not be
used as normal array.
When moving to the next nhlt_fmt_cfg we need to take into account the data
behind the ->config.caps (indicated by ->config.size).

Fixes: a864e8f159b13 ("ALSA: hda: intel-nhlt: verify config type")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
---
 sound/hda/intel-nhlt.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 9db5ccd9aa2d..13bb0ccfb36c 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -55,16 +55,22 @@ int intel_nhlt_get_dmic_geo(struct device *dev, struct nhlt_acpi_table *nhlt)
 
 		/* find max number of channels based on format_configuration */
 		if (fmt_configs->fmt_count) {
+			struct nhlt_fmt_cfg *fmt_cfg = fmt_configs->fmt_config;
+
 			dev_dbg(dev, "found %d format definitions\n",
 				fmt_configs->fmt_count);
 
 			for (i = 0; i < fmt_configs->fmt_count; i++) {
 				struct wav_fmt_ext *fmt_ext;
 
-				fmt_ext = &fmt_configs->fmt_config[i].fmt_ext;
+				fmt_ext = &fmt_cfg->fmt_ext;
 
 				if (fmt_ext->fmt.channels > max_ch)
 					max_ch = fmt_ext->fmt.channels;
+
+				/* Move to the next nhlt_fmt_cfg */
+				fmt_cfg = (struct nhlt_fmt_cfg *)(fmt_cfg->config.caps +
+								  fmt_cfg->config.size);
 			}
 			dev_dbg(dev, "max channels found %d\n", max_ch);
 		} else {
-- 
2.37.2

