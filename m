Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A362FFD12
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 08:09:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 001091AB4;
	Fri, 22 Jan 2021 08:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 001091AB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611299351;
	bh=JLevd7qVEkkTeILzLBTaDtY9PASF2nusC/uMlueYsW0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HHqxLlJp6zZ1fKha/K+1qqWUYzFQDq9RePKHwamFliFW0fbhIRvQi3JnzBYV8UlVu
	 VWC50GSf9lCPsdABR3Dm3oxk52Lxn/IvD7u0s1g6d3v/H7wXd7mgToAnSS4N9Bi+8F
	 DyY0sA0MqvQWn3gSPrrC4RiE9Ej9jIPuEQr5gxjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D4F0F804E1;
	Fri, 22 Jan 2021 08:07:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65C5BF804D2; Fri, 22 Jan 2021 08:06:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 73F3BF804C2
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 08:06:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73F3BF804C2
IronPort-SDR: 8j+h7vEkuJRIH0qJmcBs+n/FdflhnRgdW5S1DcT/zpD0lE6Oq3Dddcl0bm23Ve0l23UX1+PCkv
 oESFzheafJnw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="158581064"
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="158581064"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:51 -0800
IronPort-SDR: zctXTqIqtrMiJykXZZRmoEmGdTrS0YAR1L6O4CreQbfW/f84tn83kF8JhqH7TRURLOsrTMWshX
 T0hOhJ0y406w==
X-IronPort-AV: E=Sophos;i="5.79,366,1602572400"; d="scan'208";a="427863648"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2021 23:06:47 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [RESEND PATCH v2 5/9] regmap: sdw: use _no_pm functions in
 regmap_read/write
Date: Fri, 22 Jan 2021 15:06:30 +0800
Message-Id: <20210122070634.12825-6-yung-chuan.liao@linux.intel.com>
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

sdw_update_slave_status will be invoked when a codec is attached,
and the codec driver will initialize the codec with regmap functions
while the codec device is pm_runtime suspended.

regmap routines currently rely on regular SoundWire IO functions,
which will call pm_runtime_get_sync()/put_autosuspend.

This causes a deadlock where the resume routine waits for an
initialization complete signal that while the initialization complete
can only be reached when the resume completes.

The only solution if we allow regmap functions to be used in resume
operations as well as during codec initialization is to use _no_pm
routines. The duty of making sure the bus is operational needs to be
handled above the regmap level.

Fixes: 7c22ce6e21840 ('regmap: Add SoundWire bus support')
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/base/regmap/regmap-sdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regmap-sdw.c b/drivers/base/regmap/regmap-sdw.c
index c92d614b4943..4b8d2d010cab 100644
--- a/drivers/base/regmap/regmap-sdw.c
+++ b/drivers/base/regmap/regmap-sdw.c
@@ -11,7 +11,7 @@ static int regmap_sdw_write(void *context, unsigned int reg, unsigned int val)
 	struct device *dev = context;
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 
-	return sdw_write(slave, reg, val);
+	return sdw_write_no_pm(slave, reg, val);
 }
 
 static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
@@ -20,7 +20,7 @@ static int regmap_sdw_read(void *context, unsigned int reg, unsigned int *val)
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	int read;
 
-	read = sdw_read(slave, reg);
+	read = sdw_read_no_pm(slave, reg);
 	if (read < 0)
 		return read;
 
-- 
2.17.1

