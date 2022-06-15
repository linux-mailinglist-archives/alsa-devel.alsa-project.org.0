Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0B54C71A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jun 2022 13:03:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D27E1918;
	Wed, 15 Jun 2022 13:03:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D27E1918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655291037;
	bh=+eBod1AbuflrGZyETNkqQFJ/qRpCcnjD62eOthJoFJE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWE+PlsImziwiDfqFF+Z9KHJMmVx0fLBGAZgTyyUxvH6zjTnb5Xg/jDo3iBRq6nFh
	 huwjbhWlJ+F+iOV1wBUElrNPSW/q5FO2JJE/ejvgrQdmNKuyhD8aQTlL0GhgPb43Eo
	 ALsUCE6E3M4fKnkS4YEiBg0DSnkUCA6I8o0xkaJg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846F9F801F7;
	Wed, 15 Jun 2022 13:02:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35438F80162; Wed, 15 Jun 2022 13:02:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4EA90F800D8;
 Wed, 15 Jun 2022 13:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EA90F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bDOdq1Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655290968; x=1686826968;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+eBod1AbuflrGZyETNkqQFJ/qRpCcnjD62eOthJoFJE=;
 b=bDOdq1Bf87nuPEvXepDrNTmpC5i3LRlP3thD9Bvwars0Qsz3s7Nq2VoD
 Ajri1OHNntsOTKk0tDLurHOurYAry3U0DfKgEwgjiMqwFWzSue2X8YbuU
 sjLQSE30CsPBad2CCDAQgLJz71WBW9U1DxzL0nHPbXdPV/y6WGSUlB/LV
 Ntp67ESHfE0HsjrLxzq3Rqe7ZN8qETUCr0TegoD1wwWU4GdmjkFQpnKfg
 wVQJL6A1ttoP6uhFGRWXRrcMJk/b5QX2kvx4hzFIVwcp6g7KB9HHOyGcR
 NlGr6RpYWfM1AVwdPssYMflL3uzA7nL5+duu1BhWQQOrumW93XZlhPigk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="278965779"
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="278965779"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 04:02:38 -0700
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; d="scan'208";a="830979055"
Received: from ldortadu-mobl1.amr.corp.intel.com (HELO [10.209.160.187])
 ([10.209.160.187])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 04:02:37 -0700
Message-ID: <5e2f44f1-de41-ac02-9fa8-e26a849897ad@linux.intel.com>
Date: Wed, 15 Jun 2022 05:56:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.9.1
Subject: Re: [PATCH] ASoC: SOF: mediatek: Fix error code in probe
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>
References: <YqmWIK8sTj578OJP@kili>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <YqmWIK8sTj578OJP@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, YC Hung <yc.hung@mediatek.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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



On 6/15/22 03:19, Dan Carpenter wrote:
> This should return PTR_ERR() instead of IS_ERR().
> 
> Fixes: e0100bfd383c ("ASoC: SOF: mediatek: Add mt8186 ipc support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Nice catch, thanks!

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

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
