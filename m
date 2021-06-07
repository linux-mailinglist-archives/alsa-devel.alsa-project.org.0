Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2036139E9A2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 00:30:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6036F169D;
	Tue,  8 Jun 2021 00:29:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6036F169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623105016;
	bh=22jHY/2h/okHx2jWOJx1DPS30vVGNbKHi/I2USzxDI4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AnTa/jrrY+usmr+/FdD2BF/aadh/Z30jJknBVEQkqGwdPmahuz1wCS5NXmPN5k0Aw
	 HFD1XIO0x39hd/HmWPZQ1CAjdpLJI1MbxSlCleQZW5qXjXWcu1c4qKoZY4AlZZO9FO
	 8ZTAivfma3Rly7ooPNfW9dJRevD+/NXL8VmpEZJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61CF9F80536;
	Tue,  8 Jun 2021 00:23:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD52F80510; Tue,  8 Jun 2021 00:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A0063F80212
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 00:23:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A0063F80212
IronPort-SDR: 9xGz7mW5VLGSOkzlFpqYcVn5tauaEiENnK8Ll5XizQgGBUkB/YtvtQfVTrhtfwj1Ah0cy+rbH7
 HxE1RXwwKFLA==
X-IronPort-AV: E=McAfee;i="6200,9189,10008"; a="268581961"
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="268581961"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:15 -0700
IronPort-SDR: T3bfzk3lBK+7aBr/OS7qwonXDI+U8DCEHvYCmnMgKMaTZB5VJALVWdBpLMYtjAuWyfJXNja9oK
 Z0U6T38ItoWA==
X-IronPort-AV: E=Sophos;i="5.83,256,1616482800"; d="scan'208";a="449271019"
Received: from ticela-or-160.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.108.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2021 15:23:14 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/15] ASoC: rt711-sdca-sdw: add readable for SDW_SDCA_CTL()
 registers
Date: Mon,  7 Jun 2021 17:22:38 -0500
Message-Id: <20210607222239.582139-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
References: <20210607222239.582139-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 Ryan Lee <ryans.lee@maximintegrated.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

SDW_SDCA_CTL() registers are used but are not set to readable.

Fixes: 7ad4d237e7c4a ('ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver')
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index b84e64233d96..03cd3e0142f9 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -75,6 +75,16 @@ static bool rt711_sdca_mbq_readable_register(struct device *dev, unsigned int re
 	case 0x5b00000 ... 0x5b000ff:
 	case 0x5f00000 ... 0x5f000ff:
 	case 0x6100000 ... 0x61000ff:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU05, RT711_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU05, RT711_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_USER_FU1E, RT711_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_VOLUME, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_USER_FU0F, RT711_SDCA_CTL_FU_VOLUME, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_PLATFORM_FU44, RT711_SDCA_CTL_FU_CH_GAIN, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT711_SDCA_ENT_PLATFORM_FU44, RT711_SDCA_CTL_FU_CH_GAIN, CH_R):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_PLATFORM_FU15, RT711_SDCA_CTL_FU_CH_GAIN, CH_L):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT711_SDCA_ENT_PLATFORM_FU15, RT711_SDCA_CTL_FU_CH_GAIN, CH_R):
 		return true;
 	default:
 		return false;
-- 
2.25.1

