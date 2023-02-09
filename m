Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91188690D9F
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 16:53:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47E9CDF8;
	Thu,  9 Feb 2023 16:52:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47E9CDF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675958010;
	bh=KyI39rCp+846z2cOEhHnATKQ5Ha/pf/SwmuOkoAM2cI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=R4sk1yU/qcU3FDeXTJUuzvEeQTvnjFBllWRB2bVkAE/x/hwwP9GvGMBoH5R0cGEKg
	 r7mWj6d/QZ+gA2Pehb+92Rd3fcscmvlHEWrpr6aESSi5iJwm4Is88rG1VVaRlwRUqF
	 4EwQZ5v5mUUhqOfGv5M2O9oZyAiiGpMKqdmlRFsk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBFCDF800B8;
	Thu,  9 Feb 2023 16:52:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CC90F800E4; Thu,  9 Feb 2023 16:52:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7D2FF80027
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 16:52:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7D2FF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=e7OsjVre
Received: by mail-ed1-x532.google.com with SMTP id eq11so2476523edb.6
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 07:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSxJT407mpQM/sfujjprCzUonXMB9AqQ1ZgxPyXpTX8=;
        b=e7OsjVreLGfBEhctvfV6QWAN28rVFPAKIayr3q5300W7LrhQ7p0mUxtEeAYOCybWiQ
         8ccIC/gX9lZF67TmUoLMvag3SdbrjO+JvEbPOYkqilQkRZ827jp1/e/lutfwcrF/6NBf
         aMTFj6fOjWCWgSOjHqmUZR5ZHVJRZIlBXxqC6znK2+bGpPVlw3ovaQ0talm+uAFiMrOl
         VVpPMMToXbw4jUyGeh9W3UR6jdbVwXIXHOXx9CcZIiKvLOiJSFtaL3s6Z5ir5AsCKWin
         a6sSmj5TDMCw7k23EvAgv933Zln1r9fhsiIbkd4XWa+lViadLORG3R40nqYnAdF9cPud
         /dgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSxJT407mpQM/sfujjprCzUonXMB9AqQ1ZgxPyXpTX8=;
        b=VvSHxPCATy8U3Q9Jdp7zMBspVFwaJ/h+qxR5yiD0rvsl1idsUKrdwyfuNJpUh4I2+m
         afMLwjT3VQJx0NhH48SeQlssrdtyVgdV0dOr2OcpfRRgWdh+B6vOxDvWd8It5RJ5tuZ5
         Tpffkq07m02/63iLlHGMF9V2tXpl+VBkbnDuE8sIJ3dYdm/MkrUWGUHMOD02+hgJRo/Y
         0RHfyQlx2IjKQJiqfHNRPBXn5rkgDMK0MmUWEdUtcTStEqznx1sVyxBQ+r7C31dXV0Dp
         Qp4JfiwCIBlmCR94PZ9djZeuyx4RfiXHQgCifHwx3pnuNyj3BKNpiNarKKRVXV/TT9xG
         /twQ==
X-Gm-Message-State: AO0yUKVG8L8I+85R6WjlnS+4O9oguKO1q02qJMbtaV8MFQRhG5eADMz/
	4Fo8gYaavxN+mV96zA/nfbEpnvYfC9/LXiX8
X-Google-Smtp-Source: 
 AK7set/2woOLRZfteYt602imz3nkRjsn1+ZxM/g1hTCg5gH54kR2Y08/Qdf2bSwjhsGobxnuLk2Llg==
X-Received: by 2002:a50:cd9d:0:b0:4ab:16a8:bc64 with SMTP id
 p29-20020a50cd9d000000b004ab16a8bc64mr4487385edi.24.1675957950932;
        Thu, 09 Feb 2023 07:52:30 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 b2-20020a50b402000000b004a245d70f17sm941598edh.54.2023.02.09.07.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 07:52:30 -0800 (PST)
