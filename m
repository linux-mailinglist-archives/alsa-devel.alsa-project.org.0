Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D37CF5B9B10
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:40:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED96195A;
	Thu, 15 Sep 2022 14:39:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED96195A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245647;
	bh=nv5hNRRmVXXnxqgdRhrVw8MmYbq59ngjYm7hvCP6ueM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fh7hXEJ8sQwx/pOaHR/L6qFna63L5LDNVVeheCWLOFk4/7G3C9seGsTknO/0bh3S/
	 0pwYX3KwjM4Orkx0hGNUZOJSGeBK1aidggJRHruiMjODsD0vjiKd8nD1co//H4tzNe
	 CcYuRzuGaQ1S1Ujx6c2Fy0I8/j8KCxvFaya0CwVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E17F6F80542;
	Thu, 15 Sep 2022 14:39:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19C73F80548; Thu, 15 Sep 2022 14:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7BD68F8032D
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BD68F8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LEWcsEPg"
Received: by mail-wm1-x330.google.com with SMTP id
 9-20020a1c0209000000b003b494ffc00bso519854wmc.0
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=LEWcsEPgF6HIafqmWf43ZmzIXZJKMJkx93tfpFRNdRGFx73qobC4DXt6nEN9rlpDbU
 UHyOoEkh45rRDUwLn7BNi3wpL/5wRgFPDsiYgeF6wNwlwIBvBmzT/HLv2vceAE8Sh99o
 lxjzgM30++pHNSjAClJJqC9cGr9PEzE3rYXy6DoEp8jA6RoYJES04whqHHjOo7KUpps5
 LfB3IWvVwLLbW8+BR9Pkq7sIYWMDGacrQZipe6vLNLy4B8C4nzSHrMixV9OFbKixqNyT
 RfcVsHR8cCsGEHRIEX1WYRWE/WKKw2txjIQHxOtkJjUlkpJlCygqlVNuKd1LjaFdPC62
 RerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=uI7DKgEauEg9kWAjiqiKzjULBq9M5mfDIEoAUrqZ2UYZoCUGLGLYYlO7vKtBpahGlD
 Q0Vj95hThojalbPawc+jOQsKwtJ5Jxkg9j1ZvRN/mOUTrq5Of6jHYJlU3zg1vQkQUnfU
 xfOo45RWY8slodXlW64Y5xVz2UPjzgxZIXgqf/ucc52RlYdT3cZI8cNjEy/h7+5cr5ao
 qolSfY7WOW7YpyEu9N8plmmZStoed47dXIBAqvRSL5/YDjFAqIXr3mapuIcNcOXF6O0g
 0t2Cb79v+E6l3qfkWWqYnKa4yDzdC0AuBCOVwza7OumJD9NrcLaI7+yeob7MkcZxhLd5
 eA8w==
X-Gm-Message-State: ACgBeo380M/aYA2fqI7hri4XRIXE8odh6Fs8DDtgXFaW9T36nwUan2VE
 fh8kg5oG+96RbRwF70C5kGLD4A==
X-Google-Smtp-Source: AA6agR5ND0ehbZKyqmCXUJNn0CM7WfvUwi3EWXaMkwhqaapsS1+QAdUuIyDZgg3MTZCRmLF8cYL6Zg==
X-Received: by 2002:a05:600c:22c7:b0:3b4:92ba:ff99 with SMTP id
 7-20020a05600c22c700b003b492baff99mr6939278wmg.190.1663245532832; 
 Thu, 15 Sep 2022 05:38:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:52 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 3/9] ASoC: qdsp6: audioreach: update dapm kcontrol private data
Date: Thu, 15 Sep 2022 13:38:31 +0100
Message-Id: <20220915123837.11591-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
References: <20220915123837.11591-1-srinivas.kandagatla@linaro.org>
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

