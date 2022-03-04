Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 314DC4CCDB4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 07:29:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DB4D185A;
	Fri,  4 Mar 2022 07:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DB4D185A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646375376;
	bh=xTWQicnytAj3CzkL4it1W+1H31MuVsFjGdGiLwXqjMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=covWGzL1GSNwaL7tuVxk06kgpTdSaJuZC16aH9BYJ08szPmMmnMjUM47mFknYO/TA
	 9fX0+nn++1x09JYt1RucaSNZG+ylZ9c/EJnawxl+xbUjJc28HJB9HMOxASgWLHJkpg
	 qScPICe3+Tw6M3I52T9Q7lFYqLehtc7W8OFDy0O4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14607F801F5;
	Fri,  4 Mar 2022 07:28:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939F6F801EC; Fri,  4 Mar 2022 07:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbg506.qq.com (smtpbg506.qq.com [203.205.250.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F06E9F800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 07:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F06E9F800F0
X-QQ-mid: bizesmtp88t1646375284t6hkac1h
Received: from localhost.localdomain ( [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 04 Mar 2022 14:28:00 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: ec8fk5hwdl7lFPnUj7yMxNNeEAsAECkd2tcce7oPDG2vXjcuuzYCmoQ8NWjmh
 EYRKQymFqS7+cnFjnOg3PUYObVMpPmFRnthu6ZVJ0WJQF5BA/1tfbAVDobHUa7pkB3zwLMx
 y5rII46OjZcVRx1ul4/nwRH3lWmAxNBg7fYoZunvvQ5l126mEknGP6JyMfHPX9CN9YN8Uk7
 UAi7UnzsjyXZ8CzcFMg1AZ6+4FHyeySvQqntH42nANjb9tYW6PDcEse6DdUORn8MNQ/rbaj
 Sia7cE0qQ4rJWMcYcrZh/neiHL9Jb3yziwgV2R4FbNt3nbimZgUnzLoJxdEEv4HYxv5mwcS
 +wzNDMy+fQ4H/2j5cMShzBQjsGhYw==
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: oder_chiou@realtek.com,
	broonie@kernel.org,
	tiwai@suse.com
Subject: [PATCH] ASoC: rt5665: Don't block workqueue if card is unbound
Date: Fri,  4 Mar 2022 14:27:58 +0800
Message-Id: <20220304062758.9701-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

The current rt5665_jack_detect_handler() assumes the component
and card will always show up and implements an infinite usleep
loop waiting for them to show up.

This does not hold true if a codec interrupt (or other
event) occurs when the card is unbound. The codec driver's
remove  or shutdown functions cannot cancel the workqueue due
to the wait loop. As a result, code can either end up blocking
the workqueue, or hit a kernel oops when the card is freed.

Fix the issue by rescheduling the jack detect handler in
case the card is not ready. In case card never shows up,
the shutdown/remove/suspend calls can now cancel the detect
task.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/soc/codecs/rt5665.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 33e889802ff8..cdfd7085df2a 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1293,19 +1293,13 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5665_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	while (!rt5665->component) {
-		pr_debug("%s codec = null\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!rt5665->component->card->instantiated) {
-		pr_debug("%s\n", __func__);
-		usleep_range(10000, 15000);
-	}
-
-	while (!rt5665->calibration_done) {
-		pr_debug("%s calibration not ready\n", __func__);
-		usleep_range(10000, 15000);
+	if (!rt5665->component || !rt5665->component->card->instantiated ||
+			!rt5665->calibration_done) {
+		pr_debug("%s card not yet ready\n", __func__);
+		/* try later */
+		mod_delayed_work(system_power_efficient_wq,
+				&rt5665->jack_detect_work, msecs_to_jiffies(15));
+		return;
 	}
 
 	mutex_lock(&rt5665->calibrate_mutex);
-- 
2.20.1



