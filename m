Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536A3C898D
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jul 2021 19:16:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D206169E;
	Wed, 14 Jul 2021 19:16:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D206169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626283011;
	bh=dv7DOOnfysllpXu8bvAMg+U4dBpU/96hHx/WJqsnVD8=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mqyNdMN1GIEB5mIRWwq2xlG1HgGy2K1PoWh0ZzfFK6Fo+Wc4675zlaexFeP/KIOFs
	 HUvvLlayIVRGsdf7ZfzPNs+Z9i2HtuOfmSy+xYDC3v6vik93p6IjeNtkoefJfidDOf
	 t+ooVRbJ2k+EtWcRhjuLxSfFa/ZNU9kt5zx4wuOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07233F80253;
	Wed, 14 Jul 2021 19:14:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30B63F80269; Wed, 14 Jul 2021 19:14:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9B8A6F80254
 for <alsa-devel@alsa-project.org>; Wed, 14 Jul 2021 19:14:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B8A6F80254
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="190769929"
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="190769929"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:25 -0700
X-IronPort-AV: E=Sophos;i="5.84,239,1620716400"; d="scan'208";a="413353696"
Received: from alpinagh-mobl1.amr.corp.intel.com (HELO [10.212.71.223])
 ([10.212.71.223])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 10:14:23 -0700
Subject: Re: [PATCH v2 05/16] ASoC: qcom: audioreach: add basic pkt alloc
 support
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 bjorn.andersson@linaro.org, broonie@kernel.org, robh@kernel.org
References: <20210714153039.28373-1-srinivas.kandagatla@linaro.org>
 <20210714153039.28373-6-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <58d6df8d-83ed-c716-81b2-e0927f58da6f@linux.intel.com>
Date: Wed, 14 Jul 2021 11:30:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714153039.28373-6-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=utf-8
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




> diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
> index cc7c1de2f1d9..721ea56b2cb5 100644
> --- a/sound/soc/qcom/Kconfig
> +++ b/sound/soc/qcom/Kconfig
> @@ -103,6 +103,12 @@ config SND_SOC_QDSP6
>  	 audio drivers. This includes q6asm, q6adm,
>  	 q6afe interfaces to DSP using apr.
>  
> +config SND_SOC_QCOM_AUDIOREACH
> +	tristate "SoC ALSA audio drives for Qualcomm AUDIOREACH"

typo: drivers?


> +/* container config */
> +struct apm_container_obj  {
> +	struct apm_container_cfg container_cfg;
> +	/* Capablity ID list */

typo: Capability

> +	struct apm_prop_data cap_data;
> +	uint32_t num_capablity_id;


> +static void *__audioreach_alloc_pkt(int payload_size, uint32_t opcode,
> +				     uint32_t token, uint32_t src_port,
> +				     uint32_t dest_port, bool has_cmd_hdr)
> +{
> +	struct apm_cmd_header *cmd_header;
> +	struct gpr_pkt *pkt;
> +	void *p;
> +	int pkt_size = GPR_HDR_SIZE + payload_size;
> +
> +	if (has_cmd_hdr)
> +		pkt_size += APM_CMD_HDR_SIZE;
> +
> +	p = kzalloc(pkt_size, GFP_ATOMIC);

is GFP_ATOMIC required? it's the same question really than my earlier one on spinlock_irqsave, it's rather hard to figure out in what context this code will run.

> +	if (!p)
> +		return ERR_PTR(-ENOMEM);
> +
> +	pkt = p;
> +	pkt->hdr.version = GPR_PKT_VER;
> +	pkt->hdr.hdr_size = 6;

magic number. looks like a missing macro...

> +	pkt->hdr.pkt_size = pkt_size;
> +	pkt->hdr.dest_port = dest_port;
> +	pkt->hdr.src_port = src_port;
> +
> +	pkt->hdr.dest_domain = GPR_DOMAIN_ID_ADSP;
> +	pkt->hdr.src_domain = GPR_DOMAIN_ID_APPS;
> +	pkt->hdr.token = token;
> +	pkt->hdr.opcode = opcode;
> +
> +	if (has_cmd_hdr) {
> +		p = p + GPR_HDR_SIZE;
> +		cmd_header = p;
> +		cmd_header->payload_size = payload_size;
> +	}
> +
> +	return pkt;
> +}

