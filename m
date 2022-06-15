Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5120F54C80F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 14:02:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D28A118E2;
	Wed, 15 Jun 2022 14:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D28A118E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655294534;
	bh=yCu340qMfg6oZcr5JvLYeZcBPp9Lyul8ahB/e4qnXUI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MelhbRlov/1I446T/XuMut/RrtTTIiPrxFLcQcb+uMC8gNxXBhYNSRKjl0TB1qAAA
	 OJdLImvQ3k7Mx2q7kWH9jjczkoC4Wv9o2AQf8QBBmSPAKxYzK3HnBP1Sr8MENrR2T1
	 2gZHv4X8VNdq0XFut3ConMADcPXUYYngLtO80baA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DF68F8016C;
	Wed, 15 Jun 2022 14:01:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06CBCF80162; Wed, 15 Jun 2022 14:01:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B05EF8012B;
 Wed, 15 Jun 2022 14:00:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B05EF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kXeEA8AA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655294466; x=1686830466;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yCu340qMfg6oZcr5JvLYeZcBPp9Lyul8ahB/e4qnXUI=;
 b=kXeEA8AAwnGpzT3tBY2rZT7GcIZrUwXahwlSAw2WJ+Dx/PL41DGQNMdW
 QK/Zia7YXoffbeVlsZE4SUxlXJG+bPiwe/R4DSTKWLgSTMexpFCU24Ele
 b8dxKFJmK7E9GRLh4Pib8G0E0AgcpZB1JHyGEfpXYYIKnQ2vjleeMkgr3
 COzP3LVrMKiDzFEfmQfHtU/ABZPuliJYb0J1QzeC3KUG27kjiNgYBcaWW
 pPoCuJML+uk+StZ8MctlJQB6cn/lZ+XFkiRi0Ic3xj2VNnlvr5cq3qP7k
 PzlEOlft2XD6uOnU8Na1m2NEulvLjv1/LwXkbddAH44uq2RyL7N2Of4c7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="267624381"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="267624381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 05:00:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="674463081"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.173])
 ([10.249.254.173])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 05:00:49 -0700
Message-ID: <416df4cf-5421-cbf3-bb47-b39c6129ff71@linux.intel.com>
Date: Wed, 15 Jun 2022 15:01:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
References: <YqmWIK8sTj578OJP@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, YC Hung <yc.hung@mediatek.com>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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



On 15/06/2022 11:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
> index 3333a0634e29..e006532caf2f 100644
> --- a/sound/soc/sof/mediatek/mt8186/mt8186.c
> +++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
> @@ -392,7 +392,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
>  						      PLATFORM_DEVID_NONE,
>  						      pdev, sizeof(*pdev));
>  	if (IS_ERR(priv->ipc_dev)) {
> -		ret = IS_ERR(priv->ipc_dev);
> +		ret = PTR_ERR(priv->ipc_dev);
>  		dev_err(sdev->dev, "failed to create mtk-adsp-ipc device\n");
>  		goto err_adsp_off;
>  	}

-- 
Péter
