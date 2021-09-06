Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D504D401E58
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 18:31:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6312C1754;
	Mon,  6 Sep 2021 18:30:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6312C1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630945887;
	bh=AMFqImDrQAd+kkcX77sy8AKnNGz0WLz21CisG1BuVRI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pRApM+ESAcvOlePhXjcPBC882PJUqriXiszi4pVbR1z4JidvEKnEM4WIVJMsALFAC
	 SlGe+CMu1cpH2ILwy7a6VqfUmuyfrBoyPe7YvT8lWTf2L03xidernJOXNVLu6h7LOb
	 DHn5DDovBmPfkS4TC5it+uWj96yRfGBjKpk7cKsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 469F5F804E3;
	Mon,  6 Sep 2021 18:29:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FFF8F804B2; Mon,  6 Sep 2021 18:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34A46F8014D
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 18:29:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34A46F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="NntqWuYB"
Received: by mail-wm1-x32c.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so5437464wmi.0
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 09:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N2F4JeB3sa1+gkHdG83OBiSEbhGCE1UpAe34oEJDfjA=;
 b=NntqWuYBClVLEomO7SUyo4BExOxqujdurX7YU4FQlh71RaTX2ZYM2SHILWGsX+EvVB
 oDfLp+xlPHta1e5lshBPCeEQ1yJYgvjbUVscmARvgkTwzAYcGeWmoqZ7N8z488fXjjj8
 tvLBaozvvZRL0V8IsctpDhiWI55PDYJ5GAjf7ZWjB2jHV0e6iHh+okVWi+wksFq46Z8S
 MRv3JinCDf/thGMXY1SnK2UjiFE2L4K2nZrXmOK2Gobl0T+CiGPji+8ewTaey+hwnTjE
 rEMFdnpwBkMHqLJlcWnYmpYpKzoQ3bQDa6FKlcyPg9rcNx4KWz6QaWOphVLR1zdZD0rF
 x7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N2F4JeB3sa1+gkHdG83OBiSEbhGCE1UpAe34oEJDfjA=;
 b=uKN7nG9+qneptbY+8kufpxFMK5R6EnFIPXDwtA9hnhIAtX2Kog8of778X3WQyyIwni
 VWof6KPP/AGa9BSWjQN2lBRW13iiP8O/6uUHFGicYVMRoOwX0oUE0WEyMdzzPDk5rDd0
 KLFcnhyWdGm6S0FHk8DJM5Nxc2ajzz5okDj/YUxY7zEgLMeuMtLWjJ8TUpUnh9AMHmP1
 QK2a/NMwnDVLRQb1MPVm4JuMicZGH3gQbgFRcoyYKWwwM/oqE8/8n6qREMSfAxVWtxCg
 0UKO1ciisLwn6Oi4YrHH0CX8rrZXA1UkdSLnods401+DFhFuvv8p2vP8HDjXhGvWrVYR
 SJZg==
X-Gm-Message-State: AOAM530DrT3WRLf6Pul1J7dosk/FzQ6YkkfALKgXyOkLXXiHQYFwfsiC
 EV74HsQynMbsaqAm+bGFmm0e7Q==
X-Google-Smtp-Source: ABdhPJxb0/l730xJ/heDliolE+E9KBIrOX7chQpvrOEZ9HAxZJK/VtNF9OOD0SG2X5NOefCeqHWgvg==
X-Received: by 2002:a1c:7503:: with SMTP id o3mr11966361wmc.129.1630945751442; 
 Mon, 06 Sep 2021 09:29:11 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l17sm8637307wrz.35.2021.09.06.09.29.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 09:29:10 -0700 (PDT)
Subject: Re: [PATCH v5 20/21] ASoC: qdsp6: audioreach: add q6prm support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-21-srinivas.kandagatla@linaro.org>
 <8a38f2f2-d74d-53c6-a4f5-669fef1f7c05@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <0e7fd3da-6cea-7b7d-6890-6bd409aa0c06@linaro.org>
Date: Mon, 6 Sep 2021 17:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8a38f2f2-d74d-53c6-a4f5-669fef1f7c05@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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


thanks Pierre for taking time to review the patches.

On 03/09/2021 16:57, Pierre-Louis Bossart wrote:
> 
>> +struct prm_cmd_request_rsc {
>> +	struct apm_module_param_data param_data;
>> +	uint32_t num_clk_id;
>> +	struct audio_hw_clk_cfg clock_ids[1];
>> +} __packed;
>> +
>> +struct prm_cmd_release_rsc {
>> +	struct apm_module_param_data param_data;
>> +	uint32_t num_clk_id;
>> +	struct audio_hw_clk_cfg clock_ids[1];
> 
> why do you need arrays of one element? I thought this was also frowned
> upon if not already deprecated?
> 
> 
These instances are fixed across the patches now.

>> +} __packed;
>> +
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
> this looks again like the same code we've seen twice already?
I remember your comments last time in the same area, Not sure why I 
missed this one. Its now fixed we have one library function for this.

> 
>> +
>> +static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)
>> +{
>> +	struct prm_cmd_request_hw_core *req;
>> +	struct apm_module_param_data *param_data;
>> +	struct gpr_pkt *pkt;
>> +	struct q6prm *prm = dev_get_drvdata(dev->parent);
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
> 
> same comment as before for the rest of this file:
> 
> pkt = audioreach_alloc_cmd_pkt(sizeof(*req), opcode, 0, gdev->svc.id,
> 				     GPR_PRM_MODULE_IID);
> kfree(pkt);
> 
> 
This is now fixed.
> 
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
>> +}
>> +
> 
