Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDC69069D
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C6A482B;
	Thu,  9 Feb 2023 12:18:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C6A482B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941535;
	bh=e5xKhM6EHuypLaXFIb6K7TSOUUobBXtWAZExTQ7ruVk=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l3gjebFgISlx0Tro0wgBUI3Cy72seElai9HDjEvt/iOHC4Qsx0P9VW2rK2ih4pwNk
	 QhgEm0CvkWRrG10j590U0E2FtPno9hLGL4/7poIKxn2Hpu4Zwyijw9S4aDU+yJnFRm
	 /XUmp7AckeB5mmWDBUi2SkogjF9xIGOjXMpJCrN0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E828F800E4;
	Thu,  9 Feb 2023 12:16:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA369F8021D; Thu,  9 Feb 2023 12:16:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BAD33F80086
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:15:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAD33F80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=prCjN49M
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09BAFB820FF;
	Thu,  9 Feb 2023 11:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28B88C433D2;
	Thu,  9 Feb 2023 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675941316;
	bh=e5xKhM6EHuypLaXFIb6K7TSOUUobBXtWAZExTQ7ruVk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=prCjN49MtYINqZnzcQX+2Wsbyq3EwqvI4xYEV7sVce6cafUgFiYJZWy/aQX2LrPxZ
	 AM7jl3WflQ7WXNJIKcs4UQxoXXdJzLFgIk30BnWBW5N78kAbNqwmcKBDRHh2UlvTUx
	 QnD03ycKtdRtR9owsay9eTGNf4PuWAdGdd9h+mFSKwfu+mkPZQzNTGMQM6WfwIDKVw
	 X/mDGvOssObi8LtQDoVx9i+SB486ebLaNMvmBuQx47gpxO0UnefELsN21Z+lfvb5Bb
	 4L8GQnA3gQWP7IZFs6XB8rIxArpkdYk89Mw7q1sYQ7ktwlh5atp5jtXVinwDw0JCBo
	 RIRbxKfAGFs0A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 05/38] ASoC: Intel: sof_cs42l42: always set
 dpcm_capture for amplifiers
Date: Thu,  9 Feb 2023 06:14:24 -0500
Message-Id: <20230209111459.1891941-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230209111459.1891941-1-sashal@kernel.org>
References: <20230209111459.1891941-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TG5BVZH3O3NOY3LFMYPGP57SMOQCCMOP
X-Message-ID-Hash: TG5BVZH3O3NOY3LFMYPGP57SMOQCCMOP
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
 akihiko.odaki@gmail.com, ye.xingchen@zte.com.cn, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TG5BVZH3O3NOY3LFMYPGP57SMOQCCMOP/>
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
index e38bd2831e6ac..e9d190cb13b0a 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -336,6 +336,9 @@ static int create_spk_amp_dai_links(struct device *dev,
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

