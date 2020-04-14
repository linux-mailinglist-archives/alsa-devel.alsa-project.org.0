Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1841A7A2F
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Apr 2020 13:57:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8A2C16A3;
	Tue, 14 Apr 2020 13:56:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8A2C16A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586865436;
	bh=LkQ0dcrf9MyjqTc7cSRslR0WVvMeZfNCFsl59el83SY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iGUv9I2ugIs4UI4QD6wuAiJuxJ/Ul1FEsL6sHtTSeZwMd3hshStcYqB43LH4LRAOr
	 5fBoxHamSXlUgSPCsarUL54jbGug11aoboAzGFweqv6lpgdVoEtBPwSnJ2kAgUj17d
	 lmThy7dcKRy2Hl9F2yL/qRUiewmRYXul0rTGRF8E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16562F8013D;
	Tue, 14 Apr 2020 13:55:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEE3BF8013D; Tue, 14 Apr 2020 13:55:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFDCF800B9
 for <alsa-devel@alsa-project.org>; Tue, 14 Apr 2020 13:55:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFDCF800B9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mnNY+rRO"
Received: from localhost (unknown [106.51.106.133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D53E206D5;
 Tue, 14 Apr 2020 11:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586865326;
 bh=LkQ0dcrf9MyjqTc7cSRslR0WVvMeZfNCFsl59el83SY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mnNY+rROPD2XsMKTOhtq44rZfwnnvF4NyAxYxKm+A9t8kvy1azy+gRdcDjHTLqj+O
 gDGylWU5KlgywVfu0+tYfHRNfE8K4VQobZs87stg/aQ3aWnK3L0qbaAIburMe67YpT
 XzBjPCItCIPIsUN9OTtHNWZ39tnvq9r+2+8D+9uY=
Date: Tue, 14 Apr 2020 17:25:12 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RESEND PATCH] ASoC: wsa881x: mark read_only_wordlength flag
Message-ID: <20200414115512.GG72691@vkoul-mobl>
References: <20200414110347.23829-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200414110347.23829-1-srinivas.kandagatla@linaro.org>
Cc: alsa-devel@alsa-project.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org
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

On 14-04-20, 12:03, Srinivas Kandagatla wrote:
> WSA881x works in PDM mode so the wordlength is fixed, which also makes
> the only field "WordLength" in DPN_BlockCtrl1 register a read-only.
> Writing to this register will throw up errors with Qualcomm Controller.
> So use ro_blockctrl1_reg flag to mark this field as read-only so that
> core will not write to this register.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
> Hi Mark,
> 
> For some reason this patch was missed during last merge window,
> Other patch in this series is already in mainline.
> Without this patch audio is not functional on DB845c and other SDM845
> based platforms.
> 
> Can you please take this for next possible rc.
> 
> Thanks,
> srini
> 
>  sound/soc/codecs/wsa881x.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
> index f2d6f2f81f14..d39d479e2378 100644
> --- a/sound/soc/codecs/wsa881x.c
> +++ b/sound/soc/codecs/wsa881x.c
> @@ -394,6 +394,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>  		.min_ch = 1,
>  		.max_ch = 1,
>  		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>  	}, {
>  		/* COMP */
>  		.num = 2,
> @@ -401,6 +402,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>  		.min_ch = 1,
>  		.max_ch = 1,
>  		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>  	}, {
>  		/* BOOST */
>  		.num = 3,
> @@ -408,6 +410,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>  		.min_ch = 1,
>  		.max_ch = 1,
>  		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>  	}, {
>  		/* VISENSE */
>  		.num = 4,
> @@ -415,6 +418,7 @@ static struct sdw_dpn_prop wsa_sink_dpn_prop[WSA881X_MAX_SWR_PORTS] = {
>  		.min_ch = 1,
>  		.max_ch = 1,
>  		.simple_ch_prep_sm = true,
> +		.read_only_wordlength = true,
>  	}
>  };
>  
> -- 
> 2.21.0

-- 
~Vinod