Message-ID: <a1d79008-3ec4-d7b5-12b5-ea5c6c5a8370@linaro.org>
Date: Thu, 9 Feb 2023 15:52:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/5] soundwire: qcom: wait for fifo to be empty before
 suspend
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vkoul@kernel.org
References: <20230209131336.18252-1-srinivas.kandagatla@linaro.org>
 <20230209131336.18252-4-srinivas.kandagatla@linaro.org>
 <dbec6aab-6456-72b3-39b6-3490dfdf083c@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <dbec6aab-6456-72b3-39b6-3490dfdf083c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BOXZWYE3AZPRSRXMIY22BSH4BUAGH275
X-Message-ID-Hash: BOXZWYE3AZPRSRXMIY22BSH4BUAGH275
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, steev@kali.org, johan+linaro@kernel.org,
 quic_bjorande@quicinc.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BOXZWYE3AZPRSRXMIY22BSH4BUAGH275/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 09/02/2023 15:23, Pierre-Louis Bossart wrote:
> 
> 
> On 2/9/23 07:13, Srinivas Kandagatla wrote:
>> Wait for Fifo to be empty before going to suspend or before bank
>> switch happens. Just to make sure that all the reads/writes are done.
> 
> For the suspend case that seems like a valid approach, but for bank
> switch don't we already have a bus->msg_lock mutex that will prevent the
> bank switch command from being sent before the other commands are handled?

All read/writes are fifo based, so writes could be still pending.

--srini
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
>> index b2363839624c..465b2a2ef0d5 100644
>> --- a/drivers/soundwire/qcom.c
>> +++ b/drivers/soundwire/qcom.c
>> @@ -325,6 +325,32 @@ static int swrm_wait_for_wr_fifo_avail(struct qcom_swrm_ctrl *swrm)
>>   	return 0;
>>   }
>>   
>> +static bool swrm_wait_for_wr_fifo_done(struct qcom_swrm_ctrl *swrm)
>> +{
>> +	u32 fifo_outstanding_cmds, value;
>> +	int fifo_retry_count = SWR_OVERFLOW_RETRY_COUNT;
>> +
>> +	/* Check for fifo overflow during write */
>> +	swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
>> +	fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
>> +
>> +	if (fifo_outstanding_cmds) {
>> +		while (fifo_retry_count) {
>> +			usleep_range(500, 510);
>> +			swrm->reg_read(swrm, SWRM_CMD_FIFO_STATUS, &value);
>> +			fifo_outstanding_cmds = FIELD_GET(SWRM_WR_CMD_FIFO_CNT_MASK, value);
>> +			fifo_retry_count--;
>> +			if (fifo_outstanding_cmds == 0)
>> +				return true;
>> +		}
>> +	} else {
>> +		return true;
>> +	}
>> +
>> +
>> +	return false;
>> +}
>> +
>>   static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>>   				     u8 dev_addr, u16 reg_addr)
>>   {
>> @@ -356,6 +382,7 @@ static int qcom_swrm_cmd_fifo_wr_cmd(struct qcom_swrm_ctrl *swrm, u8 cmd_data,
>>   		usleep_range(150, 155);
>>   
>>   	if (cmd_id == SWR_BROADCAST_CMD_ID) {
>> +		swrm_wait_for_wr_fifo_done(swrm);
>>   		/*
>>   		 * sleep for 10ms for MSM soundwire variant to allow broadcast
>>   		 * command to complete.
>> @@ -1122,6 +1149,7 @@ static void qcom_swrm_shutdown(struct snd_pcm_substream *substream,
>>   {
>>   	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dai->dev);
>>   
>> +	swrm_wait_for_wr_fifo_done(ctrl);
>>   	sdw_release_stream(ctrl->sruntime[dai->id]);
>>   	ctrl->sruntime[dai->id] = NULL;
>>   	pm_runtime_mark_last_busy(ctrl->dev);
>> @@ -1558,6 +1586,7 @@ static int __maybe_unused swrm_runtime_suspend(struct device *dev)
>>   	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(dev);
>>   	int ret;
>>   
>> +	swrm_wait_for_wr_fifo_done(ctrl);
>>   	if (!ctrl->clock_stop_not_supported) {
>>   		/* Mask bus clash interrupt */
>>   		ctrl->intr_mask &= ~SWRM_INTERRUPT_STATUS_MASTER_CLASH_DET;
