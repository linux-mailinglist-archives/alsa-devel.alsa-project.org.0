Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD610A049
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:31:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D69B416ED;
	Tue, 26 Nov 2019 15:31:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D69B416ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574778715;
	bh=8b3nq1pyOUnxjY9SyDGXunXF2uLlu43v6FmQRa2okjw=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XNTD3waW5rkmH/FQuBos7dXAk8+XHnCb/9S81gntixR6mLwbhzrEElCuSKGxWCUmm
	 O/TZp2jLGbfZSdoYnhCBhN9TbudijK/GXLoAo5CNuqLwQSmcdQysXC9C6vKK1sYbpS
	 G0YNwJN6ANWV0DBUPTuk9SOTMRQpvjN0VEL+cNvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7903F80218;
	Tue, 26 Nov 2019 15:28:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05FDAF801F4; Tue, 26 Nov 2019 15:28:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFD5AF80149
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:28:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFD5AF80149
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:28:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="206473449"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga008.fm.intel.com with ESMTP; 26 Nov 2019 06:28:28 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:28:06 -0600
Message-Id: <20191126142815.21856-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
References: <20191126142815.21856-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 01/10] ASoC: SOF: topology: remove
	snd_sof_init_topology()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Remove snd_sof_init_topology() as it is never used.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 2 --
 sound/soc/sof/topology.c | 9 ---------
 2 files changed, 11 deletions(-)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index c7c2c70ee4d0..31f0eb31598a 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -585,8 +585,6 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_ipc *ipc,
  * There is no snd_sof_free_topology since topology components will
  * be freed by snd_soc_unregister_component,
  */
-int snd_sof_init_topology(struct snd_sof_dev *sdev,
-			  struct snd_soc_tplg_ops *ops);
 int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file);
 int snd_sof_complete_pipeline(struct snd_sof_dev *sdev,
 			      struct snd_sof_widget *swidget);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e20b806ec80f..f31791ce9958 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3465,15 +3465,6 @@ static struct snd_soc_tplg_ops sof_tplg_ops = {
 	.bytes_ext_ops_count	= ARRAY_SIZE(sof_bytes_ext_ops),
 };
 
-int snd_sof_init_topology(struct snd_sof_dev *sdev,
-			  struct snd_soc_tplg_ops *ops)
-{
-	/* TODO: support linked list of topologies */
-	sdev->tplg_ops = ops;
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_init_topology);
-
 int snd_sof_load_topology(struct snd_sof_dev *sdev, const char *file)
 {
 	const struct firmware *fw;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
