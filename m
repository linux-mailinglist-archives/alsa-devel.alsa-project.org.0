Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68921C45F3
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 04:56:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6884167C;
	Wed,  2 Oct 2019 04:55:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6884167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569984972;
	bh=F3UD/+8Ss0wxuDqk1BQ/F4dvQfZiTvPnJBbqVrd10H0=;
	h=From:To:Date:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KXL3w9J3S3vgBgBM+k/1v0743nFesa9wXZpxeDfkY+h39kvwPT+cmmCKvsPcbZrJ2
	 oOxBptl55+0J0R0m7nNmghx/pf2vWBohtZ9dnxWjqabIMRJDmazBV3LbtGRrB6LP4C
	 7mAd+KGK7R8hPlsT87vY8eavlHXmDfkcMSd89as4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58639F80391;
	Wed,  2 Oct 2019 04:54:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02915F80391; Wed,  2 Oct 2019 04:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BEF2F800DE
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 04:54:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BEF2F800DE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Oct 2019 19:54:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,572,1559545200"; d="scan'208";a="216299818"
Received: from kmsmsx156.gar.corp.intel.com ([172.21.138.133])
 by fmsmga004.fm.intel.com with ESMTP; 01 Oct 2019 19:53:56 -0700
Received: from pgsmsx108.gar.corp.intel.com ([169.254.8.138]) by
 KMSMSX156.gar.corp.intel.com ([169.254.1.31]) with mapi id 14.03.0439.000;
 Wed, 2 Oct 2019 10:53:55 +0800
From: "Lu, Brent" <brent.lu@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Thread-Topic: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp
 sclk early
Thread-Index: AQHVeDPt+TrcGokx5EWZxsNB/Hvyd6dFQ4qAgAFZI3A=
Date: Wed, 2 Oct 2019 02:53:55 +0000
Message-ID: <CF33C36214C39B4496568E5578BE70C7402EE40A@PGSMSX108.gar.corp.intel.com>
References: <1569919250-24472-1-git-send-email-brent.lu@intel.com>
 <823bff94-3135-c3a9-4d7f-c07b564faba2@linux.intel.com>
In-Reply-To: <823bff94-3135-c3a9-4d7f-c07b564faba2@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNThhYzRjNDUtZWY3MS00ZTkwLTlhN2QtYjUyYjFkZGI4MjNmIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoia0lKNHAzTXhYNGFUNlpSMzI5UDNuMHZ4TTM5UzBHUDlNWWR3VThOYXduS3FwZnZlcmt2OXAyNnBkVTdQK1c0TiJ9
x-ctpclassification: CTP_NT
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>,
 "yang.jie@linux.intel.com" <yang.jie@linux.intel.com>,
 "liam.r.girdwood@linux.intel.com" <liam.r.girdwood@linux.intel.com>, "Chiang,
 Mac" <mac.chiang@intel.com>, "broonie@kernel.org" <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Intel: eve: Enable mclk and ssp sclk
 early
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

> > diff --git a/sound/soc/intel/boards/Kconfig
> b/sound/soc/intel/boards/Kconfig
> > index 5c27f7a..d5f167e 100644
> > --- a/sound/soc/intel/boards/Kconfig
> > +++ b/sound/soc/intel/boards/Kconfig
> > @@ -315,6 +315,7 @@ config
> SND_SOC_INTEL_KBL_RT5663_RT5514_MAX98927_MACH
> >   	depends on I2C && ACPI
> >   	depends on MFD_INTEL_LPSS || COMPILE_TEST
> >           depends on SPI
> > +	select SND_SOC_INTEL_SKYLAKE_SSP_CLK
> 
> It would be nicer to follow the same order as for kbl_rt5663_max98927,
> with this SKYLAKE_SSP_CLK added last after HDAC_HDMI
> 
> 

Will fix it.

> > +static int platform_clock_control(struct snd_soc_dapm_widget *w,
> > +			struct snd_kcontrol *k, int  event)
> > +{
> > +	struct snd_soc_dapm_context *dapm = w->dapm;
> > +	struct snd_soc_card *card = dapm->card;
> > +	struct kbl_codec_private *priv = snd_soc_card_get_drvdata(card);
> > +	int ret = 0;
> > +
> > +	/*
> > +	 * MCLK/SCLK need to be ON early for a successful synchronization of
> > +	 * codec internal clock. And the clocks are turned off during
> > +	 * POST_PMD after the stream is stopped.
> > +	 */
> > +	switch (event) {
> > +	case SND_SOC_DAPM_PRE_PMU:
> > +		if (__clk_is_enabled(priv->mclk))
> > +			return 0;
> 
> Is this if() test needed? it's not part of the code for
> kbl_rt5663_max98927, despite all the comments and code structure being
> identical.
> 

This function call prevents the clk_set_rate() from being called when clock is 
enabled. It's removed during the upstream review and use the flag 
CLK_SET_RATE_GATE instead. Will fix it.

https://patchwork.kernel.org/patch/10070383/
https://patchwork.kernel.org/patch/10133179/

> > +
> > +		/* Enable MCLK */
> > +		ret = clk_set_rate(priv->mclk, 24000000);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "Can't set rate for mclk, err:
> %d\n",
> > +				ret);
> > +			return ret;
> > +		}
> > +
> > +		ret = clk_prepare_enable(priv->mclk);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "Can't enable mclk, err: %d\n",
> ret);
> > +			return ret;
> > +		}
> > +
> > +		/* Enable SCLK */
> > +		ret = clk_set_rate(priv->sclk, 3072000);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "Can't set rate for sclk, err:
> %d\n",
> > +				ret);
> > +			clk_disable_unprepare(priv->mclk);
> > +			return ret;
> > +		}
> > +
> > +		ret = clk_prepare_enable(priv->sclk);
> > +		if (ret < 0) {
> > +			dev_err(card->dev, "Can't enable sclk, err: %d\n",
> ret);
> > +			clk_disable_unprepare(priv->mclk);
> > +		}
> > +		break;
> > +	case SND_SOC_DAPM_POST_PMD:
> > +		if (!__clk_is_enabled(priv->mclk))
> > +			return 0;
> 
> same here, is this if() test needed? If yes, isn't it needed in
> kbl_rt5663_max98927?
> 

Will fix it.

> > +
> > +		clk_disable_unprepare(priv->mclk);
> > +		clk_disable_unprepare(priv->sclk);
> > +		break;
> > +	default:
> > +		return 0;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> 
> While I am at it, this machine driver uses .ignore_pmdown_time, which is
> typically used to avoid clock issues. Now that you have an explicit
> control on clocks, is .ignore_pmdown_time actually required?

Actually I don't know the purpose to use ignore_pmdown_time flag in the first
place but I think they are not related since this patch is to turn on ssp clocks earlier
while the ignore_pmdown_time flag is used to delay the DAPM power down for
playback stream in the soc_pcm_close(). Just my two cents and thank you for the
review.


Regards,
Brent

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
