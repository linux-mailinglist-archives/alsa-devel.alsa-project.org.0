Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6820E574262
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:24:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97EA017A3;
	Thu, 14 Jul 2022 06:23:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97EA017A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657772653;
	bh=OEWXMHSWT917Fw8am9Qo09APHrxq7qb4VM0bIGWLQDU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HLg1uNlCQjd4aNOW7H8wH73oPHRf3g8jRnDZF+iSIfeJaPhEi4aViWjbiBuk7vzgl
	 GMHMUZ+5fBGDdSXnkl1Y5FfvqSKOP07Of7ObvEBfQYTdMOVN3AuFf3sgKAukQ9R0lF
	 INbkkz+Q7gR8VZ2JFqs+NrhyaoJNfFzIhhiC+ces=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BD52F80548;
	Thu, 14 Jul 2022 06:22:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A532F8053D; Thu, 14 Jul 2022 06:22:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE08CF802BE
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE08CF802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Yz6D4Vuo"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 271DBB82335;
 Thu, 14 Jul 2022 04:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D2DC3411C;
 Thu, 14 Jul 2022 04:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772552;
 bh=OEWXMHSWT917Fw8am9Qo09APHrxq7qb4VM0bIGWLQDU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Yz6D4Vuo6e9S5MQV76mBB9aZvlReYUTpI3Z2JjzxnAf4EJ58iFTDJmXXPcCCAF1DI
 UuB2tayb3iKpcI+9uG/OuqxMhu6VS5emcZ8kvU3AKOJBdBUmJ2Cee5AEweqSFm5bwZ
 5eapCExm1/lObZhpc6c50RmIxVlKAMZhkgRaPeItp1rMbzmMP51cal36XN0rZ8BsRi
 ij8g3HVbz0acl3pfS5o4s/jTKZZ9krAYwar1EX8gh9mX2SUOJL1UcyULq/vVSBvK7n
 m+W2YgMv5Zi4FXQH3F4fVv2PP0DgZWyZivzeEfkqmeBrCCVBxtWGUtrqA4dNebUXN7
 uAogRU4mCHWwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 04/41] ASoC: rt711-sdca-sdw: fix calibrate mutex
 initialization
Date: Thu, 14 Jul 2022 00:21:44 -0400
Message-Id: <20220714042221.281187-4-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042221.281187-1-sashal@kernel.org>
References: <20220714042221.281187-1-sashal@kernel.org>
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

[ Upstream commit ed0a7fb29c9fd4f53eeb37d1fe2354df7a038047 ]

In codec driver bind/unbind test, the following warning is thrown:

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
...
[  699.182495]  rt711_sdca_jack_init+0x1b/0x1d0 [snd_soc_rt711_sdca]
[  699.182498]  rt711_sdca_set_jack_detect+0x3b/0x90 [snd_soc_rt711_sdca]
[  699.182500]  snd_soc_component_set_jack+0x24/0x50 [snd_soc_core]

A quick check in the code shows that the 'calibrate_mutex' used by
this driver are not initialized at probe time. Moving the
initialization to the probe removes the issue.

BugLink: https://github.com/thesofproject/linux/issues/3644
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220606203752.144159-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 3 +++
 sound/soc/codecs/rt711-sdca.c     | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index c722a2b0041f..a085b2f530aa 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -373,6 +373,9 @@ static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
 	if (rt711->first_hw_init)
 		pm_runtime_disable(&slave->dev);
 
+	mutex_destroy(&rt711->calibrate_mutex);
+	mutex_destroy(&rt711->disable_irq_lock);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index bdb1375f0338..e5a0ec984bdd 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1411,6 +1411,7 @@ int rt711_sdca_init(struct device *dev, struct regmap *regmap,
 	rt711->regmap = regmap;
 	rt711->mbq_regmap = mbq_regmap;
 
+	mutex_init(&rt711->calibrate_mutex);
 	mutex_init(&rt711->disable_irq_lock);
 
 	/*
@@ -1549,7 +1550,6 @@ int rt711_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 			rt711_sdca_jack_detect_handler);
 		INIT_DELAYED_WORK(&rt711->jack_btn_check_work,
 			rt711_sdca_btn_check_handler);
-		mutex_init(&rt711->calibrate_mutex);
 	}
 
 	/* calibration */
-- 
2.35.1

