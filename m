Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E32589CC94
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 21:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67C0823DF;
	Mon,  8 Apr 2024 21:43:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67C0823DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712605423;
	bh=4qtLV05lDjmjdiMZgc2NNyc/kZf7iepOU2DsqdEnfJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hjmoIwnIRiNtyJ8vEZB6EK9/YfaNhEj9iYBKVo1sggelB1yaL37WHoXw1GWAQtL99
	 EFvGZzP5UOgSTNiXZSoDLG1oxQZjN3zKwRq8b/DN3RiM9DYRkL18sHBcbak6DiQIvn
	 ruoS+M+Niu2D0a98aHvyQ8myfjeaMf9NdNEZHH74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5362BF8061F; Mon,  8 Apr 2024 21:42:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5594BF8061B;
	Mon,  8 Apr 2024 21:42:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14B39F8028B; Mon,  8 Apr 2024 21:42:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 04F84F8028B
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 21:42:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F84F8028B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NhWweSwl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712605327; x=1744141327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4qtLV05lDjmjdiMZgc2NNyc/kZf7iepOU2DsqdEnfJY=;
  b=NhWweSwl2dZJVOMWxYVfVgzihTX2x3yieqpQ8ZIyfXG6hojqnTFskyaA
   yI9P7YHes39OqpKV0uOIHwzkyU9DuBcJvGK1Ff1zrfzn6adTIC3PsUqVv
   QG7hbqN3S6sIRxnTF0k4W8dZD5mKnTX58uMPLWXlnRe1rsx1hxG+eR1dT
   MYOGJSUizPTrKxt7Nes81B8wBkfYfIpEARxYs7TGEm294/IKzhCsL97ek
   hti7/wb2vNI7gzfWEkE/lZ8NOztYDBWD3z6W+asJSNg5z4v5RnWQcekap
   tozaqaXperevzcqdhj5cfN7VhuIkVmnqcFHMCIbGZE6940kIKw4V9y62V
   g==;
X-CSE-ConnectionGUID: YJMX/YHeROGrk1khlAXa4g==
X-CSE-MsgGUID: I79A4Y7bR7+Sfzqie6Rtsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30390465"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="30390465"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:58 -0700
X-CSE-ConnectionGUID: 5E3flx/pQbmZhNtM84gctg==
X-CSE-MsgGUID: ZN/MqZMzTjegvfrnUmxRjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24776971"
Received: from aikuseru-mobl1.amr.corp.intel.com (HELO pbossart-mobl6.lan)
 ([10.212.40.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:41:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/3] ASoC: SOF: debug: show firmware/topology prefix/names
Date: Mon,  8 Apr 2024 14:41:47 -0500
Message-Id: <20240408194147.28919-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
References: <20240408194147.28919-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: M7QF3QTNV5OD2N3FGLJ545I4NNJESVPT
X-Message-ID-Hash: M7QF3QTNV5OD2N3FGLJ545I4NNJESVPT
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7QF3QTNV5OD2N3FGLJ545I4NNJESVPT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SOF driver has multiple profiles to select firmware/topology
prefix/names depending on the platform and ipc_type, and each of those
fields can be overridden with kernel parameters. This results in some
cases in confusion on what configuration is actually used in a given
test.

We currently log the firmware and topology names in the kernel logs,
but there's been an ask to add the information in debugfs to simplify
test scripts used by developers and CI.

This isn't meant to be a stable ABI used by apps, changes will be
allowed as needed.

Closes: https://github.com/thesofproject/linux/issues/3867
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/debug.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 937e51b02a24..cf282c8b18af 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -311,14 +311,32 @@ EXPORT_SYMBOL_GPL(snd_sof_dbg_memory_info_init);
 
 int snd_sof_dbg_init(struct snd_sof_dev *sdev)
 {
+	struct snd_sof_pdata *plat_data = sdev->pdata;
 	struct snd_sof_dsp_ops *ops = sof_ops(sdev);
 	const struct snd_sof_debugfs_map *map;
+	struct dentry *fw_profile;
 	int i;
 	int err;
 
 	/* use "sof" as top level debugFS dir */
 	sdev->debugfs_root = debugfs_create_dir("sof", NULL);
 
+	/* expose firmware/topology prefix/names for test purposes */
+	fw_profile = debugfs_create_dir("fw_profile", sdev->debugfs_root);
+
+	debugfs_create_str("fw_path", 0444, fw_profile,
+			   (char **)&plat_data->fw_filename_prefix);
+	debugfs_create_str("fw_lib_path", 0444, fw_profile,
+			   (char **)&plat_data->fw_lib_prefix);
+	debugfs_create_str("tplg_path", 0444, fw_profile,
+			   (char **)&plat_data->tplg_filename_prefix);
+	debugfs_create_str("fw_name", 0444, fw_profile,
+			   (char **)&plat_data->fw_filename);
+	debugfs_create_str("tplg_name", 0444, fw_profile,
+			   (char **)&plat_data->tplg_filename);
+	debugfs_create_u32("ipc_type", 0444, fw_profile,
+			   (u32 *)&plat_data->ipc_type);
+
 	/* init dfsentry list */
 	INIT_LIST_HEAD(&sdev->dfsentry_list);
 
-- 
2.40.1

