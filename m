Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D2421795E
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 22:28:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715A81689;
	Tue,  7 Jul 2020 22:28:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715A81689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594153733;
	bh=Iciy0x2awSGdZtNpAG7lCk4JXg86I/+6iAJS5vxU2vw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q5vIXFKaTPfLGdYjeNh9D4ybikKJdUjVZlR2PX35pDccOjI5XXWpflNOY5idwlYwU
	 zjVW2Qcf14Co5UWlB/NtTCyomOLbHhA8Gzs8fR3osOVtCe/bQ4N9FPeMoSVpe3kkOJ
	 g/jp26I0JyNt4z39UtercsNq+kIeXuSoCXeM52nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22943F80216;
	Tue,  7 Jul 2020 22:27:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08C4CF80216; Tue,  7 Jul 2020 22:27:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EFDEF8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 22:27:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EFDEF8011F
IronPort-SDR: bqVMzxiHc0SI+6EhgiFRU4UJ6tpfimEGBaCOcPt4bJqph4TXUQY4RTtwjquNp/yPcyOH8YMXF3
 5KZ4BfOMCFTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="127286548"
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="127286548"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:26:56 -0700
IronPort-SDR: 4XMez0CfGVlbIoNhwldnMVoWcMd8Yygej7tAp3PB03LQM4vjyggSw4n26FQDrpeTJj5NwVBetj
 b4LG0nQSEOnA==
X-IronPort-AV: E=Sophos;i="5.75,325,1589266800"; d="scan'208";a="483638417"
Received: from wli3-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.230.203])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 13:26:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] regmap: add missing dependency on SoundWire
Date: Tue,  7 Jul 2020 15:26:28 -0500
Message-Id: <20200707202628.113142-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, tiwai@suse.de,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "open list:REGISTER MAP ABSTRACTION" <linux-kernel@vger.kernel.org>,
 broonie@kernel.org
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

CONFIG_REGMAP is not selected when no other serial bus is supported.
It's largely academic since CONFIG_I2C is usually selected e.g. by
DRM, but still this can break randconfig so let's be explicit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/base/regmap/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 0fd6f97ee523..1d1d26b0d279 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SCCB || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_SOUNDWIRE || REGMAP_SCCB || REGMAP_I3C)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
-- 
2.25.1

