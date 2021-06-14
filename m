Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8A53A6E06
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Jun 2021 20:11:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B359A1688;
	Mon, 14 Jun 2021 20:11:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B359A1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623694315;
	bh=iYGxxyJB55rn+lQoJh0OYRVBT6C8JemB9bKK+SSuP/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C9YRk3IQQe8zQXi7Wo0uXnTur+qF5apfF8uMfM+xZFvOpT4BT270xtjavmmEfCYoj
	 aNnppc1l0w1ssoRTJTEQllR+Uq012FM8PmE8B82on7+FM2rPeHaY7uw/fFm0rG3+VT
	 +Prt1xdBcnVoQ3WdaUnukoRa9Kvoq1YS9uTxmUg0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1822F804E0;
	Mon, 14 Jun 2021 20:09:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2767AF800F7; Mon, 14 Jun 2021 20:09:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B35E0F802E8
 for <alsa-devel@alsa-project.org>; Mon, 14 Jun 2021 20:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B35E0F802E8
IronPort-SDR: paBzcVBJg7en1eDsEEkZ0KSo1THwq05nB/zu0CkOmxCxTfT5D1C0SlfJ/USXJsJ5Ik6qn3T/Z2
 5wBBsIeioBhQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="192969583"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="192969583"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:52 -0700
IronPort-SDR: RJRfPtptmK6kRzPKR/K8i/PT2mO9BtG8B0QE/TjD1OcAsiNysNYNTgSpppUZyVmQO0WWcnCpkF
 Cnd43xGSP3Gg==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="484166446"
Received: from jepowell-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.114.106])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 11:08:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org,
	srinivas.kandagatla@linaro.org
Subject: [PATCH 5/5] ASoC: rt711-sdca-sdw: fix race condition on system suspend
Date: Mon, 14 Jun 2021 13:08:15 -0500
Message-Id: <20210614180815.153711-6-pierre-louis.bossart@linux.intel.com>
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

In the initial driver we cancelled deferred work, but there is still a
window of time where a new interrupt could result in new deferred work
executed after the link is disabled, leading to an IO error. While we
did not see this IO error on RT711-sdca-based platforms, the code pattern
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

The code is slightly different from the other codecs since the
interrupt callback deals with the SDCA interrupts, leading to a much
larger section that's protected by the mutex. The SoundWire interrupt
scheme requires a read after clearing a status, it's not clear from
the specifications what would happen if SDCA interrupts are disabled
in the middle of the sequence, so the entire interrupt status
read/write is kept as is, even if in the end we discard the
information.

BugLink: https://github.com/thesofproject/linux/issues/2943
Fixes: 7ad4d237e7c4 ('ASoC: rt711-sdca: Add RT711 SDCA vendor-specific driver')
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 46 +++++++++++++++++++++++++++++--
 sound/soc/codecs/rt711-sdca.c     |  4 +++
 sound/soc/codecs/rt711-sdca.h     |  2 ++
 3 files changed, 50 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 03cd3e0142f9..aaf5af153d3f 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -256,6 +256,15 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 			scp_sdca_stat2 = rt711->scp_sdca_stat2;
 	}
 
+	/*
+	 * The critical section below intentionally protects a rather large piece of code.
+	 * We don't want to allow the system suspend to disable an interrupt while we are
+	 * processing it, which could be problematic given the quirky SoundWire interrupt
+	 * scheme. We do want however to prevent new workqueues from being scheduled if
+	 * the disable_irq flag was set during system suspend.
+	 */
+	mutex_lock(&rt711->disable_irq_lock);
+
 	ret = sdw_read_no_pm(rt711->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
 		goto io_error;
@@ -314,13 +323,16 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 			"%s scp_sdca_stat1=0x%x, scp_sdca_stat2=0x%x\n", __func__,
 			rt711->scp_sdca_stat1, rt711->scp_sdca_stat2);
 
-	if (status->sdca_cascade)
+	if (status->sdca_cascade && !rt711->disable_irq)
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(30));
 
+	mutex_unlock(&rt711->disable_irq_lock);
+
 	return 0;
 
 io_error:
+	mutex_unlock(&rt711->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -382,6 +394,36 @@ static int __maybe_unused rt711_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused rt711_sdca_dev_system_suspend(struct device *dev)
+{
+	struct rt711_sdca_priv *rt711_sdca = dev_get_drvdata(dev);
+	struct sdw_slave *slave = dev_to_sdw_dev(dev);
+	int ret1, ret2;
+
+	if (!rt711_sdca->hw_init)
+		return 0;
+
+	/*
+	 * prevent new interrupts from being handled after the
+	 * deferred work completes and before the parent disables
+	 * interrupts on the link
+	 */
+	mutex_lock(&rt711_sdca->disable_irq_lock);
+	rt711_sdca->disable_irq = true;
+	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	mutex_unlock(&rt711_sdca->disable_irq_lock);
+
+	if (ret1 < 0 || ret2 < 0) {
+		/* log but don't prevent suspend from happening */
+		dev_dbg(&slave->dev, "%s: could not disable SDCA interrupts\n:", __func__);
+	}
+
+	return rt711_sdca_dev_suspend(dev);
+}
+
 #define RT711_PROBE_TIMEOUT 5000
 
 static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
@@ -413,7 +455,7 @@ static int __maybe_unused rt711_sdca_dev_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rt711_sdca_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(rt711_sdca_dev_system_suspend, rt711_sdca_dev_resume)
 	SET_RUNTIME_PM_OPS(rt711_sdca_dev_suspend, rt711_sdca_dev_resume, NULL)
 };
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 0b0c230dcf71..2e992589f1e4 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1411,6 +1411,8 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	rt711->regmap = regmap;
 	rt711->mbq_regmap = mbq_regmap;
 
+	mutex_init(&rt711->disable_irq_lock);
+
 	/*
 	 * Mark hw_init to false
 	 * HW init will be performed when device reports present
@@ -1494,6 +1496,8 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 	int ret = 0;
 	unsigned int val;
 
+	rt711->disable_irq = false;
+
 	if (rt711->hw_init)
 		return 0;
 
diff --git a/sound/soc/codecs/rt711-sdca.h b/sound/soc/codecs/rt711-sdca.h
index 43ae82b7fdb3..498ca687c47b 100644
--- a/sound/soc/codecs/rt711-sdca.h
+++ b/sound/soc/codecs/rt711-sdca.h
@@ -27,6 +27,8 @@ struct  rt711_sdca_priv {
 	struct delayed_work jack_detect_work;
 	struct delayed_work jack_btn_check_work;
 	struct mutex calibrate_mutex; /* for headset calibration */
+	struct mutex disable_irq_lock; /* SDCA irq lock protection */
+	bool disable_irq;
 	int jack_type, jd_src;
 	unsigned int scp_sdca_stat1, scp_sdca_stat2;
 	int hw_ver;
-- 
2.25.1

