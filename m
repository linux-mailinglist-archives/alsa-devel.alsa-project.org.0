Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 583DA5B9B11
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B08751A29;
	Thu, 15 Sep 2022 14:40:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B08751A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663245666;
	bh=E5vOzwj7nPMJtYRMRWR324GHBMXgidkASIiA4EyeMJE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=siVfP3zklllaK6+5zP/tbAAYK7Lmj40AiZCCJxfD25h0rDtwFONknvFpqz9n5NZPg
	 hVHBqGQltOjpBgltm15TTIRCpioHUwmfXuJenN1RDmcMxpdgnb6bAoHljgglZoT7u0
	 t1biTr0ybWDj3sqDblXc6jxHm3pzGBBKEc1aq0oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABB03F80528;
	Thu, 15 Sep 2022 14:39:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28AA3F80482; Thu, 15 Sep 2022 14:39:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78CE7F80482
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:38:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78CE7F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="ke/c/lzv"
Received: by mail-wr1-x436.google.com with SMTP id t7so30639496wrm.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RV4wF232kZpwZvwtbOvkLH7fVkb3VMbqjdLt/ZUggPs=;
 b=ke/c/lzv6U9ofG/tiCo8KZL3cfn0YNdB/6+zGhj6/qboz95EF4ULmzGMUse72Mzkoh
 KcbZahR2BtpmyIkS9SxaBtR73Z4g6EjTpLtm598AQPXhlbwxSE4SV+/iS3gx3IdwUunt
 KeaJRWva6Fk7tT5NICTXrESFXwYtXd1zRqFZXhzDHA00JF9MbdN+YMFBiy2XXDy0/Xfr
 uzwvULgBsij9yZDBznJl/n8OlFLetz/Do5FWiOLJWdTGDQgyoAsnR0STZEaoS+YIXWdK
 e6YUJjDnck5spkNHJhLhlR3NGpzF31thC51xAVWWHxxAvakRRDoL+wvyQFLyZkZd8Umm
 NjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RV4wF232kZpwZvwtbOvkLH7fVkb3VMbqjdLt/ZUggPs=;
 b=QrugpTHvN2486Ho9WvVSfJtjjtPsT2mCfKYgtpeX5LKCzWQMAl8RyQeXFtvqUKTuUo
 oWkGSrsYTYW6t4cMW8X0ekZ64EG2c64r3zGPWoWkyUaGx/NGKGndHindHFgiYRccsBne
 jaSCA+iump5rIIDw+RgCN5bAMtGnZO7ssjMw36Hg06e7o5V74VcbDDaqkv/QK3VvwKdQ
 T9QknXQTrQdu5eXOSl6OggabK0IXNwZfVlAbgvl5YgS9RZppS0a3sIiIhCyhkjj3yfBa
 s49LYTKqqLkG4LL9qnBmT4M2T1lXpvbWIdKPwgJ/dRV7rHk2YmLDNQZTRMmQTcXf9zAn
 VPlQ==
X-Gm-Message-State: ACgBeo1NOcspsoU+b8bGdfZIYrztg2ulgdrpkCNI0ySldRYiKjGC5m4g
 ILsowdtmfTCt1HMYi9cL4QKpUg==
X-Google-Smtp-Source: AA6agR5adbW9nWruS/eO1UF0hiNQtR9UN4aG/zxUPSGfS2nBdFjbR7LRzC6nG+tmXRwJ9YmfEzTpUQ==
X-Received: by 2002:adf:e94e:0:b0:228:da92:3691 with SMTP id
 m14-20020adfe94e000000b00228da923691mr24576549wrn.1.1663245537095; 
 Thu, 15 Sep 2022 05:38:57 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 bg13-20020a05600c3c8d00b003a5f4fccd4asm3112559wmb.35.2022.09.15.05.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:38:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 6/9] ASoC: qdsp6: audioreach: add support for more port
 connections
Date: Thu, 15 Sep 2022 13:38:34 +0100
Message-Id: <20220915123837.11591-7-srinivas.kandagatla@linaro.org>
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

AudioReach Modules can connect to other modules using source and
destination port, and each module in theory can support up to 255 port
connections. But in practice this limit is at max 8 ports at a time.
So add support for allowing multiple port connections.

