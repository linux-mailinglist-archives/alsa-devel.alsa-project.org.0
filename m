Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A057386
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2019 23:22:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1FAB16A5;
	Wed, 26 Jun 2019 23:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1FAB16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561584145;
	bh=TKZhmoa43fBOiPpaR/7dWhvQfZuty5EGaIalQlHZfkU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8Vr3+kl3DoWkoS+fJID40rg4yWXXe6TrUTY1509tPLVs9uWOYc7MSfhJ1fIV4jP8
	 IJKj+09hFCl6RHtL+gQ2+e2mznukRigh4uvo6zeX70Mk8xupQ4XANbFLCzlsHxJ9Hq
	 xDO/HGMQCY4mbzIgc81pMVVKniFOQIPGEhXgMYks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38AB0F896B7;
	Wed, 26 Jun 2019 23:20:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC44AF896B9; Wed, 26 Jun 2019 23:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BCC5F806F0
 for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2019 23:20:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BCC5F806F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 14:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="188793233"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 26 Jun 2019 14:20:26 -0700
Received: from iriji-mobl1.ger.corp.intel.com (unknown [10.252.28.127])
 by linux.intel.com (Postfix) with ESMTP id A171658046A;
 Wed, 26 Jun 2019 14:20:23 -0700 (PDT)
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Kevin Hilman <khilman@baylibre.com>
References: <20190626133617.25959-1-jbrunet@baylibre.com>
 <20190626133617.25959-2-jbrunet@baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8b4822f7-6671-1c23-572d-37f7e94ea8cc@linux.intel.com>
Date: Wed, 26 Jun 2019 23:20:22 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190626133617.25959-2-jbrunet@baylibre.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: soc-core: defer card
 registration if codec component is missing
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

On 6/26/19 3:36 PM, Jerome Brunet wrote:
> Like cpus and platforms, defer sound card initialization if the codec
> component is missing when initializing the dai_link
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   sound/soc/soc-core.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 358f1fbf9a30..002ddbf4e5a3 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1064,12 +1064,20 @@ static int soc_init_dai_link(struct snd_soc_card *card,
>   				link->name);
>   			return -EINVAL;
>   		}
> +
>   		/* Codec DAI name must be specified */
>   		if (!codec->dai_name) {
>   			dev_err(card->dev, "ASoC: codec_dai_name not set for %s\n",
>   				link->name);
>   			return -EINVAL;
>   		}
> +
> +		/*
> +		 * Defer card registartion if codec component is not added to

registration

> +		 * component list.
> +		 */
> +		if (!soc_find_component(codec))
> +			return -EPROBE_DEFER;
>   	}
>   
>   	/*
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
