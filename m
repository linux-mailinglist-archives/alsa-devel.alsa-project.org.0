Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38E43B068
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Oct 2021 12:44:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 562D11703;
	Tue, 26 Oct 2021 12:43:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 562D11703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635245061;
	bh=bKRXEurxzZcn9fzuunJDUMWxulntFmMRV7Pd3V+HaiQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IxyDsnQOPw9hd4KCZB7uAEFOqS/zLe36UciTckSKD1Hcn9V9vpXm9JOhYt0srzk0B
	 apMpdvX6vM/f9rouLZajw1CZEwW5rQkON27O6aF9Q5SLPMhr9Rxwxd4qW5u5vjk3hX
	 Jbuo9c9vG0CmPg3DvHGb4eT9XQ++0bYexjls8qxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0FB5F80508;
	Tue, 26 Oct 2021 12:39:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10C82F8053B; Tue, 26 Oct 2021 12:39:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D26EF804FE
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 12:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D26EF804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x6sgWU7Q"
Received: by mail-wr1-x434.google.com with SMTP id u18so14963819wrg.5
 for <alsa-devel@alsa-project.org>; Tue, 26 Oct 2021 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uKRXYCPxcB3edtTV1OCipd65QJaTMl4rhwbSRNW+Etc=;
 b=x6sgWU7QGFy2TQVmYrx9PAkZCmAfsAXq6Rqo2sWQrBNrucrYdk32ma4R5pI23bGTB2
 7Q7d4eeqy3VF3BaNKvZ6/kjCOohouyqftp/rBdQcqC5grLa2ITvxlgNrKA1kA0HNkL6s
 otzMzzYe0EhXGBREWawtTehImmWoXEOOxs5NPxV6zSc4yMFDGiRnxUyHaJlWb27t9ExW
 KyxFXCoXgdhUlbGzmsdFSxac1ECVEHDQC2NfoiWEDRcHf0Yb6X+hx+gfpgq9drWyVUx3
 WgsKK5qtvpWKqZHCcYMVpNMugSJVfyS0nNtUvnhbeNHVhUK5rf/UPHmzsyeMAYgUbcfZ
 Rhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKRXYCPxcB3edtTV1OCipd65QJaTMl4rhwbSRNW+Etc=;
 b=oVQA3ItTxg3x2KjSjRIo1dXA2vMEMFhyZaCLsS3lcJiPDuhi63uMF0UIjZA7Xoo72g
 7iIYgGQt27kZcutPLWvm0mgtx5R4PAbWi/3z22NFeDoEMLjPlLxmim/zmyVdKveNfd7L
 xBtJ9SWJvB5TbI3rxyq0/HnjUMMXZB6dSp/v8igDZqfxm8EPumvl7TTw2xXLc8/ePTdb
 GSKHiKA6vRaTYByfV7oBkvCKr65ESufCF8ZkjTpb6k4bw3xtTXa6vW2zEsS46kPw0vpb
 C0bDv4MMGG11SgM2cmn6esDWldWyd89tltPy86TsQ1FIcAxJuKYr583GmA9Jw61ROarT
 db/g==
X-Gm-Message-State: AOAM531rVlAEusSe6YrugUg12CEDLk2JTgFhR9pvEcKNrBRJy+NIntdM
 zGE48Xth3IWHrTn/6MTec8gG3Q==
X-Google-Smtp-Source: ABdhPJy8cqfPuADKwxB4iyRrES18ZcrpVgyWcCLZOyc0IQD6cDHgh+Ee/DZgRlkSvAgd+rtCQp1sxQ==
X-Received: by 2002:a5d:4590:: with SMTP id p16mr339012wrq.123.1635244721052; 
 Tue, 26 Oct 2021 03:38:41 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.gmail.com with ESMTPSA id x21sm221397wmc.14.2021.10.26.03.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:38:40 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org,
	bjorn.andersson@linaro.org,
	robh@kernel.org
Subject: [RESEND PATCH v10 10/17] ASoC: qdsp6: audioreach: add q6apm support
Date: Tue, 26 Oct 2021 11:38:08 +0100
Message-Id: <20211026103815.19468-11-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
References: <20211026103815.19468-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, lgirdwood@gmail.com, tiwai@suse.de,
 plai@codeaurora.org, pierre-louis.bossart@linux.intel.com
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

Add support to q6apm (Audio Process Manager) component which is
core Audioreach service running in the DSP.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 305 +++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  29 ++
 sound/soc/qcom/qdsp6/q6apm.c      | 596 ++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm.h      | 152 ++++++++
 4 files changed, 1082 insertions(+)
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.c
 create mode 100644 sound/soc/qcom/qdsp6/q6apm.h

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 198d962c81f8..63a0e6c9ac14 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -5,6 +5,7 @@
 #include <linux/slab.h>
 #include <linux/soc/qcom/apr.h>
 #include <dt-bindings/soc/qcom,gpr.h>
+#include "q6apm.h"
 #include "audioreach.h"
 
 /* SubGraph Config */
@@ -253,3 +254,307 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t token
 				       APM_MODULE_INSTANCE_ID, true);
 }
 EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
