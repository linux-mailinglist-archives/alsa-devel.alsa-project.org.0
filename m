Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 705354D164F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 12:31:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FC5717A5;
	Tue,  8 Mar 2022 12:31:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FC5717A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646739119;
	bh=FfySqN0vQa4ttzZHSXEhhQ3ALTvA9lNDII7nXpWIblk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aHBY+67VhkxKPstJ2NHUWHyJrBMOENRdOoxwv+ddoEorZtgulBXPtcGRmagc1PGG0
	 vOdR654qC0S0ZZ9nYP0hpH4cYbQwKF9XuLSS8YC87LtCDydWPhugpSdtutmPA1tfIa
	 ZTRuyLe+5uGgMV/iNLntPTfPU13HF28Qc403Ui2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77BECF80121;
	Tue,  8 Mar 2022 12:30:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91C93F8026A; Tue,  8 Mar 2022 12:30:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19AA0F800D2;
 Tue,  8 Mar 2022 12:30:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19AA0F800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ETZ96CB/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646739043; x=1678275043;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FfySqN0vQa4ttzZHSXEhhQ3ALTvA9lNDII7nXpWIblk=;
 b=ETZ96CB/1Kf0JgMPc2Osp9OPLFmjsJE1PzvF5/Gz1s+Y9ofvb6yARKKA
 nWJ3qeOvfYDkRI2I8E7TyIJhiluVTYov0mL5KRQEkRLDSzpfaexkOoj5i
 hse70FVOMD+AJkbPiM3lxpFr9BDz/KI+qUPOK4XNK9ZNNVd3WW9F0IU1J
 XLCnGrmegfgcuQ2t38s6/QMPLILfV7QENhfK76G0Yn+b2kJJaSd3fdK12
 2vPstJRpD9ofgI4n84gKyDSqqjQwb/m6JWLktM4+MIR9kj0HeCNQp7VF8
 kgb4bzVJwPLAWIa5xKfPfgmWmSKc4TDNcv+q29ab0MLkZHqZAvrEGGGbd Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="341093267"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="341093267"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 03:30:37 -0800
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="687893094"
Received: from nsedoc-mobl.ger.corp.intel.com (HELO [10.251.218.162])
 ([10.251.218.162])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 03:30:33 -0800
Message-ID: <886a7712-ffdc-4d0c-fde5-5498b84e416c@linux.intel.com>
Date: Tue, 8 Mar 2022 13:30:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: SOF: Add missing of_node_put() in imx8m_probe
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220308023325.31702-1-linmq006@gmail.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220308023325.31702-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 08/03/2022 04:33, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: afb93d716533 ("ASoC: SOF: imx: Add i.MX8M HW support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
>  sound/soc/sof/imx/imx8m.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
> index 788e77bcb603..60251486b24b 100644
> --- a/sound/soc/sof/imx/imx8m.c
> +++ b/sound/soc/sof/imx/imx8m.c
> @@ -224,6 +224,7 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
>  	}
>  
>  	ret = of_address_to_resource(res_node, 0, &res);
> +	of_node_put(res_node);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to get reserved region address\n");
>  		goto exit_pdev_unregister;

-- 
Péter
