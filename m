Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B993A6E05
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:11:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF7411680;
	Mon, 14 Jun 2021 20:10:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF7411680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694290;
	bh=RfIy6QgMfuFTeJWqKXklAL6IUdgA0Uqncz81RAnUveQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXInJzmhrIvVAEz5KVGUzTLIzwhte6fqG5x1ofKY+T9F4WGPn60iMxKEuIhR7Wq9Z
	 7WSZHAHN2khVmyMXSdjk0pffkNUx1aubgbk4Dm59l/3K9KPyp8O5e4VoiRQ9C8mtcz
	 piqeQ8oHoSD2RwTrWJv1h4AnoQ2VhE0GuVL4H6as=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AF30F804D2;
	Mon, 14 Jun 2021 20:09:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76A4DF804CA; Mon, 14 Jun 2021 20:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D11CBF8028B
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D11CBF8028B
IronPort-SDR: moKwY6mGwqKGAZPP4CMLKPhT8gRuR82iCHosVVCc6J8HualZnZGfoJ9qAK/9juEQCvLRX7M5s5
 F1ZxkUwTfjEQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969581"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969581"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:51 -0700
IronPort-SDR: QMz9h5D4R+M5rWNcbW4LAYtZHDOgB1PVLVWdGUQw1RLWI5jzomHB4u9seA9GkvgLsLDvLqTfmQ
 DB095xgsO89A==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166440"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:48 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 4/5] ASoC: rt5682-sdw: fix race condition on system suspend
Date: Mon, 14 Jun 2021 13:08:14 -0500
Message-Id: <20210614180815.153711-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
References: <20210614180815.153711-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Oder Chiou <oder_chiou@realtek.com>, Jack Yu <jack.yu@realtek.com>,
 open list <linux-kernel@vger.kernel.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>,
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

In the initial driver we cancelled deferred work, but there is still a
window of time where a new interrupt could result in new deferred work
executed after the link is disabled, leading to an IO error. While we
did not see this IO error on RT5682-based platforms, the code pattern
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

The Fixes tag points to a 5.10 commit, there's no need to propagate
this change to earlier upstream versions.

BugLink: https://github.com/thesofproject/linux/issues/2943
Fixes: 4a55000722d7 ('ASoC: codecs: rt*.c: remove useless pointer cast')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/rt5682-sdw.c | 38 +++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt5682.h     |  2 ++
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 54873730bec5..31a4f286043e 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -344,6 +344,8 @@ static int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
 	rt5682->sdw_regmap = regmap;
 	rt5682->is_sdw = true;
 
+	mutex_init(&rt5682->disable_irq_lock);
+
 	rt5682->regmap = devm_regmap_init(dev, NULL, dev,
 					  &rt5682_sdw_indirect_regmap);
 	if (IS_ERR(rt5682->regmap)) {
@@ -378,6 +380,8 @@ static int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	int ret = 0, loop = 10;
 	unsigned int val;
 
+	rt5682->disable_irq = false;
+
 	if (rt5682->hw_init)
 		return 0;
 
@@ -679,10 +683,12 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	if (status->control_port & 0x4) {
+	mutex_lock(&rt5682->disable_irq_lock);
+	if (status->control_port & 0x4 && !rt5682->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 	}
+	mutex_unlock(&rt5682->disable_irq_lock);
 
 	return 0;
 }
@@ -740,6 +746,34 @@ static int __maybe_unused rt5682_dev_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused rt5682_dev_system_suspend(struct device *dev)
+{
+	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret;
+
+	if (!rt5682->hw_init)
+		return 0;
+
+	/*
+	 * prevent new interrupts from being handled after the
+	 * deferred work completes and before the parent disables
+	 * interrupts on the link
+	 */
+	mutex_lock(&rt5682->disable_irq_lock);
+	rt5682->disable_irq = true;
+	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+			       SDW_SCP_INT1_IMPL_DEF, 0);
+	mutex_unlock(&rt5682->disable_irq_lock);
+
+	if (ret < 0) {
+		/* log but don't prevent suspend from happening */
+		dev_dbg(&slave->dev, "%s: could not disable imp-def interrupts\n:", __func__);
+	}
+
+	return rt5682_dev_suspend(dev);
+}
+
 static int __maybe_unused rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -768,7 +802,7 @@ static int __maybe_unused rt5682_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt5682_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(rt5682_dev_system_suspend, rt5682_dev_resume)
 	SET_RUNTIME_PM_OPS(rt5682_dev_suspend, rt5682_dev_resume, NULL)
 };
 
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index 74ff66767016..b59221048ebf 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1415,6 +1415,8 @@ struct rt5682_priv {
 	struct regulator_bulk_data supplies[RT5682_NUM_SUPPLIES];
 	struct delayed_work jack_detect_work;
 	struct delayed_work jd_check_work;
+	struct mutex disable_irq_lock; /* imp-def irq lock protection */
+	bool disable_irq;
 	struct mutex calibrate_mutex;
 	struct sdw_slave *slave;
 	enum sdw_slave_status status;
-- 
2.25.1

