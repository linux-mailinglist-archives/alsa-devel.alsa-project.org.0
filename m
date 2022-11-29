Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA5F63C6E7
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Nov 2022 18:58:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68D51169F;
	Tue, 29 Nov 2022 18:58:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68D51169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669744731;
	bh=5SnK0iQEgA0hVbmUtHkFlKw/ZIpQPvI3f4njotN6yxk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOvm7PtNCThGDMzF/RKT8bY/QLjJLktQwtTEssJc2dXkJAGPQIXNyVp+ssgyUsf63
	 PoMs4IrsXGeqWIvsNS+9Xlqh8Xkm/SvSZ9M/SvDRjJ1NHvFO2DGWEGgAbi572KWowB
	 uV45qy35bTK8xZqhN/i5MODfPUX2wLoA1MkCJrzA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F212F801F5;
	Tue, 29 Nov 2022 18:57:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C02F80559; Tue, 29 Nov 2022 18:57:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5A54F801F5
 for <alsa-devel@alsa-project.org>; Tue, 29 Nov 2022 18:57:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5A54F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GRitzY5H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669744647; x=1701280647;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5SnK0iQEgA0hVbmUtHkFlKw/ZIpQPvI3f4njotN6yxk=;
 b=GRitzY5H4y59zl5JPx2bLTYwxGxWMaFqQttYj04/76b9eASbHuELyAuR
 DZBV0piAO900Qmqz4fexcYHS6LbKiRUS70DGhTU3ZU7ykPCvY58wyaMqv
 89ObDONdkuHFlCR3a3KgqEaPu2D/5KQdbjCxMHzhWuZX5LQTbRhmik9Bj
 NfOeH2HN722tr/CcrcWt6YcPJv80santqRd1PwXz2H9LSn6avXFsMrBRF
 xQKi0XrOwr4KniAdj5i/iUK72659nxTkil8mtLaECTMG27hI7hTGsMd0h
 i9IQOl6iOjoBK6VEb2Rzj+OZJtIWNyiwg07rsBJ3uHsxJ91XBHL1hktdo A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="377343615"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="377343615"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2022 09:50:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="645996085"
X-IronPort-AV: E=Sophos;i="5.96,204,1665471600"; d="scan'208";a="645996085"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2022 09:50:36 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: Intel: avs: rt5682: Add define for codec DAI name
Date: Tue, 29 Nov 2022 19:07:37 +0100
Message-Id: <20221129180738.2866290-2-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221129180738.2866290-1-cezary.rojewski@intel.com>
References: <20221129180738.2866290-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

Following commits will make use of it to find codec DAI, define it
first.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/boards/rt5682.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 01f9b9f0c12b..7c86c8c69dbd 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -26,6 +26,7 @@
 #define AVS_RT5682_SSP_CODEC_MASK	(GENMASK(2, 0))
 #define AVS_RT5682_MCLK_EN		BIT(3)
 #define AVS_RT5682_MCLK_24MHZ		BIT(4)
+#define AVS_RT5682_CODEC_DAI_NAME	"rt5682-aif1"
 
 /* Default: MCLK on, MCLK 19.2M, SSP0 */
 static unsigned long avs_rt5682_quirk = AVS_RT5682_MCLK_EN | AVS_RT5682_SSP_CODEC(0);
@@ -184,7 +185,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 
 	dl->cpus->dai_name = devm_kasprintf(dev, GFP_KERNEL, "SSP%d Pin", ssp_port);
 	dl->codecs->name = devm_kasprintf(dev, GFP_KERNEL, "i2c-10EC5682:00");
-	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, "rt5682-aif1");
+	dl->codecs->dai_name = devm_kasprintf(dev, GFP_KERNEL, AVS_RT5682_CODEC_DAI_NAME);
 	if (!dl->cpus->dai_name || !dl->codecs->name || !dl->codecs->dai_name)
 		return -ENOMEM;
 
-- 
2.25.1

