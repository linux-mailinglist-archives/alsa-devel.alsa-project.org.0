Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A34DA54DAAB
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 08:30:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 463BD1AD4;
	Thu, 16 Jun 2022 08:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 463BD1AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655361053;
	bh=wif9O5KgkHB6xEW3qKmsm9ZXlJa2XQra7Oa5kcrBsGA=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EDpPP9ZJydkAlZh5sLB+6NtiKRCujukTcO3PmnLE6B8eaVSSt2xxvsOp2bvwW0Mv5
	 Flzi23kFfR1qEz+pWQXFOEtoI2HyzmptJZmb/2Rc8tMq07ngzMwN1Els6WcZvTll4A
	 7kxiOCvj8YoZ+kACxnQBTm6pXur9EepNqTDhetS4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68E55F8047C;
	Thu, 16 Jun 2022 08:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 171CAF80310; Thu, 16 Jun 2022 08:29:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45F02F8012A;
 Thu, 16 Jun 2022 08:29:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45F02F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ibS7oTvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655360987; x=1686896987;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=wif9O5KgkHB6xEW3qKmsm9ZXlJa2XQra7Oa5kcrBsGA=;
 b=ibS7oTviJWOcxkGlkZ3S+04cgYIUuBQHapdpkR2WqtxOlVnKiqLinWFM
 MmnQ1y53+dkBRu8Uzd9Y8kWHJGadGB7rFayUxgXRsizImVyLILVNO3j40
 Wt9xqA8SfiI4aDCkvWbrWRQMfr1KZnrt94vBZOb+INWR4eLA3FSNxTuUD
 7kpw6Y/Ulkz1mhWwhm9gwsx5tutT6hwvcQxbFYZPBHUle+qTDGE+sesGv
 XUnHkvtTas5h9HAZl5vYHsFER4sPLb1dkS6PQCyWreRF/fodYnABEM9xx
 Pfhc4zQzc9o0UkyJy/SXlaOqImZw7M96I14JiF++k8azxSso2Rdh4N2BJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="280212640"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="280212640"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:29:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; d="scan'208";a="831426996"
Received: from marlonpr-mobl3.ger.corp.intel.com (HELO [10.249.254.228])
 ([10.249.254.228])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:29:36 -0700
Message-ID: <01641154-8cf3-ef29-3bc2-c3c1b31b877c@linux.intel.com>
Date: Thu, 16 Jun 2022 09:30:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.10.0
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Fix error code in
 sof_ipc4_volume_put()
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
References: <YqqyDU5BhOzpRjco@kili>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YqqyDU5BhOzpRjco@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, kernel-janitors@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>,
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



On 16/06/2022 07:31, Dan Carpenter wrote:
> The sof_ipc4_volume_put() function returns type bool so returning
> -ENOENT means returning true.  Return false instead.

Good catch,

Acked-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

> Fixes: 955e84fc0b6d ("ASoC: SOF: ipc4-topology: Add control IO ops")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/sof/ipc4-control.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
> index 95ee121dd3cf..0d5a578c3496 100644
> --- a/sound/soc/sof/ipc4-control.c
> +++ b/sound/soc/sof/ipc4-control.c
> @@ -142,7 +142,7 @@ static bool sof_ipc4_volume_put(struct snd_sof_control *scontrol,
>  
>  	if (!widget_found) {
>  		dev_err(scomp->dev, "Failed to find widget for kcontrol %s\n", scontrol->name);
> -		return -ENOENT;
> +		return false;
>  	}
>  
>  	ret = sof_ipc4_set_volume_data(sdev, swidget, scontrol);

-- 
Péter
