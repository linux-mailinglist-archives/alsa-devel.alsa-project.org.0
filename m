Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C8B545A28
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 04:37:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A3E020DC;
	Fri, 10 Jun 2022 04:36:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A3E020DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654828661;
	bh=JbfVyJIpKWWl8KF3OlHEusSCn78ZocgcBg7L63EI6as=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dnHc6Lo0h4DqnowNADQXApw1I+blBI1VI2IIEzvdEZyoeDxNmadV9mhdGMlaHN+q9
	 m2z/cl+RpDNi7Ox4WSHGRNNmnwC/6bQy9NeJapfppZedUXARcSfBi5EA+i/0J6QG+Z
	 JKv3/9BzZAA53PhezC1LENnqYjdf42ouaAqwT1xg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58552F80520;
	Fri, 10 Jun 2022 04:36:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4676AF80515; Fri, 10 Jun 2022 04:36:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7D7CF800E5
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 04:36:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7D7CF800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yk0+4ESd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654828566; x=1686364566;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JbfVyJIpKWWl8KF3OlHEusSCn78ZocgcBg7L63EI6as=;
 b=Yk0+4ESdI+PQJtqPLoffi9J8o4WzuIKyBDy5oS4ZW+/ZD//4Z5+2igRu
 k4uWFnIXi4+0tydgDedNWZMdq3D2zxmoHLGi3WbjZu82tAydxiA1hF9Um
 dP4cLKQu4uEVPQKJBNk7zdPDRwfdblM4Kv9H/TDZE8Uoo05C87hKf5QW7
 Wdhl7G72Qp0HQ6kg7ktMaIS4neTo8dNt6P8Lw1VQqiv8UZarhYOENM7W2
 RV2na0vLySl0yynWB9TPxIuh4yCiH1yWg0tyEYYs1QY43muRR2AyqQuhk
 RdYQOZonW75/MJxPTXOGHV6flwVOSRouOWZ5OsCA+K6TZ4VwxmYpqAz6w g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="266258663"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="266258663"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 19:35:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="637874955"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 19:35:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH 1/2] soundwire: intel: uniquify debug message
Date: Fri, 10 Jun 2022 10:35:36 +0800
Message-Id: <20220610023537.27223-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
References: <20220610023537.27223-1-yung-chuan.liao@linux.intel.com>
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

The same debug message is replicated multiple time, add __func__ to
figure out what link is ignored.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 505c5ef061e3..808e2f320052 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1328,8 +1328,8 @@ int intel_link_startup(struct auxiliary_device *auxdev)
 
 	if (bus->prop.hw_disabled) {
 		dev_info(dev,
-			 "SoundWire master %d is disabled, ignoring\n",
-			 sdw->instance);
+			 "%s: SoundWire master %d is disabled, ignoring\n",
+			 __func__, sdw->instance);
 		return 0;
 	}
 
@@ -1489,8 +1489,8 @@ int intel_link_process_wakeen_event(struct auxiliary_device *auxdev)
 	bus = &sdw->cdns.bus;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
@@ -1549,8 +1549,8 @@ static int __maybe_unused intel_pm_prepare(struct device *dev)
 	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
@@ -1609,8 +1609,8 @@ static int __maybe_unused intel_suspend(struct device *dev)
 	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
@@ -1662,8 +1662,8 @@ static int __maybe_unused intel_suspend_runtime(struct device *dev)
 	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
@@ -1727,8 +1727,8 @@ static int __maybe_unused intel_resume(struct device *dev)
 	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
@@ -1825,8 +1825,8 @@ static int __maybe_unused intel_resume_runtime(struct device *dev)
 	int ret;
 
 	if (bus->prop.hw_disabled || !sdw->startup_done) {
-		dev_dbg(dev, "SoundWire master %d is disabled or not-started, ignoring\n",
-			bus->link_id);
+		dev_dbg(dev, "%s: SoundWire master %d is disabled or not-started, ignoring\n",
+			__func__, bus->link_id);
 		return 0;
 	}
 
-- 
2.17.1

