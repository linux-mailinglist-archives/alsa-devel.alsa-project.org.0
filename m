Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E098E1A39F1
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:47:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EE9B16A8;
	Thu,  9 Apr 2020 20:46:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EE9B16A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458033;
	bh=a96EFOApqYfM86h9kPMYOJ18uZaYaIX6/jHeVoe9/uk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RWsv/KT+wc84coHtKDZth3YKmrfAzFF/aNhRiqKlr4MFsEzv2SdRRIEc1rJhYJWrJ
	 miwtDD/+cD0rWbmWWWyOMP+AuN+zeg2Z4rzIqk+oWGRsRjo0bjSB2r1qfnaF0x9itX
	 S2O0PxzMrOxckdhlgMPMcUpdxUFf+6BokTJW+PDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 934A1F800CB;
	Thu,  9 Apr 2020 20:44:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6C066F801D8; Thu,  9 Apr 2020 20:44:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21065F801D8
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:44:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21065F801D8
IronPort-SDR: Qw0EXld9g+1KsvyV95jDsQwBTKTzCobt8jzVTfMofh/dMDUKbyJPwcWw7PP4YGEVa9afC2dqi/
 0N2ADUW7BMWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:44:31 -0700
IronPort-SDR: fvZTBeO25t8sbkK/qX/WlJvxu0uxgC/aCc8hQyD7jTJp6D0ofoa+PYgqPEpHxC/nG1gPSWETN1
 fWmXxjSQjuqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="251981335"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 11:44:30 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: codecs: rt1308-sdw: reduce verbosity
Date: Thu,  9 Apr 2020 13:44:13 -0500
Message-Id: <20200409184416.15591-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409184416.15591-1-pierre-louis.bossart@linux.intel.com>
References: <20200409184416.15591-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

These messages are generated at each enumeration, this is
overkill. Move to dev_dbg

[   86.481709] rt1308 sdw:1:25d:1308:0: rt1308_io_init m_btl_l=0xffee, m_btl_r=0xffff
[   86.481714] rt1308 sdw:1:25d:1308:0: rt1308_io_init c_btl_l=0x28c, c_btl_r=0x113

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt1308-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index a5a7e46de246..1502a22b0d4a 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -235,9 +235,9 @@ static int rt1308_io_init(struct device *dev, struct sdw_slave *slave)
 	efuse_c_btl_r = tmp;
 	regmap_read(rt1308->regmap, 0xc872, &tmp);
 	efuse_c_btl_r = efuse_c_btl_r | (tmp << 8);
-	dev_info(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
+	dev_dbg(&slave->dev, "%s m_btl_l=0x%x, m_btl_r=0x%x\n", __func__,
 		efuse_m_btl_l, efuse_m_btl_r);
-	dev_info(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
+	dev_dbg(&slave->dev, "%s c_btl_l=0x%x, c_btl_r=0x%x\n", __func__,
 		efuse_c_btl_l, efuse_c_btl_r);
 
 	/* initial settings */
-- 
2.20.1

