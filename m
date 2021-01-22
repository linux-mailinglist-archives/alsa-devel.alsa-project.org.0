Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C62C2FFD15
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EFE91AB4;
	Fri, 22 Jan 2021 08:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EFE91AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299421;
	bh=dNRywSzfXvnb4tZ52bJvLf9G15SwFvB7hoRQU6gCxTk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OGT8I+pl0fl2hnf8slR3aT6vtGUIxWQDRgR7mhvYSGb/KLfNOMoZVZoGqc2NbKdor
	 ElwqN5Fd+lyXt1ls0Fqf7m/LPHv3kLvFXVEp8JlxF38krMU5Izbxz6Q6qUbRuBL5sS
	 rPiLlz2pVAB61ut0ICnFOXRrmEAdAAuPwNOpc+/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 115EEF80506;
	Fri, 22 Jan 2021 08:07:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FAA5F804EC; Fri, 22 Jan 2021 08:07:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3EEEF804E2
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:06:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3EEEF804E2
IronPort-SDR: DLEj/JUVhBDDgAxVuYl9NlOKaPZHCV9RiEFOiG9S7/ClNU1Vs/6Qc3z2yribTKqpeZPHR44m/R
 TaKpPC9nQccw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="158581071"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="158581071"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:58 -0800
IronPort-SDR: iCH+sD5cGjcAPoyFUf02Y8ojQ3vclpF/DWQwyROD/8p5HZjpTj2wXgS0O8a2ht4NYd0dnRc/vh
 67vZ22JCASaA==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="427863817"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:54 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v2 7/9] regmap: sdw-mbq: use MODULE_LICENSE("GPL")
Date: Fri, 22 Jan 2021 15:06:32 +0800
Message-Id: <20210122070634.12825-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
References: <20210122070634.12825-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org, tiwai@suse.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

"GPL v2" is the same as "GPL". It exists for historic reasons.
See Documentation/process/license-rules.rst

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 6675c3a4b829..fe3ac26b66ad 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -98,4 +98,4 @@ struct regmap *__devm_regmap_init_sdw_mbq(struct sdw_slave *sdw,
 EXPORT_SYMBOL_GPL(__devm_regmap_init_sdw_mbq);
 
 MODULE_DESCRIPTION("Regmap SoundWire MBQ Module");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
-- 
2.17.1

