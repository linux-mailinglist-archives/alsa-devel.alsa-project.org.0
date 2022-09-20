Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E671B5BE969
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 16:56:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9CE9B161E;
	Tue, 20 Sep 2022 16:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9CE9B161E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663685769;
	bh=9AUoeTqsJviu/QSHqj+2Oqy2yXJl7d1Bf3gDhwbkIco=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vnXEVpN8OhFx/1e69HwX5wd5NxrHMR0PDsJGKJTQiDg6lnhFWQXhbJyq52OH4ThV8
	 AzS5tKgX5RLyphdyqEq9+kBIqCdYp3rCy9LkWCDVEAj9iw3I2trAHUCql4NK6utj6X
	 iPFaBsP7MzMPDzWOBJtwriAxKEjBBqe5+Zvf0JMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2351F804E4;
	Tue, 20 Sep 2022 16:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 634EFF80155; Tue, 20 Sep 2022 16:54:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A9730F80153
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 16:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9730F80153
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TDNP74KE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663685666; x=1695221666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9AUoeTqsJviu/QSHqj+2Oqy2yXJl7d1Bf3gDhwbkIco=;
 b=TDNP74KE+SiLjJRqAOFK6s0xnPEC5KeaPsNgN9821k1/kTczCEDTszf/
 TUyLjhHgdp+ZiCqojfVmAQ//SfYLrRfnmmHNIU57m02LewWIIqDdLI/lc
 BRZnrMACg7nk7enV/yc7E+tARsP2CtEGJTn4SridghesEkSTV+nTlv5q6
 i3gvEWzxef0UtT4p56GmecrVrP7zxxQWhqV2LYxqDhuC+GzCiH6Jby8U3
 nWtc6BnRpZfK1nUD2A+3dj2zaEP//7bQDdb7eIhIBdlGvL+8qKghDvof8
 zhoUEisK5zDml8Oyy3KgcHKOR2RRJnH7onPfVInke8uYeqx9jgDPb+mHr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="301095356"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="301095356"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 07:54:23 -0700
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; d="scan'208";a="681341675"
Received: from atcamara-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.209.87])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 07:54:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: ipc4-topology: remove useless assignment
Date: Tue, 20 Sep 2022 16:54:05 +0200
Message-Id: <20220920145405.2089147-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920145405.2089147-1-pierre-louis.bossart@linux.intel.com>
References: <20220920145405.2089147-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Chao Song <chao.song@intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

cppcheck warning:

sound/soc/sof/ipc4-topology.c:1533:12: style: Variable 'pipeline' is
assigned a value that is never used. [unreadVariable]
  pipeline = pipe_widget->private;
           ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 1503e3c49e703..66bbe101680cf 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1447,7 +1447,6 @@ static int sof_ipc4_control_setup(struct snd_sof_dev *sdev, struct snd_sof_contr
 
 static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget *swidget)
 {
-	struct snd_sof_widget *pipe_widget = swidget->pipe_widget;
 	struct sof_ipc4_pipeline *pipeline;
 	struct sof_ipc4_msg *msg;
 	void *ipc_data = NULL;
@@ -1530,7 +1529,7 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 				swidget->widget->name);
 			return ret;
 		}
-		pipeline = pipe_widget->private;
+
 		msg->primary &= ~SOF_IPC4_MOD_INSTANCE_MASK;
 		msg->primary |= SOF_IPC4_MOD_INSTANCE(swidget->instance_id);
 
-- 
2.34.1

