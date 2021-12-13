Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2823F4720BB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 06:49:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A318D18E6;
	Mon, 13 Dec 2021 06:48:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A318D18E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639374550;
	bh=fHmZUxLZKQyNgnpdUkwYq4j8U0CCyC8duIiXUapajnA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F736i2UIk02EGHWIRNQqc29QL+A2tRgRQ6HcEwBypbKQ0gwkxFLUV9NMxcNxGfHbM
	 0FUD7OsLKv1peXahKCXcgDkXjQjzFwo4rwjm6D65VBaT0laXCI8aNdvWDmAMI9rSDG
	 rjL1SmugV8Q+3ip3MqbK9kKva9kPUsT7fIxMpNqc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 287BCF80517;
	Mon, 13 Dec 2021 06:47:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 398CEF8051E; Mon, 13 Dec 2021 06:47:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD1BFF80517
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 06:47:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD1BFF80517
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="237402061"
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="237402061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:47:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,201,1635231600"; d="scan'208";a="517608194"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 21:47:02 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 6/7] soundwire: intel: remove unnecessary init
Date: Mon, 13 Dec 2021 13:46:33 +0800
Message-Id: <20211213054634.30088-7-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
References: <20211213054634.30088-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com,
 bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

cppcheck warning:

drivers/soundwire/intel.c:1487:10: style: Variable 'ret' is assigned a
value that is never used. [unreadVariable]
 int ret = 0;
         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index e946d1283892..45ea55a7d0c8 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1613,7 +1613,7 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
 	struct sdw_intel *sdw = cdns_to_intel(cdns);
 	struct sdw_bus *bus = &cdns->bus;
 	u32 clock_stop_quirks;
-	int ret = 0;
+	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
 		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-- 
2.17.1

