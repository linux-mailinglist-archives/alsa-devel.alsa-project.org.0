Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F31419F8D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 21:54:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BA0316A9;
	Mon, 27 Sep 2021 21:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BA0316A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632772461;
	bh=UgPJeLu7Sv0ydEAuBoxqi6lB3I4TaqHyYsavd/hQhAY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CW6hkOpHf2V9ndrc7XzUDIwVKOGHOAOZ7cY7cMc7K228pHfM/dLGKji9H68/g1yTU
	 8y31smh0cqtoXowsiwZ4/zZ8hvsxSdBKMpInWcrgYWvZ04Fxy6Dk5v23AZYs3PpDci
	 MU0UJSO8LqgEX9SVpiNWYOa046jqaq9k9EegVOS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C9D1F802C4;
	Mon, 27 Sep 2021 21:53:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DF50F80147; Mon, 27 Sep 2021 21:53:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C416EF80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 21:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C416EF80147
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="288212681"
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="288212681"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,327,1624345200"; d="scan'208";a="486267985"
Received: from asen4-mobl2.amr.corp.intel.com (HELO [10.212.27.2])
 ([10.212.27.2])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2021 12:52:44 -0700
Subject: Re: [PATCH v8 14/22] ASoC: qdsp6: audioreach: add basic pkt alloc
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-15-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ebfe1e31-778d-852a-20bf-ac8fe860dcc2@linux.intel.com>
Date: Mon, 27 Sep 2021 11:08:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-15-srinivas.kandagatla@linaro.org>
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



> +struct apm_sub_graph_params  {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_sub_graphs;
> +	struct apm_sub_graph_data sg_cfg[];
> +} __packed;

The style you use is num_foobar and later foobar[]

> +/* container config */
> +struct apm_container_obj  {
> +	struct apm_container_cfg container_cfg;
> +	/* Capability ID list */
> +	struct apm_prop_data cap_data;
> +	uint32_t num_capability_id;
> +	uint32_t capability_id;

but here you have both a num_capability_id and capability_id

It's not very clear what they mean, or if there is a dependency?

> +	/* Container graph Position */
> +	struct apm_prop_data pos_data;
> +	struct apm_cont_prop_id_graph_pos pos;
> +
> +	/* Container Stack size */
> +	struct apm_prop_data stack_data;
> +	struct apm_cont_prop_id_stack_size stack;
> +
> +	/* Container proc domain id */
> +	struct apm_prop_data domain_data;
> +	struct apm_cont_prop_id_domain domain;
> +} __packed;

> +/* Module IDs */
> +#define MODULE_ID_WR_SHARED_MEM_EP	0x07001000
> +#define MODULE_ID_RD_SHARED_MEM_EP	0x07001001
> +#define MODULE_ID_GAIN			0x07001002
> +#define MODULE_ID_PCM_CNV		0x07001003
> +#define MODULE_ID_PCM_ENC		0x07001004
> +#define MODULE_ID_PCM_DEC		0x07001005
> +#define MODULE_ID_CODEC_DMA_SINK	0x07001023
> +#define MODULE_ID_CODEC_DMA_SOURCE	0x07001024
> +#define MODULE_ID_I2S_SINK		0x0700100A
> +#define MODULE_ID_I2S_SOURCE		0x0700100b
> +#define MODULE_ID_DATA_LOGGING		0x0700101A
> +
> +#define APM_CMD_GET_SPF_STATE		0x01001021
> +#define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> +
> +#define APM_MODULE_INSTANCE_ID		0x00000001
> +#define PRM_MODULE_INSTANCE_ID		0x00000002
> +#define AMDB_MODULE_INSTANCE_ID		0x00000003
> +#define VCPM_MODULE_INSTANCE_ID		0x00000004
> +#define AR_MODULE_INSTANCE_ID_START	0x00006000
> +#define AR_MODULE_INSTANCE_ID_END	0x00007000
> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_START	0x00007000
> +#define AR_MODULE_DYNAMIC_INSTANCE_ID_END	0x00008000
> +#define AR_CONT_INSTANCE_ID_START	0x00005000
> +#define AR_CONT_INSTANCE_ID_END		0x00006000
> +#define AR_SG_INSTANCE_ID_START		0x00004000
> +
> +#define APM_CMD_GRAPH_OPEN			0x01001000
> +#define APM_CMD_GRAPH_PREPARE			0x01001001
> +#define APM_CMD_GRAPH_START			0x01001002
> +#define APM_CMD_GRAPH_STOP			0x01001003
> +#define APM_CMD_GRAPH_CLOSE			0x01001004
> +#define APM_CMD_GRAPH_FLUSH			0x01001005
> +#define APM_CMD_SET_CFG				0x01001006
> +#define APM_CMD_GET_CFG				0x01001007
> +#define APM_CMD_SHARED_MEM_MAP_REGIONS		0x0100100c
> +#define APM_CMD_SHARED_MEM_UNMAP_REGIONS	0x0100100d
> +#define APM_CMD_RSP_SHARED_MEM_MAP_REGIONS	0x02001001
> +#define APM_CMD_RSP_GET_CFG			0x02001000
> +#define APM_CMD_CLOSE_ALL			0x01001013
> +#define APM_CMD_REGISTER_SHARED_CFG		0x0100100A

> +/* APM module */
> +#define APM_PARAM_ID_SUB_GRAPH_LIST		0x08001005
> +
> +#define APM_PARAM_ID_MODULE_LIST		0x08001002

> +#define APM_PARAM_ID_MODULE_PROP		0x08001003

It seems like those definition follow a pattern, e.g. bits 28..32 a type
and bits 0..15 a token?


> 
