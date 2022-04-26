Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FFB510806
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:03:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D25C4183A;
	Tue, 26 Apr 2022 21:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D25C4183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650999802;
	bh=Lczrt4+YUqRZ1mToh23wQuAlFBbPmfoWphl6BE6TpG8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Q515vT9UJui8y28GMgA4eWpiB857vDhaNUrd7DGiH2acgB3HVMMVwsvYs1SzSh++Q
	 ccE1mYuYPWnk08BgAdPuoFh7nC3V/usuLQkG4M+BWWm4EGZc67LZK1nzcUfJh+fKa0
	 n+YzDJfdAsST/PYelPUNhT8tdWgwS6wUAXsjyLAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1813F80510;
	Tue, 26 Apr 2022 21:02:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FBC6F80510; Tue, 26 Apr 2022 21:01:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9086F8027D
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:01:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9086F8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="j1Y3W/cD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7AD69619AC;
 Tue, 26 Apr 2022 19:01:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE9CAC385AA;
 Tue, 26 Apr 2022 19:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650999707;
 bh=Lczrt4+YUqRZ1mToh23wQuAlFBbPmfoWphl6BE6TpG8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j1Y3W/cDiQF6/YxPYC0jGB8sliXqFZlhFUltYGhUWmPAKyAtrjcZ86UEj23CJDfWT
 gQBw32n4QTJ91c3OX+FpVn7LfaMVezW7HbAEbJifEttVwJmLPwbF/1XTrawHziyKwK
 yeuQaogYfVUOqcz4j/LYCGKI3GMgmQDmHYDgG5a0JZdyNhxqDtX5Rgc9lDDSnwbc2r
 Tzkzx/cx4727XNHwJozoJr/CJt6X3XpNHvHKN+mnjhv7VuDBUtVFfStTYuS3rjrAke
 3F0Qnnb/HCAIB9UxKvCLShTRLEvTgZSTs1Y9RhvuNJjcd1s3EwHtIQtg9lNUems1p1
 JLlJafdNc0tMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 03/22] ASoC: rt711/5682: check if bus is active
 before deferred jack detection
Date: Tue, 26 Apr 2022 15:01:26 -0400
Message-Id: <20220426190145.2351135-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220426190145.2351135-1-sashal@kernel.org>
References: <20220426190145.2351135-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

[ Upstream commit 770f3d992a3f7330f801dfeee98429b2885c9fdb ]

This patch takes a defensive programming and paranoid approach in case
the parent device (SoundWire) is pm_runtime resumed but the rt711
device is not. In that case, during the attachment and initialization,
a jack detection workqueue can be scheduled. Since the pm_runtime
suspend routines will not be invoked, the sequence to cancel all
deferred work is not executed, and the jack detection could happen
after the bus stops operating, leading to a timeout.

This patch applies the same solution to rt5682, based on the
similarities between codec drivers. The race condition with rt5682 was
not detected experimentally though.

BugLink: https://github.com/thesofproject/linux/issues/3459
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220406192005.262996-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt5682.c | 9 +++++++++
 sound/soc/codecs/rt711.c  | 7 +++++++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index be68d573a490..e6f7e9f82511 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1100,6 +1100,15 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
+	if (rt5682->is_sdw) {
+		if (pm_runtime_status_suspended(rt5682->slave->dev.parent)) {
+			dev_dbg(&rt5682->slave->dev,
+				"%s: parent device is pm_runtime_status_suspended, skipping jack detection\n",
+				__func__);
+			return;
+		}
+	}
+
 	dapm = snd_soc_component_get_dapm(rt5682->component);
 
 	snd_soc_dapm_mutex_lock(dapm);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 6770825d037a..ea25fd58d43a 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -245,6 +245,13 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->component->card->instantiated)
 		return;
 
+	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
+		dev_dbg(&rt711->slave->dev,
+			"%s: parent device is pm_runtime_status_suspended, skipping jack detection\n",
+			__func__);
+		return;
+	}
+
 	reg = RT711_VERB_GET_PIN_SENSE | RT711_HP_OUT;
 	ret = regmap_read(rt711->regmap, reg, &jack_status);
 	if (ret < 0)
-- 
2.35.1

