Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AD7182E1
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 15:45:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C495E844;
	Wed, 31 May 2023 15:44:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C495E844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685540749;
	bh=9swSHFlNdRRmHcEMmXn4VaK1HAJJeWfGbNvUfnYsJIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UC6/ngiQ06SBAguAjVLGCn1kViqHYhDhMzwZkdp3aXJQSG7iISebzzfhhn790+3Dp
	 XcsrOydNevut9prSDMuGq4DgwrLJ7dv/1FCYvODdrHpZLD3X1pjpv9PN4Dk6LdbvNI
	 BVR9s582LZ+8+vrsq1Kle9XqQOWTRFTtbm7yUwCQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E82EFF805BD; Wed, 31 May 2023 15:43:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58DF8F80544;
	Wed, 31 May 2023 15:43:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFD1BF80544; Wed, 31 May 2023 15:43:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6CC8DF8055A
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 15:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CC8DF8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hAONlEvT
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D74DE63B10;
	Wed, 31 May 2023 13:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52557C4339E;
	Wed, 31 May 2023 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540621;
	bh=9swSHFlNdRRmHcEMmXn4VaK1HAJJeWfGbNvUfnYsJIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hAONlEvTs9HIJhBgTEfRCYx9NrbGSRojt1pf7opYxo8ZT5s9H3qs6qiktXOvQGwIZ
	 irxh70PxrwlwlUfzQf5R5ukRCKJVDR74Eu5Ptu8kwKVywoTc1bsy1CcrwhPRyQ9Y4x
	 sgz/o2KDsGW+nU3BGTg6FEtgyggmEOyUHi/WImU/h3u5RhAn5kmHDZBbGcLsU5NMMn
	 ILBr4pdPGxYW5IX2TGTLxnxC6Q7A98iKLKfeN6TYsWyPMSSGIPUCy0P+w7eS1nSSLP
	 wmUGZUl/tyl/QkpJua2fYq25WMDgfai42q1u8KaSLaEbjnLI5WWm5jO43D4Zrh2bAM
	 lm8XiQgJ6WJ+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 5.15 14/24] ASoC: soc-pcm: test if a BE can be
 prepared
Date: Wed, 31 May 2023 09:43:10 -0400
Message-Id: <20230531134320.3384102-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134320.3384102-1-sashal@kernel.org>
References: <20230531134320.3384102-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XE2W5USEDNCVYHR3YIAKSFSKWGQEJKUO
X-Message-ID-Hash: XE2W5USEDNCVYHR3YIAKSFSKWGQEJKUO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XE2W5USEDNCVYHR3YIAKSFSKWGQEJKUO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

[ Upstream commit e123036be377ddf628226a7c6d4f9af5efd113d3 ]

In the BE hw_params configuration, the existing code checks if any of the
existing FEs are prepared, running, paused or suspended - and skips the
configuration in those cases. This allows multiple calls of hw_params
which the ALSA state machine supports.

This check is not handled for the prepare stage, which can lead to the
same BE being prepared multiple times. This patch adds a check similar to
that of the hw_params, with the main difference being that the suspended
state is allowed: the ALSA state machine allows a transition from
suspended to prepared with hw_params skipped.

This problem was detected on Intel IPC4/SoundWire devices, where the BE
dailink .prepare stage is used to configure the SoundWire stream with a
bank switch. Multiple .prepare calls lead to conflicts with the .trigger
operation with IPC4 configurations. This problem was not detected earlier
on Intel devices, HDaudio BE dailinks detect that the link is already
prepared and skip the configuration, and for IPC3 devices there is no BE
trigger.

Link: https://github.com/thesofproject/sof/issues/7596
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com
Link: https://lore.kernel.org/r/20230517185731.487124-1-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/sound/soc-dpcm.h |  4 ++++
 sound/soc/soc-pcm.c      | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index d963f3b608489..4bb3ebfdaa45e 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -123,6 +123,10 @@ int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
 int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 		struct snd_soc_pcm_runtime *be, int stream);
 
+/* can this BE perform prepare */
+int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+				 struct snd_soc_pcm_runtime *be, int stream);
+
 /* is the current PCM operation for this FE ? */
 int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 76c807372ef50..6ec248778e2fc 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2398,6 +2398,9 @@ int dpcm_be_dai_prepare(struct snd_soc_pcm_runtime *fe, int stream)
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
 			continue;
 
+		if (!snd_soc_dpcm_can_be_prepared(fe, be, stream))
+			continue;
+
 		if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_HW_PARAMS) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
 		    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_SUSPEND) &&
@@ -3047,3 +3050,20 @@ int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
 	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
+
+/*
+ * We can only prepare a BE DAI if any of it's FE are not prepared,
+ * running or paused for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+				 struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
-- 
2.39.2

