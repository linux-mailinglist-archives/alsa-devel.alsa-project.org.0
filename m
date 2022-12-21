Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC2652F6A
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:26:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C8F216BA;
	Wed, 21 Dec 2022 11:25:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C8F216BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618368;
	bh=Ty5qAXM/AFGjjzztSqmZtt/EnlYWl7E5dO1EbGYaUWY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=YqKieFrld3yxjt0jCFqB2qSzTC8E4Il3788GugPPFC8NS/2wc794rZ8cXTDFqdxel
	 ofXVda0is4GcZ2KT/5Hpp3t162xDgYLLLaYv1rbWGAlSoubY7LiaaTyrefGi+lWLRU
	 0sczGZmnm+FCdHyPgB9C4VIriO9kXz6dxEeeKx5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 687B7F80543;
	Wed, 21 Dec 2022 11:24:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9726F804AD; Wed, 21 Dec 2022 11:23:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D02AF8047B
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D02AF8047B
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ew/2igow
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618217; x=1703154217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ty5qAXM/AFGjjzztSqmZtt/EnlYWl7E5dO1EbGYaUWY=;
 b=ew/2igow7/lXngYXAChJBCSs9mcAvOCfwSX372XCrdvkLUaQik5byKdm
 SqDMAJimEc2S7dPqJGFNzO5Bb8hCv0JH3niR1b5uMq3lCbfkWoVtMVyvv
 fdmVMb+Iqn/DV3FTxH74hyB6AKRX5jskw/fscnTCf2nEbJ9eMB/zjFLAV
 WdkYopb0/HpehRnLYng1HJWTGWWIVA0uIMS4dbar54sUHcwvFHyVwbNqe
 Qbe8zx5WjuGryEUPr2ORItrlopo7Kd19XQATwnLe0k2XheCqI2h4xS6ju
 SzRaCATeYeI1dcGwg4ZrJ+xC/GegkmjGaNSmEioi8RLl5+Rdx5GWYSQ6s A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078639"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078639"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984311"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984311"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 05/11] ASoC: SOF: control: Extend the optionality of IPC ops
 to IPC as well
Date: Wed, 21 Dec 2022 12:23:22 +0200
Message-Id: <20221221102328.9635-6-peter.ujfalusi@linux.intel.com>
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
sdev->ipc->ops->[tplg] == NULL
sdev->ipc->ops->[tplg]->control == NULL
sdev->ipc->ops->[tplg]->control->ops == NULL (treated optional currently)

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/control.c | 44 ++++++++++++++++++++---------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index e0e9efd25d34..75e13f4fd1eb 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -22,9 +22,9 @@ int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->volume_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_get)
 		return tplg_ops->control->volume_get(scontrol, ucontrol);
 
 	return 0;
@@ -37,9 +37,9 @@ int snd_sof_volume_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->volume_put)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->volume_put)
 		return tplg_ops->control->volume_put(scontrol, ucontrol);
 
 	return false;
@@ -74,9 +74,9 @@ int snd_sof_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->switch_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_get)
 		return tplg_ops->control->switch_get(scontrol, ucontrol);
 
 	return 0;
@@ -89,9 +89,9 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = sm->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->switch_put)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->switch_put)
 		return tplg_ops->control->switch_put(scontrol, ucontrol);
 
 	return false;
@@ -104,9 +104,9 @@ int snd_sof_enum_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = se->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->enum_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_get)
 		return tplg_ops->control->enum_get(scontrol, ucontrol);
 
 	return 0;
@@ -119,9 +119,9 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = se->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->enum_put)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_put)
 		return tplg_ops->control->enum_put(scontrol, ucontrol);
 
 	return false;
@@ -134,9 +134,9 @@ int snd_sof_bytes_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->bytes_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_get)
 		return tplg_ops->control->bytes_get(scontrol, ucontrol);
 
 	return 0;
@@ -149,9 +149,9 @@ int snd_sof_bytes_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->bytes_put)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_put)
 		return tplg_ops->control->bytes_put(scontrol, ucontrol);
 
 	return 0;
@@ -165,13 +165,13 @@ int snd_sof_bytes_ext_put(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
 	/* make sure we have at least a header */
 	if (size < sizeof(struct snd_ctl_tlv))
 		return -EINVAL;
 
-	if (tplg_ops->control->bytes_ext_put)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_put)
 		return tplg_ops->control->bytes_ext_put(scontrol, binary_data, size);
 
 	return 0;
@@ -184,7 +184,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 	int ret, err;
 
 	ret = pm_runtime_resume_and_get(scomp->dev);
@@ -193,7 +193,7 @@ int snd_sof_bytes_ext_volatile_get(struct snd_kcontrol *kcontrol, unsigned int _
 		return ret;
 	}
 
-	if (tplg_ops->control->bytes_ext_volatile_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_volatile_get)
 		ret = tplg_ops->control->bytes_ext_volatile_get(scontrol, binary_data, size);
 
 	pm_runtime_mark_last_busy(scomp->dev);
@@ -212,9 +212,9 @@ int snd_sof_bytes_ext_get(struct snd_kcontrol *kcontrol,
 	struct snd_sof_control *scontrol = be->dobj.private;
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
 
-	if (tplg_ops->control->bytes_ext_get)
+	if (tplg_ops && tplg_ops->control && tplg_ops->control->bytes_ext_get)
 		return tplg_ops->control->bytes_ext_get(scontrol, binary_data, size);
 
 	return 0;
-- 
2.39.0

