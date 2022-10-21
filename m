Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EB5607CEA
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Oct 2022 18:54:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607074D07;
	Fri, 21 Oct 2022 18:53:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607074D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666371289;
	bh=nv5hNRRmVXXnxqgdRhrVw8MmYbq59ngjYm7hvCP6ueM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ct7dk5yBJF49E+F99jmxf9TD1ZCe1Tr9dbdwiDKGJ/1EhY2/dlCmWM/ZSuE5jMChZ
	 2wIW0g9yhLpJWLH719WtzI4VecaOwhpVbWQTUx2p7mjvcbAOxKL0MypwLBZSRNX9o+
	 TqSHZBnQWvNV2RJOdCli9XdZhhRYAmvyufonKp3Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85F2AF80551;
	Fri, 21 Oct 2022 18:53:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55214F80533; Fri, 21 Oct 2022 18:53:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DA5DF80533
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 18:53:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA5DF80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xoYaAB1s"
Received: by mail-wr1-x435.google.com with SMTP id j7so5946459wrr.3
 for <alsa-devel@alsa-project.org>; Fri, 21 Oct 2022 09:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=xoYaAB1se0w8ASUEmK0yW36m16q6/3YuZFWOFiqSgFAt6Q+2IAr3T/myjzrkvcz8Bv
 gzKrXoFMxmuEBnG1T/Kz3GlngDReayQaAjRoHvXcIACbjnQ9qdTr9ysWh6oql/kGBEGu
 FbZ9kGFUXx8rYpIuq67r0LDS2k87GwNMtP8XC8zjnOY7bnedQqrFBml/erwBb9npWAej
 61CGnKq/VPVrPPoVymQjS43npVirCIeIDZyzYjiAf1X+G0hRSTHlc7Mly4gIQM9KS2Nq
 GJp+T0OqZx5GvUTOs0G7vJwBtVw6owITtpQA8EnfOZI6lyAx5u0uYCscpedA//6JfOj2
 UbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=O81HWngWpdD828IMt8szqvvWkbGnMBepV0jgIM/JufSb+VVu00yA+WUQcVioygEoWG
 H4drR3TFGS1Iyiz/ZfiXWI27E6uil2DPkg9hKir0IoO2pu+nxvZTGNsAjqMNphqQxpcT
 bCEq+hUJ/AR0mXR6f3aboCbM1Q8T43V2jMqbgJWjptRecCZ/vCP+/MBDN+tStW6YODK0
 LLAlmv3Vqv1pbxO2+mCepWTLwkov/kAjtaZ00GHDT24zMZNVB3htjUz/oZWOoMrSTHAk
 sNk1b/EEV0AT3OTzQcEO/m6VIIy7nUw/N1AUtBQwzdMHNYV2BIy31W5OInF4GC1dDDvS
 Wejg==
X-Gm-Message-State: ACrzQf0oMgLSnIrq95EmFVmjbPMoBxNw3oMNgGRLAnl6IJha6pxBmix/
 ImJ+SdaE8BDYTBGbIJEjV5LaNA==
X-Google-Smtp-Source: AMsMyM6izeud5K4Zu2OXqrdoXRMtXTje3wxLKz2CfxolNth6XovzzV0zHh4yvAh6FFc2gPabdphjBw==
X-Received: by 2002:a05:6000:1ac7:b0:232:8c6c:6c4a with SMTP id
 i7-20020a0560001ac700b002328c6c6c4amr13030296wry.455.1666371187605; 
 Fri, 21 Oct 2022 09:53:07 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d400e000000b0022ae401e9e0sm19541773wrp.78.2022.10.21.09.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 09:53:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/9] ASoC: qdsp6: audioreach: update dapm kcontrol private
 data
Date: Fri, 21 Oct 2022 17:52:01 +0100
Message-Id: <20221021165207.13220-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bgoswami@quicinc.com, linux-kernel@vger.kernel.org
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

Update kcontrol private date to include more information like graph id
and module instance id which its connected to. Also maintain this virtual
dapm mixer widget in a list so that we could lookup while FE and BE connection
are added.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm.c    |  1 +
 sound/soc/qcom/qdsp6/q6apm.h    |  1 +
 sound/soc/qcom/qdsp6/topology.c | 19 ++++++++++++++++++-
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 794019286c70..81e2d7090fb4 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -731,6 +731,7 @@ static int apm_probe(gpr_device_t *gdev)
 	apm->gdev = gdev;
 	init_waitqueue_head(&apm->wait);
 
+	INIT_LIST_HEAD(&apm->widget_list);
 	idr_init(&apm->graph_idr);
 	idr_init(&apm->graph_info_idr);
 	idr_init(&apm->sub_graphs_idr);
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 54eadadf712c..96ad5ea2ae07 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -58,6 +58,7 @@ struct q6apm {
 	struct mutex lock;
 	uint32_t state;
 
+	struct list_head widget_list;
 	struct idr graph_idr;
 	struct idr graph_info_idr;
 	struct idr sub_graphs_idr;
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 9a3d9e0eae53..0c4886d30131 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -16,7 +16,11 @@
 #include "audioreach.h"
 
 struct snd_ar_control {
+	u32 graph_id; /* Graph ID */
 	u32 sgid; /* Sub Graph ID */
+	u32 module_instance_id; /* Connected Module Instance ID */
+	struct snd_soc_dapm_widget *w;
+	struct list_head node;
 	struct snd_soc_component *scomp;
 };
 
@@ -692,6 +696,7 @@ static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 	struct snd_soc_tplg_vendor_value_elem *w_elem;
 	struct snd_soc_tplg_vendor_array *w_array;
 	struct snd_ar_control *scontrol;
+	struct q6apm *data = dev_get_drvdata(component->dev);
 	struct snd_soc_dobj *dobj;
 	int tkn_count = 0;
 
@@ -711,6 +716,9 @@ static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
 			scontrol->sgid = le32_to_cpu(w_elem->value);
 			break;
+		case AR_TKN_DAI_INDEX:
+			scontrol->graph_id = le32_to_cpu(w_elem->value);
+			break;
 		default: /* ignore other tokens */
 			break;
 		}
@@ -718,6 +726,9 @@ static int audioreach_widget_load_mixer(struct snd_soc_component *component,
 		w_elem++;
 	}
 
+	scontrol->w = w;
+	list_add_tail(&scontrol->node, &data->widget_list);
+
 	return 0;
 }
 
@@ -819,7 +830,10 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 
 	if (w->id == snd_soc_dapm_mixer) {
 		/* virtual widget */
-		kfree(dobj->private);
+		struct snd_ar_control *scontrol = dobj->private;
+
+		list_del(&scontrol->node);
+		kfree(scontrol);
 		return 0;
 	}
 
@@ -998,6 +1012,9 @@ static int audioreach_control_load_mix(struct snd_soc_component *scomp,
 		case AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:
 			scontrol->sgid = le32_to_cpu(c_elem->value);
 			break;
+		case AR_TKN_DAI_INDEX:
+			scontrol->graph_id = le32_to_cpu(c_elem->value);
+			break;
 		default:
 			/* Ignore other tokens */
 			break;
-- 
2.21.0

