Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4082E3A6E02
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:11:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B932C1673;
	Mon, 14 Jun 2021 20:10:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B932C1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694275;
	bh=YPXqwNTxjE0+LNSpeMRuo0UJcBU0hFwePIHSOveT3d4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fjCzz3JArjVaPBF6H53rjOg1DteJVfO7vTDsjZeOroRcsXvPL73VEJqAk03TVA75k
	 cE9nq0U2ojYqMd1MRc4fJfcI/Oq5ZN6H3h+OOlocA5LrbEtFG/NvemHP0ezz4ZyrqK
	 CxTxP64GhuDDRoo71oqXloKPrN/v/lGWoyNZrSnc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 44207F804D0;
	Mon, 14 Jun 2021 20:09:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1789AF804C2; Mon, 14 Jun 2021 20:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B806EF80424
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B806EF80424
IronPort-SDR: qh9ij7WTq0HXOnyvqwgC8P4mrZamit+AzUs9xe3b1BNKK6dAaoly7URhl7LqU0ivaqw4RXG5Oz
 aHH5iReNPIOg==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969578"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969578"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:48 -0700
IronPort-SDR: JxpUUiVAyyQrQSij/i+O8Y6scFMUKJkkR9iq+9yJPSvqCHeEbd61JTP9ADc21TCL0AH5ZSiezV
 eSdbNa+wmyUQ==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166431"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 3/5] ASoC: rt711-sdw: fix race condition on system suspend
Date: Mon, 14 Jun 2021 13:08:13 -0500
Message-Id: <20210614180815.153711-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
References: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 open list <linux-kernel@vger.kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, Takashi Iwai <tiwai@suse.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 Shuming Fan <shumingf@realtek.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Bard Liao <bard.liao@intel.com>
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

In previous commits we cancelled deferred work, but there is still a
window of time where a new interrupt could result in new deferred work
executed after the link is disabled, leading to an IO error. While we
did not see this IO error on RT711-based platforms, the code pattern
is similar to the RT700 case where the IO error was noted, so the fix
is added for consistency.

This patch uses an 'disable_irq_lock' mutex to prevent new interrupts
from happening after the start of the system suspend. The choice of a
mutex v. a spinlock is mainly due to the time required to clear
interrupts, which requires a command to be transmitted by the
SoundWire host IP and acknowledged with an interrupt. The
'interrupt_callback' routine is also not meant to be called from an
interrupt context.

An additional 'disable_irq' flag prevents race conditions where the
status changes before the interrupts are disabled, but the workqueue
handling status changes is scheduled after the completion of the
system suspend. On resume the interrupts are re-enabled already by the
io_init routine so we only clear the flag.

BugLink: https://github.com/thesofproject/linux/issues/2943
Fixes: 501ef013390b ('ASoC: rt711: wait for the delayed work to finish when the system suspends')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/rt711-sdw.c | 34 ++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt711.c     |  4 ++++
 sound/soc/codecs/rt711.h     |  2 ++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 15299084429f..bda2cc9439c9 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -423,10 +423,12 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	if (status->control_port & 0x4) {
+	mutex_lock(&rt711->disable_irq_lock);
+	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
+	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -493,6 +495,34 @@ static int __maybe_unused rt711_dev_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused rt711_dev_system_suspend(struct device *dev)
+{
+	struct rt711_priv *rt711 = dev_get_drvdata(dev);
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	if (!rt711->hw_init)
+		return 0;
+
+	/*
+	 * prevent new interrupts from being handled after the
+	 * deferred work completes and before the parent disables
+	 * interrupts on the link
+	 */
+	mutex_lock(&rt711->disable_irq_lock);
+	rt711->disable_irq = true;
+	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+			       SDW_SCP_INT1_IMPL_DEF, 0);
+	mutex_unlock(&rt711->disable_irq_lock);
+
+	if (ret < 0) {
+		/* log but don't prevent suspend from happening */
+		dev_dbg(&slave->dev, "%s: could not disable imp-def interrupts\n:", __func__);
+	}
+
+	return rt711_dev_suspend(dev);
+}
+
 #define RT711_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt711_dev_resume(struct device *dev)
@@ -524,7 +554,7 @@ static int __maybe_unused rt711_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_dev_suspend, rt711_dev_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(rt711_dev_system_suspend, rt711_dev_resume)
 	SET_RUNTIME_PM_OPS(rt711_dev_suspend, rt711_dev_resume, NULL)
 };
 
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 9f5b2dc16c54..4dbfa7b8680e 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -1166,6 +1166,8 @@ int rt711_init(struct device *dev, struct regmap *sdw_regmap,
 	rt711->sdw_regmap = sdw_regmap;
 	rt711->regmap = regmap;
 
+	mutex_init(&rt711->disable_irq_lock);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1190,6 +1192,8 @@ int rt711_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
 
+	rt711->disable_irq = false;
+
 	if (rt711->hw_init)
 		return 0;
 
diff --git a/sound/soc/codecs/rt711.h b/sound/soc/codecs/rt711.h
index ca0f581feec7..2af467631435 100644
--- a/sound/soc/codecs/rt711.h
+++ b/sound/soc/codecs/rt711.h
@@ -25,6 +25,8 @@ struct  rt711_priv {
 	struct work_struct calibration_work;
 	struct mutex calibrate_mutex; /* for headset calibration */
 	int jack_type, jd_src;
+	struct mutex disable_irq_lock; /* imp-def irq lock protection */
+	bool disable_irq;
 };
 
 struct sdw_stream_data {
-- 
2.25.1

