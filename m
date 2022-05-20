Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D39352E981
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 11:58:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98D7C172C;
	Fri, 20 May 2022 11:57:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98D7C172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653040686;
	bh=HC8j50IOQxMEPHmZdnEVos6iA1pNgClwqH5wkKKaCTo=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MrsYAATZMPKMxZ4DIq2pINBNvGJYtCKxOtuD0f1rR345pvhGEPA4ljIg9u27GjUmf
	 Pt21sfROEBuiUTXETcU7lnGB1WqALekrFPit7pr308ddAmKOMRM8hQEF0mTrDP6li8
	 zIS2MkjS9sO7n0hJwjpEvKJnchZDbGmI4JSCz3I4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F60FF801F5;
	Fri, 20 May 2022 11:57:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 98D1AF8019D; Fri, 20 May 2022 11:57:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEBEF800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 11:56:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEBEF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="OZjWqUg2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K5UCw9026795;
 Fri, 20 May 2022 04:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=OE6raZbucX9LQfP+TUClB+u691iV9kBCVX1IaiFUTRE=;
 b=OZjWqUg2GB9AJ9JqFusRILLr+RJoWNaMdCe9RA8DZ3zC+BqhasJKotr9r087ufLn2CfT
 ImDGP7AQdM1dEhMs05cuGKULUV2UMVhWKhwv1lv9aIYxP58hsADDle5oYJD73+1i/5E/
 DJ4PIeWt9ouGrMRIwpVZYIv2N+Hl3NLhwUKoEL7upZzJBlhj+H8WMUIA+0c0utHrFXib
 6St0njUEwySoagUHdfOhKQMIhve6czUMiuHZthPtAEsJdIL2UVkqXmo+S/ET4vQeKKCR
 eK2EWlTLp4WJJ/WhIR7yVYO0bDmrZEz1nQCC+kwy9kogs86oLbScSXA9l5o3Xs/ta2/U LQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3g28upg5ms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 20 May 2022 04:56:55 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 20 May
 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Fri, 20 May 2022 10:56:54 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 42FB3476;
 Fri, 20 May 2022 09:56:54 +0000 (UTC)
Date: Fri, 20 May 2022 09:56:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 22/56] ASoC: sunxi: Update to use set_fmt_new callback
Message-ID: <20220520095654.GK38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
 <20220519154318.2153729-23-ckeepax@opensource.cirrus.com>
 <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <948d5418-44ca-2e60-0c1c-0b16f315feba@sholland.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-ORIG-GUID: 0o2bd6ilE3N_-d0xNvYBerQp3pGSYvGE
X-Proofpoint-Spam-Reason: safe
Cc: cezary.rojewski@intel.com, heiko@sntech.de,
 kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, broonie@kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, jarkko.nikula@bitmer.com,
 kernel@pengutronix.de, shawnguo@kernel.org, daniel@zonque.org
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

On Thu, May 19, 2022 at 06:40:11PM -0500, Samuel Holland wrote:
> On 5/19/22 10:42 AM, Charles Keepax wrote:
> > As part of updating the core to directly tell drivers if they are clock
> > provider or consumer update these CPU side drivers to use the new direct
> > callback.
> > 
> > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c   | 20 ++++++++++----------
> >  sound/soc/sunxi/sun8i-codec.c |  8 ++++----
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> > diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
> > index 0bea2162f68d9..6e9ef948d6621 100644
> > --- a/sound/soc/sunxi/sun8i-codec.c
> > +++ b/sound/soc/sunxi/sun8i-codec.c
> > @@ -286,11 +286,11 @@ static int sun8i_codec_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> >  	u32 dsp_format, format, invert, value;
> >  
> >  	/* clock masters */
> > -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> > -	case SND_SOC_DAIFMT_CBS_CFS: /* Codec slave, DAI master */
> > +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> > +	case SND_SOC_DAIFMT_BP_FP: /* Codec slave, DAI master */
> 
> This is a codec driver, and it is only ever used on the codec end of a link, so
> I would not expect it to be changed.
> 

Thanks for spotting that, silly mistake on my part. Will fix for
a rev 2.

Thanks,
Charles
