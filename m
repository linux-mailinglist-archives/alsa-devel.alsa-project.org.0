Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A426E597FE4
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Aug 2022 10:16:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4359E823;
	Thu, 18 Aug 2022 10:15:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4359E823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660810561;
	bh=1pMu3yuAB0gQ8wwcQ/V5v3DSCGyeUtyrelY95YGU83k=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ToVFXuUUNB9SavjjTKCATySnASoKv3EeHJr0tqAZ/C5VfVN6cqOdtxh5xokMUMjtN
	 YVQrRxhtqpsvOpSPuEP1UGLbE5EmpdLCYxtaz5FwgvgvpKy6wHWg8yp8Xvxhf97LnZ
	 dcL2JtwMXdzT5ILMaifTcIemRiWvVkFOxw96lX6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AB2EF800EE;
	Thu, 18 Aug 2022 10:15:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 298EFF80430; Thu, 18 Aug 2022 10:15:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 606B3F800B5;
 Thu, 18 Aug 2022 10:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 606B3F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dPzINHps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660810495; x=1692346495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=1pMu3yuAB0gQ8wwcQ/V5v3DSCGyeUtyrelY95YGU83k=;
 b=dPzINHps5X9WIkJriNdCiiDpRNPiMK9VTmtfTc/L18u5XxwcQ+Tnwn//
 m8/txSluNrznfAAjNeUF47Tv9CpyJjTndQyQVCVE2gJ/xsqumUwiAeDUS
 l3Jmejm7JI5J1F1tAtFcyzSaVVNcfUxVhoe4pHLWFbjKoraYCjh1TCTx+
 CCCkgol/7eP5bYHSB7DtiA2Ue7caJrztVQbXZ0312w4IThhinW47+a8ib
 ulqLpJlx3cWtm6ZJi1QSG0lEbOBY7qAvE6EAWN9XLyOsv9THV8caAQh/d
 BRxji+cgnnkwAvfYxUz+9EHRF4qUllZpx03IfZo3oFZCfELJhPDQ/8J5z g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10442"; a="378992287"
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; d="scan'208";a="378992287"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 01:14:50 -0700
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; d="scan'208";a="604176061"
Received: from jiayiwan-mobl1.ccr.corp.intel.com (HELO [10.249.254.115])
 ([10.249.254.115])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 01:14:48 -0700
Message-ID: <afcaffc6-aa07-d95f-6823-a858b53ee978@linux.intel.com>
Date: Thu, 18 Aug 2022 11:14:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.12.0
Subject: Re: [PATCH -next] ASoC: SOF: ipc4-topology: fix wrong use of sizeof
 in sof_ipc4_widget_setup_comp_src()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org
References: <20220818081751.2407066-1-yangyingliang@huawei.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220818081751.2407066-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: broonie@kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com
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



On 18/08/2022 11:17, Yang Yingliang wrote:
> It should be size of the struct sof_ipc4_src, not data pointer pass to
> sof_update_ipc_object().

Good find, thank you.

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: b85f4fc40d56 ("ASoC: SOF: add ipc4 SRC module support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  sound/soc/sof/ipc4-topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
> index af072b484a60..c6abfaf5d532 100644
> --- a/sound/soc/sof/ipc4-topology.c
> +++ b/sound/soc/sof/ipc4-topology.c
> @@ -771,7 +771,7 @@ static int sof_ipc4_widget_setup_comp_src(struct snd_sof_widget *swidget)
>  		goto err;
>  
>  	ret = sof_update_ipc_object(scomp, src, SOF_SRC_TOKENS, swidget->tuples,
> -				    swidget->num_tuples, sizeof(src), 1);
> +				    swidget->num_tuples, sizeof(*src), 1);
>  	if (ret) {
>  		dev_err(scomp->dev, "Parsing SRC tokens failed\n");
>  		goto err;

-- 
Péter