This support is needed for more detailed graphs like ECNS, speaker
protection and so.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h |  27 ++++++++
 sound/soc/qcom/qdsp6/audioreach.c  |  34 ++++------
 sound/soc/qcom/qdsp6/audioreach.h  |   9 ++-
 sound/soc/qcom/qdsp6/topology.c    | 102 +++++++++++++++++++++++++----
 4 files changed, 136 insertions(+), 36 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 440c0725660b..b9b9093b4396 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -191,6 +191,33 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_SRC_INSTANCE_ID	208
 #define AR_TKN_U32_MODULE_DST_INSTANCE_ID	209
 
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID1	210
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID1	211
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID1	212
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID2	213
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID2	214
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID2	215
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID3	216
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID3	217
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID3	218
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID4	219
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID4	220
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID4	221
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID5	222
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID5	223
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID5	224
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID6	225
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID6	226
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID6	227
+
+#define AR_TKN_U32_MODULE_SRC_OP_PORT_ID7	228
+#define AR_TKN_U32_MODULE_DST_IN_PORT_ID7	229
+#define AR_TKN_U32_MODULE_DST_INSTANCE_ID7	230
 
 #define AR_TKN_U32_MODULE_HW_IF_IDX		250
 #define AR_TKN_U32_MODULE_HW_IF_TYPE		251
diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bae0b7f67e0b..37f1408f6f6f 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -311,15 +311,6 @@ static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
 	cfg->sid.scenario_id = sg->scenario_id;
 }
 
