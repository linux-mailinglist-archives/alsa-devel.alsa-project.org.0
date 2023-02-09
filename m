Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFC36906AF
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:19:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 345ECE0F;
	Thu,  9 Feb 2023 12:18:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 345ECE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941566;
	bh=hq6nmMg5CiRsVDfcKqX5x6arJmJVCZ1gJxMc4loHpAY=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=E4rhZyZtQWCGnIdDOq4fM4cr4Sq4E4KpR44sKIt23l2Xdplca6fbvhyqGCBTqJP+N
	 xxhggtSYB76g/9zfIigC9v1oXWhpKEBppCtYYJUe1+mqm/B/HopxxzhajAOuQJ/PZP
	 HxkSlJj/kNovuvyscveM+g/KGKQXgWSQHKL9uy48=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 873ABF80525;
	Thu,  9 Feb 2023 12:17:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A93A9F80526; Thu,  9 Feb 2023 12:17:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 56981F804F2
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56981F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OVLiCfyb
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4576361A1E;
	Thu,  9 Feb 2023 11:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABB0C4339B;
	Thu,  9 Feb 2023 11:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941454;
	bh=hq6nmMg5CiRsVDfcKqX5x6arJmJVCZ1gJxMc4loHpAY=;
	h=From:To:Cc:Subject:Date:From;
	b=OVLiCfybhyyrtFB+9j5MX5LRj4QimVUIcNDW45H8E3RkvzkQ9oigp60JXRSry3bGO
	 2VtiaAKXzY0yvNzMN+WKrDL/TV88Y0QT5zqSosE5CdjLYjL+zlSyOn+PD4jBe2D7VO
	 oap0Ppky6rRnF1R0V/QuGRJtSS2DkEmocGRa4nIYGZtgD+7FT0QuJ4m21TDNa6X8u+
	 J3B3xnJbQ2exl/5hJPrcZAn8R2WyPH6AyIhgLlZf4bRuJm1kGRgeXI1BkWEnt+Bz9g
	 iNje2D1Ravn6S5ifE2hGX2rgSHbmr5i1dWZRwYcPR21LSxFNpL2USX1Qp/9kXU8srU
	 3ltrNLm+ovZgg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 01/17] ASoC: Intel: sof_rt5682: always set
 dpcm_capture for amplifiers
Date: Thu,  9 Feb 2023 06:17:13 -0500
Message-Id: <20230209111731.1892569-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KGTIKSQDXJ5DD2PCNKWOKO4XLJNHIXZ7
X-Message-ID-Hash: KGTIKSQDXJ5DD2PCNKWOKO4XLJNHIXZ7
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, cezary.rojewski@intel.com,
 liam.r.girdwood@linux.intel.com, tiwai@suse.com, brent.lu@intel.com,
 yong.zhi@intel.com, ajye_huang@compal.corp-partner.google.com,
 akihiko.odaki@gmail.com, vamshi.krishna.gopal@intel.com,
 ye.xingchen@zte.com.cn, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KGTIKSQDXJ5DD2PCNKWOKO4XLJNHIXZ7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit 324f065cdbaba1b879a63bf07e61ca156b789537 ]

The amplifier may provide hardware support for I/V feedback, or
alternatively the firmware may generate an echo reference attached to
the SSP and dailink used for the amplifier.

To avoid any issues with invalid/NULL substreams in the latter case,
always unconditionally set dpcm_capture.

Link: https://github.com/thesofproject/linux/issues/4083
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Link: https://lore.kernel.org/r/20230119163459.2235843-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_rt5682.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f096bd6d69be7..d0ce2f06b30c6 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -737,8 +737,6 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
 			links[id].init = max_98373_spk_codec_init;
 			links[id].ops = &max_98373_ops;
-			/* feedback stream */
-			links[id].dpcm_capture = 1;
 		} else if (sof_rt5682_quirk &
 				SOF_MAX98360A_SPEAKER_AMP_PRESENT) {
 			max_98360a_dai_link(&links[id]);
@@ -751,6 +749,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].platforms = platform_component;
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].dpcm_playback = 1;
+		/* feedback stream or firmware-generated echo reference */
+		links[id].dpcm_capture = 1;
+
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
-- 
2.39.0

