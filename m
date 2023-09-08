Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE7E798FF4
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Sep 2023 21:36:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F730DF4;
	Fri,  8 Sep 2023 21:35:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F730DF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694201769;
	bh=VEfuBzvAe1ClXyjHdy//kvGqpsKQLdmmE3zetC7ol28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rqjmOnSORas8Brh76YMmV0CH5XQ4+Mty/lKjOHmCxqV97EGw7vYGtMpuvUSIRucUf
	 sUHPVIDZ11t0wbW65e5O2vMwyLvKXmdDTHSceIy5ZVzcN8riI9QngokvnWYKh9CRn9
	 lGGEjJqUTDgx+zxOGcZz2IBJzz7veBwblva5X4zI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D7F3F80563; Fri,  8 Sep 2023 21:35:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CA8D1F80563;
	Fri,  8 Sep 2023 21:35:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C4F6F80579; Fri,  8 Sep 2023 21:35:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABCAEF80563
	for <alsa-devel@alsa-project.org>; Fri,  8 Sep 2023 21:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABCAEF80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rwEevOfB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3BF55B821F2;
	Fri,  8 Sep 2023 19:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A86AC43140;
	Fri,  8 Sep 2023 19:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694201698;
	bh=VEfuBzvAe1ClXyjHdy//kvGqpsKQLdmmE3zetC7ol28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rwEevOfB2+fTI/gyU3WbSQWRgArhSYoC9W8Zh9JLOzqJW8Yc3SohJ+SUXF6INC/Bf
	 Dt/xFZRSkddiYy5W2ZcUU7SGj2QJHIMaCaVdZ8+jLPM+/TL/IsdbHUPJlgmAVehn1R
	 Uvk2tpUQ+0gTQEkLhALIcfoLPchM9Cd/sKFKFTlqUg5Ve70YGdK5TpYHfkxk0r1LhW
	 dE0oQe5GbVNeaN/9Q39snbJNUIcvyNFlJOMHurDUERji3najV5THHzYgAkTxVqoK4N
	 PM0rzre2wmp9aJEnk7OrJquMqBkJYYjSuauIVsUY8Xf7eQfD5UIIgE62VsoxLBGlwR
	 t98uXa6g+rc1Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Takashi Iwai <tiwai@suse.de>,
	Sasha Levin <sashal@kernel.org>,
	perex@perex.cz,
	tiwai@suse.com,
	broonie@kernel.org,
	amadeuszx.slawinski@linux.intel.com,
	bradynorander@gmail.com,
	muralidhar.reddy@intel.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.1 13/22] ALSA: hda: intel-dsp-cfg: add LunarLake
 support
Date: Fri,  8 Sep 2023 15:33:57 -0400
Message-Id: <20230908193407.3463368-13-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GHNSRZTL4SARI44XY4XPCC7UVAAM6KTU
X-Message-ID-Hash: GHNSRZTL4SARI44XY4XPCC7UVAAM6KTU
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GHNSRZTL4SARI44XY4XPCC7UVAAM6KTU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit d2852b8c045ebd31d753b06f2810df5be30ed56a ]

One more PCI ID for the road.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20230802150105.24604-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/hda/intel-dsp-config.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 317bdf6dcbef4..2873420c9aca8 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -481,6 +481,14 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 
+/* Lunar Lake */
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_LUNARLAKE)
+	/* Lunarlake-P */
+	{
+		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
+		.device = PCI_DEVICE_ID_INTEL_HDA_LNL_P,
+	},
+#endif
 };
 
 static const struct config_entry *snd_intel_dsp_find_config
-- 
2.40.1

