Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE242718271
	for <lists+alsa-devel@lfdr.de>; Wed, 31 May 2023 15:43:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE78207;
	Wed, 31 May 2023 15:42:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE78207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685540585;
	bh=T+b1Mld9xi7m8dULwPfvheiEogr8e/MnWZp9YePKVo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=p+BdbUeM+R1WlNrUSOEQzXa6QqxE8MHY7kur3urG2N2XegXi+Ks0cn6Hgk4H0zkM3
	 GbCcCFa9+5vyvWVDtl5j9askVi3n7R7abrgs0teth/5FZdYv0BAD+TEV5XyYsccmya
	 4Uh+THszzjYGGSMsyUL5QsKNIHMM0Lq39GeiK0uk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AD05F8057A; Wed, 31 May 2023 15:41:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAB39F8056F;
	Wed, 31 May 2023 15:41:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97E07F8057B; Wed, 31 May 2023 15:41:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 00827F8056F
	for <alsa-devel@alsa-project.org>; Wed, 31 May 2023 15:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00827F8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lFwVI67r
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E21D963B06;
	Wed, 31 May 2023 13:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3079C433EF;
	Wed, 31 May 2023 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685540474;
	bh=T+b1Mld9xi7m8dULwPfvheiEogr8e/MnWZp9YePKVo0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lFwVI67r+NNtV3qfBDAdj010Uzvb/Pfg0rBKhXwkfXvvl1uWAsnUi42ZFjA4inr9K
	 /mAJt7elrwHyC+aPCWLA4uy/LKhf4134XBZKOzp8/PUaQIRyOP4ZrZXP0kwn1hzGPK
	 2JfzJbD65WdGK6ha45nZLmmn14O/MkZt2MP3glH6ZL+nfKTTpgurRl096kioFpYGSS
	 RBf+Oy/HaS5VLn4nf/Y6dy6CLcf/QnHghG/cX1ysa5+Q0d0u8MscTfO7lRZZfnyARw
	 utUwc69p1iVvcyRGGi2myafzdEjCmLDXng1YCPjty/R/URVhXyJOD30u7fU6gxuI2w
	 zPk5C/LoGP3Kw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com,
	piotrx.maziarz@linux.intel.com,
	zhangyiqun@phytium.com.cn,
	alsa-devel@alsa-project.org
Subject: [PATCH AUTOSEL 6.3 23/37] ASoC: Intel: avs: Fix
 avs_path_module::instance_id size
Date: Wed, 31 May 2023 09:40:05 -0400
Message-Id: <20230531134020.3383253-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531134020.3383253-1-sashal@kernel.org>
References: <20230531134020.3383253-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IUQOEA4VANSIG7GVVHCKTVBZIYRSGYYS
X-Message-ID-Hash: IUQOEA4VANSIG7GVVHCKTVBZIYRSGYYS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IUQOEA4VANSIG7GVVHCKTVBZIYRSGYYS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

[ Upstream commit 320f4d868b83a804e3a4bd61a5b7d0f1db66380e ]

All IPCs using instance_id use 8 bit value. Original commit used 16 bit
value because FW reports possible max value in 16 bit field, but in
practice FW limits the value to 8 bits.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Link: https://lore.kernel.org/r/20230519201711.4073845-7-amadeuszx.slawinski@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/avs/avs.h    | 4 ++--
 sound/soc/intel/avs/dsp.c    | 4 ++--
 sound/soc/intel/avs/path.h   | 2 +-
 sound/soc/intel/avs/probes.c | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index d7fccdcb9c167..0cf38c9e768e7 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -283,8 +283,8 @@ void avs_release_firmwares(struct avs_dev *adev);
 
 int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u8 core_id, u8 domain, void *param, u32 param_size,
-			u16 *instance_id);
-void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+			u8 *instance_id);
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			   u8 ppl_instance_id, u8 core_id);
 int avs_dsp_create_pipeline(struct avs_dev *adev, u16 req_size, u8 priority,
 			    bool lp, u16 attributes, u8 *instance_id);
diff --git a/sound/soc/intel/avs/dsp.c b/sound/soc/intel/avs/dsp.c
index b881100d3e02a..aa03af4473e94 100644
--- a/sound/soc/intel/avs/dsp.c
+++ b/sound/soc/intel/avs/dsp.c
@@ -225,7 +225,7 @@ static int avs_dsp_put_core(struct avs_dev *adev, u32 core_id)
 
 int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 			u8 core_id, u8 domain, void *param, u32 param_size,
-			u16 *instance_id)
+			u8 *instance_id)
 {
 	struct avs_module_entry mentry;
 	bool was_loaded = false;
@@ -272,7 +272,7 @@ int avs_dsp_init_module(struct avs_dev *adev, u16 module_id, u8 ppl_instance_id,
 	return ret;
 }
 
-void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u16 instance_id,
+void avs_dsp_delete_module(struct avs_dev *adev, u16 module_id, u8 instance_id,
 			   u8 ppl_instance_id, u8 core_id)
 {
 	struct avs_module_entry mentry;
diff --git a/sound/soc/intel/avs/path.h b/sound/soc/intel/avs/path.h
index 197222c5e008e..657f7b093e805 100644
--- a/sound/soc/intel/avs/path.h
+++ b/sound/soc/intel/avs/path.h
@@ -37,7 +37,7 @@ struct avs_path_pipeline {
 
 struct avs_path_module {
 	u16 module_id;
-	u16 instance_id;
+	u8 instance_id;
 	union avs_gtw_attributes gtw_attrs;
 
 	struct avs_tplg_module *template;
diff --git a/sound/soc/intel/avs/probes.c b/sound/soc/intel/avs/probes.c
index 70a94201d6a56..275928281c6c6 100644
--- a/sound/soc/intel/avs/probes.c
+++ b/sound/soc/intel/avs/probes.c
@@ -18,7 +18,7 @@ static int avs_dsp_init_probe(struct avs_dev *adev, union avs_connector_node_id
 {
 	struct avs_probe_cfg cfg = {{0}};
 	struct avs_module_entry mentry;
-	u16 dummy;
+	u8 dummy;
 
 	avs_get_module_entry(adev, &AVS_PROBE_MOD_UUID, &mentry);
 
-- 
2.39.2

