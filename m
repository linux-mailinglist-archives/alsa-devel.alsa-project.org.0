Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD98A4B6A54
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 12:09:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F7B8164F;
	Tue, 15 Feb 2022 12:08:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F7B8164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644923353;
	bh=YCXt4YwiSCbq67RYWyrUT8g/MWumGO5INi/OE9XVuQg=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=igkI3P0kBY+B3+J2kIR9UUPR0tnZZAFbCG1kJSwqQI1UHANVgbaz9nsCFPMz2+uMA
	 zno10qHJLVi7ZT1ia9/Awex0LfEiSroRExVMkwaIYXeKblPoWU4elndjiHXQaOY7oS
	 vDUide3TFkiNfcHtCXI2ApeMk3FU1p+R4ZV5WSJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DAEA3F800D8;
	Tue, 15 Feb 2022 12:08:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8FD0F80132; Tue, 15 Feb 2022 12:08:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FED6F800D8
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 12:07:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FED6F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ENmotTUE"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F6vGcr025181;
 Tue, 15 Feb 2022 05:07:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=yXH1AqAShEtuo15E73/S6sSBQOLQIjgze6arjKIgrps=;
 b=ENmotTUEi3YHdpxQZdsDX0uY51uMdBEc6OOUghCQ6mOjU0/nawddwHoB4YL1O9BrJOWT
 hOCcrHP+e8iQdmWPrOZIIVO7L8nAcUS9hiizVbNZD6DgfyHtjbHqsjGI7dlzqg9HzHSL
 Su4/eBplhCGTToPis8yMDcUEl3MOAGop0ylD43w5C+iUazPOYSziTAwNrH/fRlhN1/JD
 z/LPJbEG7S7hG8ht5Jl1pj6zXe3ULeIAteXUT9rdKwOE3QeOF4agsbev1zFDijuMMWSI
 ZQoAVVxajnZqo1NF6M/Ob3xXL8Pzc75DASa6OQoJ1+fVIL/CC3NLosfp+tNlSUTUq2cJ mA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e7qq197sa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 15 Feb 2022 05:07:51 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 15 Feb
 2022 11:07:49 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 15 Feb 2022 11:07:49 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6898D11C7;
 Tue, 15 Feb 2022 11:07:49 +0000 (UTC)
Date: Tue, 15 Feb 2022 11:07:49 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] ASoC: cs4265: Fix the duplicated control name
Message-ID: <20220215110749.GF38351@ediswmail.ad.cirrus.com>
References: <20220214195716.1096265-1-festevam@gmail.com>
 <20220215101950.GB38351@ediswmail.ad.cirrus.com>
 <CAOMZO5BGt1UFm97mpfhfDzkq4i9n=wWpMtUCr=JRcnbN0a_ipw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAOMZO5BGt1UFm97mpfhfDzkq4i9n=wWpMtUCr=JRcnbN0a_ipw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: JWmr-EO_ccZG6hVYxtmFF4O5PRvP-TiE
X-Proofpoint-GUID: JWmr-EO_ccZG6hVYxtmFF4O5PRvP-TiE
X-Proofpoint-Spam-Reason: safe
Cc: Fabio Estevam <festevam@denx.de>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>
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

On Tue, Feb 15, 2022 at 07:52:07AM -0300, Fabio Estevam wrote:
> On Tue, Feb 15, 2022 at 7:20 AM Charles Keepax
> <ckeepax@opensource.cirrus.com> wrote:
> Do you mean something like this?
> 
> --- a/sound/soc/codecs/cs4265.c
> +++ b/sound/soc/codecs/cs4265.c
> @@ -122,7 +122,7 @@ static const struct snd_kcontrol_new loopback_ctl =
>         SOC_DAPM_SINGLE("Switch", CS4265_SIG_SEL, 1, 1, 0);
> 
>  static const struct snd_kcontrol_new spdif_switch =
> -       SOC_DAPM_SINGLE("Switch", SND_SOC_NOPM, 0, 0, 0);
> +       SOC_DAPM_SINGLE("Switch", CS4265_SPDIF_CTL2, 5, 1, 1);
> 
>  static const struct snd_kcontrol_new dac_switch =
>         SOC_DAPM_SINGLE("Switch", CS4265_PWRCTL, 1, 1, 0);
> @@ -150,7 +150,6 @@ static const struct snd_kcontrol_new
> cs4265_snd_controls[] = {
>         SOC_SINGLE("E to F Buffer Disable Switch", CS4265_SPDIF_CTL1,
>                                 6, 1, 0),
>         SOC_ENUM("C Data Access", cam_mode_enum),
> -       SOC_SINGLE("SPDIF Switch", CS4265_SPDIF_CTL2, 5, 1, 1),
>         SOC_SINGLE("Validity Bit Control Switch", CS4265_SPDIF_CTL2,
>                                 3, 1, 0),
>         SOC_ENUM("SPDIF Mono/Stereo", spdif_mono_stereo_enum),
> @@ -186,7 +185,7 @@ static const struct snd_soc_dapm_widget
> cs4265_dapm_widgets[] = {
> 
>         SND_SOC_DAPM_SWITCH("Loopback", SND_SOC_NOPM, 0, 0,
>                         &loopback_ctl),
> -       SND_SOC_DAPM_SWITCH("SPDIF", SND_SOC_NOPM, 0, 0,
> +       SND_SOC_DAPM_SWITCH("SPDIF", CS4265_SPDIF_CTL2, 5, 1,
>                         &spdif_switch),
>         SND_SOC_DAPM_SWITCH("DAC", CS4265_PWRCTL, 1, 1,
>                         &dac_switch),
> 
> If this is not what you meant, please feel free to submit a proper patch.

Yeah that is almost exactly what I meant. Only thing is you don't
need to put the register on the both SOC_DAPM_SINGLE and on the
SND_SOC_DAPM_SWITCH. Little bit of a judgement call on which of
the two to put it on.

Putting it on the SOC_DAPM_SINGLE is much closer to the existing
code.

But putting it on the SND_SOC_DAPM_SWITCH feels more correct to
me, ie. only enabling it when the SPDIF is in use. I would
suggest this way, as the existing code is clearly not tested so
it doesn't feel very valuable to stick to what the existing code
does and this seems more correct.

Thanks,
Charles
