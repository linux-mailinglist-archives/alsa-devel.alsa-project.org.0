Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F388400393
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Sep 2021 18:40:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C140718D4;
	Fri,  3 Sep 2021 18:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C140718D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630687236;
	bh=NW6qcChOSSCcuYEsj6tBHbcbaVXNsBbi8Xb3bP7RKXo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EJeNLUavdl7KKIUv4m2IOOa2mf4YzipPYWOvcIPw2ZZOMKofgtr0hg0L0++Mkw4hA
	 WabI+vDsy7YwXhPEYXCwi52Hr26souzkJbE4Su4QBzRFRx0bhUE1lCLToSJDJRT6LV
	 Am1puhg9zK/JxSgNlH5e9i+wJrBvPSLpn050J6w8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98B2AF80507;
	Fri,  3 Sep 2021 18:38:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B8C87F804FB; Fri,  3 Sep 2021 18:38:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FD9CF80254
 for <alsa-devel@alsa-project.org>; Fri,  3 Sep 2021 18:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD9CF80254
X-IronPort-AV: E=McAfee;i="6200,9189,10096"; a="206687211"
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="206687211"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:59 -0700
X-IronPort-AV: E=Sophos;i="5.85,265,1624345200"; d="scan'208";a="462453508"
Received: from seangorm-mobl.amr.corp.intel.com (HELO [10.251.136.111])
 ([10.251.136.111])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2021 09:37:57 -0700
Subject: Re: [PATCH v5 20/21] ASoC: qdsp6: audioreach: add q6prm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-21-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8a38f2f2-d74d-53c6-a4f5-669fef1f7c05@linux.intel.com>
Date: Fri, 3 Sep 2021 10:57:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903112032.25834-21-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com
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


> +struct prm_cmd_request_rsc {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_clk_id;
> +	struct audio_hw_clk_cfg clock_ids[1];
> +} __packed;
> +
> +struct prm_cmd_release_rsc {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_clk_id;
> +	struct audio_hw_clk_cfg clock_ids[1];

why do you need arrays of one element? I thought this was also frowned
upon if not already deprecated?


> +} __packed;
> +
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

this looks again like the same code we've seen twice already?

> +
> +static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)
> +{
> +	struct prm_cmd_request_hw_core *req;
> +	struct apm_module_param_data *param_data;
> +	struct gpr_pkt *pkt;
> +	struct q6prm *prm = dev_get_drvdata(dev->parent);
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

same comment as before for the rest of this file:

pkt = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id,
				     GPR_PRM_MODULE_IID);
kfree(pkt);



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
> +}
> +

