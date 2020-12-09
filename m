Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2612D3AE0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Dec 2020 06:39:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED0616C8;
	Wed,  9 Dec 2020 06:38:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED0616C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607492359;
	bh=jVDr8fLhWq8DVW81JyycY3mpY0LWpghv3/pBrF+8Hos=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hjYM6hTn0AJ0zupsJUl5nN9PJuCmlqmKwRx77Np6w3hkXJUlTpdEfYKqHHGVd+rMC
	 TI2o75SVySOIe566k4+24EEkuAzyz19895bPxerxR5CQibwBXBEx2qOYRctHyXQAoe
	 kS444/6Xwq438kkg/9YN4qiN3t7pQKi2SEeCK2Hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B70DDF804F2;
	Wed,  9 Dec 2020 06:35:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 449DCF804F1; Wed,  9 Dec 2020 06:35:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EA3DF804DF
 for <alsa-devel@alsa-project.org>; Wed,  9 Dec 2020 06:35:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EA3DF804DF
IronPort-SDR: qyJFL1OUfQUKGQ7TyFxfcCtycdI+wuLnhil3giw2OUHUqDu2gYAC0LNxmNdanNVJfXuqsN1zFw
 3egF5sjRB6zQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="153259026"
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="153259026"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:32 -0800
IronPort-SDR: 6sVhimHoUq2X7jFeiif9HamdLL4aq/hpilS0JeqWr2EjVYUgRBxP5Wxwav2i2waHttAD6VGjEk
 g8F7Fb3WwxRg==
X-IronPort-AV: E=Sophos;i="5.78,404,1599548400"; d="scan'208";a="363989551"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 21:35:28 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH v2 6/9] regmap: sdw: use no_pm routines for SoundWire 1.2 MBQ
Date: Wed,  9 Dec 2020 13:34:56 +0800
Message-Id: <20201209053459.5515-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
References: <20201209053459.5515-1-yung-chuan.liao@linux.intel.com>
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

Use no_pm versions for write and read.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
---
 drivers/base/regmap/regmap-sdw-mbq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw-mbq.c b/drivers/base/regmap/regmap-sdw-mbq.c
index 8ce30650b97c..6675c3a4b829 100644
--- a/drivers/base/regmap/regmap-sdw-mbq.c
+++ b/drivers/base/regmap/regmap-sdw-mbq.c
@@ -15,11 +15,11 @@ static int regmap_sdw_mbq_write(void *context, unsigned int reg, unsigned int va
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int ret;
 
-	ret = sdw_write(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
+	ret = sdw_write_no_pm(slave, SDW_SDCA_MBQ_CTL(reg), (val >> 8) & 0xff);
 	if (ret < 0)
 		return ret;
 
-	return sdw_write(slave, reg, val & 0xff);
+	return sdw_write_no_pm(slave, reg, val & 0xff);
 }
 
 static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *val)
@@ -29,11 +29,11 @@ static int regmap_sdw_mbq_read(void *context, unsigned int reg, unsigned int *va
 	int read0;
 	int read1;
 
-	read0 = sdw_read(slave, reg);
+	read0 = sdw_read_no_pm(slave, reg);
 	if (read0 < 0)
 		return read0;
 
-	read1 = sdw_read(slave, SDW_SDCA_MBQ_CTL(reg));
+	read1 = sdw_read_no_pm(slave, SDW_SDCA_MBQ_CTL(reg));
 	if (read1 < 0)
 		return read1;
 
-- 
2.17.1

