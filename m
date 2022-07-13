Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B32A573977
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:59:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C9641740;
	Wed, 13 Jul 2022 16:58:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C9641740
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657724367;
	bh=lTmAVQlD6Vx1Np35GsT5xt5v+z7aHOSMCs6G1835MVM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lj+nQRFmx/cUWwb690k4Qy8jGXpvi1A7JEEMu/gAdQv8GRnEk2Q4/UlfJ88f9Gme/
	 fInEoOtq5tdojku/jg8HnfRAzF+0dmE3lmg5tdAwVvqCmd1jakDL117F0SotV3BUR1
	 zOkd8QaNkMnnjhCakg4lE9rmGjAA6jEGzG7bmLpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90D8AF80254;
	Wed, 13 Jul 2022 16:58:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DD75F80249; Wed, 13 Jul 2022 16:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC6B8F80134
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC6B8F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mLS9bWU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657724299; x=1689260299;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=lTmAVQlD6Vx1Np35GsT5xt5v+z7aHOSMCs6G1835MVM=;
 b=mLS9bWU7dXsv5UgpPWQOBreci/FcdxBbhPhJy1m1aEm78ATeBYcJFE2F
 pMkJ3629Mb+7wcuTvJeYqeum7c0uSR+RRUxuGYMUGxvLBVcGFKgEesj5J
 XWnWZUVFMPlAT0c0gLDlUY0hoGjswn4KumZiT11suoHPfLBbgw/HgfnA7
 jUNFG2lf1qvXEBV8kmfD8GEeaQVOYRKfWKm+cdqdSWTcf2vrl0BlhkSIr
 GKfqR5rSf4SpuANt5bP3piWk0r+X4lAwcXTxvAlobiOc3jQgNdsW0tdrb
 dAoZg2wA3b4hMvh6XawPgJYm+u9VL7q3PcXRO+5e/yJBFKk7ul3L6NyV5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="265643519"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="265643519"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:58:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="593017443"
Received: from melanief-mobl.amr.corp.intel.com (HELO [10.212.10.37])
 ([10.212.10.37])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 07:58:11 -0700
Message-ID: <726124ab-53e4-5f3c-b0bb-124d129d3028@linux.intel.com>
Date: Wed, 13 Jul 2022 09:58:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH v2] soundwire: qcom: Update error prints to debug prints
Content-Language: en-US
To: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, quic_plai@quicinc.com,
 bgoswami@quicinc.com, perex@perex.cz, tiwai@suse.com,
 srinivas.kandagatla@linaro.org, quic_rohkumar@quicinc.com,
 linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 swboyd@chromium.org, judyhsiao@chromium.org
References: <1657724067-19004-1-git-send-email-quic_srivasam@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1657724067-19004-1-git-send-email-quic_srivasam@quicinc.com>
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



On 7/13/22 09:54, Srinivasa Rao Mandadapu wrote:
> Update error prints to debug prints to avoid redundant logging in kernel
> boot time, as these prints are informative prints in irq handler.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
> Changes since v1:
>     -- Remove redundant __func__ argument.
>     -- Replace dev_dbg with dev_dbg_ratelimited.
> 
>  drivers/soundwire/qcom.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 9df970e..976ae75 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c
> @@ -573,11 +573,10 @@ static irqreturn_t qcom_swrm_irq_handler(int irq, void *dev_id)
>  				break;
>  			case SWRM_INTERRUPT_STATUS_NEW_SLAVE_ATTACHED:
>  			case SWRM_INTERRUPT_STATUS_CHANGE_ENUM_SLAVE_STATUS:
> -				dev_err_ratelimited(swrm->dev, "%s: SWR new slave attached\n",
> -					__func__);
> +				dev_dbg_ratelimited(swrm->dev, "SWR new slave attached\n");
>  				swrm->reg_read(swrm, SWRM_MCP_SLV_STATUS, &slave_status);
>  				if (swrm->slave_status == slave_status) {
> -					dev_err(swrm->dev, "Slave status not changed %x\n",
> +					dev_dbg(swrm->dev, "Slave status not changed %x\n",
>  						slave_status);
>  				} else {
>  					qcom_swrm_get_device_status(swrm);
