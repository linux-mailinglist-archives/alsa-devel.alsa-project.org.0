Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B0D4D8DD8
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Mar 2022 21:07:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04B017CC;
	Mon, 14 Mar 2022 21:06:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04B017CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647288469;
	bh=KyGFR7GQKbIjELhAeh95O3NZ/wi/fjlySV1ylTb+DGc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FZnZfuH8RsM1nVwXZyaxG1OufBuDuXGVh5s4YXC2+8TzKU4uTtJIjZQ30HUdD3KWz
	 MT7sdG5cRlIgzAmkgNcHBYEARGkC7nM17VZjvY79idrXupOn+wZXbwUBeMY3KhZUpN
	 A7hFgCFzLZxsbuIQE1jAhv64QqAb1V1dMabSSu8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7561EF80526;
	Mon, 14 Mar 2022 21:05:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2845F80510; Mon, 14 Mar 2022 21:05:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E1028F8011C
 for <alsa-devel@alsa-project.org>; Mon, 14 Mar 2022 21:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1028F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BbHWsfzs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647288339; x=1678824339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KyGFR7GQKbIjELhAeh95O3NZ/wi/fjlySV1ylTb+DGc=;
 b=BbHWsfzsImGjSVandBtKo7d9xAHBjqDqa0E1uJ3dshr66F+EbYVSe6ky
 Nb0oT9oZfHDZDN511bjwve3oA+adSbIWNRq9Dksa2kNot6s5piFA71jgA
 UM72Bp2DV/6EoM3hTt2yknEWkkj6QwRhzj1Mg1ZgVryjcOs9a41hu/yUS
 ZGT2gvgZP/ZBO6mxGiwG+u8H3KyoSxiUMRpzdH2CVKRwlGYx+wr/hIT13
 mq5R63QNgcSib8nbK4nFyxq0t0OCXNm7qk/qo13bgRgc8PFoI3QqjegoW
 ex3WcedDgHqG2K/Vh+WIbqr9o6Fh/UQxJiNKlb/rYuzgzXyhSkRmUBJgA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="342563466"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="342563466"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; d="scan'208";a="634339883"
Received: from pmishr1-mobl1.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.25.117])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2022 13:05:32 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/18] ASoC: SOF: Introduce struct snd_sof_dai_link
Date: Mon, 14 Mar 2022 13:05:02 -0700
Message-Id: <20220314200520.1233427-2-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
References: <20220314200520.1233427-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =tiwai@suse.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Introduce a new struct for DAI links to save the DAI link information
parsed from topology. Also add a list of dai_links to struct snd_sof_dev
that will be populated during topology parsing.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c      |  1 +
 sound/soc/sof/sof-audio.h | 21 ++++++++++++++++++++-
 sound/soc/sof/sof-priv.h  |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 9217644e2eab..e91631618bff 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -370,6 +370,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	INIT_LIST_HEAD(&sdev->kcontrol_list);
 	INIT_LIST_HEAD(&sdev->widget_list);
 	INIT_LIST_HEAD(&sdev->dai_list);
+	INIT_LIST_HEAD(&sdev->dai_link_list);
 	INIT_LIST_HEAD(&sdev->route_list);
 	INIT_LIST_HEAD(&sdev->ipc_client_list);
 	INIT_LIST_HEAD(&sdev->ipc_rx_handler_list);
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 450ee9977c55..548d443e83b0 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -96,7 +96,26 @@ struct snd_sof_control {
 	bool comp_data_dirty;
 };
 
-struct snd_sof_widget;
+/** struct snd_sof_dai_link - DAI link info
+ * @tuples: array of parsed tuples
+ * @num_tuples: number of tuples in the tuples array
+ * @link: Pointer to snd_soc_dai_link
+ * @hw_configs: Pointer to hw configs in topology
+ * @num_hw_configs: Number of hw configs in topology
+ * @default_hw_cfg_id: Default hw config ID
+ * @type: DAI type
+ * @list: item in snd_sof_dev dai_link list
+ */
+struct snd_sof_dai_link {
+	struct snd_sof_tuple *tuples;
+	int num_tuples;
+	struct snd_soc_dai_link *link;
+	struct snd_soc_tplg_hw_config *hw_configs;
+	int num_hw_configs;
+	int default_hw_cfg_id;
+	int type;
+	struct list_head list;
+};
 
 /* ASoC SOF DAPM widget */
 struct snd_sof_widget {
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index ef5a2adae5c7..28d3f1ac8be8 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -441,6 +441,7 @@ struct snd_sof_dev {
 	struct list_head kcontrol_list;
 	struct list_head widget_list;
 	struct list_head dai_list;
+	struct list_head dai_link_list;
 	struct list_head route_list;
 	struct snd_soc_component *component;
 	u32 enabled_cores_mask; /* keep track of enabled cores */
-- 
2.25.1

