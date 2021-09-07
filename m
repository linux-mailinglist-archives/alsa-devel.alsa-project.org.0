Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDD402744
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Sep 2021 12:35:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A0C8E1720;
	Tue,  7 Sep 2021 12:34:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A0C8E1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631010913;
	bh=aY/k0tQ1tcVrT1KRpNnqoullC/EQdNOYIR3M7lrxCok=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vbciMN47uL8wvpGN8B872rITcDLu+o0r74AHAp5eVIC/UJlX3CkA4qkRta462jZoh
	 +D8IlZsywvXjtRT6qxiVKR7OA2TGGe14mc+tiQtujDwfFNe2O/V0r1ld5cTonqJXLi
	 TRvCp7R3pkd6LN7TLb48GP/3mM1kCmBaUnCRdoy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECAD3F800BC;
	Tue,  7 Sep 2021 12:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A3ECF80224; Tue,  7 Sep 2021 12:33:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4B1AEF800C7
 for <alsa-devel@alsa-project.org>; Tue,  7 Sep 2021 12:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B1AEF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="mPohdchv"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1875W66e006859; 
 Tue, 7 Sep 2021 05:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=wi8C/OOR4jGamE5VgR4Kcd0QgpnltJi1HMdgo3MAAfg=;
 b=mPohdchvfLIlFRumeHKZ8NdHxyozC/TUk3ZzsJ3PScOG9Kq3TmvfEk0jQfWroonImZ9h
 g3iGT483HL2C9jaXxlxPdbgMHkamMuolkffQ3D3moTmmlY0rC/vEcf1purIQoRsY91gq
 kg9utZv0+cmUoQaDuTCwfNHpap7WKZSljvbg6ehh+9cHwxJQSmngW6ou/CX8bc6W1qCo
 +dmWTQC9RwMxQKHL+Cxnuch7PUF5DqqhRo+0OIjeU794nEFJfmVtmyv8ATVgq5y0476D
 jMu8RqRdxcldgiO3y0cQ838nDFy2FQT0iskyj5SPteS+6JSB3qlKVtGnvf9kjc9R28oz cg== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3awp5ugru3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Sep 2021 05:33:39 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Tue, 7 Sep
 2021 11:33:38 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2242.12 via
 Frontend Transport; Tue, 7 Sep 2021 11:33:38 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E9ADDB15;
 Tue,  7 Sep 2021 10:33:37 +0000 (UTC)
Date: Tue, 7 Sep 2021 10:33:37 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: wm8960: Fix clock configuration on slave mode
Message-ID: <20210907103337.GO9223@ediswmail.ad.cirrus.com>
References: <1631005869-7308-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1631005869-7308-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: bgrLMdxn9w4gSw_U3QOadr0epMkMEDux
X-Proofpoint-ORIG-GUID: bgrLMdxn9w4gSw_U3QOadr0epMkMEDux
X-Proofpoint-Spam-Reason: safe
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 patches@opensource.cirrus.com, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, linux-kernel@vger.kernel.org
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

On Tue, Sep 07, 2021 at 05:11:09PM +0800, Shengjiu Wang wrote:
> There is a noise issue for 8kHz sample rate on slave mode.
> Compared with master mode, the difference is the DACDIV
> setting, after correcting the DACDIV, the noise is gone.
> 
> There is no noise issue for 48kHz sample rate, because
> the default value of DACDIV is correct for 48kHz.
> 
> So wm8960_configure_clocking() should be functional for
> ADC and DAC function even if it is slave mode.
> 
> In order to be compatible for old use case, just add
> condition for checking that sysclk is zero with
> slave mode.
> 
> Fixes: 0e50b51aa22f ("ASoC: wm8960: Let wm8960 driver configure its bit clock and frame clock")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/codecs/wm8960.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
> index 9e621a254392..9c6af76a60fd 100644
> --- a/sound/soc/codecs/wm8960.c
> +++ b/sound/soc/codecs/wm8960.c
> @@ -742,7 +742,7 @@ static int wm8960_configure_clocking(struct snd_soc_component *component)
>  	int i, j, k;
>  	int ret;
>  
> -	if (!(iface1 & (1<<6))) {
> +	if (!(iface1 & (1 << 6)) && !wm8960->sysclk) {
>  		dev_dbg(component->dev,
>  			"Codec is slave mode, no need to configure clock\n");

Looking through the datasheet it just looks like this if
statement has always been non-sense, it looks pretty clear the
clocking should still be configured in slave mode (apart from
BCLKDIV which is presumably ignored in slave mode).

I would be slightly inclined to suggest it would be better
to just fixup any systems not setting sysclk for slave mode,
but I am assuming you are talking primarily about out of tree
systems. So I think we need to at least update the message here
as well, it should probably change to a warning and state that
the we are proceeding with no clock configuration, rather than
erroneously saying it doesn't need one.

Thanks,
Charles
