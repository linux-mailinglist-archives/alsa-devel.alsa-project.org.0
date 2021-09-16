Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95940DD87
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 17:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 040CC18AE;
	Thu, 16 Sep 2021 17:03:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 040CC18AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631804689;
	bh=Qw0VRbUA+3VNn61jMazHEj7pCN1v3vvvw0oK5tna398=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hMwgWgZk3QD9GuiRhvi6cNWWu9unFIlgOsMlbirR/+Mhu31eBOTsAjbZoOISHVd2q
	 i6JxnoGLJbkT6legLh7H7ow2rV01kb2jWV/S3/pi/jcs0kv4YF2DkBNlItlP+MU7jV
	 V0Ikjf9asl54TwGLIRGFMdToCD2jnADJWTlGFqfI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8E6A6F804EC;
	Thu, 16 Sep 2021 17:02:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0184AF804E4; Thu, 16 Sep 2021 17:02:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53225F804E4
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 17:02:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53225F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="deewXA8/"
Received: by mail-wr1-x436.google.com with SMTP id w17so1851394wrv.10
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZjJ0xClmqjo+gTIddy26W01R4VzloCVoaZoUYIC3Lp4=;
 b=deewXA8/pg6ilkcnc2ZuFqW+Ug3T39c9cL8co760X8Dt8n9vjqspGIvwMsOUAwnra8
 xVyTkdIPwwlOpVshd0ql6TQvjqyxAyBKgJZKJJP1AVvrgfnF+DIxlLoPHkIoAcOHpdLI
 qB00IvnZtiAC39veO4CHtxw9/9u0hfQmtbvT++4q89DOjcjewBm5wAz1RxD75McOntAc
 wtce4RDSf3Jfzv8tsm2Vv5og9/ZTayiFTpwzd1YsCGnt8q+AmjQWOpAFz8PNXfJl1kcd
 e4d9nHDP1RPAvqImxRxWrrZwwgm+3H5uLlKbNUH9jVUgE10ClacvM05hI1SzDSowZw2W
 C9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZjJ0xClmqjo+gTIddy26W01R4VzloCVoaZoUYIC3Lp4=;
 b=794hM6Y2DRL2Ws70Cf1LJ6Rwh/HBRtrFy1YaE4/dSpnY65b0B/oyOmmDq+iUGCuTOs
 i8E/G8/alX1T/6C1kuKu1shg47Vaw1SBhfU29JciUaUkzhUK9RXepl+f3t4dXO8QgKJu
 TkGMgJZPkC7qPyZv6pGpoLlYx6vOHHVK8b+eoSKEyz/DQ45VNAMaawkxr7bjWFx3VPHz
 LbQvPpJi+VKvNFh9y3TUKLMsqezIu6Ca4vweE1GRvl+7AfXlY9YeoBDDzG71+jwK6ga1
 9lmVhZttX3rw6zE+fMyifrVPpLkytx6XF1uetfBw51vrPDiCduw21bUm0Dw8C4CkF+Wn
 Gf7A==
X-Gm-Message-State: AOAM532IWZuWzMTFeTYZLy2H7KnosqJI/9qb5t3L28yLi2yQZT/HCHrk
 CuyDkkQ7TqwHZJ2bBHcjAUx7hQ==
X-Google-Smtp-Source: ABdhPJzVwyp2uNEXD/zDcQ//GhQNtYuBAQxM5In2OAZtb8Hm0X7q7RDIzeRdcvaP+tzu6a4H60MP+A==
X-Received: by 2002:adf:c7d1:: with SMTP id y17mr6535042wrg.214.1631804546633; 
 Thu, 16 Sep 2021 08:02:26 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o1sm3712718wru.91.2021.09.16.08.02.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:02:26 -0700 (PDT)
Subject: Re: [PATCH v6 16/22] ASoC: qdsp6: audioreach: add module
 configuration command helpers
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210915131333.19047-1-srinivas.kandagatla@linaro.org>
 <20210915131333.19047-17-srinivas.kandagatla@linaro.org>
 <4cd0e63f-107b-d10a-11e9-bced83f487a5@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <00472b83-f02d-70cc-7c6e-cf414dc17754@linaro.org>
Date: Thu, 16 Sep 2021 16:02:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <4cd0e63f-107b-d10a-11e9-bced83f487a5@linux.intel.com>
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

Thanks Pierre,

