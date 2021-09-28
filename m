Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A3C41ACE2
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 12:23:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17E0916A4;
	Tue, 28 Sep 2021 12:22:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17E0916A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632824585;
	bh=S0iyvhIl0aE0fQ2y7OAZlcwzKZRNcx9P0yQFbH+nTMs=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hGnzwh3y3irtwYRyW3rk+0S81hVQbG+67QrB3zlpmDvlcOm3AWRf3pbKFdwBBouQh
	 ftokUVlelTWvJStsPGaFuBrX7/18r7tWX5bDG+xRUlnfa5Ilj8xWv7UKFXELLa9DK8
	 +dGMxGmExwQhpOwDMD67pybN6C+ovDEC8dhVB2ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59793F804BC;
	Tue, 28 Sep 2021 12:21:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E62DDF804AD; Tue, 28 Sep 2021 12:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C825F800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 12:21:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C825F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="n8hiDNLG"
Received: by mail-wm1-x32e.google.com with SMTP id v127so3027751wme.5
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P4rbKj3d/woidokjvbpPUbGWRF5RvEv/2Gj/Zmur/bI=;
 b=n8hiDNLG/+TGnrfWgbNWtgHz01Rbv76vsUlLnhJq6MfpUUVO2xl8+OjARxPRVfx3EW
 ArzChCTRAU6+jgzESeqD22n4Gobb2Inx4MufrvCbIWJTLEZOh5GFmEIBjJ3fuk3ow+h3
 28693JHfhTZViJVJodzoKPYsmz//SMZ+5yRigBpuPThM1Py/O9tzDcMpeGpMz3pd2T76
 Mq3yV/XSC26N0DOgX0ITm35PhtfTapegNfMbAchIbCxDUVgg7h/iBehQ6mAXNxkEurTu
 HnGn297T89s8mpNwXxgcO+lskslQzr987fkC5HMqD8K0rzS/8jKq4QHBtfDQRv2ufWXd
 USMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P4rbKj3d/woidokjvbpPUbGWRF5RvEv/2Gj/Zmur/bI=;
 b=Y3QeP50Aah2FJXgITSwJl5FzeUat71Er9K4Ax/1XBQoclhriyjiNiBXucm499EPljc
 ha3X+f9O4/m/Hcr8HlvO9YnfSHjF9Et7OFzJ4txB+lJeVzuDh98H43hlM1LyLaqAuapR
 VbczpPXeBJBclwXn9VVjpQXO+J+6XhkuaTrEnU2pTejIVN4iN4NiwyY2VBOZCLaW/Lo6
 irlng7zs6DjFOrVceebZzqcjThzMt8VnsOo4432ljgURe6QK8LhzDsodgonmCEG6t71/
 sQmgl8T6etpAYsValX53P6QnIJsHbMXXXlcvQjUriv+bXZAzMxjqZowtWMOuK+CPJl0Z
 Y1eg==
X-Gm-Message-State: AOAM531rL/4kznwnAMITuWiQCB3eQTjbAFJM7EtTGwoiuePFAlIza7HM
 UJztzsjWFMXYDsgeS1oynadTew==
X-Google-Smtp-Source: ABdhPJy+BvIKjHPLakTXuFs6462RKnaNRkKp7fL0GUlBTuSHpti2s5PKjkQNBn5GNz56rEL68WSkNg==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr1908531wmj.4.1632824499076; 
 Tue, 28 Sep 2021 03:21:39 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id a3sm6597588wrn.16.2021.09.28.03.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:21:38 -0700 (PDT)
Subject: Re: [PATCH v8 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-17-srinivas.kandagatla@linaro.org>
 <2be40835-e98a-ff3f-71b1-ab2dd80086c3@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <42986413-57a5-30cb-5256-84b5f4e5e004@linaro.org>
Date: Tue, 28 Sep 2021 11:21:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2be40835-e98a-ff3f-71b1-ab2dd80086c3@linux.intel.com>
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



On 27/09/2021 17:16, Pierre-Louis Bossart wrote:
> 
>> +static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
>> +					     struct audioreach_module *module,
>> +					     struct audioreach_module_config *mcfg)
>> +{
>> +	uint32_t num_channels = mcfg->num_channels;
>> +	struct apm_module_param_data *param_data;
>> +	struct payload_media_fmt_pcm *cfg;
>> +	struct media_format *header;
>> +	int rc, payload_size;
>> +	struct gpr_pkt *pkt;
>> +	void *p;
>> +
>> +	if (num_channels > 2) {
>> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
>> +		return -EINVAL;
>> +	}
> 
> so here mcfg->num_channels > 2 is flagged as an error, but ...
> 
>> +
>> +	payload_size = APM_SHMEM_FMT_CFG_PSIZE(num_channels) + APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	pkt = audioreach_alloc_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0,
>> +				     graph->port->id, module->instance_id);
>> +	if (IS_ERR(pkt))
>> +		return PTR_ERR(pkt);
>> +
>> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
>> +
>> +	param_data = p;
>> +	param_data->module_instance_id = module->instance_id;
>> +	param_data->error_code = 0;
>> +	param_data->param_id = PARAM_ID_MEDIA_FORMAT;
>> +	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
>> +	p = p + APM_MODULE_PARAM_DATA_SIZE;
>> +
>> +	header = p;
>> +	header->data_format = DATA_FORMAT_FIXED_POINT;
>> +	header->fmt_id = MEDIA_FMT_ID_PCM;
>> +	header->payload_size = payload_size - sizeof(*header);
>> +
>> +	p = p + sizeof(*header);
>> +	cfg = p;
>> +	cfg->sample_rate = mcfg->sample_rate;
>> +	cfg->bit_width = mcfg->bit_width;
>> +	cfg->alignment = PCM_LSB_ALIGNED;
>> +	cfg->bits_per_sample = mcfg->bit_width;
>> +	cfg->q_factor = mcfg->bit_width - 1;
>> +	cfg->endianness = PCM_LITTLE_ENDIAN;
>> +	cfg->num_channels = mcfg->num_channels;
>> +
>> +	if (mcfg->num_channels == 1) {
>> +		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
>> +	} else if (num_channels == 2) {
>> +		cfg->channel_mapping[0] =  PCM_CHANNEL_L;
>> +		cfg->channel_mapping[1] =  PCM_CHANNEL_R;
>> +	} else {
>> +		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
>> +		rc = -EINVAL;
>> +		goto err;
> 
> ... this is again the case where mcfg->num_channels > 2 so this block is
> never executed.

I agree this else is dead code, will remove this.

--srini
> 
>> +	}
>> +
>> +	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
>> +err:
>> +	kfree(pkt);
>> +
>> +	return rc;
>> +}
>> +