-static void apm_populate_connection_obj(struct apm_module_conn_obj *obj,
-					struct audioreach_module *module)
-{
-	obj->src_mod_inst_id = module->src_mod_inst_id;
-	obj->src_mod_op_port_id = module->src_mod_op_port_id;
-	obj->dst_mod_inst_id = module->instance_id;
-	obj->dst_mod_ip_port_id = module->in_port;
-}
-
 static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
 					 struct audioreach_module *module)
 {
@@ -394,17 +385,21 @@ static void audioreach_populate_graph(struct q6apm *apm, struct audioreach_graph
 			apm_populate_module_list_obj(mlobj, container, sg->sub_graph_id);
 
 			list_for_each_entry(module, &container->modules_list, node) {
-				uint32_t src_mod_inst_id;
-
-				src_mod_inst_id = module->src_mod_inst_id;
-
 				module_prop_obj = &mp_data->mod_prop_obj[nmodule];
 				apm_populate_module_prop_obj(module_prop_obj, module);
 
-				if (src_mod_inst_id) {
-					conn_obj = &mc_data->conn_obj[nconn];
-					apm_populate_connection_obj(conn_obj, module);
-					nconn++;
+				if (module->max_op_port) {
+					int pn;
+					for (pn = 0; pn < module->max_op_port; pn++) {
+						    if (module->dst_mod_inst_id[pn]) {
+							conn_obj = &mc_data->conn_obj[nconn];
+							conn_obj->src_mod_inst_id = module->instance_id;
+							conn_obj->src_mod_op_port_id = module->src_mod_op_port_id[pn];
+							conn_obj->dst_mod_inst_id = module->dst_mod_inst_id[pn];
+							conn_obj->dst_mod_ip_port_id = module->dst_mod_ip_port_id[pn];
+							nconn++;
+						}
+					}
 				}
 
 				nmodule++;
@@ -456,8 +451,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 				APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
 
 			list_for_each_entry(module, &container->modules_list, node) {
-				if (module->src_mod_inst_id)
-					num_connections++;
+				num_connections += module->num_connections;
 			}
 		}
 	}
@@ -502,7 +496,7 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
 	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
 	param_data->param_id = APM_PARAM_ID_MODULE_LIST;
 	param_data->param_size = ml_sz - APM_MODULE_PARAM_DATA_SIZE;
-	params.mod_list_data->num_modules_list = num_sub_graphs;
+	params.mod_list_data->num_modules_list = num_modules_list;
 	p += ml_sz;
 
 	/* Module Properties */
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 1dc6ffcb3362..df5026b646c1 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -627,6 +627,8 @@ struct audioreach_container {
 	struct audioreach_sub_graph *sub_graph;
 };
 
+#define AR_MAX_MOD_LINKS	8
+
 struct audioreach_module {
 	uint32_t module_id;
 	uint32_t instance_id;
@@ -637,11 +639,12 @@ struct audioreach_module {
 	uint32_t in_port;
 	uint32_t out_port;
 
+	uint32_t num_connections;
 	/* Connections */
 	uint32_t src_mod_inst_id;
-	uint32_t src_mod_op_port_id;
-	uint32_t dst_mod_inst_id;
-	uint32_t dst_mod_ip_port_id;
+	uint32_t src_mod_op_port_id[AR_MAX_MOD_LINKS];
+	uint32_t dst_mod_inst_id[AR_MAX_MOD_LINKS];
+	uint32_t dst_mod_ip_port_id[AR_MAX_MOD_LINKS];
 
 	/* Format specifics */
 	uint32_t ch_fmt;
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index f66d7054177c..9994e9ec01f4 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -412,19 +412,25 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 							struct snd_soc_dapm_widget *w)
 {
 	uint32_t max_ip_port = 0, max_op_port = 0, in_port = 0, out_port = 0;
-	uint32_t src_mod_inst_id = 0, src_mod_op_port_id = 0;
-	uint32_t dst_mod_inst_id = 0, dst_mod_ip_port_id = 0;
+	uint32_t src_mod_op_port_id[AR_MAX_MOD_LINKS] = { 0, };
+	uint32_t dst_mod_inst_id[AR_MAX_MOD_LINKS] = { 0, };
+	uint32_t dst_mod_ip_port_id[AR_MAX_MOD_LINKS] = { 0, };
+	uint32_t src_mod_inst_id = 0;
+
 	int module_id = 0, instance_id = 0, tkn_count = 0;
 	struct snd_soc_tplg_vendor_value_elem *mod_elem;
 	struct snd_soc_tplg_vendor_array *mod_array;
 	struct audioreach_module *mod = NULL;
+	uint32_t token;
 	bool found;
+	int max_tokens;
 
 	mod_array = audioreach_get_module_array(private);
 	mod_elem = mod_array->value;
-
-	while (tkn_count <= (le32_to_cpu(mod_array->num_elems) - 1)) {
-		switch (le32_to_cpu(mod_elem->token)) {
+	max_tokens = le32_to_cpu(mod_array->num_elems);
+	while (tkn_count <= (max_tokens - 1)) {
+		token = le32_to_cpu(mod_elem->token);
+		switch (token) {
 		/* common module info */
 		case AR_TKN_U32_MODULE_ID:
 			module_id = le32_to_cpu(mod_elem->value);
@@ -454,17 +460,80 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 		case AR_TKN_U32_MODULE_OUT_PORTS:
 			out_port = le32_to_cpu(mod_elem->value);
 			break;
-		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID:
-			src_mod_op_port_id = le32_to_cpu(mod_elem->value);
-			break;
 		case AR_TKN_U32_MODULE_SRC_INSTANCE_ID:
 			src_mod_inst_id = le32_to_cpu(mod_elem->value);
 			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID:
+			src_mod_op_port_id[0] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID1:
+			src_mod_op_port_id[1] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID2:
+			src_mod_op_port_id[2] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID3:
+			src_mod_op_port_id[3] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID4:
+			src_mod_op_port_id[4] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID5:
+			src_mod_op_port_id[5] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID6:
+			src_mod_op_port_id[6] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_SRC_OP_PORT_ID7:
+			src_mod_op_port_id[7] = le32_to_cpu(mod_elem->value);
+			break;
 		case AR_TKN_U32_MODULE_DST_INSTANCE_ID:
-			dst_mod_inst_id = le32_to_cpu(mod_elem->value);
+			dst_mod_inst_id[0] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID1:
+			dst_mod_inst_id[1] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID2:
+			dst_mod_inst_id[2] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID3:
+			dst_mod_inst_id[3] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID4:
+			dst_mod_inst_id[4] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID5:
+			dst_mod_inst_id[5] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID6:
+			dst_mod_inst_id[6] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_INSTANCE_ID7:
+			dst_mod_inst_id[7] = le32_to_cpu(mod_elem->value);
 			break;
 		case AR_TKN_U32_MODULE_DST_IN_PORT_ID:
-			dst_mod_ip_port_id = le32_to_cpu(mod_elem->value);
+			dst_mod_ip_port_id[0] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID1:
+			dst_mod_ip_port_id[1] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID2:
+			dst_mod_ip_port_id[2] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID3:
+			dst_mod_ip_port_id[3] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID4:
+			dst_mod_ip_port_id[4] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID5:
+			dst_mod_ip_port_id[5] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID6:
+			dst_mod_ip_port_id[6] = le32_to_cpu(mod_elem->value);
+			break;
+		case AR_TKN_U32_MODULE_DST_IN_PORT_ID7:
+			dst_mod_ip_port_id[7] = le32_to_cpu(mod_elem->value);
 			break;
 		default:
 			break;
@@ -475,15 +544,22 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 	}
 
 	if (mod) {
+		int pn, id = 0;
 		mod->module_id = module_id;
 		mod->max_ip_port = max_ip_port;
 		mod->max_op_port = max_op_port;
 		mod->in_port = in_port;
 		mod->out_port = out_port;
 		mod->src_mod_inst_id = src_mod_inst_id;
-		mod->src_mod_op_port_id = src_mod_op_port_id;
-		mod->dst_mod_inst_id = dst_mod_inst_id;
-		mod->dst_mod_ip_port_id = dst_mod_ip_port_id;
+		for (pn = 0; pn < mod->max_op_port; pn++) {
+			if (src_mod_op_port_id[pn] && dst_mod_inst_id[pn] && dst_mod_ip_port_id[pn]) {
+				mod->src_mod_op_port_id[id] = src_mod_op_port_id[pn];
+				mod->dst_mod_inst_id[id] = dst_mod_inst_id[pn];
+				mod->dst_mod_ip_port_id[id] = dst_mod_ip_port_id[pn];
+				id++;
+				mod->num_connections = id;
+			}
+		}
 	}
 
 	return mod;
-- 
2.21.0

