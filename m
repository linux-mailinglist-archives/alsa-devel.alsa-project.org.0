Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410C36906B2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:19:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BE69F6;
	Thu,  9 Feb 2023 12:18:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BE69F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941582;
	bh=lfuAHYzrt2sPHR3hAQMkks3VM6Ap55lxyshqk6d3UY4=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u7G+biZYBxfTF/1gX5TMCtuz5aUBU6cEdDsjQzxx0DXrJINp8fwpCigzCAPu9EXID
	 mNf1XipmJrZYFUwc6mfQTVFWNzeJ0zMxPInA5N1ToLWnibmf3FLQd2r9hQPzQFJT2b
	 HTMC+dxBfMoRC6iwvn3vVIoWzPvZ/+ToWlCKebqA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B1EFBF80542;
	Thu,  9 Feb 2023 12:17:50 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 947F3F80526; Thu,  9 Feb 2023 12:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46BCAF804F2
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46BCAF804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jqoaw9aA
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 74F3B61A18;
	Thu,  9 Feb 2023 11:17:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D36C4339B;
	Thu,  9 Feb 2023 11:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941458;
	bh=lfuAHYzrt2sPHR3hAQMkks3VM6Ap55lxyshqk6d3UY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jqoaw9aAMjfl8NeoIjcxzZgHB0fnkpM3TWHTPmj02D+2LNS9psy69lZsGLLY6dlBe
	 T2S33GG2AIJjPiEz28zdHNTkcGyW0nf/8cLv8yJrZVRYyCa325eGPb0a0uOZ0Yv0cp
	 5bRxOYxXobfX+4IJEkMnoLaZhbLDcXDfdrcKj7QqNQyoLwc5f07oX2R19s952Q/Lmp
	 ARCSsz2u23YH0ruzcq0U0uZ48WUCB4pg2ApF9+jKbW9YlthscyOnCEu5w9Fan0HHCF
	 1fj75sxpPHRfdoU5EOywg3IeJppE0zwDB2YL5dFZl7H5QPtMoj3VuQMd7laNYKRD6b
	 gDld09kTSbx9g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 02/17] ASoC: Intel: sof_cs42l42: always set
 dpcm_capture for amplifiers
Date: Thu,  9 Feb 2023 06:17:14 -0500
Message-Id: <20230209111731.1892569-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111731.1892569-1-sashal@kernel.org>
References: <20230209111731.1892569-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IUZP7IF72TGS5APYIJO5WPHX6BQPCRK7
X-Message-ID-Hash: IUZP7IF72TGS5APYIJO5WPHX6BQPCRK7
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
 ye.xingchen@zte.com.cn, akihiko.odaki@gmail.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUZP7IF72TGS5APYIJO5WPHX6BQPCRK7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit e0a52220344ab7defe25b9cdd58fe1dc1122e67c ]

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
Link: https://lore.kernel.org/r/20230119163459.2235843-3-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/boards/sof_cs42l42.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index ce78c18798876..8061082d9fbf3 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -311,6 +311,9 @@ static int create_spk_amp_dai_links(struct device *dev,
 	links[*id].platforms = platform_component;
 	links[*id].num_platforms = ARRAY_SIZE(platform_component);
 	links[*id].dpcm_playback = 1;
+	/* firmware-generated echo reference */
+	links[*id].dpcm_capture = 1;
+
 	links[*id].no_pcm = 1;
 	links[*id].cpus = &cpus[*id];
 	links[*id].num_cpus = 1;
-- 
2.39.0

