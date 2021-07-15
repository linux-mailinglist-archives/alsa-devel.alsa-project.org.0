Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3082B3C9CCE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 12:35:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACB4616A8;
	Thu, 15 Jul 2021 12:34:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACB4616A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626345349;
	bh=AGONIHQbRPYl9/cwIbbHcE8M0cOSViq4Awq9M7D7PKs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OgYW9jUsRKcJHRkr75Pdr6axVE2BxmVMTdsFJAkUG9Gh8YbDefMIMmLp2h/o/hFZr
	 MbD2PCyZBaIMHctIYDdeo/gHjo5T6Aiw8aD1mWEC6B0t7P+i8oxEBzZC+r5phsCFxS
	 AoQJhgMvlEMhJpr/lWESAo1sXF5U7fTw5+1YcFlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C1CDF80506;
	Thu, 15 Jul 2021 12:32:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECFD2F804FF; Thu, 15 Jul 2021 12:32:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93AFAF804FD
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 12:32:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93AFAF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uoDFQHz4"
Received: by mail-wr1-x434.google.com with SMTP id t5so7076364wrw.12
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 03:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ogUkZMQle5D8vhGQlPdaF0V6lQAGwCn5kpEitnw6uQ4=;
 b=uoDFQHz4jKqL3MXptxfoHCEFo6Iis748rmY1c9AJFi0X4+K6J2VE+0YnAgCsOzLho9
 8uvBoMifRA3MEUGcWtEG6MAlyxXP+vbGS9p8xV/VzY88Zi34OU0cyRzfGaqxhLnFa615
 bJmql9PlFqA3J0YHL3an83BVG7pzmDYEx6hSfhqolTtgDkfueK1/SkxMQV6qPps0Xgp/
 geKuho/Wxrg8nNZaUZA69iobd+6oWQWaWezGc2vSF6SiMC9FRKcmAmttMfVG3AhY6d80
 TCHuazurFfwSviWSYDZlBnbtpSyxAwjcK6qphppcOnfQFzTG0govCqUSgLxLSaMiNHBW
 sENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ogUkZMQle5D8vhGQlPdaF0V6lQAGwCn5kpEitnw6uQ4=;
 b=ZgvMZISRQPoGaTzAufaiYOVAcm62j6XIRF0G8AxhaHins071yitGAz5GX6KTxvM/P8
 7olFzr7m9yf/zxukX8+WLexGLZGRC7zuJ2IHUA8gFy5I8coFN0FHTchWTKkGVplUf2R7
 W0es1j7iXqHaqSu0wFrVxqERt40xEraUCPSBQShOsO/upJ0KYD3E3pzxlRUsGWsQuYhy
 dz24mDyUE3lyQoVW0dnr31V24reGFag64WqobVMvZHnU6YOYXEvcIHH9m5n1dwADlZ+8
 itPFi+w620GVj+IdZlv7zczJfKxDPM7zqCf4WERBUiJQ1ZNxcrt4QllPvOIXIFPKtHCb
 W5bQ==
X-Gm-Message-State: AOAM5304P5mi22ejnsolNSND9+KxdJR1MQZbSQfRHbjoFXPwINBIGLWz
 QWccBvnp2hSO1dGRvye7SrgRSQ==
X-Google-Smtp-Source: ABdhPJxYME0Lv0oK8f5bk3/BtLMmAIb0vMrNxC2DwBMe5yMoa0qhcVSiuNlBu2Jgf1Z+gsiJRI7ptg==
X-Received: by 2002:a5d:5043:: with SMTP id h3mr4611038wrt.333.1626345154649; 
 Thu, 15 Jul 2021 03:32:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id p2sm4507732wmg.6.2021.07.15.03.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 03:32:34 -0700 (PDT)
Subject: Re: [PATCH v2 12/16] ASoC: qcom: audioreach: add q6prm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-13-srinivas.kandagatla@linaro.org>
 <65c935b8-fb36-8da7-9a27-1ecd6559c41b@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <50357647-7478-3848-74c4-1de50851d5d0@linaro.org>
Date: Thu, 15 Jul 2021 11:32:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <65c935b8-fb36-8da7-9a27-1ecd6559c41b@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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



