Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFABA652F68
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:25:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72AA516CF;
	Wed, 21 Dec 2022 11:25:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72AA516CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618352;
	bh=nF0ohkz5zi9CZZPvodrSnUeH0x81HkjwHrqLcBl/pw0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KtCOs0nkhENmxbMadLNr7cBRTXvWPqYlbUlzohzx7BWjp+5D0DX7q5CDsK7LCV1oE
	 qg2r63AyTyZ6XeCc6HO5CLSisj48OskVVnHGEbFU774PTZ9bUO5salMvq5adIU1ibO
	 ScnJ3MmPLrLZZ3a3I8mW7TeSM4dai/TcX7ihpNL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E800CF80536;
	Wed, 21 Dec 2022 11:24:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 943A4F8024D; Wed, 21 Dec 2022 11:23:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D19CF8024D
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D19CF8024D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Kz+qtKZ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618214; x=1703154214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nF0ohkz5zi9CZZPvodrSnUeH0x81HkjwHrqLcBl/pw0=;
 b=Kz+qtKZ3cfNhDPoAMWLfIIys4tc9KAjHovnF+6TkDHsbYDG5PaRm1diG
 jznrswulqwYEUKQtokawNZmpnE4YwxYeMdmXLmOmUA2wqP3Lain64lgcI
 HLF43ayiBTgFKpsVGOHAIpPwC7oP2+akeTCOxuTgBaLFqYhIK+cy9olmG
 RSjayOnHwJv85zo3EENvg3MKznITXCqCglO6zh4WhU2sFXUAc+t6Aucp8
 s+/CB+Wk/7OF06aBCsFFYHxgCMBhCzn0+Hv4UNqy8F2/8OE/VzQ+w3Y9k
 Rfne2EO0bn8T8ixejzLKIg7K3T6zn/RHOCOBj8BuLF2efzzKLUFeAhv6/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078631"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078631"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:33 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984304"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984304"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 04/11] ASoC: SOF: pcm: Extend the optionality of IPC ops to
 IPC as well
Date: Wed, 21 Dec 2022 12:23:21 +0200
Message-Id: <20221221102328.9635-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
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

The IPC ops are optional, but they require that the ops struct is to be
allocated with all callbacks set to NULL.

Update the code to extend the optionality to:
sdev->ipc == NULL
sdev->ipc->ops == NULL
sdev->ipc->ops->[pcm] == NULL
sdev->ipc->ops->[pcm]->ops == NULL (treated optional currently)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/pcm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 14571b821eca..952fc698a586 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -125,8 +125,8 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_platform_stream_params platform_params = { 0 };
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_pcm *spcm;
 	int ret;
@@ -143,7 +143,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	 * Handle repeated calls to hw_params() without free_pcm() in
 	 * between. At least ALSA OSS emulation depends on this.
 	 */
-	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
 		ret = pcm_ops->hw_free(component, substream);
 		if (ret < 0)
 			return ret;
@@ -177,7 +177,7 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 			return ret;
 	}
 
-	if (pcm_ops->hw_params) {
+	if (pcm_ops && pcm_ops->hw_params) {
 		ret = pcm_ops->hw_params(component, substream, params, &platform_params);
 		if (ret < 0)
 			return ret;
@@ -196,7 +196,7 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
 	int ret, err = 0;
 
@@ -212,7 +212,7 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 		spcm->pcm.pcm_id, substream->stream);
 
 	/* free PCM in the DSP */
-	if (pcm_ops->hw_free && spcm->prepared[substream->stream]) {
+	if (pcm_ops && pcm_ops->hw_free && spcm->prepared[substream->stream]) {
 		ret = pcm_ops->hw_free(component, substream);
 		if (ret < 0)
 			err = ret;
@@ -279,7 +279,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 	struct snd_sof_pcm *spcm;
 	bool reset_hw_params = false;
 	bool free_widget_list = false;
@@ -344,7 +344,7 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	if (!ipc_first)
 		snd_sof_pcm_platform_trigger(sdev, substream, cmd);
 
-	if (pcm_ops->trigger)
+	if (pcm_ops && pcm_ops->trigger)
 		ret = pcm_ops->trigger(component, substream, cmd);
 
 	/* need to STOP DMA even if trigger IPC failed */
@@ -569,7 +569,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	const struct sof_ipc_pcm_ops *pcm_ops = sof_ipc_get_ops(sdev, pcm);
 
 	/* no topology exists for this BE, try a common configuration */
 	if (!dai) {
@@ -590,7 +590,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		return 0;
 	}
 
-	if (pcm_ops->dai_link_fixup)
+	if (pcm_ops && pcm_ops->dai_link_fixup)
 		return pcm_ops->dai_link_fixup(rtd, params);
 
 	return 0;
-- 
2.39.0

