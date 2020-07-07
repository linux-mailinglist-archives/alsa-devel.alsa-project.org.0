Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA432177E6
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 21:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97CAE1672;
	Tue,  7 Jul 2020 21:25:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97CAE1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594149956;
	bh=ftiznkGhVf0jDKPK0eeSfPVmWxF7EPcySZcMur+bFTs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XMTDkbjcunA0RTT8PHBumpkjIb+Cy5eUnxF9yPY29DLsFzetX/Lz60n7FyDSDGGsn
	 x3TVti4lSESBU38ri543kf3jQup9Myg3LD4JJahIplsTh5e5iGHYbbC0eaz2xO3Djs
	 GZJ+k7u/8dk8/fMsMI3m2WQZLz/Je+5sNNwxEFfA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC5BFF802BD;
	Tue,  7 Jul 2020 21:23:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08F88F80264; Tue,  7 Jul 2020 21:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951E1F801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 21:23:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951E1F801F9
IronPort-SDR: MtCZoju1H1yxTH1EtxmM/UcpQkq6Z54JNltjFMPsVOIiEUChTytoQMblH15UasqRfAseAY4SoJ
 scU6XT3Nd08Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="145187062"
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="145187062"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:29 -0700
IronPort-SDR: K33tZHbvjJJz+antiIUzSPM8PCsbQXC/0det2ssOH3Ql+QVJxbrxSEX7yRQ07VjmGga7TrT+CC
 VjVS0Z0i/9qg==
X-IronPort-AV: E=Sophos;i="5.75,324,1589266800"; d="scan'208";a="266915978"
Received: from mrtorger-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.62])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 12:23:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: meson: axg-spdifin: remove comparison always false
 warning
Date: Tue,  7 Jul 2020 14:23:10 -0500
Message-Id: <20200707192310.98663-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
References: <20200707192310.98663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: open list <linux-kernel@vger.kernel.org>, tiwai@suse.de,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org,
 "open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>,
 Lee Jones <lee.jones@linaro.org>,
 "moderated list:ARM/Amlogic Meson SoC support"
 <linux-arm-kernel@lists.infradead.org>, Jerome Brunet <jbrunet@baylibre.com>
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

Fix W=1 warning:

sound/soc/meson/axg-spdifin.c: In function ‘axg_spdifin_write_mode_param’:
include/linux/bits.h:26:28: warning: comparison of unsigned expression
< 0 is always false [-Wtype-limits]

Cast width to an int to avoid checking if an unsigned value is lower
than zero.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/meson/axg-spdifin.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d0d09f945b48..5fa411d4e985 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -154,7 +154,7 @@ static void axg_spdifin_write_mode_param(struct regmap *map, int mode,
 	reg = offset * regmap_get_reg_stride(map) + base_reg;
 	shift = width * (num_per_reg - 1 - rem);
 
-	regmap_update_bits(map, reg, GENMASK(width - 1, 0) << shift,
+	regmap_update_bits(map, reg, GENMASK((int)width - 1, 0) << shift,
 			   val << shift);
 }
 
-- 
2.25.1

