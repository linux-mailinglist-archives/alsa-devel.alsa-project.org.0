Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C341ACAE
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 12:12:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A910416A4;
	Tue, 28 Sep 2021 12:11:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A910416A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632823919;
	bh=5sUK/BSx+0lOxSP7nkVpy7HxvS50rq/hp1dlDO8WcAU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o+7jCwdnaHuLlQL2zZUcEJGoW858WTNgyuzRUNAGZ+PHBRgNyOSuc35tLvhPBheWO
	 GqSuJQVuLXs1XSD9Lbxi74l6d3WAINJyAWr7riHsAEJo2FLtkQRNf9tP/Nb1Gi06Xj
	 wWcw0gtQWeQg52Glw+ga8reZqcvF0gQiugUcBxHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0F49F804BC;
	Tue, 28 Sep 2021 12:10:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 436C4F804AD; Tue, 28 Sep 2021 12:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8707BF80105
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 12:10:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8707BF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="CY+3n/Oo"
Received: by mail-wr1-x42a.google.com with SMTP id s21so17006251wra.7
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 03:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VRYyjAJqzt+oGd/XIZ5uVDcZC/sKLm2kGO/Eia5PR48=;
 b=CY+3n/OoUgJ33VHpMXzl38AWXNiKoEOa6EbAeHPbPKGTdKHJ6sz9MajJRffs3mAHV+
 jFJv79HSJrF1BR4M78ECqWsT/h98n9SxGGQbdxSts7ENFy1MUVXa84jPbYW4ju6hcgfg
 IkCJHNH+Iz3TXVzIxlobhrNy16mRxiYgiKDtex1rPkWZyNd1SF0pyV2sBa33auOsgLfk
 DuAP+Ie0DR7qthOh1WmdNU/DSQl0f3/zd1CBhpupRPYj5cYfy1XqUOFwPLjBHXe0qzrR
 36NgS/xo3vGI5bnx3xIxnsxqUrZ50PeS3JVnSf+koXbu61JWFeLEtqgYOsnD9iYgjr+0
 ms0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VRYyjAJqzt+oGd/XIZ5uVDcZC/sKLm2kGO/Eia5PR48=;
 b=eTsp7DfdtINAV2LQO8yMrsv2n99yIWHyfZygFRvwFm3Y6J9qpkxBZpprLNi1Oaz+YI
 64Pn/TK1taxQvfb/ZEjMXhSve4vizw2bzFd9GewmYbe4Vi7/bAXoi2ipCqJ02t8lES89
 zUlkUjnaUBcF3jbqk2moXekahJyxcSTRl4OZqwOs7m1JSYy+1XbsSFy5HD4hjzFusYvL
 RZ4ijbwg6sGLpxGqi/F3QlihKU5QY+PFpOT4xdCeroNKh3CrhYO/OtXLGxynwhr4Tl1V
 hwT/meVveWZc4uvRempUX1i8uUerRPQ+8RmA/qyebdcJwUllFdhkORnymomQJCNlyghs
 yFVQ==
X-Gm-Message-State: AOAM533J0Pp/L6BFLUzbgxr6Ye47TUV7us6RGOF6RU3KSyPg5FsKLoGk
 p8/jo13EQDqHIuBx4/skhnQSrg==
X-Google-Smtp-Source: ABdhPJz/u8z6imIBMwGvamngpy6HMxJyniXUvL/1f3PWBZNUlRmeNIQhJH5pU11SAugxMcVvjzTpxA==
X-Received: by 2002:adf:ee4d:: with SMTP id w13mr5088754wro.223.1632823834677; 
 Tue, 28 Sep 2021 03:10:34 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id o5sm7932803wrf.85.2021.09.28.03.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 03:10:34 -0700 (PDT)
Subject: Re: [PATCH v8 14/22] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-15-srinivas.kandagatla@linaro.org>
 <ebfe1e31-778d-852a-20bf-ac8fe860dcc2@linux.intel.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <d96a7337-c594-c64a-46f9-73d7d6ad77b7@linaro.org>
Date: Tue, 28 Sep 2021 11:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ebfe1e31-778d-852a-20bf-ac8fe860dcc2@linux.intel.com>
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