On 14/07/2021 18:09, Pierre-Louis Bossart wrote:
> 
> 
> 
>> +static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt,
>> +			uint32_t rsp_opcode)
>> +{
>> +	gpr_device_t *gdev = prm->gdev;
>> +	struct gpr_hdr *hdr = &pkt->hdr;
>> +	int rc;
>> +
>> +	mutex_lock(&prm->lock);
>> +	prm->result.opcode = 0;
>> +	prm->result.status = 0;
>> +
>> +	rc = gpr_send_pkt(prm->gdev, pkt);
>> +	if (rc < 0)
>> +		goto err;
>> +
>> +	if (rsp_opcode)
>> +		rc = wait_event_timeout(prm->wait,
>> +					(prm->result.opcode == hdr->opcode) ||
>> +					(prm->result.opcode == rsp_opcode),
>> +					5 * HZ);
>> +	else
>> +		rc = wait_event_timeout(prm->wait,
>> +					(prm->result.opcode == hdr->opcode),
>> +					5 * HZ);
>> +
>> +	if (!rc) {
>> +		dev_err(&gdev->dev, "CMD timeout for [%x] opcode\n",
>> +			hdr->opcode);
>> +		rc = -ETIMEDOUT;
>> +	} else if (prm->result.status > 0) {
>> +		dev_err(&gdev->dev, "DSP returned error[%x] %x\n", hdr->opcode,
>> +			prm->result.status);
>> +		rc = -EINVAL;
>> +	} else {
>> +		dev_err(&gdev->dev, "DSP returned [%x]\n",
>> +			prm->result.status);
>> +		rc = 0;
>> +	}
>> +
>> +err:
>> +	mutex_unlock(&prm->lock);
>> +	return rc;
>> +}
> 
> In patch7 you had more or less the same code. can a helper be used?

Its possible, will abstract this out in audioreach.c.


> 
> +int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph,
> +				   struct gpr_pkt *pkt, uint32_t rsp_opcode)
> +{
> +
> +	struct device *dev = graph->dev;
> +	struct gpr_hdr *hdr = &pkt->hdr;
> +	int rc;
> +
> +	mutex_lock(&graph->cmd_lock);
> +	graph->result.opcode = 0;
> +	graph->result.status = 0;
> +
> +	rc = gpr_send_port_pkt(graph->port, pkt);
> +	if (rc < 0)
> +		goto err;
> +
> +	if (rsp_opcode)
> +		rc = wait_event_timeout(graph->cmd_wait,
> +					(graph->result.opcode == hdr->opcode) ||
> +					(graph->result.opcode == rsp_opcode),
> +					5 * HZ);
> +	else
> +		rc = wait_event_timeout(graph->cmd_wait,
> +					(graph->result.opcode == hdr->opcode),
> +					5 * HZ);
> +
> +	if (!rc) {
> +		dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
> +		rc = -ETIMEDOUT;
> +	} else if (graph->result.status > 0) {
> +		dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode,
> +			graph->result.status);
> +		rc = -EINVAL;
> +	} else {
> +		dev_err(dev, "DSP returned [%x]\n", graph->result.status);
> +		rc = 0;
> +	}
> +
> +err:
> +	mutex_unlock(&graph->cmd_lock);
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
> 
> 
>> +static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id,   bool enable)
>> +{
>> +	struct prm_cmd_request_hw_core *req;
>> +	struct apm_module_param_data *param_data;
>> +	struct gpr_pkt *pkt;
>> +	struct q6prm *prm = dev_get_drvdata(dev);
>> +	gpr_device_t *gdev  = prm->gdev;
>> +	void *p;
>> +	int rc = 0;
>> +	uint32_t opcode, rsp_opcode;
>> +
>> +	if (enable) {
>> +		opcode = PRM_CMD_REQUEST_HW_RSC;
>> +		rsp_opcode = PRM_CMD_RSP_REQUEST_HW_RSC;
>> +	} else {
>> +		opcode = PRM_CMD_RELEASE_HW_RSC;
>> +		rsp_opcode = PRM_CMD_RSP_RELEASE_HW_RSC;
>> +	}
>> +
>> +	p = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id,
>> +				     GPR_PRM_MODULE_IID);
>> +	if (IS_ERR(p))
>> +		return -ENOMEM;
>> +
>> +	pkt = p;
>> +	req = p + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	param_data = &req->param_data;
>> +
>> +	param_data->module_instance_id = GPR_PRM_MODULE_IID;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_RSC_HW_CORE;
>> +	param_data->param_size = sizeof(*req) - APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	req->hw_clk_id = hw_block_id;
>> +
>> +	q6prm_send_cmd_sync(prm, pkt, rsp_opcode);
>> +
>> +	kfree(pkt);
>> +
>> +	return rc;
> 
> rc is not assigned, should this not trap the result of sending a command?
My bad! will fix such instances.


--srini
