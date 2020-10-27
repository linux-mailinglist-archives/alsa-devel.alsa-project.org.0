Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2BC29A441
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 06:42:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0148916B0;
	Tue, 27 Oct 2020 06:41:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0148916B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603777326;
	bh=9XnE1b8u9RaKI7kop9d6kSxtoF9WwYu7PHOFMLc9Z8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfqwUVQQYbzNudjkq/tgZMD8Xkm7bq6FIpumnI/8RBvK5O+lDhQSsnpre4gDMEFEp
	 joaw6mdWGhO5iTpH6/qcvrKVEw4JAmVdCZvjGsqi83LofQnvu0iWFW+k19JmehAqH9
	 NpVajQHIBYn3CT+eLCeRmcHfdI8rkYwbAAwUAIu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C70EDF80274;
	Tue, 27 Oct 2020 06:40:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC9ECF80240; Tue, 27 Oct 2020 06:40:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 773B8F80086
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 06:40:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 773B8F80086
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1kXHiR-0002d3-16; Tue, 27 Oct 2020 05:40:15 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2 1/4] ALSA: hda: Refactor codec PM to use direct-complete
 optimization
Date: Tue, 27 Oct 2020 13:39:58 +0800
Message-Id: <20201027054001.1800-2-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027054001.1800-1-kai.heng.feng@canonical.com>
References: <20201027054001.1800-1-kai.heng.feng@canonical.com>
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 linux-kernel@vger.kernel.org, hui.wang@canonical.com,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
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

Upon system resume, hda_codec_pm_resume() uses hda_codec_force_resume()
to resume the codec. However, pm_runtime_force_resume() won't really
resume the codec because of pm_runtime_need_not_resume() check.

Hence, hda_codec_force_resume() schedules a jackpoll work, which is to
really power up the codec.

Instead of doing that, we can use direct-complete to make the PM flow
more straightforward, and keep codec always suspended through system PM
flow if conditions are met.

On system suspend, PM core will decide what to do based on
hda_codec_pm_prepare():
- If codec is not runtime-suspended, PM core will suspend and resume the
device as normal.
- If codec is runtime-suspended, PM core will try to keep it suspended.
If it's still suspended after system resume, we use
hda_codec_pm_complete() to resume codec if it's needed.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Also resume when codec->jackpoll_interval is set

 sound/pci/hda/hda_codec.c | 45 +++++++++++++++++++++++++--------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index a356c21edb90..4bb58e8b08a8 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2934,7 +2934,7 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 	snd_hdac_leave_pm(&codec->core);
 }
 
-static int hda_codec_runtime_suspend(struct device *dev)
+static int hda_codec_suspend(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	unsigned int state;
@@ -2953,7 +2953,7 @@ static int hda_codec_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int hda_codec_runtime_resume(struct device *dev)
+static int hda_codec_resume(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 
@@ -2967,57 +2967,70 @@ static int hda_codec_runtime_resume(struct device *dev)
 	pm_runtime_mark_last_busy(dev);
 	return 0;
 }
+
+static int hda_codec_runtime_suspend(struct device *dev)
+{
+	return hda_codec_suspend(dev);
+}
+
+static int hda_codec_runtime_resume(struct device *dev)
+{
+	return hda_codec_resume(dev);
+}
+
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PM_SLEEP
-static int hda_codec_force_resume(struct device *dev)
+static int hda_codec_pm_prepare(struct device *dev)
+{
+	return pm_runtime_suspended(dev);
+}
+
+static void hda_codec_pm_complete(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
-	int ret;
 
-	ret = pm_runtime_force_resume(dev);
-	/* schedule jackpoll work for jack detection update */
-	if (codec->jackpoll_interval ||
-	    (pm_runtime_suspended(dev) && hda_codec_need_resume(codec)))
-		schedule_delayed_work(&codec->jackpoll_work,
-				      codec->jackpoll_interval);
-	return ret;
+	if (pm_runtime_suspended(dev) && (codec->jackpoll_interval ||
+	    hda_codec_need_resume(codec) || codec->forced_resume))
+		pm_request_resume(dev);
 }
 
 static int hda_codec_pm_suspend(struct device *dev)
 {
 	dev->power.power_state = PMSG_SUSPEND;
-	return pm_runtime_force_suspend(dev);
+	return hda_codec_suspend(dev);
 }
 
 static int hda_codec_pm_resume(struct device *dev)
 {
 	dev->power.power_state = PMSG_RESUME;
-	return hda_codec_force_resume(dev);
+	return hda_codec_resume(dev);
 }
 
 static int hda_codec_pm_freeze(struct device *dev)
 {
 	dev->power.power_state = PMSG_FREEZE;
-	return pm_runtime_force_suspend(dev);
+	return hda_codec_suspend(dev);
 }
 
 static int hda_codec_pm_thaw(struct device *dev)
 {
 	dev->power.power_state = PMSG_THAW;
-	return hda_codec_force_resume(dev);
+	return hda_codec_resume(dev);
 }
 
 static int hda_codec_pm_restore(struct device *dev)
 {
 	dev->power.power_state = PMSG_RESTORE;
-	return hda_codec_force_resume(dev);
+	return hda_codec_resume(dev);
 }
 #endif /* CONFIG_PM_SLEEP */
 
 /* referred in hda_bind.c */
 const struct dev_pm_ops hda_codec_driver_pm = {
 #ifdef CONFIG_PM_SLEEP
+	.prepare = hda_codec_pm_prepare,
+	.complete = hda_codec_pm_complete,
 	.suspend = hda_codec_pm_suspend,
 	.resume = hda_codec_pm_resume,
 	.freeze = hda_codec_pm_freeze,
-- 
2.17.1

