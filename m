Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE00E6B7537
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14392149B;
	Mon, 13 Mar 2023 12:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14392149B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705536;
	bh=mnZnM/lXmOhF9nQCLHvwgqkizAqKJJjcvkNYZ9er5YU=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bepa9CXuLHwBMgwe9hhquZp9WvfCpib9vPtrQw8Yfvta4BvmH41LIxdzjwBPQ6I2M
	 l5j8vgNfnqoIrngffevG5O+uF0xxnIyXN25at9XcM+f1zhy6Jaq5aX08UlQ+1H9sBJ
	 0Iyw5CgDLlav30+AQnCnOiVJRC53Rah/bTqen6i8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE559F8052E;
	Mon, 13 Mar 2023 12:03:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B118F8051B; Mon, 13 Mar 2023 12:03:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E83BF8016C
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E83BF8016C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PQeT62cE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705417; x=1710241417;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mnZnM/lXmOhF9nQCLHvwgqkizAqKJJjcvkNYZ9er5YU=;
  b=PQeT62cEFQeyNoktkis5j1fpMUIp5goLKiVwwzbE38MRhQf4fypamnMR
   JhsM71d5Y+WYc+hw2nl9b/p7r0TmK6okFJftN7Kd2HFc65d/q5OKTNf4k
   4nEj7WO008HrRrI0ZBRj8kUSqaHJwlgaTkM/PUZlHV8alTPD/9u3PqNYT
   p6+juTojZrzYHqsCE+PyclpWtsQExeNP/D0VG8F/ATwGEqHsgm65N2x7W
   wBfCQBgwJEEAp/uiiunACcZRhAAH+WJbn2Gvlj0pXOKj9hYX6XHVrFxuK
   Nv6FGDsVpgdfwVSd/OwyP0R/ra9SfHp1gV2l4nC7rxKu9tNnsO+AjNfao
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384075"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384075"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939064"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939064"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:23 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/7] ASoC: SOF: ipc3-control: Rename snd_sof_refresh_control()
Date: Mon, 13 Mar 2023 13:03:38 +0200
Message-Id: <20230313110344.16644-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: P4NKSWFOYEHP2VPL6ZBXQJKF4SS3FFV7
X-Message-ID-Hash: P4NKSWFOYEHP2VPL6ZBXQJKF4SS3FFV7
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, libin.yang@intel.com,
 jaska.uimonen@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P4NKSWFOYEHP2VPL6ZBXQJKF4SS3FFV7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Rename the snd_sof_refresh_control() to sof_ipc3_refresh_control() to
follow the function naming convention for IPC specific code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-control.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index 217ac5501a98..4e9d04124145 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -104,7 +104,7 @@ static int sof_ipc3_set_get_kcontrol_data(struct snd_sof_control *scontrol,
 	return ret;
 }
 
-static void snd_sof_refresh_control(struct snd_sof_control *scontrol)
+static void sof_ipc3_refresh_control(struct snd_sof_control *scontrol)
 {
 	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
 	struct snd_soc_component *scomp = scontrol->scomp;
@@ -138,7 +138,7 @@ static int sof_ipc3_volume_get(struct snd_sof_control *scontrol,
 	unsigned int channels = scontrol->num_channels;
 	unsigned int i;
 
-	snd_sof_refresh_control(scontrol);
+	sof_ipc3_refresh_control(scontrol);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
@@ -189,7 +189,7 @@ static int sof_ipc3_switch_get(struct snd_sof_control *scontrol,
 	unsigned int channels = scontrol->num_channels;
 	unsigned int i;
 
-	snd_sof_refresh_control(scontrol);
+	sof_ipc3_refresh_control(scontrol);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
@@ -237,7 +237,7 @@ static int sof_ipc3_enum_get(struct snd_sof_control *scontrol,
 	unsigned int channels = scontrol->num_channels;
 	unsigned int i;
 
-	snd_sof_refresh_control(scontrol);
+	sof_ipc3_refresh_control(scontrol);
 
 	/* read back each channel */
 	for (i = 0; i < channels; i++)
@@ -286,7 +286,7 @@ static int sof_ipc3_bytes_get(struct snd_sof_control *scontrol,
 	struct sof_abi_hdr *data = cdata->data;
 	size_t size;
 
-	snd_sof_refresh_control(scontrol);
+	sof_ipc3_refresh_control(scontrol);
 
 	if (scontrol->max_size > sizeof(ucontrol->value.bytes.data)) {
 		dev_err_ratelimited(scomp->dev, "data max %zu exceeds ucontrol data array size\n",
@@ -352,7 +352,7 @@ static int sof_ipc3_bytes_ext_get(struct snd_sof_control *scontrol,
 	struct snd_ctl_tlv header;
 	size_t data_size;
 
-	snd_sof_refresh_control(scontrol);
+	sof_ipc3_refresh_control(scontrol);
 
 	/*
 	 * Decrement the limit by ext bytes header size to
-- 
2.39.2

