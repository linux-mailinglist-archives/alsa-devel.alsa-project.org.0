Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B984CA957
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 16:44:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 083641F8B;
	Wed,  2 Mar 2022 16:44:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 083641F8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646235894;
	bh=TmvnxBsaIBUo1rh+HLkFLT9be6FT33TNEKEXBh+iG90=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=isZgWK6d2PXKuDW4EeNyp5iV2HVcyFrvKZ6R7P/y3vHCgYQ2C7mPDhs/PMIjZ59Rz
	 V7crE6kJsCgMLZG47YIDdXzCLMRUAI3O6OrFhRWiUzvKzDyNlCsLcBymapXUessU/i
	 cto2X7sBz5Il5vp70a9IdiLTAeQWC51WsqPkPUXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97B68F804CB;
	Wed,  2 Mar 2022 16:44:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47E32F804AC; Wed,  2 Mar 2022 16:44:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F065F80154
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 16:43:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F065F80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g9XenydV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A19B61720;
 Wed,  2 Mar 2022 15:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41036C004E1;
 Wed,  2 Mar 2022 15:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646235832;
 bh=TmvnxBsaIBUo1rh+HLkFLT9be6FT33TNEKEXBh+iG90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g9XenydVpDCJIsdnH4ohFLJpQ2tYFwYMF0Drkw2WwbRg+0YI2TX0ZlIq31meoJWsa
 GpE5DLpRR5j3M6HVFeIEtehuq3Hl+gAr7DO9ANbFW91n3ixycocH+JoBq0+v26yJ8x
 KeRVTf8sIn/+AuiAag89d7H18GLdy3yiLgzCV/qaIs85UzXxkRMHu6kDOtPDIe+4Rr
 vjRGeGVC7B9Uik8GHw5JQ0E+czlurNS2qIHJuZRovBagTOme8qnnu7JTFqzn22HZ6g
 m9ag0dvUDCXHLujMkOELkRl3sOTMxP8+dTd8VJnrfMWZJNgGxljDW1hE/ZES1JI0wM
 sY04ndQpkGKVg==
Date: Wed, 2 Mar 2022 21:13:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: Re: [PATCH v6 1/3] soundwire: qcom: Add compatible name for v1.6.0
Message-ID: <Yh+Qs6P3pm2mHDjJ@matsya>
References: <1646224982-3361-1-git-send-email-quic_srivasam@quicinc.com>
 <1646224982-3361-2-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646224982-3361-2-git-send-email-quic_srivasam@quicinc.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 bgoswami@codeaurora.org, yung-chuan.liao@linux.intel.com,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, tiwai@suse.com,
 agross@kernel.org, robh+dt@kernel.org, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, rohitkr@codeaurora.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, quic_plai@quicinc.com,
 sanyog.r.kale@intel.com, bjorn.andersson@linaro.org, judyhsiao@chromium.org,
 Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 linux-kernel@vger.kernel.org
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

On 02-03-22, 18:13, Srinivasa Rao Mandadapu wrote:
> Update compatible string and master data information in soundwire driver
> to support v1.6.0 in lpass sc7280 based platform.

Where is the documentation of this new compatible

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
> ---
>  drivers/soundwire/qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 5481341..fc41210 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -1348,6 +1348,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
>  static const struct of_device_id qcom_swrm_of_match[] = {
>  	{ .compatible = "qcom,soundwire-v1.3.0", .data = &swrm_v1_3_data },
>  	{ .compatible = "qcom,soundwire-v1.5.1", .data = &swrm_v1_5_data },
> +	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_5_data },
>  	{/* sentinel */},
>  };
>  
> -- 
> 2.7.4

-- 
~Vinod
