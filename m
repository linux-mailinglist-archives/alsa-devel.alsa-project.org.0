Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D06C55C9
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Mar 2023 21:01:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DF54EB3;
	Wed, 22 Mar 2023 21:00:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DF54EB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679515265;
	bh=mX+f6M4NzGYTdlnA/2Arcb1IOK+FIYPDFY/pPmN2tmo=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=L+Jv2m6DYR+uLyQzyIKnXUERTTLXNxzdEZFJEtbCyD6YX59UvX/naGfkVqImTHdGM
	 D4y4elLxMyMlmIurILvqaIcIvyAtra4D8FG5JsDpLBsJh6suRjM61ZEaJsylybG3Fp
	 dhFPIhp7U51PuKf82yYxIpLbHWd319V3Ut745qNw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B61E6F80587;
	Wed, 22 Mar 2023 20:58:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E854F80588; Wed, 22 Mar 2023 20:58:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2413F802E8;
	Wed, 22 Mar 2023 20:58:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2413F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=O1x2gz0L
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9ED8B622B4;
	Wed, 22 Mar 2023 19:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFE7C433A7;
	Wed, 22 Mar 2023 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679515099;
	bh=mX+f6M4NzGYTdlnA/2Arcb1IOK+FIYPDFY/pPmN2tmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O1x2gz0L5DKY0TZ2xNqJW0rkgbYlODKm+G3irJbDJF0HvFzYAQC99aSDwT2BazGgg
	 pXw1WSWoRK7qApd6qck0ZmIhNvoimgT/famCH8sBOWkBA8Xe47NhZG/yImpUZWwqXl
	 SmFTQpbWDlDdWA3Z2A9ZOgglrG6sqLtwLJfieMVzl0WEJrPhtZ48TJObFUGcuYPKCu
	 ASNuZgP9v1jsr8BnzFWv/tma9rBnh0ctxXWn/J2hItPWS6m2IDcBpan20XVd5IM56r
	 itarP+3vLPv7PoH5wHEIvTyS5sKjlZWXk9rDfYC5PlnL/s/eYffu6sreWxfankbFUY
	 3Y91Bfr9WA9Ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 19/45] ASoC: SOF: IPC4: update gain ipc msg
 definition to align with fw
Date: Wed, 22 Mar 2023 15:56:13 -0400
Message-Id: <20230322195639.1995821-19-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230322195639.1995821-1-sashal@kernel.org>
References: <20230322195639.1995821-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LXOK3XZO3CFM2P7YPVWTTZIX5E2B363V
X-Message-ID-Hash: LXOK3XZO3CFM2P7YPVWTTZIX5E2B363V
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>,
 lgirdwood@gmail.com, daniel.baluta@nxp.com, tiwai@suse.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LXOK3XZO3CFM2P7YPVWTTZIX5E2B363V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

[ Upstream commit e45cd86c3a78bfb9875a5eb8ab5dab459b59bbe2 ]

Recent firmware changes modified the curve duration from 32 to 64 bits,
which breaks volume ramps. A simple solution would be to change the
definition, but unfortunately the ASoC topology framework only supports
up to 32 bit tokens.

This patch suggests breaking the 64 bit value in low and high parts, with
only the low-part extracted from topology and high-part only zeroes. Since
the curve duration is represented in hundred of nanoseconds, we can still
represent a 400s ramp, which is just fine. The defacto ABI change has no
effect on existing users since the IPC4 firmware has not been released just
yet.

Link: https://github.com/thesofproject/linux/issues/4026

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Link: https://lore.kernel.org/r/20230307110656.1816-1-peter.ujfalusi@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/sof/ipc4-control.c  | 3 ++-
 sound/soc/sof/ipc4-topology.c | 4 ++--
 sound/soc/sof/ipc4-topology.h | 6 ++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 0d5a578c34962..7442ec1c5a4d4 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -84,7 +84,8 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 		}
 
 		/* set curve type and duration from topology */
-		data.curve_duration = gain->data.curve_duration;
+		data.curve_duration_l = gain->data.curve_duration_l;
+		data.curve_duration_h = gain->data.curve_duration_h;
 		data.curve_type = gain->data.curve_type;
 
 		msg->data_ptr = &data;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 65da1cf790d9c..6da6137fa2cbc 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -107,7 +107,7 @@ static const struct sof_topology_token gain_tokens[] = {
 		get_token_u32, offsetof(struct sof_ipc4_gain_data, curve_type)},
 	{SOF_TKN_GAIN_RAMP_DURATION,
 		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
-		offsetof(struct sof_ipc4_gain_data, curve_duration)},
+		offsetof(struct sof_ipc4_gain_data, curve_duration_l)},
 	{SOF_TKN_GAIN_VAL, SND_SOC_TPLG_TUPLE_TYPE_WORD,
 		get_token_u32, offsetof(struct sof_ipc4_gain_data, init_val)},
 };
@@ -670,7 +670,7 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev,
 		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x, cpc %d\n",
-		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration,
+		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration_l,
 		gain->data.init_val, gain->base_config.cpc);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 0aa87a8add5d3..edf1638221a4b 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -217,14 +217,16 @@ struct sof_ipc4_control_data {
  * @init_val: Initial value
  * @curve_type: Curve type
  * @reserved: reserved for future use
- * @curve_duration: Curve duration
+ * @curve_duration_l: Curve duration low part
+ * @curve_duration_h: Curve duration high part
  */
 struct sof_ipc4_gain_data {
 	uint32_t channels;
 	uint32_t init_val;
 	uint32_t curve_type;
 	uint32_t reserved;
-	uint32_t curve_duration;
+	uint32_t curve_duration_l;
+	uint32_t curve_duration_h;
 } __aligned(8);
 
 /**
-- 
2.39.2

