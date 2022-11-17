Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5362DCF1
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Nov 2022 14:38:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 892B01654;
	Thu, 17 Nov 2022 14:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 892B01654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668692302;
	bh=S2LL1Qvk1qH+6CRpB+yCup1YqVOGXcciNvz60LpQwfM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LzftYJeci38fr1/FbhtpWig91vpDRIW2itq4BSlTEd+3oC+hudbMy0FmrNkp2HDbo
	 3safVvODbA3C6P4hkRiOy9OUVfXs/xsEcMBVqjQAUTcYCeUlDanEXANjUqS93xJeX3
	 BSHIHyKLe9i3710WmRmgxgGZyDY1T9SVeQEQGkf4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F7C2F8051D;
	Thu, 17 Nov 2022 14:37:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 939EBF8025A; Thu, 17 Nov 2022 14:37:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58BA1F80087;
 Thu, 17 Nov 2022 14:37:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58BA1F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mzvQrd+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668692237; x=1700228237;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=S2LL1Qvk1qH+6CRpB+yCup1YqVOGXcciNvz60LpQwfM=;
 b=mzvQrd+UXA43OKPuFa+29moyTf9z+OIdVWSzRJFFZnDHL7A0CMKXHPOE
 4SyWCKTZ24GZxFPM2sfkgUztRyiRUsG48jBgraNpkTXylnBBxVMUcoD3g
 ygTbYdqywOvpxh5yoPb5ALR7blIUrmX8bgH/q4vuPLFr/qYiyEK+PVbNo
 38/q2fZcZgYrf15FIcp6Ml38FotFqLUtu0AxZApH+l5Aq5B8n08fpheCM
 D3cRrrk+hfR+gylQG+WFzsicKD1lkTV9qcRrXgKA3T4GPFOBPpgePz4nE
 1yPI1sfJ6r1pB56olj6rZFMeLAnN+1p73rj4/CuLb6J6BvgnOHtnFopEW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="311554628"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="311554628"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:37:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="590622508"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="590622508"
Received: from crequinx-mobl1.ger.corp.intel.com (HELO [10.252.19.12])
 ([10.252.19.12])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 05:37:09 -0800
Message-ID: <4942f328-8bb6-9880-8901-0cae5ca73873@linux.intel.com>
Date: Thu, 17 Nov 2022 15:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/1] ASoC: SOF: probes: Check ops before memory
 allocation
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Jyri Sarha <jyri.sarha@intel.com>, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20221117103223.74425-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20221117103223.74425-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>
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



On 17/11/2022 12:32, Andy Shevchenko wrote:
> We may check ops before spending resources on memory allocation.

we might.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> While at it, utilize dev_get_platdata() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/sof/sof-client-probes.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
> index d08395182b1a..fff126808bc0 100644
> --- a/sound/soc/sof/sof-client-probes.c
> +++ b/sound/soc/sof/sof-client-probes.c
> @@ -399,23 +399,21 @@ static int sof_probes_client_probe(struct auxiliary_device *auxdev,
>  	if (!sof_probes_enabled)
>  		return -ENXIO;
>  
> -	if (!dev->platform_data) {
> +	ops = dev_get_platdata(dev);
> +	if (!ops) {
>  		dev_err(dev, "missing platform data\n");
>  		return -ENODEV;
>  	}
> -
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> -
> -	ops = dev->platform_data;
> -
>  	if (!ops->startup || !ops->shutdown || !ops->set_params || !ops->trigger ||
>  	    !ops->pointer) {
>  		dev_err(dev, "missing platform callback(s)\n");
>  		return -ENODEV;
>  	}
>  
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
>  	priv->host_ops = ops;
>  
>  	switch (sof_client_get_ipc_type(cdev)) {

-- 
Péter
