Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 641EF6C5613
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:03:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 960A8850;
	Wed, 22 Mar 2023 21:02:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 960A8850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515390;
	bh=4TgJablwOESgf7aAECG0zRxEoDPpNi4ShnAHqdp41b8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GgML7ETlcRGzswJaYsh4cVlk1MT8eESWhizcLyWvDiTGlk7hH4DWX64eIcWNLddxp
	 NWxE8Xn5132mzE7QCc4QYVJbP2ORdRaqlFbUUyb1RXbjgO7D/TxiqFeM1UrhymtUqH
	 w9VEyfGStl/gVCLHcIDAkjzJpkuS0tD8Bb2L8qtw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EC69F8052E;
	Wed, 22 Mar 2023 20:59:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 11B09F8055A; Wed, 22 Mar 2023 20:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 141CCF8052E
	for <alsa-devel@alsa-project.org>; Wed, 22 Mar 2023 20:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 141CCF8052E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iDh5/W8/
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4FCA6228F;
	Wed, 22 Mar 2023 19:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5563CC433EF;
	Wed, 22 Mar 2023 19:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515192;
	bh=4TgJablwOESgf7aAECG0zRxEoDPpNi4ShnAHqdp41b8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDh5/W8/3Rk2JRE8O1J8IzjeEoU1RaunHwfJlj7AGovQYrZXgNpwPfkPcPWHc6s2u
	 eRRIvizXyssDU1zGqX5SgUnu/lcKbsEckIU1t11C26f0jto7qHJFs3jvEQjZy/UyJZ
	 5covjzSbYYW0qKS2FUdg5Z3IbLI5fLHSXtYAHVqUEgw8P4Xr2ZF1L6KItW/kNAMEnL
	 PYdmd9pKmpeiibXuDxRDN7n6Cq4txyGeJoxX+YfdZzh7NkXw2bcIsQkGP7LL59uON8
	 60PTdCkmmHzF1IO3ANAhYbRodymUT5nE6aMesEkV490yC2f+jn9CXJnm+96HuMNjxg
	 eM9o7Vqm92AXw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 04/34] ASoC: Intel: avs: da7219: Explicitly define
 codec format
Date: Wed, 22 Mar 2023 15:58:56 -0400
Message-Id: <20230322195926.1996699-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195926.1996699-1-sashal@kernel.org>
References: <20230322195926.1996699-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZW3FLVMI4FKPKPEQZRN4SWEF7KJ7ZXBU
X-Message-ID-Hash: ZW3FLVMI4FKPKPEQZRN4SWEF7KJ7ZXBU
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Mark Brown <broonie@kernel.org>,
 Sasha Levin <sashal@kernel.org>, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, peter.ujfalusi@linux.intel.com,
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, tiwai@suse.com, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZW3FLVMI4FKPKPEQZRN4SWEF7KJ7ZXBU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 61f368624fe4d0c25c6e9c917574b8ace51d776e ]

da7219 is headset codec configured in 48000/2/S24_LE format regardless
of front end format, so force it to be so.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230303134854.2277146-3-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/boards/da7219.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 02ae542ad7792..a63563594b4cd 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -111,6 +111,26 @@ static int avs_da7219_codec_init(struct snd_soc_pcm_runtime *runtime)
 	return 0;
 }
 
+static int
+avs_da7219_be_fixup(struct snd_soc_pcm_runtime *runrime, struct snd_pcm_hw_params *params)
+{
+	struct snd_interval *rate, *channels;
+	struct snd_mask *fmt;
+
+	rate = hw_param_interval(params, SNDRV_PCM_HW_PARAM_RATE);
+	channels = hw_param_interval(params, SNDRV_PCM_HW_PARAM_CHANNELS);
+	fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
+
+	/* The ADSP will convert the FE rate to 48k, stereo */
+	rate->min = rate->max = 48000;
+	channels->min = channels->max = 2;
+
+	/* set SSP0 to 24 bit */
+	snd_mask_none(fmt);
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
+	return 0;
+}
+
 static int avs_create_dai_link(struct device *dev, const char *platform_name, int ssp_port,
 			       struct snd_soc_dai_link **dai_link)
 {
@@ -142,6 +162,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->num_platforms = 1;
 	dl->id = 0;
 	dl->dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_CBS_CFS;
+	dl->be_hw_params_fixup = avs_da7219_be_fixup;
 	dl->init = avs_da7219_codec_init;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-- 
2.39.2

