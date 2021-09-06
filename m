Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F9E401E55
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Sep 2021 18:30:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D39301745;
	Mon,  6 Sep 2021 18:29:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D39301745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630945843;
	bh=rfmOD17+phnYb9NxK7UsKn8KmEM8cKnTZaPlWKzbU9U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tUSzYNy0CtMBXBJ+QJEJA/006T2wi630lV1IN20ufGRFy3kJuKzGbDMAbXB9rgwjv
	 to9TLEk6VkNBk28hMMZMjX2cyRBpAtd05USGq1Khk18iNdjazFNiRg/0M3VsfFbB9u
	 MPfkHbn/zWa1FV3INiiCRpwNFSd9xv01HnUkrWJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94AAEF804A9;
	Mon,  6 Sep 2021 18:29:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F900F802E7; Mon,  6 Sep 2021 18:29:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F5FF800B5
 for <alsa-devel@alsa-project.org>; Mon,  6 Sep 2021 18:28:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F5FF800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Uqu3Z2vi"
Received: by mail-wm1-x331.google.com with SMTP id
 k5-20020a05600c1c8500b002f76c42214bso5387995wms.3
 for <alsa-devel@alsa-project.org>; Mon, 06 Sep 2021 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=S5ouu0sCwAAb7QGWEvTGp15oiRUoB6xbxVGPJ+dRjKo=;
 b=Uqu3Z2vilSG56DjF9a/lgrx6Scc/x0nG9WaT3A8qWMGaikGhfd8LpeAcMwZy7KcK8H
 GUMw5LSLyDqz70Yt1oz6ICXqjjPOHgEhchmoOKLZ9JnOSE+Bs5v2icfTb5qvhMmZ8dCu
 ELnJUfk6onODISF05iMm3Swd6F9OZZUjh2W5f73QiOCblCwFHsKviZNJfhxq5QIzsxm1
 znH5eqCMiqjJaVWHmMSkpK8vDTe682U+PRu26/EB4ph74sA9DDZSxrQTkeE6cKt6xofc
 b50GTn5NCBsg0REurmr6wKRssrn0kBz3mZXStZTpogGFyZQwnnJRMzzjWkMETrftYej+
 xmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=S5ouu0sCwAAb7QGWEvTGp15oiRUoB6xbxVGPJ+dRjKo=;
 b=m47wm7WNfvPHsWZjbwzk3SoLH3wMacYocy/rYAm1WT8smkDm1qutkz07MfGZHN7rWv
 WdWexBSkBUGML71Igt2N4p2qh73bV+uXWsW89qpfaJ98WOO+HTj35MklhoM9u6n24FEp
 xDWWbzMBwJxPXIxghfVBcQBHq8UkRGSSwxWSyIuIYSVJdnwrLxJHPOV/s0/BUJD8/LU2
 R5URRXlAxMNkr/xm+bdmIduz+LkaEioEo3wo9fRtWYvYph1Ec883Yu7hGSoXa8GtOyO3
 r3gStea8wsZrC7XQjex+68034+aZAbGyqVN7xD4SdKAq81R2RodEAKnlexWya5K7KJfh
 Z2EQ==
X-Gm-Message-State: AOAM5336jflGAVmA9DBOHK5A+9MuhHft86X43paAW6PwjPaF+5OUjBIp
 pcvNBui4Tgic4K1AAcZQBDikTA==
X-Google-Smtp-Source: ABdhPJxZSxxGxoOQyouG73qLYaGMeiQxaddUTktzM1YhoSHnKghMaez+80wb+6lKzEGZ5ytcSMXHnw==
X-Received: by 2002:a05:600c:1d05:: with SMTP id
 l5mr12173070wms.139.1630945731569; 
 Mon, 06 Sep 2021 09:28:51 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id l17sm8636503wrz.35.2021.09.06.09.28.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 09:28:51 -0700 (PDT)
Subject: Re: [PATCH v5 14/21] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210903112032.25834-1-srinivas.kandagatla@linaro.org>
 <20210903112032.25834-15-srinivas.kandagatla@linaro.org>
 <ddb4f36b-8a43-d1e9-0429-78d8eefc9474@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8de8d53d-87f7-f35d-d7d2-76b3aa4d396a@linaro.org>
Date: Mon, 6 Sep 2021 17:28:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ddb4f36b-8a43-d1e9-0429-78d8eefc9474@linux.intel.com>
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

Thanks Pierre for taking time to review the patches.

On 03/09/2021 15:23, Pierre-Louis Bossart wrote:
> 
> 
> 
>> +struct apm_sub_graph_params  {
>> +	struct apm_module_param_data param_data;
>> +	uint32_t num_sub_graphs;
>> +	struct apm_sub_graph_data sg_cfg[0];
> 
> I thought the use of zero-length arrays [0] was deprecated in favor of
> flexible arrays []?
Thanks for the hints, I will fix such instances, typos and along with 
missing new lines before sending out next version.

> 
>> +} __packed;
>> +
...
>> +struct audioreach_module {
>> +	uint32_t module_id;
>> +	uint32_t instance_id;
>> +
>> +	uint32_t max_ip_port;
>> +	uint32_t max_op_port;
>> +
>> +	uint32_t in_port;
>> +	uint32_t out_port;
>> +
>> +	/* Connections */
>> +	uint32_t src_mod_inst_id;
>> +	uint32_t src_mod_op_port_id;
>> +	uint32_t dst_mod_inst_id;
>> +	uint32_t dst_mod_ip_port_id;
>> +
>> +	/* Format specifics */
>> +	uint32_t ch_fmt;
>> +	uint32_t rate;
>> +	uint32_t bit_depth;
>> +
>> +	/* I2S module */
>> +	uint32_t hw_interface_idx;
>> +	uint32_t sd_line_idx;
>> +	uint32_t ws_src;
>> +	uint32_t frame_size_factor;
>> +	uint32_t data_format;
>> +	uint32_t hw_interface_type;
>> +
>> +	/* PCM module specific */
>> +	uint32_t interleave_type;
>> +
>> +	/* GAIN/Vol Control Module */
>> +	uint16_t gain;
> 
> newline for consistency?
>> +	/* Logging */
>> +	uint32_t log_code;
>> +	uint32_t log_tap_point_id;
>> +	uint32_t mode;
> 
> probably not related to logging, comment missing?


This is actually a log mode to to indicate whether to log immediately 
(1) or wait until log buffer is completely filled (0)

I will rename this to log_mode in next version and also add an extra new 
line to split some member used for book keeping.

> 
>> +	struct list_head node;
>> +	struct audioreach_container *container;
>> +	struct snd_soc_dapm_widget *widget;
>> +};
>> +

--srini
