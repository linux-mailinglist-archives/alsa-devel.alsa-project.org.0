Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 258D56ADCCE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Mar 2023 12:07:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A56F71423;
	Tue,  7 Mar 2023 12:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A56F71423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678187260;
	bh=IfgSP5TMi2j/SLIBZi1e+k/nAxKyQXb4tnKwnqub6YM=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ESChCMdeFzENZLe8UvUja5eHZGLmD2yjCRD9sNqvPAsgpb3bdnMegO/rK97GXTrxh
	 cIwONvmwnmx9qDEgic7N4J/TqJOeLkkMMaktVYCOz1TVL0nCrP+Y2SXFOtsXBdIjMX
	 RPC2XjwME52uNnHzbXrAU0nBrM6PTmfgyULmjMks=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EAD81F80236;
	Tue,  7 Mar 2023 12:06:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5D62F8042F; Tue,  7 Mar 2023 12:06:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 64F8DF800DF
	for <alsa-devel@alsa-project.org>; Tue,  7 Mar 2023 12:06:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64F8DF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xr9dzqZY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678187202; x=1709723202;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IfgSP5TMi2j/SLIBZi1e+k/nAxKyQXb4tnKwnqub6YM=;
  b=Xr9dzqZYLUZgy2Ty/MfBeGr/W7YIl28F/WMEbk1rKGE6aebT7sbKRaA3
   vSAc1ejDVb5yzjlv3ISNUb09nG3BCMKwBpRxEx6Mlj7rqrRKVSDP0RQ33
   SkatG+f1KuuzxyUU71urQ+WHWKA+0wokW9tlwLmfL+uAZUMOdL8e1FV49
   IhEaaRbAikIM4JHQdEn5p+a1QADAqJlMVMv9PGepl6TvxV75BU6hlX+SV
   vppoZT4xHYspsHJQfd6JvoRsz1ZUpNiGBslfGYrFQZQVCH9MPIC83COOp
   SMFohSy48yh58rdjeciyNFw2Vwbjuv/2Ixxp0hQz+TiiQxFoI+Yjx3tXU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="338147579"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="338147579"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:06:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="740687916"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400";
   d="scan'208";a="740687916"
Received: from rganesh-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.47.75])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 03:06:34 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: IPC4: update gain ipc msg definition to align with
 fw
Date: Tue,  7 Mar 2023 13:06:56 +0200
Message-Id: <20230307110656.1816-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RK532DNFKUMAD2ZTYD65S2KWTEY62XLY
X-Message-ID-Hash: RK532DNFKUMAD2ZTYD65S2KWTEY62XLY
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, yung-chuan.liao@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RK532DNFKUMAD2ZTYD65S2KWTEY62XLY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

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
---
 sound/soc/sof/ipc4-control.c  | 3 ++-
 sound/soc/sof/ipc4-topology.c | 4 ++--
 sound/soc/sof/ipc4-topology.h | 6 ++++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 67bd2233fd9a..9a71af1a613a 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -97,7 +97,8 @@ sof_ipc4_set_volume_data(struct snd_sof_dev *sdev, struct snd_sof_widget *swidge
 		}
 
 		/* set curve type and duration from topology */
-		data.curve_duration = gain->data.curve_duration;
+		data.curve_duration_l = gain->data.curve_duration_l;
+		data.curve_duration_h = gain->data.curve_duration_h;
 		data.curve_type = gain->data.curve_type;
 
 		msg->data_ptr = &data;
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 3e27c7a48ebd..b178e40d2f1f 100644
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
@@ -692,7 +692,7 @@ static int sof_ipc4_widget_setup_comp_pga(struct snd_sof_widget *swidget)
 
 	dev_dbg(scomp->dev,
 		"pga widget %s: ramp type: %d, ramp duration %d, initial gain value: %#x, cpc %d\n",
-		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration,
+		swidget->widget->name, gain->data.curve_type, gain->data.curve_duration_l,
 		gain->data.init_val, gain->base_config.cpc);
 
 	ret = sof_ipc4_widget_setup_msg(swidget, &gain->msg);
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 8507171a6e4d..cf1595f8d7d2 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -277,14 +277,16 @@ struct sof_ipc4_control_data {
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