On 15/09/2021 17:11, Pierre-Louis Bossart wrote:
> 
>> +int q6apm_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, phys_addr_t phys,
>> +			     size_t period_sz, unsigned int periods)
>> +{
>> +	struct audioreach_graph_data *data;
>> +	struct audio_buffer *buf;
>> +	int cnt;
>> +	int rc;
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		data = &graph->rx_data;
>> +	else
>> +		data = &graph->tx_data;
>> +
>> +	mutex_lock(&graph->lock);
>> +
>> +	if (data->buf) {
>> +		dev_err(graph->dev, "Buffer already allocated\n");
>> +		mutex_unlock(&graph->lock);
>> +		return 0;
> 
> is this an error worth of dev_err() if you return 0?
No, its removed now.

> 
>> +	}
>> +
>> +	buf = kzalloc(((sizeof(struct audio_buffer)) * periods), GFP_KERNEL);
>> +	if (!buf) {
>> +		mutex_unlock(&graph->lock);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
>> +		data = &graph->rx_data;
>> +	else
>> +		data = &graph->tx_data;
>> +
>> +	data->buf = buf;
>> +
>> +	buf[0].phys = phys;
>> +	buf[0].size = period_sz;
>> +
>> +	for (cnt = 1; cnt < periods; cnt++) {
>> +		if (period_sz > 0) {
>> +			buf[cnt].phys = buf[0].phys + (cnt * period_sz);
>> +			buf[cnt].size = period_sz;
>> +		}
>> +	}
>> +	data->num_periods = periods;
>> +
>> +	mutex_unlock(&graph->lock);
>> +
>> +	rc = audioreach_map_memory_regions(graph, dir, period_sz, periods, 1);
>> +	if (rc < 0) {
>> +		dev_err(graph->dev, "Memory_map_regions failed\n");
>> +		audioreach_graph_free_buf(graph);
>> +	}
>> +
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_map_memory_regions);
> 
>> +int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
>> +		      uint32_t lsw_ts, uint32_t wflags)
>> +{
>> +	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write;
>> +	int rc, payload_size, iid;
>> +	struct audio_buffer *ab;
>> +	struct gpr_pkt *pkt;
>> +
>> +	payload_size = sizeof(*write);
> 
> nit-pick on variable-naming: I get confused between actions and objects.

this is payload_size for the command packet.

> 
>> +
>> +	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
>> +	pkt = audioreach_alloc_pkt(payload_size, DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
>> +				 graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
>> +				 graph->port->id, iid);
>> +	if (IS_ERR(pkt))
>> +		return -ENOMEM;
>> +
>> +	write = (void *)pkt + GPR_HDR_SIZE;
>> +
>> +	mutex_lock(&graph->lock);
>> +	ab = &graph->rx_data.buf[graph->rx_data.dsp_buf];
>> +
>> +	write->buf_addr_lsw = lower_32_bits(ab->phys);
>> +	write->buf_addr_msw = upper_32_bits(ab->phys);
>> +	write->buf_size = len;
>> +	write->timestamp_lsw = lsw_ts;
>> +	write->timestamp_msw = msw_ts;
>> +	write->mem_map_handle = graph->rx_data.mem_map_handle;
>> +	write->flags = wflags;
>> +
>> +	graph->rx_data.dsp_buf++;
>> +
>> +	if (graph->rx_data.dsp_buf >= graph->rx_data.num_periods)
>> +		graph->rx_data.dsp_buf = 0;
>> +
>> +	mutex_unlock(&graph->lock);
>> +
>> +	rc = gpr_send_port_pkt(graph->port, pkt);
>> +
>> +	kfree(pkt);
>> +
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_write_async);
>> +
>> +int q6apm_read(struct q6apm_graph *graph)
>> +{
>> +	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read;
>> +	struct audioreach_graph_data *port;
>> +	struct audio_buffer *ab;
>> +	struct gpr_pkt *pkt;
>> +	int rc, iid;
>> +
>> +	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
>> +	pkt = audioreach_alloc_pkt(sizeof(*read), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
>> +				 graph->tx_data.dsp_buf, graph->port->id, iid);
>> +	if (IS_ERR(pkt))
>> +		return -ENOMEM;
>> +
>> +	read = (void *)pkt + GPR_HDR_SIZE;
> 
> same nit-pick on variable naming, with the additional present/past
> grammar issue that you don't know if it's a read buffer or a pointer to
> data read in the past.
> 

do you think adding "_cmd" suffix like read_cmd would make more sense?

--srini


>> +
>> +	mutex_lock(&graph->lock);
>> +	port = &graph->tx_data;
>> +	ab = &port->buf[port->dsp_buf];
>> +
>> +	read->buf_addr_lsw = lower_32_bits(ab->phys);
>> +	read->buf_addr_msw = upper_32_bits(ab->phys);
>> +	read->mem_map_handle = port->mem_map_handle;
>> +	read->buf_size = ab->size;
>> +
>> +	port->dsp_buf++;
>> +
>> +	if (port->dsp_buf >= port->num_periods)
>> +		port->dsp_buf = 0;
>> +
>> +	mutex_unlock(&graph->lock);
>> +
>> +	rc = gpr_send_port_pkt(graph->port, pkt);
>> +	kfree(pkt);
>> +
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(q6apm_read);
>> +
>>   static int graph_callback(struct gpr_resp_pkt *data, void *priv, int op)
>>   {
>>   	struct data_cmd_rsp_rd_sh_mem_ep_data_buffer_done_v2 *rd_done;
>>
