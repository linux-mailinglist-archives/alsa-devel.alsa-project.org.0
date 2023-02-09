Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 715546906CC
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:20:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D5429E0E;
	Thu,  9 Feb 2023 12:19:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D5429E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941646;
	bh=J08X2vmLDjJwWn1JAxUk9hEAOF6ohBaK+5k8gOt95zc=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=fUpNdrrJSYdfZ2YhkoMc9Q3GfNjXZkN0y/CnEr0sg75xTI0kGd9hqYrX6xbm8xrxJ
	 rnuJ8YwbQuJR5nmipWcbTYVkoWhMQbiEvRc7zcN3cOyB+ty1TUYOQCJVrINcIs6knL
	 lesqkK9Smap/+PAakSFHgRqB7Nx7mGYPomjvAJ3o=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 233C1F80568;
	Thu,  9 Feb 2023 12:18:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F993F80570; Thu,  9 Feb 2023 12:18:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A5663F80568
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:18:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5663F80568
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mzzj5AH8
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 01AE5CE2470;
	Thu,  9 Feb 2023 11:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1FFC4339B;
	Thu,  9 Feb 2023 11:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941516;
	bh=J08X2vmLDjJwWn1JAxUk9hEAOF6ohBaK+5k8gOt95zc=;
	h=From:To:Cc:Subject:Date:From;
	b=mzzj5AH8U0thFjzUzDK9oNrY0sBlD24d9vAqFLEFAHc17G0AbM5fiAFmeWagKWR42
	 4MQ73eM1/bEAMvgop8o0noJYe2FDmBYFsTPrj6gYkpDWXLX13MW/+MpaYAstKBYDsV
	 0zN2xXsH11cKezjYcyB+hYDrbdTYu/MPQbGc9qTC+FbqIlvZHl1gRUec0gfcbTXjYd
	 coUcs1mc0NkMCEukL+IuLtsrXYVm+fBrLSe8MthgX+eILrxFjrCjzdks7ga90xigwd
	 KHiL8IHwkfh4/k4/NIA5yB1dOQA0CNUqrd2bY2r7qtakghNIb//5mg/tDIbmVsPuDv
	 mZ7nd+imM3JBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 01/13] ASoC: Intel: sof_rt5682: always set
 dpcm_capture for amplifiers
Date: Thu,  9 Feb 2023 06:18:19 -0500
Message-Id: <20230209111833.1892896-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KJTXG2QM6TLSQSWJEOGGJQOGFVUQVL3C
X-Message-ID-Hash: KJTXG2QM6TLSQSWJEOGGJQOGFVUQVL3C
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
 ye.xingchen@zte.com.cn, vamshi.krishna.gopal@intel.com,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KJTXG2QM6TLSQSWJEOGGJQOGFVUQVL3C/>
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
 sound/soc/intel/boards/sof_rt5682.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 1f94fa5a15db6..5883d1fa3b7ed 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -704,6 +704,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		links[id].num_platforms = ARRAY_SIZE(platform_component);
 		links[id].nonatomic = true;
 		links[id].dpcm_playback = 1;
+		/* feedback stream or firmware-generated echo reference */
+		links[id].dpcm_capture = 1;
+
 		links[id].no_pcm = 1;
 		links[id].cpus = &cpus[id];
 		links[id].num_cpus = 1;
-- 
2.39.0

