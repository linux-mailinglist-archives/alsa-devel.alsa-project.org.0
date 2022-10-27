Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32960F51D
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 12:29:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE7A531D0;
	Thu, 27 Oct 2022 12:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE7A531D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666866573;
	bh=nv5hNRRmVXXnxqgdRhrVw8MmYbq59ngjYm7hvCP6ueM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iH6utCQGxnhP7yVg7poUbY8awK2TxdNB/A+XPm4pfze+FgWLLwZn7tGcVu6m+yT0C
	 XbS9XAreDahw8uxizdXf9syP1UPtgglW4yF4engvIKerhy09TM8bv8kALOUPt1W8uZ
	 sbHnnqExPl1IaFnZhLbS6JsVs0sMjFij0KFwpaf8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AFA8F80551;
	Thu, 27 Oct 2022 12:27:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0950CF80563; Thu, 27 Oct 2022 12:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D4E6F804F3
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 12:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D4E6F804F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="RiqJKL/u"
Received: by mail-wr1-x432.google.com with SMTP id bk15so1357850wrb.13
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=RiqJKL/uMRA9zydHwoUZ5K0l+UFfgJ2Ly3Y/TDxZoEHQc3AoYv1TQ8z+HHo99c4kKX
 g+hYBuGaDNneX0KX+Q3CABFrJcHJwkBhBL3q0DEHRP9fWAGeLKACv333S3XFUBlJ8smQ
 rRmclfpV4OFtnYsmvxkoFQ2ayz2ahSH64yiU7zXxrmi/ObRHFHHEDFQziZE4/cAbFZsZ
 9t/2QpmZtJnGh+wrDTzo8UG4K+Kt6d2DZw6q/A2FSho5y0YUGFa1CYdfIo6R2bt8YQ4B
 jcp8lNlMn+wta3Hi4z3D2nnZsQ1SPm8+akuEqO8DvBGxrzZZkcPMjarF9Ds+cv1POJa5
 4jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zia5PwPjvTpWqvNWhun5tKRspbVbRhZxzacUZUNqQiU=;
 b=IfMDyTpN4MRv9EFPeXGxav1+1+nUPZSnO0xOI45UfHyVXfAXWHzHpoRgulnqrEu72z
 8qcGTB4+ajg9eJm/a8EsEZA/jY7eJn79X6TvM/gZkD4gjCB4LWH7ioo+RF4OTZwGPTLL
 l8DzWnrmwqjXbAn9rJQxnF2dgXHZ2xBiOJ6k+9/bhLSeMReP0FUeGZwSERvgd5/y2uhs
 hsXP5J9gVdXhYImomqvMpTLINfWgVSXDHm3JBSxyOI9ZrP4EYlct37Iu3+NsDAaj3dO5
 lgmSaNqp3jp0w5TQNMDn4M01u4cvA7ynKu7167H+7ZuEs76WOb2FzU5nxncJoScFrAkZ
 4T9w==
X-Gm-Message-State: ACrzQf34Pv2+YLa7fOtL51JYqBfRAG6MubPA0DFGwjAakMIEwui85Vyd
 SV/qb03tBXsyI44J7jbBmnrf9g==
X-Google-Smtp-Source: AMsMyM4xUC+CO+lmY8RQ+eyA/qsxqWMlsymc/3oPphYhbzWiEzve0Uq/PKrcut7LSfzSyyM1A0H8zA==
X-Received: by 2002:adf:d1c9:0:b0:225:f98:d602 with SMTP id
 b9-20020adfd1c9000000b002250f98d602mr32014812wrd.419.1666866463209; 
 Thu, 27 Oct 2022 03:27:43 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 fc7-20020a05600c524700b003b505d26776sm5088674wmb.5.2022.10.27.03.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:27:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v3 3/9] ASoC: qdsp6: audioreach: update dapm kcontrol private
 data
Date: Thu, 27 Oct 2022 11:27:04 +0100
Message-Id: <20221027102710.21407-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
References: <20221027102710.21407-1-srinivas.kandagatla@linaro.org>
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

