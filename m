Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 981231833C7
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 15:52:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3ACB71709;
	Thu, 12 Mar 2020 15:51:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3ACB71709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584024728;
	bh=J0Oyj3MuQnv5qAQm8NviJJ+MCU6I9259VrGs7hTdy1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RXBYGpFeHxOWPdkXcIAYfgibuEiYTvh/c3SUF7mbYOibKrO0/yIFwdPO9WoEs/o5a
	 TBJ1ULueuMwiaNVmXjVOtDvMCcNl4fMI82elsxRSBaO9GGGCNMIrha1FuSLJZwJznA
	 +PpjI/us2OBeo8LiDL3qa8sOKSbP7zgYv5n6IVGI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB621F80338;
	Thu, 12 Mar 2020 15:45:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8B9EF802FD; Thu, 12 Mar 2020 15:45:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC5D6F802A9;
 Thu, 12 Mar 2020 15:44:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC5D6F802A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 07:44:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,545,1574150400"; d="scan'208";a="443957747"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.40.3])
 by fmsmga006.fm.intel.com with ESMTP; 12 Mar 2020 07:44:52 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/14] ASoC: SOF: VirtIO: check guest component IDs
Date: Thu, 12 Mar 2020 15:44:27 +0100
Message-Id: <20200312144429.17959-13-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
References: <20200312144429.17959-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
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

Each VirtIO SOF guest has a component ID range, assigned to it. Add a
check to make sure, that guests stay within their ranges.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/vhost-be.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/vhost-be.c b/sound/soc/sof/vhost-be.c
index b3d7cfc..e1dede9 100644
--- a/sound/soc/sof/vhost-be.c
+++ b/sound/soc/sof/vhost-be.c
@@ -386,8 +386,6 @@ static int dsp_sof_ipc_stream(struct snd_sof_dev *sdev,
 	u32 cmd = hdr->cmd & SOF_CMD_TYPE_MASK;
 	struct snd_soc_dpcm *dpcm;
 
-	/* TODO validate host comp id range based on vm_id */
-
 	switch (cmd) {
 	case SOF_IPC_STREAM_PCM_PARAMS:
 		ret = dsp_sof_pcm_open(sdev, hdr);
@@ -538,6 +536,10 @@ static int dsp_sof_ipc_tplg_comp_new(struct dsp_sof_client *client, int vq_idx,
 	struct sof_ipc_comp_host *host;
 	struct dsp_pipeline_connect *conn;
 
+	if (comp->id < client->comp_id_begin ||
+	    comp->id >= client->comp_id_end)
+		return -EINVAL;
+
 	switch (comp->type) {
 	case SOF_COMP_VIRT_CON:
 		list_for_each_entry(conn, &sdev->connector_list, list)
@@ -714,7 +716,6 @@ static int dsp_sof_ipc_tplg(struct dsp_sof_client *client, int vq_idx,
 			    struct sof_ipc_cmd_hdr *hdr,
 			    void *reply_buf, size_t reply_sz)
 {
-	/* TODO validate host comp id range based on vm_id */
 	u32 cmd = hdr->cmd & SOF_CMD_TYPE_MASK;
 	int ret;
 
@@ -784,8 +785,6 @@ static int dsp_sof_ipc_stream_codec(struct snd_sof_dev *sdev,
 	unsigned int i;
 	int direction;
 
-	/* TODO validate host comp id range based on vm_id */
-
 	if (!dsp_sof_find_spcm_comp(sdev, stream->comp_id, &direction))
 		return -ENODEV;
 
-- 
1.9.3

