Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A39476083AF
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Oct 2022 04:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FD9D93BB;
	Sat, 22 Oct 2022 04:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FD9D93BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666406537;
	bh=kF/xdr28uQrpRA72AFf0G6ObdUEgtJJsF4mCHOi/eWk=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HVGJ9KhQN5rZJrHaNOdmMwElo7KQPvw65f60coJnKuXmZ8FADvEcE4g4PCDLa9yb0
	 MYBTNjnSds3yTDaDsN20rk93CZ2T/S4FhncxD6+yCR017lQGSR6Lh5CuQ/YxWjDMtN
	 99SFaT9z+tKD07vsfuxT50/v1DQcHwEK/j4B2FtA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79F2CF804B0;
	Sat, 22 Oct 2022 04:41:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CED6F80301; Sat, 22 Oct 2022 04:40:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE102F8013D
 for <alsa-devel@alsa-project.org>; Sat, 22 Oct 2022 04:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE102F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="S4QVWPxf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666406454; x=1697942454;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kF/xdr28uQrpRA72AFf0G6ObdUEgtJJsF4mCHOi/eWk=;
 b=S4QVWPxfZmeG3FwzQqQj/nmbvQmFzYULGYAlaxbPpjMI3Ybo+DmpC0/M
 S7gW0hdOnA/c0nb/QMpBRpdVnYGkEbWBKzzYAiaRXDQEM/WSO9nrb5p4k
 KllOyL0uw866aKvlIbeG38jZTMRPao+I+IoUXrl70JAQnoBuwm+JM+98L
 El7hnwtGmu66OipZcadesH15vKeG7uN12cOgQP/wi9LH5erbOsJsmnR+3
 nokfRzVmajWwcVDbWpuYxCsFJ1TrHxwtp2G8glxpuSvLib9Ro+4GNI5nN
 Wrx4ruYpbsk4JtbFJu0HAMr+31vEW6QpNv8ZWaM0K861ccmGQLllA0TPa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="308833530"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="308833530"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 19:40:47 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="773273982"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="773273982"
Received: from kerendel-mobl1.amr.corp.intel.com (HELO [10.212.96.240])
 ([10.212.96.240])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 19:40:46 -0700
Message-ID: <5528f5e7-86fe-f53e-d8db-db91cdd25adb@linux.intel.com>
Date: Fri, 21 Oct 2022 12:13:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH v2 5/9] ASoC: qdsp6: audioreach: simplify module_list sz
 calculation
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20221021165207.13220-1-srinivas.kandagatla@linaro.org>
 <20221021165207.13220-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221021165207.13220-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 bgoswami@quicinc.com
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



On 10/21/22 11:52, Srinivas Kandagatla wrote:
> Simplify module_list size calcuation by doing inside modules loop.

typo: calculation.

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 0015ec89d90b..87a3fd1f8107 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -430,7 +430,6 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
>  	struct audioreach_sub_graph *sgs;
>  	struct apm_mod_list_obj *mlobj;
>  	struct list_head *sg_list;
> -	int num_modules_per_list;
>  	int num_connections = 0;
>  	int num_containers = 0;
>  	int num_sub_graphs = 0;
> @@ -451,6 +450,9 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
>  		list_for_each_entry(container, &sgs->container_list, node) {
>  			num_containers++;
>  			num_modules += container->num_modules;
> +			ml_sz = ml_sz + sizeof(struct apm_module_list_params) +
> +				APM_MOD_LIST_OBJ_PSIZE(mlobj, container->num_modules);
> +
>  			list_for_each_entry(module, &container->modules_list, node) {
>  				if (module->src_mod_inst_id)
>  					num_connections++;
> @@ -459,11 +461,11 @@ void *audioreach_alloc_graph_pkt(struct q6apm *apm, struct audioreach_graph_info
>  	}
>  
>  	num_modules_list = num_containers;
> -	num_modules_per_list = num_modules/num_containers;
>  	sg_sz = APM_SUB_GRAPH_PSIZE(sg_params, num_sub_graphs);
>  	cont_sz = APM_CONTAINER_PSIZE(cont_params, num_containers);
> -	ml_sz =	ALIGN(sizeof(struct apm_module_list_params) +
> -		num_modules_list * APM_MOD_LIST_OBJ_PSIZE(mlobj,  num_modules_per_list), 8);
> +
> +	ml_sz = ALIGN(ml_sz, 8);
> +
>  	mp_sz = APM_MOD_PROP_PSIZE(mprop, num_modules);
>  	mc_sz =	APM_MOD_CONN_PSIZE(mcon, num_connections);
>  
