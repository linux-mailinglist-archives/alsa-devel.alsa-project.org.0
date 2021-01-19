Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFD32FBB0A
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Jan 2021 16:23:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D46B18A3;
	Tue, 19 Jan 2021 16:23:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D46B18A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611069834;
	bh=PQidS4VSDElv+g5FnRx1bJ6xMw+2lAEY1K9mME1xoOk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s95SUilcSxJ7OYFgYaG8n2ULSN95NL6oK4opPun9aE4Kzm74eZL/4agtXTDl7WQA+
	 R2pHOlFQlu2ItRXjpH8TPoTOnRXxDqdxrDPBczvi5e4Dthtxn8KglNP7cl2K7SK77v
	 yqWBOiw6dPLt76ML5suTyNJyf/fNY6Zv21EiI+Cg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B32A2F80117;
	Tue, 19 Jan 2021 16:22:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EE01F80257; Tue, 19 Jan 2021 16:22:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=AC_FROM_MANY_DOTS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7199AF80117
 for <alsa-devel@alsa-project.org>; Tue, 19 Jan 2021 16:22:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7199AF80117
Received: from 1-171-232-235.dynamic-ip.hinet.net ([1.171.232.235]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1l1spS-0000wH-K5; Tue, 19 Jan 2021 15:21:59 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2] ALSA: hda: Balance runtime/system PM if direct-complete is
 disabled
Date: Tue, 19 Jan 2021 23:21:43 +0800
Message-Id: <20210119152145.346558-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Harsha Priya <harshapriya.n@intel.com>,
 open list <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "Kenneth R . Crudup" <kenny@panix.com>
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

After hibernation, HDA controller can't be runtime-suspended after
commit 215a22ed31a1 ("ALSA: hda: Refactor codjc PM to use
direct-complete optimization"), which enables direct-complete for HDA
codec.

The HDA codec driver didn't expect direct-complete will be disabled
after it returns a positive value from prepare() callback. However,
there are some places that PM core can disable direct-complete. For
instance, system hibernation or when codec has subordinates like LEDs.

So if the codec is prepared for direct-complete but PM core still calls
codec's suspend or freeze callback, partially revert the commit and take
the original approach, which uses pm_runtime_force_*() helpers to
ensure PM refcount are balanced. Meanwhile, still keep prepare() and
complete() callbacks to enable direct-complete and request a resume for
jack detection, respectively.

Reported-by: Kenneth R. Crudup <kenny@panix.com>
Fixes: 215a22ed31a1 ("ALSA: hda: Refactor codec PM to use direct-complete optimization")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Use pm_runtime_force_*() helpers to avoid suspend/resume ping pong.

 sound/pci/hda/hda_codec.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)


diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 687216e74526..eec1775dfffe 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -2934,7 +2934,7 @@ static void hda_call_codec_resume(struct hda_codec *codec)
 	snd_hdac_leave_pm(&codec->core);
 }
 
-static int hda_codec_suspend(struct device *dev)
+static int hda_codec_runtime_suspend(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 	unsigned int state;
@@ -2953,7 +2953,7 @@ static int hda_codec_suspend(struct device *dev)
 	return 0;
 }
 
-static int hda_codec_resume(struct device *dev)
+static int hda_codec_runtime_resume(struct device *dev)
 {
 	struct hda_codec *codec = dev_to_hda_codec(dev);
 
@@ -2968,16 +2968,6 @@ static int hda_codec_resume(struct device *dev)
 	return 0;
 }
 
-static int hda_codec_runtime_suspend(struct device *dev)
-{
-	return hda_codec_suspend(dev);
-}
-
-static int hda_codec_runtime_resume(struct device *dev)
-{
-	return hda_codec_resume(dev);
-}
-
 #endif /* CONFIG_PM */
 
 #ifdef CONFIG_PM_SLEEP
@@ -2998,31 +2988,31 @@ static void hda_codec_pm_complete(struct device *dev)
 static int hda_codec_pm_suspend(struct device *dev)
 {
 	dev->power.power_state = PMSG_SUSPEND;
-	return hda_codec_suspend(dev);
+	return pm_runtime_force_suspend(dev);
 }
 
 static int hda_codec_pm_resume(struct device *dev)
 {
 	dev->power.power_state = PMSG_RESUME;
-	return hda_codec_resume(dev);
+	return pm_runtime_force_resume(dev);
 }
 
 static int hda_codec_pm_freeze(struct device *dev)
 {
 	dev->power.power_state = PMSG_FREEZE;
-	return hda_codec_suspend(dev);
+	return pm_runtime_force_suspend(dev);
 }
 
 static int hda_codec_pm_thaw(struct device *dev)
 {
 	dev->power.power_state = PMSG_THAW;
-	return hda_codec_resume(dev);
+	return pm_runtime_force_resume(dev);
 }
 
 static int hda_codec_pm_restore(struct device *dev)
 {
 	dev->power.power_state = PMSG_RESTORE;
-	return hda_codec_resume(dev);
+	return pm_runtime_force_resume(dev);
 }
 #endif /* CONFIG_PM_SLEEP */
 
-- 
2.29.2