+
+static void apm_populate_container_config(struct apm_container_obj *cfg,
+					  struct audioreach_container *cont)
+{
+
+	/* Container Config */
+	cfg->container_cfg.container_id = cont->container_id;
+	cfg->container_cfg.num_prop = 4;
+
+	/* Capability list */
+	cfg->cap_data.prop_id = APM_CONTAINER_PROP_ID_CAPABILITY_LIST;
+	cfg->cap_data.prop_size = APM_CONTAINER_PROP_ID_CAPABILITY_SIZE;
+	cfg->num_capability_id = 1;
+	cfg->capability_id = cont->capability_id;
+
+	/* Graph Position */
+	cfg->pos_data.prop_id = APM_CONTAINER_PROP_ID_GRAPH_POS;
+	cfg->pos_data.prop_size = sizeof(struct apm_cont_prop_id_graph_pos);
+	cfg->pos.graph_pos = cont->graph_pos;
+
+	/* Stack size */
+	cfg->stack_data.prop_id = APM_CONTAINER_PROP_ID_STACK_SIZE;
+	cfg->stack_data.prop_size = sizeof(struct apm_cont_prop_id_stack_size);
+	cfg->stack.stack_size = cont->stack_size;
+
+	/* Proc domain */
+	cfg->domain_data.prop_id = APM_CONTAINER_PROP_ID_PROC_DOMAIN;
+	cfg->domain_data.prop_size = sizeof(struct apm_cont_prop_id_domain);
+	cfg->domain.proc_domain = cont->proc_domain;
+}
+
+static void apm_populate_sub_graph_config(struct apm_sub_graph_data *cfg,
+					  struct audioreach_sub_graph *sg)
+{
+	cfg->sub_graph_cfg.sub_graph_id = sg->sub_graph_id;
+	cfg->sub_graph_cfg.num_sub_graph_prop = APM_SUB_GRAPH_CFG_NPROP;
+
+	/* Perf Mode */
+	cfg->perf_data.prop_id = APM_SUB_GRAPH_PROP_ID_PERF_MODE;
+	cfg->perf_data.prop_size = APM_SG_PROP_ID_PERF_MODE_SIZE;
+	cfg->perf.perf_mode = sg->perf_mode;
+
+	/* Direction */
+	cfg->dir_data.prop_id = APM_SUB_GRAPH_PROP_ID_DIRECTION;
+	cfg->dir_data.prop_size = APM_SG_PROP_ID_DIR_SIZE;
+	cfg->dir.direction = sg->direction;
+
+	/* Scenario ID */
+	cfg->sid_data.prop_id = APM_SUB_GRAPH_PROP_ID_SCENARIO_ID;
+	cfg->sid_data.prop_size = APM_SG_PROP_ID_SID_SIZE;
+	cfg->sid.scenario_id = sg->scenario_id;
+}
+
+static void apm_populate_connection_obj(struct apm_module_conn_obj *obj,
+					struct audioreach_module *module)
+{
+	obj->src_mod_inst_id = module->src_mod_inst_id;
+	obj->src_mod_op_port_id = module->src_mod_op_port_id;
+	obj->dst_mod_inst_id = module->instance_id;
+	obj->dst_mod_ip_port_id = module->in_port;
+}
+
+static void apm_populate_module_prop_obj(struct apm_mod_prop_obj *obj,
+					 struct audioreach_module *module)
+{
+
+	obj->instance_id = module->instance_id;
+	obj->num_props = 1;
+	obj->prop_data_1.prop_id = APM_MODULE_PROP_ID_PORT_INFO;
+	obj->prop_data_1.prop_size = APM_MODULE_PROP_ID_PORT_INFO_SZ;
+	obj->prop_id_port.max_ip_port = module->max_ip_port;
+	obj->prop_id_port.max_op_port = module->max_op_port;
+}
+
+struct audioreach_module *audioreach_get_container_last_module(
+							struct audioreach_container *container)
+{
+	struct audioreach_module *module;
+
+	list_for_each_entry(module, &container->modules_list, node) {
+		if (module->dst_mod_inst_id == 0)
+			return module;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_container_last_module);
+
+static bool is_module_in_container(struct audioreach_container *container, int module_iid)
+{
+	struct audioreach_module *module;
+
+	list_for_each_entry(module, &container->modules_list, node) {
+		if (module->instance_id == module_iid)
+			return true;
+	}
+
+	return false;
+}
+
+struct audioreach_module *audioreach_get_container_first_module(
+							struct audioreach_container *container)
+{
+	struct audioreach_module *module;
+
+	/* get the first module from both connected or un-connected containers */
+	list_for_each_entry(module, &container->modules_list, node) {
+		if (module->src_mod_inst_id == 0 ||
+		    !is_module_in_container(container, module->src_mod_inst_id))
+			return module;
+	}
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_container_first_module);
+
+struct audioreach_module *audioreach_get_container_next_module(
+						struct audioreach_container *container,
+						struct audioreach_module *module)
+{
+	int nmodule_iid = module->dst_mod_inst_id;
+	struct audioreach_module *nmodule;
+
+	list_for_each_entry(nmodule, &container->modules_list, node) {
+		if (nmodule->instance_id == nmodule_iid)
+			return nmodule;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(audioreach_get_container_next_module);
+
+static void apm_populate_module_list_obj(struct apm_mod_list_obj *obj,
+					 struct audioreach_container *container,
+					 int sub_graph_id)
+{
+	struct audioreach_module *module;
+	int i;
+
+	obj->sub_graph_id = sub_graph_id;
+	obj->container_id = container->container_id;
+	obj->num_modules = container->num_modules;
+	i = 0;
+	list_for_each_container_module(module, container) {
+		obj->mod_cfg[i].module_id = module->module_id;
+		obj->mod_cfg[i].instance_id = module->instance_id;
+		i++;
+	}
+}
+
+static void audioreach_populate_graph(struct apm_graph_open_params *open,
+				      struct list_head *sg_list,
+				      int num_sub_graphs)
+{
+	struct apm_mod_conn_list_params *mc_data = open->mod_conn_list_data;
+	struct apm_module_list_params *ml_data = open->mod_list_data;
+	struct apm_prop_list_params *mp_data = open->mod_prop_data;
+	struct apm_container_params *c_data = open->cont_data;
+	struct apm_sub_graph_params *sg_data = open->sg_data;
+	int ncontainer = 0, nmodule = 0, nconn = 0;
+	struct apm_mod_prop_obj *module_prop_obj;
+	struct audioreach_container *container;
+	struct apm_module_conn_obj *conn_obj;
+	struct audioreach_module *module;
+	struct audioreach_sub_graph *sg;
+	struct apm_container_obj *cobj;
+	struct apm_mod_list_obj *mlobj;
+	int i = 0;
+
+	mlobj = &ml_data->mod_list_obj[0];
+
+	list_for_each_entry(sg, sg_list, node) {
+		struct apm_sub_graph_data *sg_cfg = &sg_data->sg_cfg[i++];
+
+		apm_populate_sub_graph_config(sg_cfg, sg);
+
+		list_for_each_entry(container, &sg->container_list, node) {
+			cobj = &c_data->cont_obj[ncontainer];
+
+			apm_populate_container_config(cobj, container);
+			apm_populate_module_list_obj(mlobj, container, sg->sub_graph_id);
+
+			list_for_each_container_module(module, container) {
+				uint32_t src_mod_inst_id;
+
+				src_mod_inst_id = module->src_mod_inst_id;
+
+				module_prop_obj = &mp_data->mod_prop_obj[nmodule];
+				apm_populate_module_prop_obj(module_prop_obj, module);
+
+				if (src_mod_inst_id) {
+					conn_obj = &mc_data->conn_obj[nconn];
+					apm_populate_connection_obj(conn_obj, module);
+					nconn++;
+				}
+
+				nmodule++;
+			}
+			mlobj = (void *) mlobj + APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
+
+			ncontainer++;
+		}
+	}
+}
+
+void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct list_head *sg_list, int graph_id)
+{
+	int payload_size, sg_sz, cont_sz, ml_sz, mp_sz, mc_sz;
+	struct apm_module_param_data  *param_data;
+	struct apm_container_params *cont_params;
+	struct audioreach_container *container;
+	struct apm_sub_graph_params *sg_params;
+	struct apm_mod_conn_list_params *mcon;
+	struct apm_graph_open_params params;
+	struct apm_prop_list_params *mprop;
+	struct audioreach_module *module;
+	struct audioreach_sub_graph *sgs;
+	struct apm_mod_list_obj *mlobj;
+	int num_modules_per_list;
+	int num_connections = 0;
+	int num_containers = 0;
+	int num_sub_graphs = 0;
+	int num_modules = 0;
+	int num_modules_list;
+	struct gpr_pkt *pkt;
+	void *p;
+
+	list_for_each_entry(sgs, sg_list, node) {
+		num_sub_graphs++;
+		list_for_each_entry(container, &sgs->container_list, node) {
+			num_containers++;
+			num_modules += container->num_modules;
+			list_for_each_container_module(module, container) {
+				if (module->src_mod_inst_id)
+					num_connections++;
+			}
+		}
+	}
+
+	num_modules_list = num_containers;
+	num_modules_per_list = num_modules/num_containers;
+	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
+	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
+	ml_sz =	ALIGN(sizeof(struct apm_module_list_params) +
+		num_modules_list * APM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
+	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
+	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
+
+	payload_size = sg_sz + cont_sz + ml_sz + mp_sz + mc_sz;
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_GRAPH_OPEN, 0);
+	if (IS_ERR(pkt))
+		return pkt;
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	/* SubGraph */
+	params.sg_data = p;
+	param_data = &params.sg_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_CONFIG;
+	param_data->param_size = sg_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.sg_data->num_sub_graphs = num_sub_graphs;
+	p += sg_sz;
+
+	/* Container */
+	params.cont_data = p;
+	param_data = &params.cont_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_CONTAINER_CONFIG;
+	param_data->param_size = cont_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.cont_data->num_containers = num_containers;
+	p += cont_sz;
+
+	/* Module List*/
+	params.mod_list_data = p;
+	param_data = &params.mod_list_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_LIST;
+	param_data->param_size = ml_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_list_data->num_modules_list = num_sub_graphs;
+	p += ml_sz;
+
+	/* Module Properties */
+	params.mod_prop_data = p;
+	param_data = &params.mod_prop_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_PROP;
+	param_data->param_size = mp_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_prop_data->num_modules_prop_cfg = num_modules;
+	p += mp_sz;
+
+	/* Module Connections */
+	params.mod_conn_list_data = p;
+	param_data = &params.mod_conn_list_data->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_MODULE_CONN;
+	param_data->param_size = mc_sz - APM_MODULE_PARAM_DATA_SIZE;
+	params.mod_conn_list_data->num_connections = num_connections;
+	p += mc_sz;
+
+	audioreach_populate_graph(&params, sg_list, num_sub_graphs);
+
+	return pkt;
+}
+EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index c124b7953e6e..b6ce1a510e91 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -5,6 +5,8 @@
 #include <linux/types.h>
 #include <linux/soc/qcom/apr.h>
 #include <sound/soc.h>
+struct q6apm;
+struct q6apm_graph;
 
 /* Module IDs */
 #define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
@@ -654,6 +656,20 @@ struct audioreach_module {
 	struct snd_soc_dapm_widget *widget;
 };
 
+struct audioreach_module_config {
+	int	direction;
+	u32	sample_rate;
+	u16	bit_width;
+	u16	bits_per_sample;
+
+	u16	data_format;
+	u16	num_channels;
+	u16	active_channels_mask;
+	u32	sd_line_mask;
+	int	fmt;
+	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
+};
+
 /* Packet Allocation routines */
 void *audioreach_alloc_apm_cmd_pkt(int pkt_size, uint32_t opcode, uint32_t
 				    token);
@@ -665,4 +681,17 @@ void *audioreach_alloc_apm_pkt(int pkt_size, uint32_t opcode, uint32_t token,
 void *audioreach_alloc_pkt(int payload_size, uint32_t opcode,
 			   uint32_t token, uint32_t src_port,
 			   uint32_t dest_port);
+void *audioreach_alloc_graph_pkt(struct q6apm *apm,
+				 struct list_head *sg_list,
+				  int graph_id);
+struct audioreach_module *audioreach_get_container_last_module(
+				struct audioreach_container *container);
+struct audioreach_module *audioreach_get_container_first_module(
+				struct audioreach_container *container);
+struct audioreach_module *audioreach_get_container_next_module(
+				struct audioreach_container *container,
+				struct audioreach_module *module);
+#define list_for_each_container_module(mod, cont) \
+	for (mod = audioreach_get_container_first_module(cont); mod != NULL; \
+	     mod = audioreach_get_container_next_module(cont, mod))
 #endif /* __AUDIOREACH_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
new file mode 100644
index 000000000000..b87ea6cb540e
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -0,0 +1,596 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020, Linaro Limited
+
+#include <dt-bindings/soc/qcom,gpr.h>
+#include <linux/delay.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/apr.h>
+#include <linux/wait.h>
+#include <sound/soc.h>
+#include <sound/soc-dapm.h>
+#include <sound/pcm.h>
+#include "audioreach.h"
+#include "q6apm.h"
+
+/* Graph Management */
+struct apm_graph_mgmt_cmd {
+	struct apm_module_param_data param_data;
+	uint32_t num_sub_graphs;
+	uint32_t sub_graph_id_list[];
+} __packed;
+
+#define APM_GRAPH_MGMT_PSIZE(p, n) ALIGN(struct_size(p, sub_graph_id_list, n), 8)
+
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
+{
+	gpr_device_t *gdev = apm->gdev;
+
+	return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
+					NULL, &apm->wait, pkt, rsp_opcode);
+}
+
+static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, uint32_t graph_id)
+{
+	struct audioreach_graph_info *info;
+	struct audioreach_graph *graph;
+	int id;
+
+	mutex_lock(&apm->lock);
+	graph = idr_find(&apm->graph_idr, graph_id);
+	mutex_unlock(&apm->lock);
+
+	if (graph) {
+		kref_get(&graph->refcount);
+		return graph;
+	}
+
+	info = idr_find(&apm->graph_info_idr, graph_id);
+
+	if (!info)
+		return ERR_PTR(-ENODEV);
+
+	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
+	if (!graph)
+		return ERR_PTR(-ENOMEM);
+
+	graph->apm = apm;
+	graph->info = info;
+	graph->id = graph_id;
+
+	graph->graph = audioreach_alloc_graph_pkt(apm, &info->sg_list, graph_id);
+	if (IS_ERR(graph->graph)) {
+		void *err = graph->graph;
+
+		kfree(graph);
+		return ERR_CAST(err);
+	}
+
+	mutex_lock(&apm->lock);
+	id = idr_alloc(&apm->graph_idr, graph, graph_id, graph_id + 1, GFP_KERNEL);
+	if (id < 0) {
+		dev_err(apm->dev, "Unable to allocate graph id (%d)\n", graph_id);
+		kfree(graph);
+		mutex_unlock(&apm->lock);
+		return ERR_PTR(id);
+	}
+	mutex_unlock(&apm->lock);
+
+	kref_init(&graph->refcount);
+
+	q6apm_send_cmd_sync(apm, graph->graph, 0);
+
+	return graph;
+}
+
+static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t opcode)
+{
+	struct audioreach_graph_info *info = graph->info;
+	int num_sub_graphs = info->num_sub_graphs;
+	struct apm_module_param_data *param_data;
+	struct apm_graph_mgmt_cmd *mgmt_cmd;
+	struct audioreach_sub_graph *sg;
+	struct q6apm *apm = graph->apm;
+	int i = 0, rc, payload_size;
+	struct gpr_pkt *pkt;
+
+	payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	mgmt_cmd = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	mgmt_cmd->num_sub_graphs = num_sub_graphs;
+
+	param_data = &mgmt_cmd->param_data;
+	param_data->module_instance_id = APM_MODULE_INSTANCE_ID;
+	param_data->param_id = APM_PARAM_ID_SUB_GRAPH_LIST;
+	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+
+	list_for_each_entry(sg, &info->sg_list, node)
+		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
+
+	rc = q6apm_send_cmd_sync(apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
+static void q6apm_put_audioreach_graph(struct kref *ref)
+{
+	struct audioreach_graph *graph;
+	struct q6apm *apm;
+
+	graph = container_of(ref, struct audioreach_graph, refcount);
+	apm = graph->apm;
+
+	audioreach_graph_mgmt_cmd(graph, APM_CMD_GRAPH_CLOSE);
+
+	mutex_lock(&apm->lock);
+	graph = idr_remove(&apm->graph_idr, graph->id);
+	mutex_unlock(&apm->lock);
+
+	kfree(graph->graph);
+	kfree(graph);
+}
+
+static int q6apm_get_apm_state(struct q6apm *apm)
+{
+	struct gpr_pkt *pkt;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
+
+	kfree(pkt);
+
+	return apm->state;
+}
+
+static struct audioreach_module *__q6apm_find_module_by_mid(struct q6apm *apm,
+						    struct audioreach_graph_info *info,
+						    uint32_t mid)
+{
+	struct audioreach_container *container;
+	struct audioreach_sub_graph *sgs;
+	struct audioreach_module *module;
+
+	list_for_each_entry(sgs, &info->sg_list, node) {
+		list_for_each_entry(container, &sgs->container_list, node) {
+			list_for_each_entry(module, &container->modules_list, node) {
+				if (mid == module->module_id)
+					return module;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+static struct audioreach_module *q6apm_graph_get_last_module(struct q6apm *apm, u32 sgid)
+{
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+	struct audioreach_sub_graph *sg;
+
+	mutex_lock(&apm->lock);
+	sg = idr_find(&apm->sub_graphs_idr, sgid);
+	mutex_unlock(&apm->lock);
+	if (!sg)
+		return NULL;
+
+	container = list_last_entry(&sg->container_list, struct audioreach_container, node);
+	module = audioreach_get_container_last_module(container);
+
+	return module;
+}
+
+static struct audioreach_module *q6apm_graph_get_first_module(struct q6apm *apm, u32 sgid)
+{
+	struct audioreach_container *container;
+	struct audioreach_module *module;
+	struct audioreach_sub_graph *sg;
+
+	mutex_lock(&apm->lock);
+	sg = idr_find(&apm->sub_graphs_idr, sgid);
+	mutex_unlock(&apm->lock);
+	if (!sg)
+		return NULL;
+
+	container = list_first_entry(&sg->container_list, struct audioreach_container, node);
+	module = audioreach_get_container_first_module(container);
+
+	return module;
+}
+
+bool q6apm_is_sub_graphs_connected(struct q6apm *apm, u32 src_sgid, u32 dst_sgid)
+{
+	struct audioreach_module *module;
+	u32 iid;
+
+	module = q6apm_graph_get_last_module(apm, src_sgid);
+	if (!module)
+		return false;
+
+	iid = module->instance_id;
+	module = q6apm_graph_get_first_module(apm, dst_sgid);
+	if (!module)
+		return false;
+
+	if (module->src_mod_inst_id == iid)
+		return true;
+
+	return false;
+}
+
+int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid, u32 dst_sgid, bool connect)
+{
+	struct audioreach_module *module;
+	u32 iid;
+
+	if (connect) {
+		module = q6apm_graph_get_last_module(apm, src_sgid);
+		if (!module)
+			return -ENODEV;
+
+		iid = module->instance_id;
+	} else {
+		iid = 0;
+	}
+
+	module = q6apm_graph_get_first_module(apm, dst_sgid);
+	if (!module)
+		return -ENODEV;
+
+	/* set src module in dst subgraph first module */
+	module->src_mod_inst_id = iid;
+
+	return 0;
+}
+
+int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph)
+{
+	struct audioreach_module *module;
+
+	module = q6apm_find_module_by_mid(graph, MODULE_ID_WR_SHARED_MEM_EP);
+	if (!module)
+		return -ENODEV;
+
+	return module->instance_id;
+
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_get_rx_shmem_module_iid);
+
+static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
+{
+	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
+	struct data_cmd_rsp_wr_sh_mem_ep_data_buffer_done_v2 *done;
+	struct apm_cmd_rsp_shared_mem_map_regions *rsp;
+	struct gpr_ibasic_rsp_result_t *result;
+	struct q6apm_graph *graph = priv;
+	struct gpr_hdr *hdr = &data->hdr;
+	struct device *dev = graph->dev;
+	uint32_t client_event;
+	phys_addr_t phys;
+	int token;
+
+	result = data->payload;
+
+	switch (hdr->opcode) {
+	case DATA_CMD_RSP_WR_SH_MEM_EP_DATA_BUFFER_DONE_V2:
+		client_event = APM_CLIENT_EVENT_DATA_WRITE_DONE;
+		mutex_lock(&graph->lock);
+		token = hdr->token & APM_WRITE_TOKEN_MASK;
+
+		done = data->payload;
+		phys = graph->rx_data.buf[token].phys;
+		mutex_unlock(&graph->lock);
+
+		if (lower_32_bits(phys) == done->buf_addr_lsw &&
+		    upper_32_bits(phys) == done->buf_addr_msw) {
+			graph->result.opcode = hdr->opcode;
+			graph->result.status = done->status;
+			if (graph->cb)
+				graph->cb(client_event, hdr->token, data->payload, graph->priv);
+		} else {
+			dev_err(dev, "WR BUFF Unexpected addr %08x-%08x\n", done->buf_addr_lsw,
+				done->buf_addr_msw);
+		}
+
+		break;
+	case APM_CMD_RSP_SHARED_MEM_MAP_REGIONS:
+		graph->result.opcode = hdr->opcode;
+		graph->result.status = 0;
+		rsp = data->payload;
+
+		if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+			graph->rx_data.mem_map_handle = rsp->mem_map_handle;
+		else
+			graph->tx_data.mem_map_handle = rsp->mem_map_handle;
+
+		wake_up(&graph->cmd_wait);
+		break;
+	case DATA_CMD_RSP_RD_SH_MEM_EP_DATA_BUFFER_V2:
+		client_event = APM_CLIENT_EVENT_DATA_READ_DONE;
+		mutex_lock(&graph->lock);
+		rd_done = data->payload;
+		phys = graph->tx_data.buf[hdr->token].phys;
+		mutex_unlock(&graph->lock);
+
+		if (upper_32_bits(phys) == rd_done->buf_addr_msw &&
+		    lower_32_bits(phys) == rd_done->buf_addr_lsw) {
+			graph->result.opcode = hdr->opcode;
+			graph->result.status = rd_done->status;
+			if (graph->cb)
+				graph->cb(client_event, hdr->token, data->payload, graph->priv);
+		} else {
+			dev_err(dev, "RD BUFF Unexpected addr %08x-%08x\n", rd_done->buf_addr_lsw,
+				rd_done->buf_addr_msw);
+		}
+		break;
+	case DATA_CMD_WR_SH_MEM_EP_EOS_RENDERED:
+		break;
+	case GPR_BASIC_RSP_RESULT:
+		switch (result->opcode) {
+		case APM_CMD_SHARED_MEM_UNMAP_REGIONS:
+			graph->result.opcode = result->opcode;
+			graph->result.status = 0;
+			if (hdr->token == SNDRV_PCM_STREAM_PLAYBACK)
+				graph->rx_data.mem_map_handle = 0;
+			else
+				graph->tx_data.mem_map_handle = 0;
+
+			wake_up(&graph->cmd_wait);
+			break;
+		case APM_CMD_SHARED_MEM_MAP_REGIONS:
+		case DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT:
+		case APM_CMD_SET_CFG:
+			graph->result.opcode = result->opcode;
+			graph->result.status = result->status;
+			if (result->status)
+				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n",
+					result->status, result->opcode);
+			wake_up(&graph->cmd_wait);
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
+				     void *priv, int graph_id)
+{
+	struct q6apm *apm = dev_get_drvdata(dev->parent);
+	struct audioreach_graph *ar_graph;
+	struct q6apm_graph *graph;
+	int ret;
+
+	ar_graph = q6apm_get_audioreach_graph(apm, graph_id);
+	if (IS_ERR(ar_graph)) {
+		dev_err(dev, "No graph found with id %d\n", graph_id);
+		return ERR_CAST(ar_graph);
+	}
+
+	graph = kzalloc(sizeof(*graph), GFP_KERNEL);
+	if (!graph) {
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	graph->apm = apm;
+	graph->priv = priv;
+	graph->cb = cb;
+	graph->info = ar_graph->info;
+	graph->ar_graph = ar_graph;
+	graph->id = ar_graph->id;
+	graph->dev = dev;
+
+	mutex_init(&graph->lock);
+	init_waitqueue_head(&graph->cmd_wait);
+
+	graph->port = gpr_alloc_port(apm->gdev, dev, graph_callback, graph);
+	if (!graph->port) {
+		kfree(graph);
+		ret = -ENOMEM;
+		goto err;
+	}
+
+	return graph;
+err:
+	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_open);
+
+int q6apm_graph_close(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+
+	gpr_free_port(graph->port);
+	kref_put(&ar_graph->refcount, q6apm_put_audioreach_graph);
+	kfree(graph);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_close);
+
+int q6apm_graph_prepare(struct q6apm_graph *graph)
+{
+	return audioreach_graph_mgmt_cmd(graph->ar_graph, APM_CMD_GRAPH_PREPARE);
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_prepare);
+
+int q6apm_graph_start(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+	int ret = 0;
+
+	if (ar_graph->start_count == 0)
+		ret = audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_START);
+
+	ar_graph->start_count++;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_start);
+
+int q6apm_graph_stop(struct q6apm_graph *graph)
+{
+	struct audioreach_graph *ar_graph = graph->ar_graph;
+
+	if (--ar_graph->start_count > 0)
+		return 0;
+
+	return audioreach_graph_mgmt_cmd(ar_graph, APM_CMD_GRAPH_STOP);
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_stop);
+
+int q6apm_graph_flush(struct q6apm_graph *graph)
+{
+	return audioreach_graph_mgmt_cmd(graph->ar_graph, APM_CMD_GRAPH_FLUSH);
+}
+EXPORT_SYMBOL_GPL(q6apm_graph_flush);
+
+static int q6apm_audio_probe(struct snd_soc_component *component)
+{
+	return 0;
+}
+
+static void q6apm_audio_remove(struct snd_soc_component *component)
+{
+	/* remove topology */
+	snd_soc_tplg_component_remove(component);
+}
+
+#define APM_AUDIO_DRV_NAME "q6apm-audio"
+
+static const struct snd_soc_component_driver q6apm_audio_component = {
+	.name		= APM_AUDIO_DRV_NAME,
+	.probe		= q6apm_audio_probe,
+	.remove		= q6apm_audio_remove,
+};
+
+static int apm_probe(gpr_device_t *gdev)
+{
+	struct device *dev = &gdev->dev;
+	struct q6apm *apm;
+	int ret;
+
+	apm = devm_kzalloc(dev, sizeof(*apm), GFP_KERNEL);
+	if (!apm)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, apm);
+
+	mutex_init(&apm->lock);
+	apm->dev = dev;
+	apm->gdev = gdev;
+	init_waitqueue_head(&apm->wait);
+
+	idr_init(&apm->graph_idr);
+	idr_init(&apm->graph_info_idr);
+	idr_init(&apm->sub_graphs_idr);
+	idr_init(&apm->containers_idr);
+
+	idr_init(&apm->modules_idr);
+
+	q6apm_get_apm_state(apm);
+
+	ret = devm_snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to get register q6apm: %d\n", ret);
+		return ret;
+	}
+
+	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+}
+
+struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph, uint32_t mid)
+{
+	struct audioreach_graph_info *info = graph->info;
+	struct q6apm *apm = graph->apm;
+
+	return __q6apm_find_module_by_mid(apm, info, mid);
+
+}
+
+static int apm_callback(struct gpr_resp_pkt *data, void *priv, int op)
+{
+	gpr_device_t *gdev = priv;
+	struct q6apm *apm = dev_get_drvdata(&gdev->dev);
+	struct device *dev = &gdev->dev;
+	struct gpr_ibasic_rsp_result_t *result;
+	struct gpr_hdr *hdr = &data->hdr;
+
+	result = data->payload;
+
+	switch (hdr->opcode) {
+	case APM_CMD_RSP_GET_SPF_STATE:
+		apm->result.opcode = hdr->opcode;
+		apm->result.status = 0;
+		/* First word of result it state */
+		apm->state = result->opcode;
+		wake_up(&apm->wait);
+		break;
+	case GPR_BASIC_RSP_RESULT:
+		switch (result->opcode) {
+		case APM_CMD_GRAPH_START:
+		case APM_CMD_GRAPH_OPEN:
+		case APM_CMD_GRAPH_PREPARE:
+		case APM_CMD_GRAPH_CLOSE:
+		case APM_CMD_GRAPH_FLUSH:
+		case APM_CMD_GRAPH_STOP:
+		case APM_CMD_SET_CFG:
+			apm->result.opcode = result->opcode;
+			apm->result.status = result->status;
+			if (result->status)
+				dev_err(dev, "Error (%d) Processing 0x%08x cmd\n", result->status,
+					result->opcode);
+			wake_up(&apm->wait);
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id apm_device_id[]  = {
+	{ .compatible = "qcom,q6apm" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, apm_device_id);
+#endif
+
+static gpr_driver_t apm_driver = {
+	.probe = apm_probe,
+	.gpr_callback = apm_callback,
+	.driver = {
+		.name = "qcom-apm",
+		.of_match_table = of_match_ptr(apm_device_id),
+	},
+};
+
+module_gpr_driver(apm_driver);
+MODULE_DESCRIPTION("Audio Process Manager");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
new file mode 100644
index 000000000000..54eadadf712c
--- /dev/null
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -0,0 +1,152 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __Q6APM_H__
+#define __Q6APM_H__
+#include <linux/types.h>
+#include <linux/slab.h>
+#include <linux/wait.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/sched.h>
+#include <linux/of.h>
+#include <linux/delay.h>
+#include <sound/soc.h>
+#include <linux/of_platform.h>
+#include <linux/jiffies.h>
+#include <linux/soc/qcom/apr.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include "audioreach.h"
+
+#define APM_PORT_MAX		127
+#define APM_PORT_MAX_AUDIO_CHAN_CNT 8
+#define PCM_CHANNEL_NULL 0
+#define PCM_CHANNEL_FL    1	/* Front left channel. */
+#define PCM_CHANNEL_FR    2	/* Front right channel. */
+#define PCM_CHANNEL_FC    3	/* Front center channel. */
+#define PCM_CHANNEL_LS   4	/* Left surround channel. */
+#define PCM_CHANNEL_RS   5	/* Right surround channel. */
+#define PCM_CHANNEL_LFE  6	/* Low frequency effect channel. */
+#define PCM_CHANNEL_CS   7	/* Center surround channel; Rear center ch */
+#define PCM_CHANNEL_LB   8	/* Left back channel; Rear left channel. */
+#define PCM_CHANNEL_RB   9	/* Right back channel; Rear right channel. */
+#define PCM_CHANNELS   10	/* Top surround channel. */
+
+#define APM_TIMESTAMP_FLAG	0x80000000
+#define FORMAT_LINEAR_PCM	0x0000
+/* APM client callback events */
+#define APM_CMD_EOS				0x0003
+#define APM_CLIENT_EVENT_CMD_EOS_DONE		0x1003
+#define APM_CMD_CLOSE				0x0004
+#define APM_CLIENT_EVENT_CMD_CLOSE_DONE		0x1004
+#define APM_CLIENT_EVENT_CMD_RUN_DONE		0x1008
+#define APM_CLIENT_EVENT_DATA_WRITE_DONE	0x1009
+#define APM_CLIENT_EVENT_DATA_READ_DONE		0x100a
+#define APM_WRITE_TOKEN_MASK                   GENMASK(15, 0)
+#define APM_WRITE_TOKEN_LEN_MASK               GENMASK(31, 16)
+#define APM_WRITE_TOKEN_LEN_SHIFT              16
+
+#define APM_MAX_SESSIONS			8
+
+struct q6apm {
+	struct device *dev;
+	gpr_port_t *port;
+	gpr_device_t *gdev;
+	/* For Graph OPEN/START/STOP/CLOSE operations */
+	wait_queue_head_t wait;
+	struct gpr_ibasic_rsp_result_t result;
+
+	struct mutex cmd_lock;
+	struct mutex lock;
+	uint32_t state;
+
+	struct idr graph_idr;
+	struct idr graph_info_idr;
+	struct idr sub_graphs_idr;
+	struct idr containers_idr;
+	struct idr modules_idr;
+};
+
+struct audio_buffer {
+	phys_addr_t phys;
+	uint32_t size;		/* size of buffer */
+};
+
+struct audioreach_graph_data {
+	struct audio_buffer *buf;
+	uint32_t num_periods;
+	uint32_t dsp_buf;
+	uint32_t mem_map_handle;
+};
+
+struct audioreach_graph {
+	struct audioreach_graph_info *info;
+	uint32_t id;
+	int state;
+	int start_count;
+	/* Cached Graph data */
+	void *graph;
+	struct kref refcount;
+	struct q6apm *apm;
+};
+
+typedef void (*q6apm_cb) (uint32_t opcode, uint32_t token,
+			  void *payload, void *priv);
+struct q6apm_graph {
+	void *priv;
+	q6apm_cb cb;
+	uint32_t id;
+	struct device *dev;
+	struct q6apm *apm;
+	gpr_port_t *port;
+	struct audioreach_graph_data rx_data;
+	struct audioreach_graph_data tx_data;
+	struct gpr_ibasic_rsp_result_t result;
+	wait_queue_head_t cmd_wait;
+	struct mutex lock;
+	struct audioreach_graph *ar_graph;
+	struct audioreach_graph_info *info;
+};
+
+/* Graph Operations */
+struct q6apm_graph *q6apm_graph_open(struct device *dev, q6apm_cb cb,
+				     void *priv, int graph_id);
+int q6apm_graph_close(struct q6apm_graph *graph);
+int q6apm_graph_prepare(struct q6apm_graph *graph);
+int q6apm_graph_start(struct q6apm_graph *graph);
+int q6apm_graph_stop(struct q6apm_graph *graph);
+int q6apm_graph_flush(struct q6apm_graph *graph);
+
+/* Media Format */
+int q6apm_graph_media_format_pcm(struct q6apm_graph *graph,
+				 struct audioreach_module_config *cfg);
+
+int q6apm_graph_media_format_shmem(struct q6apm_graph *graph,
+				   struct audioreach_module_config *cfg);
+
+/* read/write related */
+int q6apm_send_eos_nowait(struct q6apm_graph *graph);
+int q6apm_read(struct q6apm_graph *graph);
+int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
+		      uint32_t lsw_ts, uint32_t wflags);
+
+/* Memory Map related */
+int q6apm_map_memory_regions(struct q6apm_graph *graph,
+			     unsigned int dir, phys_addr_t phys,
+			     size_t period_sz, unsigned int periods);
+int q6apm_unmap_memory_regions(struct q6apm_graph *graph,
+			       unsigned int dir);
+/* Helpers */
+int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,
+			uint32_t rsp_opcode);
+
+/* Callback for graph specific */
+struct audioreach_module *q6apm_find_module_by_mid(struct q6apm_graph *graph,
+						    uint32_t mid);
+
+void q6apm_set_fe_dai_ops(struct snd_soc_dai_driver *dai_drv);
+int q6apm_connect_sub_graphs(struct q6apm *apm, u32 src_sgid, u32 dst_sgid,
+			     bool connect);
+bool q6apm_is_sub_graphs_connected(struct q6apm *apm, u32 src_sgid,
+				   u32 dst_sgid);
+int q6apm_graph_get_rx_shmem_module_iid(struct q6apm_graph *graph);
+
+#endif /* __APM_GRAPH_ */
-- 
2.21.0

