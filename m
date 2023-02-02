Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C700687BF7
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 12:15:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79E4E852;
	Thu,  2 Feb 2023 12:14:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79E4E852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675336506;
	bh=PWm0vyhHI7D3eocYSia+cq1hDXzXLcNoTI2P2k03OmU=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cLhmzwqhuqzUs+1lybf/3i4/1W6hiQ69xZL6uea3MweC4mDf5F1B7+i+NNx/x9tlQ
	 5IjqSAjwBJE1W5w7wRy8dVyYQUqkiJ7289LU2cg32K11vyrRYgVsL2QwIi6QfNUW8A
	 LQwGMeapeUHYlF9J099ZDNV/anSCBe93kiY8scbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20066F80528;
	Thu,  2 Feb 2023 12:12:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4DEEF80553; Thu,  2 Feb 2023 12:12:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F39DDF80543
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 12:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F39DDF80543
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WFKV9J1V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675336298; x=1706872298;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PWm0vyhHI7D3eocYSia+cq1hDXzXLcNoTI2P2k03OmU=;
 b=WFKV9J1VP0ILjbvzNmDdIV9eGzrLdT6txhx9BdYTa9MA+AYnzMjjCoHp
 d1nOgRf9T9tEQ08IdjGkqAALaqpAG+tVkL95WiZiANHQ/MQkR41XarItM
 ujD3TAAJjL3ksYft6wHUOICUu8UIqqXKIlwR2W+107h4GmQwYLYXSFAVn
 2C8L5XWY/W1jHCQktamQ7nyDiAWMljK70eMdXDhYvJOTwObI7is9tI4NS
 YHf7jJf/rurdzy1/VUaYYKY4t/5Y1t8E6WVIrdyCXXYusZgkOZYQgt7d7
 VcnDKEPzuGkhL1tOZJGo9kFnioB5EB+HnXdjgR64aHwDEf9zbE6S+jGRY A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="414625215"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="414625215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="695747698"
X-IronPort-AV: E=Sophos;i="5.97,267,1669104000"; d="scan'208";a="695747698"
Received: from jpdamery-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.1.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2023 03:11:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz
Subject: [PATCH v2 6/9] ASoC: SOF: add delay function support in sof framework
Date: Thu,  2 Feb 2023 13:11:20 +0200
Message-Id: <20230202111123.25231-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
References: <20230202111123.25231-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Rander Wang <rander.wang@intel.com>

Sof framework will call specific delay function for
different IPC version.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/pcm.c       | 13 +++++++++++++
 sound/soc/sof/sof-audio.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 34d40c5c629a..445acb5c3a21 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -646,6 +646,18 @@ static int sof_pcm_ack(struct snd_soc_component *component,
 	return snd_sof_pcm_platform_ack(sdev, substream);
 }
 
+static snd_pcm_sframes_t sof_pcm_delay(struct snd_soc_component *component,
+				       struct snd_pcm_substream *substream)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
+
+	if (pcm_ops && pcm_ops->delay)
+		return pcm_ops->delay(component, substream);
+
+	return 0;
+}
+
 void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 {
 	struct snd_soc_component_driver *pd = &sdev->plat_drv;
@@ -670,6 +682,7 @@ void snd_sof_new_platform_drv(struct snd_sof_dev *sdev)
 	pd->trigger = sof_pcm_trigger;
 	pd->pointer = sof_pcm_pointer;
 	pd->ack = sof_pcm_ack;
+	pd->delay = sof_pcm_delay;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_COMPRESS)
 	pd->compress_ops = &sof_compressed_ops;
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 334b715b17c8..d3104941e83e 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -102,6 +102,7 @@ struct snd_sof_dai_config_data {
  *	       additional memory in the SOF PCM stream structure
  * @pcm_free: Function pointer for PCM free that can be used for freeing any
  *	       additional memory in the SOF PCM stream structure
+ * @delay: Function pointer for pcm delay calculation
  */
 struct sof_ipc_pcm_ops {
 	int (*hw_params)(struct snd_soc_component *component, struct snd_pcm_substream *substream,
@@ -113,6 +114,8 @@ struct sof_ipc_pcm_ops {
 	int (*dai_link_fixup)(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params);
 	int (*pcm_setup)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
 	void (*pcm_free)(struct snd_sof_dev *sdev, struct snd_sof_pcm *spcm);
+	snd_pcm_sframes_t (*delay)(struct snd_soc_component *component,
+				   struct snd_pcm_substream *substream);
 };
 
 /**
-- 
2.39.1

