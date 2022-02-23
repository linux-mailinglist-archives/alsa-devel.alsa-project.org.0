Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5638D4C0803
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 03:31:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED02D16E3;
	Wed, 23 Feb 2022 03:30:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED02D16E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645583474;
	bh=mqQlBlOzmeSF6kjm5/81gVYISa9Xaknvi26FPi+wghc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u/8XH9KHazyk5qifPZsAtiTnuTy967nPCYy1o2yg7yDgJMi5Pc91xlPRlxMQNlAom
	 Sz2gdu7TFLEPRYvwqcqleGyypFYLLxhjALW/4xXeMJO7Vtf8XfN5phWHZ4vw7aEge4
	 qqbIhXewDnhXwJsd6fROU3RFWyZ/TeWh8RGubgyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FBE6F80519;
	Wed, 23 Feb 2022 03:29:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B86F800B6; Wed, 23 Feb 2022 03:29:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F7D3F800B6
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 03:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F7D3F800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="LOWwDV57"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DE466150E;
 Wed, 23 Feb 2022 02:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DC62C36AE2;
 Wed, 23 Feb 2022 02:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645583382;
 bh=mqQlBlOzmeSF6kjm5/81gVYISa9Xaknvi26FPi+wghc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LOWwDV57DJuhcSectMsEx8w8e1cBYZZHU/3nlyxKiwpZgNrxKKfUgcl/wQrBAaI4F
 a9onQJudcU/bETJWHTXtRkYXwt5uE7f1Z62/4ZhIgoQyaIgIfTMmVuGqcjb+oxxgsp
 +jc+2C0K72Xb4NBXGd3d3j6rNMljMyodMi9raIHNbYPG88RHVM7nl6aH8XvO+LAKQa
 uVwyeCVUJOspZVouY59dLu5TxQfJ4mxmcc8LpCcBlksP6G04FA5Q/CxXS2MD+wGOWJ
 Gcqp8QWhwzOJWVsR0rMaovKoHKXPeBBc6acQIazWBp3Nd99/mvzvTbjPxuEo+iLNc+
 IBOMMv3VHjfbw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 05/28] ASoC: rt5682: do not block workqueue if
 card is unbound
Date: Tue, 22 Feb 2022 21:29:06 -0500
Message-Id: <20220223022929.241127-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223022929.241127-1-sashal@kernel.org>
References: <20220223022929.241127-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 tiwai@suse.com, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Shuming Fan <shumingf@realtek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

[ Upstream commit 4c33de0673ced9c7c37b3bbd9bfe0fda72340b2a ]

The current rt5682_jack_detect_handler() assumes the component
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

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Link: https://lore.kernel.org/r/20220207153000.3452802-3-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 757d1362b5f48..6ad3159eceb98 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1090,11 +1090,13 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5682_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	while (!rt5682->component)
-		usleep_range(10000, 15000);
-
-	while (!rt5682->component->card->instantiated)
-		usleep_range(10000, 15000);
+	if (!rt5682->component || !rt5682->component->card ||
+	    !rt5682->component->card->instantiated) {
+		/* card not yet ready, try later */
+		mod_delayed_work(system_power_efficient_wq,
+				 &rt5682->jack_detect_work, msecs_to_jiffies(15));
+		return;
+	}
 
 	mutex_lock(&rt5682->calibrate_mutex);
 
-- 
2.34.1

