Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7678454381B
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jun 2022 17:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AC031A6A;
	Wed,  8 Jun 2022 17:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AC031A6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654703558;
	bh=J9gVhWmRkrARQ+vF0CS/Zkh9G25iczH9M7T6+0LTHwA=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GTfWgEs99+gl3BynJQZHZ/wDlgDTNNRiRhAHXR8kpjslxF5/aRovfofga+qPOjja4
	 Z6wltrYO5fJVPzFT48x/8z9Qxu1gBomCgaXFVORVo01CeqnV1NdLdfvBGGKnoRAu6a
	 ZwY72H+GvD33CQcB5lWGKBTVsaaDdu7yuCncv2Mc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE92F80116;
	Wed,  8 Jun 2022 17:51:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB407F80118; Wed,  8 Jun 2022 17:51:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A05CF80118
 for <alsa-devel@alsa-project.org>; Wed,  8 Jun 2022 17:51:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A05CF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GLZdNr+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654703491; x=1686239491;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J9gVhWmRkrARQ+vF0CS/Zkh9G25iczH9M7T6+0LTHwA=;
 b=GLZdNr+I04IrYt+zwGJupWoF5c65LkzRJaeCd1iWbc4pcB+VHjyU0FE8
 rgDW47VZqNt0kZft/CN09vjCTSANwOTpk2/QMG6wHNs7bjcZ6F8lHXu8Q
 J8+4yrGi3lEKjYnVHDNfMJ3v7fwgrmHfvxaJ4sfvScs/LMRUXA2LKOEhV
 9/bLo/B+mua+Yri5dnBGHoTJ+WzEGRU0v3yarah/h0PXiCgPDfDYo21rE
 imyT3raUVEuke9jjtbiS+xPg1vJmKo8BblnmL6+BETHjcvMal8m8XGD8p
 APp1vUTEIoF4ncm3+sEubvHFg6UA3HUDCHpBQn83WCpO+nxwgc5qnYuJN Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="302302721"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="302302721"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 08:51:20 -0700
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; d="scan'208";a="609715710"
Received: from pandeyvi-mobl1.amr.corp.intel.com (HELO [10.213.185.165])
 ([10.213.185.165])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 08:51:19 -0700
Message-ID: <90a49c5c-7433-cec4-cb86-1424209a54e4@linux.intel.com>
Date: Wed, 8 Jun 2022 10:39:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH v3 1/2] soundwire: qcom: Add flag for software clock
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
References: <1654696929-20205-1-git-send-email-quic_srivasam@quicinc.com>
 <1654696929-20205-2-git-send-email-quic_srivasam@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1654696929-20205-2-git-send-email-quic_srivasam@quicinc.com>
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



On 6/8/22 09:02, Srinivasa Rao Mandadapu wrote:
> Add flag in qcom_swrm_data private data structure for validating
> software colck gating control requirement.

typo: clock

> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/soundwire/qcom.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index a3fccf0..38c3bf5 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -181,6 +181,7 @@ struct qcom_swrm_ctrl {
>  struct qcom_swrm_data {
>  	u32 default_cols;
>  	u32 default_rows;
> +	bool sw_clk_gate_required;

I would have used a different split between patches, where the flag and
functionality is introduced, and a second patch where this flag would be
set for a specific platform.

>  };
>  
>  static const struct qcom_swrm_data swrm_v1_3_data = {
