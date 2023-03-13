Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CF6B753A
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Mar 2023 12:05:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DCB27147E;
	Mon, 13 Mar 2023 12:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DCB27147E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678705549;
	bh=miL0D9BfCShEftzf2YWntzDjLwJZxpqx9D0xLPPlnNA=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NjTPGvHiG1vM9E5/49bdEaLcNpw7A6gHvLNKPd9MlOAiKuvzAt6mkPUPDcsbtR7s5
	 PPU8S1kl60vkzhMAkVnjfwyk1VTfePo7CW9mgTbgKeeuZyvrZiWiJr96ggjgw9/4EK
	 L4wv9ZKLonJfU5WdqDMscFDD7olKp3UqcfgJSkCc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C9D4F80548;
	Mon, 13 Mar 2023 12:03:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67932F8051B; Mon, 13 Mar 2023 12:03:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA82DF8032D
	for <alsa-devel@alsa-project.org>; Mon, 13 Mar 2023 12:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA82DF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WT50ErhR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678705423; x=1710241423;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=miL0D9BfCShEftzf2YWntzDjLwJZxpqx9D0xLPPlnNA=;
  b=WT50ErhRvGbJPs3CECkBwx/IEVF39dkfasYe//ayNn1bMOS6XUJvB6nF
   U3KIuO56qTpY6Ls2M1sZKrfnlWxIEEsRsODn42ntPPe5AxiP9Q1FHpe1C
   /yrYy+yeEZ9JZA7rdw+/vepgTN4RFQO0xmBW1itWEolQX0kLonuNuk2OK
   0VLgutNqW2x48ArZZnnXPM5HxI7o5CviFCMXyKTRKMSOUxNKylRq/rI39
   JhqMpgotheTi8aqO3zWCNszPe05Y/cJZeNWJtHg5TtouLbItNU7uXOcL+
   Y8N2HJQJzFNVfKoDgkUjFMblEIZoOOoUNszycFn5x142qB2vzsfKeBDGO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="423384156"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="423384156"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="655939099"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400";
   d="scan'208";a="655939099"
Received: from tchambon-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.68])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 04:03:37 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 6/7] ASoC: SOF: ipc4-topology: Add support for TPLG_CTL_BYTES
Date: Mon, 13 Mar 2023 13:03:43 +0200
Message-Id: <20230313110344.16644-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
References: <20230313110344.16644-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JJGC5CGXVWOYRNOEPLHOPQWOBP5ML64H
X-Message-ID-Hash: JJGC5CGXVWOYRNOEPLHOPQWOBP5ML64H
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JJGC5CGXVWOYRNOEPLHOPQWOBP5ML64H/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Libin Yang <libin.yang@intel.com>

Add byte type support for IPC4. The bytes controls are used to transfer
configuration blobs to/from firmware via large_config messages.

Signed-off-by: Libin Yang <libin.yang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 67 +++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 0bb16ed38e48..7cc57e795f5a 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1506,6 +1506,71 @@ static int sof_ipc4_control_load_volume(struct snd_sof_dev *sdev, struct snd_sof
 	return 0;
 }
 
+static int sof_ipc4_control_load_bytes(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
+{
+	struct sof_ipc4_control_data *control_data;
+	struct sof_ipc4_msg *msg;
+	int ret;
+
+	if (scontrol->max_size < (sizeof(*control_data) + sizeof(struct sof_abi_hdr))) {
+		dev_err(sdev->dev, "insufficient size for a bytes control %s: %zu.\n",
+			scontrol->name, scontrol->max_size);
+		return -EINVAL;
+	}
+
+	if (scontrol->priv_size > scontrol->max_size - sizeof(*control_data)) {
+		dev_err(sdev->dev, "scontrol %s bytes data size %zu exceeds max %zu.\n",
+			scontrol->name, scontrol->priv_size,
+			scontrol->max_size - sizeof(*control_data));
+		return -EINVAL;
+	}
+
+	scontrol->size = sizeof(struct sof_ipc4_control_data) + scontrol->priv_size;
+
+	scontrol->ipc_control_data = kzalloc(scontrol->max_size, GFP_KERNEL);
+	if (!scontrol->ipc_control_data)
+		return -ENOMEM;
+
+	control_data = scontrol->ipc_control_data;
+	control_data->index = scontrol->index;
+	if (scontrol->priv_size > 0) {
+		memcpy(control_data->data, scontrol->priv, scontrol->priv_size);
+		kfree(scontrol->priv);
+		scontrol->priv = NULL;
+
+		if (control_data->data->magic != SOF_IPC4_ABI_MAGIC) {
+			dev_err(sdev->dev, "Wrong ABI magic (%#x) for control: %s\n",
+				control_data->data->magic, scontrol->name);
+			ret = -EINVAL;
+			goto err;
+		}
+
+		/* TODO: check the ABI version */
+
+		if (control_data->data->size + sizeof(struct sof_abi_hdr) !=
+		    scontrol->priv_size) {
+			dev_err(sdev->dev, "Control %s conflict in bytes %zu vs. priv size %zu.\n",
+				scontrol->name,
+				control_data->data->size + sizeof(struct sof_abi_hdr),
+				scontrol->priv_size);
+			ret = -EINVAL;
+			goto err;
+		}
+	}
+
+	msg = &control_data->msg;
+	msg->primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_LARGE_CONFIG_SET);
+	msg->primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg->primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+
+	return 0;
+
+err:
+	kfree(scontrol->ipc_control_data);
+	scontrol->ipc_control_data = NULL;
+	return ret;
+}
+
 static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol)
 {
 	switch (scontrol->info_type) {
@@ -1513,6 +1578,8 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 	case SND_SOC_TPLG_CTL_VOLSW_SX:
 	case SND_SOC_TPLG_CTL_VOLSW_XR_SX:
 		return sof_ipc4_control_load_volume(sdev, scontrol);
+	case SND_SOC_TPLG_CTL_BYTES:
+		return sof_ipc4_control_load_bytes(sdev, scontrol);
 	default:
 		break;
 	}
-- 
2.39.2