On 27/09/2021 17:08, Pierre-Louis Bossart wrote:
> 
> 
>> +struct apm_sub_graph_params  {
>> +	struct apm_module_param_data param_data;
>> +	uint32_t num_sub_graphs;
>> +	struct apm_sub_graph_data sg_cfg[];
>> +} __packed;
> 
> The style you use is num_foobar and later foobar[]
> 
>> +/* container config */
>> +struct apm_container_obj  {
>> +	struct apm_container_cfg container_cfg;
>> +	/* Capability ID list */
>> +	struct apm_prop_data cap_data;
>> +	uint32_t num_capability_id;
>> +	uint32_t capability_id;
> 
> but here you have both a num_capability_id and capability_id
> 
> It's not very clear what they mean, or if there is a dependency?

DSP supports multiple capabilities for a container, however for now this 
version of patches only support 1 capability for a container.

I will add multiple capabilities once am in a position to test it.

> 
>> +	/* Container graph Position */
>> +	struct apm_prop_data pos_data;
>> +	struct apm_cont_prop_id_graph_pos pos;
>> +
>> +	/* Container Stack size */
>> +	struct apm_prop_data stack_data;
>> +	struct apm_cont_prop_id_stack_size stack;
>> +
>> +	/* Container proc domain id */
>> +	struct apm_prop_data domain_data;
>> +	struct apm_cont_prop_id_domain domain;
>> +} __packed;
> 
>> +/* Module IDs */
>> +#define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
>> +#define MODULE_ID_RD_SHARED_MEM_EP	0x07001001
>> +#define MODULE_ID_GAIN			0x07001002
>> +#define MODULE_ID_PCM_CNV		0x07001003
>> +#define MODULE_ID_PCM_ENC		0x07001004
>> +#define MODULE_ID_PCM_DEC		0x07001005
>> +#define MODULE_ID_CODEC_DMA_SINK	0x07001023
>> +#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
>> +#define MODULE_ID_I2S_SINK		0x0700100A
>> +#define MODULE_ID_I2S_SOURCE		0x0700100b
>> +#define MODULE_ID_DATA_LOGGING		0x0700101A
>> +
>> +#define APM_CMD_GET_SPF_STATE		0x01001021
>> +#define APM_CMD_RSP_GET_SPF_STATE	0x02001007
>> +
>> +#define APM_MODULE_INSTANCE_ID		0x00000001
>> +#define PRM_MODULE_INSTANCE_ID		0x00000002
>> +#define AMDB_MODULE_INSTANCE_ID		0x00000003
>> +#define VCPM_MODULE_INSTANCE_ID		0x00000004
>> +#define AR_MODULE_INSTANCE_ID_START	0x00006000
>> +#define AR_MODULE_INSTANCE_ID_END	0x00007000
>> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_START	0x00007000
>> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_END	0x00008000
>> +#define AR_CONT_INSTANCE_ID_START	0x00005000
>> +#define AR_CONT_INSTANCE_ID_END		0x00006000
>> +#define AR_SG_INSTANCE_ID_START		0x00004000
>> +
>> +#define APM_CMD_GRAPH_OPEN			0x01001000
>> +#define APM_CMD_GRAPH_PREPARE			0x01001001
>> +#define APM_CMD_GRAPH_START			0x01001002
>> +#define APM_CMD_GRAPH_STOP			0x01001003
>> +#define APM_CMD_GRAPH_CLOSE			0x01001004
>> +#define APM_CMD_GRAPH_FLUSH			0x01001005
>> +#define APM_CMD_SET_CFG				0x01001006
>> +#define APM_CMD_GET_CFG				0x01001007
>> +#define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100c
>> +#define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100d
>> +#define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
>> +#define APM_CMD_RSP_GET_CFG			0x02001000
>> +#define APM_CMD_CLOSE_ALL			0x01001013
>> +#define APM_CMD_REGISTER_SHARED_CFG		0x0100100A
> 
>> +/* APM module */
>> +#define APM_PARAM_ID_SUB_GRAPH_LIST		0x08001005
>> +
>> +#define APM_PARAM_ID_MODULE_LIST		0x08001002
> 
>> +#define APM_PARAM_ID_MODULE_PROP		0x08001003
> 
> It seems like those definition follow a pattern, e.g. bits 28..32 a type
> and bits 0..15 a token?
Yes, it does have a pattern, each Opcode is divided in to 3 fields.

GUID OWNER 31:28
GUID Type 27:24
MAIN GUID 23:0

--srini


> 
> 
>>
