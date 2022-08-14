Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DBA592401
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Aug 2022 18:27:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4DB81679;
	Sun, 14 Aug 2022 18:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4DB81679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660494463;
	bh=d8mo+pUCA+EwvmdxNIIz0GM6OrtFvpdgmGfI6+Xn3cs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oHsOgAmkS3cMPkARbm4P2xypYMagFqFExZaDP6oBBsyCXKfR8/nGTJa8s0pmw/meM
	 omPqLvNjMHhFiHvq3eeN+dQVVFgdArJkM/2JRcX2ydmP410wTLW2hZP70GOEN3QLfb
	 rBnGmMoBRfcedqXHWVYccMAY0vPfz5aeYgXTD8U4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16E87F80245;
	Sun, 14 Aug 2022 18:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62833F8055C; Sun, 14 Aug 2022 18:25:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75CB9F80508
 for <alsa-devel@alsa-project.org>; Sun, 14 Aug 2022 18:25:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75CB9F80508
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Ocm0ZYBj"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 874BCB80B7C;
 Sun, 14 Aug 2022 16:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7785EC433C1;
 Sun, 14 Aug 2022 16:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660494299;
 bh=d8mo+pUCA+EwvmdxNIIz0GM6OrtFvpdgmGfI6+Xn3cs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ocm0ZYBjEtzpYwQjcjl0O9BxHuuy9337KbgNPJBz3T+RGeulVmPbMO0s0pMEU9080
 40TRo1i0gkrMuR+9F2WvC9zq13+BgMXaxhAWrBIMlPJvalAagn/1F2jALgXQcVWGCb
 4RsrGLJ60fZpJwrFYouMw77VxAL0CskD/5QxdGhT1OS8bozz+U4/mfxQg77AHz4tR7
 SV2LaqEeD43UQQHQg666GxPkWm6e4UloHqTowhbrSJ/3ESvYZwhAUOC/sJPM8QXJmj
 Hx0jE7hsaG5f+rSOPWwsEsMn7p64KuMYYkg3IUGW6A8jNEQUfEVhApZ4XhuI/crV3Z
 acNk/LUVAEU1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 20/39] ASoC: Intel: sof_nau8825: Move quirk check
 to the front in late probe
Date: Sun, 14 Aug 2022 12:23:09 -0400
Message-Id: <20220814162332.2396012-20-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com, tiwai@suse.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, alsa-devel@alsa-project.org,
 mac.chiang@intel.com, Mark Brown <broonie@kernel.org>, CTLIN0@nuvoton.com,
 akihiko.odaki@gmail.com, peter.ujfalusi@linux.intel.com,
 Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

[ Upstream commit 5b56db90bbaf9d8581e5e6268727d8ad706555e4 ]

The sof_rt5682_quirk check was placed in the middle of
hdmi handling code, move it to the front to be consistent
with sof_rt5682.c/sof_card_late_probe().

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20220725194909.145418-11-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_nau8825.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index 33de043b66c6..b6826d6572b8 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -177,11 +177,6 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 	struct sof_hdmi_pcm *pcm;
 	int err;
 
-	if (list_empty(&ctx->hdmi_pcm_list))
-		return -EINVAL;
-
-	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
-
 	if (sof_nau8825_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT) {
 		/* Disable Left and Right Spk pin after boot */
 		snd_soc_dapm_disable_pin(dapm, "Left Spk");
@@ -191,6 +186,11 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 			return err;
 	}
 
+	if (list_empty(&ctx->hdmi_pcm_list))
+		return -EINVAL;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct sof_hdmi_pcm, head);
+
 	return hda_dsp_hdmi_build_controls(card, pcm->codec_dai->component);
 }
 
-- 
2.35.1

