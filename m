Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2D75450B8
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Jun 2022 17:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C7181A95;
	Thu,  9 Jun 2022 17:23:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C7181A95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654788281;
	bh=OqFF6qDwLOh06Q07Wxi7YuzZhtAUWXJ5RHWWW3Dj/IY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I+QnqmjOLcnDFhSDUsferaW4wCfkbygKy5XHqZ7CNw5+WALcSs1E8Kx4mx70JvZyj
	 n3kkE1+UlP3n+mJgrjiK2RdszB56FHYx+nhXiuHWhBIC2uYGtkJghIRVVl1ravlkwu
	 vJqTCBI5YY34koJyMZdZLewCD/3DNgCc9lOXOkCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88ADFF80240;
	Thu,  9 Jun 2022 17:23:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 317ACF801F5; Thu,  9 Jun 2022 17:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 342B0F800E9
 for <alsa-devel@alsa-project.org>; Thu,  9 Jun 2022 17:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 342B0F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="MceyIh5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654788214; x=1686324214;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=OqFF6qDwLOh06Q07Wxi7YuzZhtAUWXJ5RHWWW3Dj/IY=;
 b=MceyIh5Kzs24swoh6Oa9kLtmAMZe8dRSIemUJRL1Zh5+DoDtAFvNu9l9
 9SdDH+wCNzDOACPlPMfmQ9ZRwMOt332j2rx8rC4Fyw2CoU+Ce+JZ4IKuD
 dXH7fDNCBU6L/rm1o16n0g5JmXHeqwhuk7KqecW6kUODVRECfMktFeu6S
 D1CKv+B3uxo96eUULI3cXOqpesPrp3HE/mMo6Jze0BcjLsZ4sYcM7WW/6
 sKuKMzmFlvAmTjludgddS+szHO1mSLe1fhCU/J18GFVWG1cGFD94fJl5Z
 8MJcf/jLCCdleXa2WG/c2i1YFxD9/QsTX4ptU+jiybJCXbPDCGcfFQl5a g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339077567"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="339077567"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:23:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; d="scan'208";a="585630710"
Received: from jeremywe-mobl3.amr.corp.intel.com (HELO [10.209.173.145])
 ([10.209.173.145])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2022 08:23:26 -0700
Message-ID: <97757ee1-2525-4e97-855e-da6fb66f01ae@linux.intel.com>
Date: Thu, 9 Jun 2022 10:22:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v4 1/2] soundwire: qcom: Add flag for software clock
 gating check
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
 perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
 quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, swboyd@chromium.org, judyhsiao@chromium.org,
 vkoul@kernel.org
References: <1654785023-1667-1-git-send-email-quic_srivasam@quicinc.com>
 <1654785023-1667-2-git-send-email-quic_srivasam@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1654785023-1667-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/9/22 09:30, Srinivasa Rao Mandadapu wrote:
> Validate software clock gating required or not and do software
> clock gating on hclk if soundwire is operational and keep it
> running by adding flag in private data structure.
> This is to avoid conflict between older architectures,
> where software clock gating is not required and on latest
> architectues, where software clock gating is mandatory.

architectures.

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a3fccf0..8e163da 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -181,6 +181,7 @@ struct qcom_swrm_ctrl {
>  struct qcom_swrm_data {
>  	u32 default_cols;
>  	u32 default_rows;
> +	bool sw_clk_gate_required;
>  };
>  
>  static const struct qcom_swrm_data swrm_v1_3_data = {
> @@ -1311,6 +1312,15 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  			return PTR_ERR(ctrl->mmio);
>  	}
>  
> +	if (data->sw_clk_gate_required) {
> +		ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> +		if (IS_ERR(ctrl->audio_cgcr)) {

You need to handle the NULL case, devm_reset_control_get_exclusive() can
return ERR_OR_NULL

https://elixir.bootlin.com/linux/latest/source/drivers/reset/core.c#L1045

> +			dev_err(dev, "Failed to get cgcr reset ctrl required for SW gating\n");
> +			ret = PTR_ERR(ctrl->audio_cgcr);
> +			goto err_init;
> +		}
> +	}
> +
>  	ctrl->irq = of_irq_get(dev->of_node, 0);
>  	if (ctrl->irq < 0) {
>  		ret = ctrl->irq;
> @@ -1336,10 +1346,6 @@ static int qcom_swrm_probe(struct platform_device *pdev)
>  	ctrl->bus.compute_params = &qcom_swrm_compute_params;
>  	ctrl->bus.clk_stop_timeout = 300;
>  
> -	ctrl->audio_cgcr = devm_reset_control_get_exclusive(dev, "swr_audio_cgcr");
> -	if (IS_ERR(ctrl->audio_cgcr))
> -		dev_err(dev, "Failed to get audio_cgcr reset required for soundwire-v1.6.0\n");
> -
>  	ret = qcom_swrm_get_port_config(ctrl);
>  	if (ret)
>  		goto err_clk;
