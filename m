Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631057D58
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Jun 2019 09:43:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F02241714;
	Thu, 27 Jun 2019 09:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F02241714
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561621398;
	bh=TrrdhhKH8hJZHYNJM7UGrZ47Mn57NPhKupNZIJ8mm/o=;
	h=Date:From:To:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=djbR3+qfyBalndQ8PfERG3w7lXXFvs7dxiLfuVes9BVGN+kE/Twu2E5WORzG2ftcO
	 EGNGs4XKFSl6uf9jMioyLAFRI0zZ2KUKIzLB1dQ+qFV12swcBS2Or2Dkg8GiLu3FkL
	 DKHbw/xncGMYu2ykXB4ZDYWjGhHlt2NYDJ0jJGsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 320CDF8973B;
	Thu, 27 Jun 2019 09:39:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BDE8F8973A; Thu, 27 Jun 2019 09:39:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=FROM_EXCESS_BASE64,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF8E3F89739
 for <alsa-devel@alsa-project.org>; Thu, 27 Jun 2019 09:39:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8E3F89739
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 00:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="245727633"
Received: from xxx.igk.intel.com (HELO xxx) ([10.237.93.170])
 by orsmga001.jf.intel.com with ESMTP; 27 Jun 2019 00:39:48 -0700
Date: Thu, 27 Jun 2019 09:43:47 +0200
From: Amadeusz =?UTF-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Message-ID: <20190627094347.6054300a@xxx>
In-Reply-To: <87mui3iybl.wl-kuninori.morimoto.gx@renesas.com>
References: <8736jvkcy1.wl-kuninori.morimoto.gx@renesas.com>
 <87mui3iybl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 11/23] ASoC: rt5682: use
 devm_snd_soc_register_component()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 27 Jun 2019 11:00:46 +0900
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> We have devm_xxx version of snd_soc_register_component,
> let's use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/codecs/rt5682.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
> index 78409dd..a3459ce 100644
> --- a/sound/soc/codecs/rt5682.c
> +++ b/sound/soc/codecs/rt5682.c
> @@ -2662,14 +2662,13 @@ static int rt5682_i2c_probe(struct i2c_client
> *i2c, 
>  	}
>  
> -	return snd_soc_register_component(&i2c->dev,
> &soc_component_dev_rt5682,
> -			rt5682_dai, ARRAY_SIZE(rt5682_dai));
> +	return devm_snd_soc_register_component(&i2c->dev,
> +					&soc_component_dev_rt5682,
> +					rt5682_dai,
> ARRAY_SIZE(rt5682_dai)); }
>  
>  static int rt5682_i2c_remove(struct i2c_client *i2c)
>  {
> -	snd_soc_unregister_component(&i2c->dev);
> -
>  	return 0;
>  }
>  

Can be entirely removed.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
