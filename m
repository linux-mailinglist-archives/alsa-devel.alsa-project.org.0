Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F21E51053A
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:21:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 214A218F1;
	Tue, 26 Apr 2022 19:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 214A218F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650993672;
	bh=XbGHb/dGxszVsrBHBtRsx10GCI9VTtP5ir7j5jTetuo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kr/LhZfZi8y3bPR0Gc7G5m7U3cUvkkm9M/Ey7mPIz3vMMY1raBwQ+Cja9jWCaAx+6
	 s8dyrjHJxgqTXqo7WxR3jjX2prfiXmNeUkLyabOoNwFAovaI+abMfpZMhsvQVi4Hdd
	 2aEWQ+AhgF4hifQTW2Apy21k7dSFrlkjwChydXuw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9C6FF8050F;
	Tue, 26 Apr 2022 19:18:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5F01CF80533; Tue, 26 Apr 2022 19:18:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A838DF8050F
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:17:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A838DF8050F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="cu9vH3KJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650993476; x=1682529476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XbGHb/dGxszVsrBHBtRsx10GCI9VTtP5ir7j5jTetuo=;
 b=cu9vH3KJq/dx4KVOwx+h+Af8HrIG7U6b9ao7Pj56fwQSPklImHM+xucj
 +DtLGw1OMVaIOmKjLxfiM5CKS1ftp9MYUn4yvyqnepYj7zGhJnczL3ypW
 6/lTQJI2Bo6GfYN2o42xQDbZgO4Hja39Ee90BKEenMzbpM7kGmmvCQKau
 whCwwpc8EKSgsKCK1RG8ASAZTGAQhbO8ad9cNL/NgCfIfQMV96Q2nVIZg
 SSVpnak/erEwdWRj5YX2/9Nvkc3M2IBYm8A5eRGVievBxnfOiwZNJHL9B
 p04UD5Ow/VvBOS2olCerM8EiRUq/XjpYrpYTfGMNgrzBucyF6zCJKQGy7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="290807972"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="290807972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:50 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="558431201"
Received: from shashinx-mobl.gar.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.0.53])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 10:17:50 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/11] ASoC: SOF: Add a route_free op in struct
 sof_ipc_tplg_ops
Date: Tue, 26 Apr 2022 10:17:38 -0700
Message-Id: <20220426171743.171061-7-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
References: <20220426171743.171061-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.com,
 broonie@kernel.org, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

IPC4 requires that the widgets be unbound in the firmware before they
are freed. So add a new op in struct sof_ipc_tplg_ops that will be used
to send the IPC to the firmware to unbind widgets.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 7 ++++++-
 sound/soc/sof/sof-audio.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 0bc6c3ef0cd4..07576ed3c4fa 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -14,11 +14,16 @@
 
 static void sof_reset_route_setup_status(struct snd_sof_dev *sdev, struct snd_sof_widget *widget)
 {
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
 	struct snd_sof_route *sroute;
 
 	list_for_each_entry(sroute, &sdev->route_list, list)
-		if (sroute->src_widget == widget || sroute->sink_widget == widget)
+		if (sroute->src_widget == widget || sroute->sink_widget == widget) {
+			if (sroute->setup && tplg_ops->route_free)
+				tplg_ops->route_free(sdev, sroute);
+
 			sroute->setup = false;
+		}
 }
 
 int sof_widget_free(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index e3cfc813975b..7ca87056b106 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -146,6 +146,7 @@ struct sof_ipc_tplg_widget_ops {
  *	    initialized to 0.
  * @control: Pointer to the IPC-specific ops for topology kcontrol IO
  * @route_setup: Function pointer for setting up pipeline connections
+ * @route_free: Optional op for freeing pipeline connections.
  * @token_list: List of all tokens supported by the IPC version. The size of the token_list
  *		array should be SOF_TOKEN_COUNT. The unused elements in the array will be
  *		initialized to 0.
@@ -163,6 +164,7 @@ struct sof_ipc_tplg_ops {
 	const struct sof_ipc_tplg_widget_ops *widget;
 	const struct sof_ipc_tplg_control_ops *control;
 	int (*route_setup)(struct snd_sof_dev *sdev, struct snd_sof_route *sroute);
+	int (*route_free)(struct snd_sof_dev *sdev, struct snd_sof_route *sroute);
 	const struct sof_token_info *token_list;
 	int (*control_setup)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
 	int (*control_free)(struct snd_sof_dev *sdev, struct snd_sof_control *scontrol);
-- 
2.25.1

