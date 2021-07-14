Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B553C899B
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 19:18:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7508516B0;
	Wed, 14 Jul 2021 19:17:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7508516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626283117;
	bh=1ZbWDCe3jMYObm8mrIbaSjyO966RQnwncjZoZ7q3MZc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=U6TNqnSYv9ZwPR7ce6xhtg9olZ819bvGPS1s61yFsT/96FsRHr3wYiVYspWP3m4RT
	 QP8JE+oNRl195YZGysBCg2tesELOGkxJbXHhSuSaMGB79B3KSR2HSVnyXsv6H489Fe
	 /HAKGFWMdQFglrIVkPpri/NWeIfpKfNhLJJ3KBIA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD37AF80515;
	Wed, 14 Jul 2021 19:14:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06719F804FC; Wed, 14 Jul 2021 19:14:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0968FF804E4
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 19:14:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0968FF804E4
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190769984"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="190769984"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:36 -0700
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="413353793"
Received: from alpinagh-mobl1.amr.corp.intel.com (HELO [10.212.71.223])
 ([10.212.71.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:35 -0700
Subject: Re: [PATCH v2 12/16] ASoC: qcom: audioreach: add q6prm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-13-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <65c935b8-fb36-8da7-9a27-1ecd6559c41b@linux.intel.com>
Date: Wed, 14 Jul 2021 12:09:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714153039.28373-13-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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




> +static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt,
> +			uint32_t rsp_opcode)
> +{
> +	gpr_device_t *gdev = prm->gdev;
> +	struct gpr_hdr *hdr = &pkt->hdr;
> +	int rc;
> +
> +	mutex_lock(&prm->lock);
> +	prm->result.opcode = 0;
> +	prm->result.status = 0;
> +
> +	rc = gpr_send_pkt(prm->gdev, pkt);
> +	if (rc < 0)
> +		goto err;
> +
> +	if (rsp_opcode)
> +		rc = wait_event_timeout(prm->wait,
> +					(prm->result.opcode == hdr->opcode) ||
> +					(prm->result.opcode == rsp_opcode),
> +					5 * HZ);
> +	else
> +		rc = wait_event_timeout(prm->wait,
> +					(prm->result.opcode == hdr->opcode),
> +					5 * HZ);
> +
> +	if (!rc) {
> +		dev_err(&gdev->dev, "CMD timeout for [%x] opcode\n",
> +			hdr->opcode);
> +		rc = -ETIMEDOUT;
> +	} else if (prm->result.status > 0) {
> +		dev_err(&gdev->dev, "DSP returned error[%x] %x\n", hdr->opcode,
> +			prm->result.status);
> +		rc = -EINVAL;
> +	} else {
> +		dev_err(&gdev->dev, "DSP returned [%x]\n",
> +			prm->result.status);
> +		rc = 0;
> +	}
> +
> +err:
> +	mutex_unlock(&prm->lock);
> +	return rc;
> +}

In patch7 you had more or less the same code. can a helper be used?

+int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
+				   struct gpr_pkt *pkt, uint32_t rsp_opcode)
+{
+
+	struct device *dev = graph->dev;
+	struct gpr_hdr *hdr = &pkt->hdr;
+	int rc;
+
+	mutex_lock(&graph->cmd_lock);
+	graph->result.opcode = 0;
+	graph->result.status = 0;
+
+	rc = gpr_send_port_pkt(graph->port, pkt);
+	if (rc < 0)
+		goto err;
+
+	if (rsp_opcode)
+		rc = wait_event_timeout(graph->cmd_wait,
+					(graph->result.opcode == hdr->opcode) ||
+					(graph->result.opcode == rsp_opcode),
+					5 * HZ);
+	else
+		rc = wait_event_timeout(graph->cmd_wait,
+					(graph->result.opcode == hdr->opcode),
+					5 * HZ);
+
+	if (!rc) {
+		dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
+		rc = -ETIMEDOUT;
+	} else if (graph->result.status > 0) {
+		dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode,
+			graph->result.status);
+		rc = -EINVAL;
+	} else {
+		dev_err(dev, "DSP returned [%x]\n", graph->result.status);
+		rc = 0;
+	}
+
+err:
+	mutex_unlock(&graph->cmd_lock);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);


> +static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id,   bool enable)
> +{
> +	struct prm_cmd_request_hw_core *req;
> +	struct apm_module_param_data *param_data;
> +	struct gpr_pkt *pkt;
> +	struct q6prm *prm = dev_get_drvdata(dev);
> +	gpr_device_t *gdev  = prm->gdev;
> +	void *p;
> +	int rc = 0;
> +	uint32_t opcode, rsp_opcode;
> +
> +	if (enable) {
> +		opcode = PRM_CMD_REQUEST_HW_RSC;
> +		rsp_opcode = PRM_CMD_RSP_REQUEST_HW_RSC;
> +	} else {
> +		opcode = PRM_CMD_RELEASE_HW_RSC;
> +		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
> +	}
> +
> +	p = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id,
> +				     GPR_PRM_MODULE_IID);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	req = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	param_data = &req->param_data;
> +
> +	param_data->module_instance_id = GPR_PRM_MODULE_IID;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_RSC_HW_CORE;
> +	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	req->hw_clk_id = hw_block_id;
> +
> +	q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
> +
> +	kfree(pkt);
> +
> +	return rc;

rc is not assigned, should this not trap the result of sending a command?

> +}
> +
> +static int q6prm_set_lpass_clock(struct device *dev, int clk_id, int clk_attr,
> +				 int clk_root, unsigned int freq)
> +{
> +	struct prm_cmd_request_rsc *req;
> +	struct apm_module_param_data *param_data;
> +	struct gpr_pkt *pkt;
> +	struct q6prm *prm = dev_get_drvdata(dev);
> +	gpr_device_t *gdev  = prm->gdev;
> +	void *p;
> +	int rc = 0;
> +
> +	p = audioreach_alloc_cmd_pkt(sizeof(*req), PRM_CMD_REQUEST_HW_RSC,
> +				     0, gdev->svc.id, GPR_PRM_MODULE_IID);
> +	if (IS_ERR(p))
> +		return -ENOMEM;
> +
> +	pkt = p;
> +	req = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +
> +	param_data = &req->param_data;
> +
> +	param_data->module_instance_id = GPR_PRM_MODULE_IID;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_RSC_AUDIO_HW_CLK;
> +	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	req->num_clk_id = 1;
> +	req->clock_ids[0].clock_id = clk_id;
> +	req->clock_ids[0].clock_freq = freq;
> +	req->clock_ids[0].clock_attri = clk_attr;
> +	req->clock_ids[0].clock_root = clk_root;
> +
> +	q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);

rc = q6prm_send_cmd_sync(prm, pkt, PRM_CMD_RSP_REQUEST_HW_RSC);

?

> +
> +	kfree(pkt);
> +
> +	return rc;
> +}
> +
