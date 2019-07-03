Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4D55EE0E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2019 23:03:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCEB316A6;
	Wed,  3 Jul 2019 23:02:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCEB316A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562187799;
	bh=M8ZxkFy+AZYeCpQptOWoN4boM1CKljU5DJw7vUKlxf0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SNCARsDAQlvOLstESz+Boz0vt+tFzXMVJA9l6hhEi6JXNxMjtwIJK5JfEsQEjEzzc
	 Bmf0x795AzzMglPFdvlhEwm/zYzk2k9i6Cpt7Fq04QID3mdvqX4Ad8Lhy0WMuLXhcn
	 UZUcrGMfwhs/GKqhBZ63VmvNH4OSF+M94PriMeGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3800F800F1;
	Wed,  3 Jul 2019 23:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0099F800EA; Wed,  3 Jul 2019 22:58:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90412F800E8
 for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2019 22:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90412F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jul 2019 13:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,448,1557212400"; d="scan'208";a="166087884"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.1.56])
 ([10.252.1.56])
 by fmsmga007.fm.intel.com with ESMTP; 03 Jul 2019 13:56:20 -0700
To: shengjiu.wang@nxp.com
References: <cover.1562136119.git.shengjiu.wang@nxp.com>
 <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <3238f813-ac71-69e2-45bf-badb461dac82@intel.com>
Date: Wed, 3 Jul 2019 22:56:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <c29639336b6b32fa781bdddad30287f8b76d5e0b.1562136119.git.shengjiu.wang@nxp.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com
Subject: Re: [alsa-devel] [PATCH V2 2/2] ASoC: fsl_esai: recover the channel
 swap after xrun
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

On 2019-07-03 08:42, shengjiu.wang@nxp.com wrote:
> +static void fsl_esai_reset(unsigned long arg)
> +{
> +	struct fsl_esai *esai_priv = (struct fsl_esai *)arg;
> +	u32 saisr, tfcr, rfcr;
> +
> +	/* save the registers */
> +	regmap_read(esai_priv->regmap, REG_ESAI_TFCR, &tfcr);
> +	regmap_read(esai_priv->regmap, REG_ESAI_RFCR, &rfcr);
> +
> +	/* stop the tx & rx */
> +	fsl_esai_trigger_stop(esai_priv, 1);
> +	fsl_esai_trigger_stop(esai_priv, 0);
> +
> +	/* reset the esai, and restore the registers */
> +	fsl_esai_init(esai_priv);

<comment below applies>

> +
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_TCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);
> +	regmap_update_bits(esai_priv->regmap, REG_ESAI_RCR,
> +			   ESAI_xCR_xPR_MASK,
> +			   ESAI_xCR_xPR);
> +
> +	/* restore registers by regcache_sync */
> +	fsl_esai_register_restore(esai_priv);
> +

Both _init and _restore may fail given their declaration in 1/2 "ASoC: 
fsl_esai: Wrap some operations to be functions" yet here you simply 
ignore the return values.

If failure of said functions is permissive, it might be a good place for 
a comment.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
