Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF18470972A
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 14:17:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F1B4820;
	Fri, 19 May 2023 14:17:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F1B4820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684498671;
	bh=xKs0sKOFC8whl/yuyULPst15ZR2QkGZqx+W9OFp2gFY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e3e9rNJYEfzozFTJhEqUhWLz6QRWq5n3TvAjpz0w/GeOKicGDSrBG7ORZIYXiEXma
	 ZvXPhDg8ipP0RsN2o+Y4NaLF9LEQg5owuoQ2LNVP2ZeZJrkUyexSDhpq5lByt5ATij
	 BzK8Egdoz85xzzlxiDZ0QmPWGj5QL1oaAmhxQfuo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D51B8F80571; Fri, 19 May 2023 14:16:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CA65F8055B;
	Fri, 19 May 2023 14:16:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 40020F80542; Fri, 19 May 2023 14:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C97E8F80272
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 14:15:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C97E8F80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IJyshSvG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684498561; x=1716034561;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKs0sKOFC8whl/yuyULPst15ZR2QkGZqx+W9OFp2gFY=;
  b=IJyshSvGH/QHSQ9R1Hos+DAf+xq+JwbecKEoWp7nJovR/jZ9mPW5S7Ge
   ccRO2UHaiIF42RqCShPygXZtcFPWk3JgEmOicSyU1mbw0Kf1tkrJcVe0B
   54wR/yspKOzvxT1v6iFyTNt5BS/FwzkCq9bEhkbZv6FUoSZw5vYcjlcXz
   XHORZYGUcRCBgedkYRIh+DK0m6TvPxatqw7f46F9fp2f2kaIRSgSlRyeG
   c8WxYtR1xwQT1STfybvGmszNi0B3i9ck4wNajcayIushmXRuZZD0usDZX
   YjXdpA5Gb1yKymLe5NHSnDR5Editqvn3f6ev74yfNsOD0jyCT8iA+Yzdc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="355584409"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="355584409"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 05:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733283658"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="733283658"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 05:15:53 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/7] ASoC: Intel: avs: Fix module lookup
Date: Fri, 19 May 2023 22:17:05 +0200
Message-Id: <20230519201711.4073845-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
References: <20230519201711.4073845-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KWKGA3CDASFKCZLDC2V2ROA3ERYTY4LA
X-Message-ID-Hash: KWKGA3CDASFKCZLDC2V2ROA3ERYTY4LA
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KWKGA3CDASFKCZLDC2V2ROA3ERYTY4LA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When changing value of kcontrol, FW module to which data should be send
needs to be found. Currently it is done in improper way, fix it. Change
function name to indicate that it looks only for volume module.

This allows to change volume during runtime, instead of only changing
init value.

Fixes: be2b81b519d7 ("ASoC: Intel: avs: Parse control tuples")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/control.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/avs/control.c b/sound/soc/intel/avs/control.c
index a8b14b784f8a..3dfa2e9816db 100644
--- a/sound/soc/intel/avs/control.c
+++ b/sound/soc/intel/avs/control.c
@@ -21,17 +21,25 @@ static struct avs_dev *avs_get_kcontrol_adev(struct snd_kcontrol *kcontrol)
 	return to_avs_dev(w->dapm->component->dev);
 }
 
-static struct avs_path_module *avs_get_kcontrol_module(struct avs_dev *adev, u32 id)
+static struct avs_path_module *avs_get_volume_module(struct avs_dev *adev, u32 id)
 {
 	struct avs_path *path;
 	struct avs_path_pipeline *ppl;
 	struct avs_path_module *mod;
 
-	list_for_each_entry(path, &adev->path_list, node)
-		list_for_each_entry(ppl, &path->ppl_list, node)
-			list_for_each_entry(mod, &ppl->mod_list, node)
-				if (mod->template->ctl_id && mod->template->ctl_id == id)
+	spin_lock(&adev->path_list_lock);
+	list_for_each_entry(path, &adev->path_list, node) {
+		list_for_each_entry(ppl, &path->ppl_list, node) {
+			list_for_each_entry(mod, &ppl->mod_list, node) {
+				if (guid_equal(&mod->template->cfg_ext->type, &AVS_PEAKVOL_MOD_UUID)
+				    && mod->template->ctl_id == id) {
+					spin_unlock(&adev->path_list_lock);
 					return mod;
+				}
+			}
+		}
+	}
+	spin_unlock(&adev->path_list_lock);
 
 	return NULL;
 }
@@ -49,7 +57,7 @@ int avs_control_volume_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_va
 	/* prevent access to modules while path is being constructed */
 	mutex_lock(&adev->path_mutex);
 
-	active_module = avs_get_kcontrol_module(adev, ctl_data->id);
+	active_module = avs_get_volume_module(adev, ctl_data->id);
 	if (active_module) {
 		ret = avs_ipc_peakvol_get_volume(adev, active_module->module_id,
 						 active_module->instance_id, &dspvols,
@@ -89,7 +97,7 @@ int avs_control_volume_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_va
 		changed = 1;
 	}
 
-	active_module = avs_get_kcontrol_module(adev, ctl_data->id);
+	active_module = avs_get_volume_module(adev, ctl_data->id);
 	if (active_module) {
 		dspvol.channel_id = AVS_ALL_CHANNELS_MASK;
 		dspvol.target_volume = *volume;
-- 
2.34.1

