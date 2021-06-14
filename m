Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 966F13A6E00
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:10:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C2781691;
	Mon, 14 Jun 2021 20:09:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C2781691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694241;
	bh=ng/L5vEWSUxMmHGYfl9Pc9AQ1U7DhYLZq24p8A4yI5k=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d5u+T7CXJoGxz62acIaUkzzvKb3LRtpyIIEwSGeqtBpodlpGC9XkTiFENKPDd+kHn
	 XCCsoXSc5NQ2CyzOWUxMYb4P4FsQlMBFKtrmhV5NvZzRfluXyDvmEOYvYS6XjXQ8XG
	 L9eKoV4Q0HokNTevnQftAqKpZ8B3soHuLtbLB02s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84649F804CA;
	Mon, 14 Jun 2021 20:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DAA1F804C2; Mon, 14 Jun 2021 20:08:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D06B2F800F7
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D06B2F800F7
IronPort-SDR: TAZvkYvx5jQZlD+6KJ6i6roF7uFQ+vtuX8X9ix9iBSiEsvEgeMzU+kQunymzOyd/DlIfrg1JQj
 cCZeOoq6fuew==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969575"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969575"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:45 -0700
IronPort-SDR: lhAyVb42Y4tFIWQd17H9o9r/4UwWb+jlKm45saZS4Yc4VKAeIesxvfM2d9LCK+n4h6z4CwcFxu
 uefeOaX+rBbQ==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166421"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 2/5] ASoC: rt700-sdw: fix race condition on system suspend
Date: Mon, 14 Jun 2021 13:08:12 -0500
Message-Id: <20210614180815.153711-3-pierre-louis.bossart@linux.intel.com>
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
executed after the link is disabled, leading to an IO error.

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
Fixes: 5f2df2a4583b ('ASoC: rt700: wait for the delayed work to finish when the system suspends')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/rt700-sdw.c | 34 ++++++++++++++++++++++++++++++++--
 sound/soc/codecs/rt700.c     |  4 ++++
 sound/soc/codecs/rt700.h     |  2 ++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index d1d9c0f455b4..bda594899664 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -418,10 +418,12 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	if (status->control_port & 0x4) {
+	mutex_lock(&rt700->disable_irq_lock);
+	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
+	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -490,6 +492,34 @@ static int __maybe_unused rt700_dev_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused rt700_dev_system_suspend(struct device *dev)
+{
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	struct rt700_priv *rt700 = dev_get_drvdata(dev);
+	int ret;
+
+	if (!rt700->hw_init)
+		return 0;
+
+	/*
+	 * prevent new interrupts from being handled after the
+	 * deferred work completes and before the parent disables
+	 * interrupts on the link
+	 */
+	mutex_lock(&rt700->disable_irq_lock);
+	rt700->disable_irq = true;
+	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+			       SDW_SCP_INT1_IMPL_DEF, 0);
+	mutex_unlock(&rt700->disable_irq_lock);
+
+	if (ret < 0) {
+		/* log but don't prevent suspend from happening */
+		dev_dbg(&slave->dev, "%s: could not disable imp-def interrupts\n:", __func__);
+	}
+
+	return rt700_dev_suspend(dev);
+}
+
 #define RT700_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt700_dev_resume(struct device *dev)
@@ -521,7 +551,7 @@ static int __maybe_unused rt700_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt700_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt700_dev_suspend, rt700_dev_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(rt700_dev_system_suspend, rt700_dev_resume)
 	SET_RUNTIME_PM_OPS(rt700_dev_suspend, rt700_dev_resume, NULL)
 };
 
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 01af9d9dd3ca..921382724f9c 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -1112,6 +1112,8 @@ int rt700_init(struct device *dev, struct regmap *sdw_regmap,
 	rt700->sdw_regmap = sdw_regmap;
 	rt700->regmap = regmap;
 
+	mutex_init(&rt700->disable_irq_lock);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1133,6 +1135,8 @@ int rt700_io_init(struct device *dev, struct sdw_slave *slave)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
 
+	rt700->disable_irq = false;
+
 	if (rt700->hw_init)
 		return 0;
 
diff --git a/sound/soc/codecs/rt700.h b/sound/soc/codecs/rt700.h
index 794ee2e29051..bed9d1de6d5b 100644
--- a/sound/soc/codecs/rt700.h
+++ b/sound/soc/codecs/rt700.h
@@ -23,6 +23,8 @@ struct  rt700_priv {
 	struct delayed_work jack_detect_work;
 	struct delayed_work jack_btn_check_work;
 	int jack_type;
+	struct mutex disable_irq_lock; /* imp-def irq lock protection */
+	bool disable_irq;
 };
 
 struct sdw_stream_data {
-- 
2.25.1

