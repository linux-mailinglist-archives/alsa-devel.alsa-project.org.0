Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C68541AA8C
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 10:24:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D643D16BC;
	Tue, 28 Sep 2021 10:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D643D16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632817480;
	bh=Je5gC2PX/3+jsg89/HgJgcRdnkj7W8zZVek0HX3wzDw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MA9ydmFQKASU25BqebkzlNjoql5f3MKyelE73oWtlwzXDVwbJWfr7YwUF3eBilA+/
	 1hYp1NoTLo9xI3XwpdOUgKiNzaL9bRvRcHRlnnHZmFqlvPJUEAww0Qe/L0U4uqEol4
	 3m6jIBRu794uqCKfkb5ntOuny+HG7lozghZVnlZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42B11F80161;
	Tue, 28 Sep 2021 10:23:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E485DF804D1; Tue, 28 Sep 2021 10:23:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CC4F804E1
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 10:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CC4F804E1
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="222754939"
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="222754939"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:23:34 -0700
X-IronPort-AV: E=Sophos;i="5.85,329,1624345200"; d="scan'208";a="561974715"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.12.65])
 ([10.237.12.65])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 01:23:32 -0700
Subject: Re: [PATCH v8 15/22] ASoC: qdsp6: audioreach: add q6apm support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210927135559.738-1-srinivas.kandagatla@linaro.org>
 <20210927135559.738-16-srinivas.kandagatla@linaro.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Message-ID: <f5cad020-9d36-d700-df14-95e72a8357fd@linux.intel.com>
Date: Tue, 28 Sep 2021 10:23:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210927135559.738-16-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, tiwai@suse.de, plai@codeaurora.org,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com
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

On 9/27/2021 3:55 PM, Srinivas Kandagatla wrote:
> Add support to q6apm (Audio Process Manager) component which is
> core Audioreach service running in the DSP.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---

(...)

> +++ b/sound/soc/qcom/qdsp6/q6apm.c
> @@ -0,0 +1,597 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2020, Linaro Limited
> +
> +#include <dt-bindings/soc/qcom,gpr.h>
> +#include <linux/delay.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/apr.h>
> +#include <linux/wait.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <sound/pcm.h>
> +#include "audioreach.h"
> +#include "q6apm.h"
> +
> +/* Graph Management */
> +struct apm_graph_mgmt_cmd {
> +	struct apm_module_param_data param_data;
> +	uint32_t num_sub_graphs;
> +	uint32_t sub_graph_id_list[];
> +} __packed;
> +
> +#define APM_GRAPH_MGMT_PSIZE(n) ALIGN(sizeof(struct apm_graph_mgmt_cmd) + \
> +				      n * sizeof(uint32_t), 8)

Possible struct_size again

> +
> +int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,	uint32_t rsp_opcode)

There seems to be 'tab' in argument list?

> +{
> +	gpr_device_t *gdev = apm->gdev;
> +
> +	return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
> +					NULL, &apm->wait, pkt, rsp_opcode);
> +}
> +

(...)
