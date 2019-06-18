Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4379449A15
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jun 2019 09:13:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE27A1720;
	Tue, 18 Jun 2019 09:12:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE27A1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560842007;
	bh=eWbDgEp8JiAAMx2FRXHkLxj3Y2Oto6QiPxZfCaUtXWs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nSiRZqHZn94ZMwo70my7CFu7znKWWP12qmJozXnM2y9ZvuHX4/nFJ7rRNzHNiLLOH
	 jvDDpd7cW1w63gZLPS0GA5BN1KTqZtOsB+xWpFX+bBiEscdR0Ak+x3Q5SN+DAIMuVQ
	 mMW9GSHvk86tJpmw49IaXIr6RGRmknY8VOLmyRfk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F425F896F4;
	Tue, 18 Jun 2019 09:11:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F029F896F4; Tue, 18 Jun 2019 09:11:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E1C5F89682
 for <alsa-devel@alsa-project.org>; Tue, 18 Jun 2019 09:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E1C5F89682
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 00:11:36 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga004.jf.intel.com with ESMTP; 18 Jun 2019 00:11:36 -0700
Received: from rkammarx-mobl3.ger.corp.intel.com (unknown [10.252.61.163])
 by linux.intel.com (Postfix) with ESMTP id 8F63558028E;
 Tue, 18 Jun 2019 00:11:34 -0700 (PDT)
To: Tzung-Bi Shih <tzungbi@google.com>, broonie@kernel.org
References: <20190618070426.35405-1-tzungbi@google.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cdb8d180-808f-62d2-4227-10e661e2f9ea@linux.intel.com>
Date: Tue, 18 Jun 2019 09:11:37 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618070426.35405-1-tzungbi@google.com>
Content-Language: en-US
Cc: yung-chuan.liao@linux.intel.com, alsa-devel@alsa-project.org,
 dgreid@google.com, cychiang@google.com
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: sof_rt5682: use GFP_KERNEL
 instead of GFP_ATOMIC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 6/18/19 9:04 AM, Tzung-Bi Shih wrote:
> Change the memory allocation flag from GFP_ATOMIC to GFP_KERNEL because
> probe of platform device is unlikely a place where cannot sleep.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> It might be a typo introduced from copied-and-pasted.

Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

We noticed this issue yesterday while reviewing additional changes for 
this machine driver but you beat us to it. Thanks!

> 
>   sound/soc/intel/boards/sof_rt5682.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
> index e2e5f97d9920..02138aa8a850 100644
> --- a/sound/soc/intel/boards/sof_rt5682.c
> +++ b/sound/soc/intel/boards/sof_rt5682.c
> @@ -498,7 +498,7 @@ static int sof_audio_probe(struct platform_device *pdev)
>   	int dmic_num, hdmi_num;
>   	int ret, ssp_amp, ssp_codec;
>   
> -	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
> +	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_KERNEL);
>   	if (!ctx)
>   		return -ENOMEM;
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
