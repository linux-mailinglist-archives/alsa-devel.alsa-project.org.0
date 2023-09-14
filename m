Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0826B7A009C
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 11:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 614FD84B;
	Thu, 14 Sep 2023 11:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 614FD84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694684725;
	bh=g58qj08epj4+mkbYslAlPCZbrzjmGAohdlCr7kE9Oqc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=enGNfmGYrdY88uZ1lKW/qBuW6lMNDIn/ERDE5YV3tlE6r4ssI+J5ZRyoTJQ+523bk
	 tjNcsXoyh3PIZYZflSxMOtfozn8xBnu3vXV+bnPxD2tGWmOTdmvAWIWgQF6o0bTPIl
	 35i2i+0QgdBuZCBoBSNj65OW0vSFyRzAq016GYs0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBFFDF80552; Thu, 14 Sep 2023 11:44:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75293F80246;
	Thu, 14 Sep 2023 11:44:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7371BF80425; Thu, 14 Sep 2023 11:44:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4F806F801F5
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 11:44:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4F806F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=k4vrvgwH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38E74Pac017688;
	Thu, 14 Sep 2023 04:44:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=2IPcvMJ6I8FbRO8
	Q4YQtRfi9KDKzY1NIt+8SrW/Lmko=; b=k4vrvgwH+PHcuZOxITvoDXV/MGy6LsJ
	fxq6A0NwXRHusvyS1L86igNQhbdOmNzfoRFa1/9NuGaJ0lozThBcwAKQiasypKRm
	XsLE0ciCDMaULGybZ2EwdK351FUFRGQ7GiCIMJSUVIlMhSpaoOtJF0yUjXmU4kKM
	jy2JFOZ+gz9GPm/l5tYgwTtYXGb0H4efbLnx0ogm0y0U7K5Kz5VXblh9ER0jI9PT
	WblW1Q8aI9DUHCcM0638xOFCJwCbr8K0YyriSLSptdhNHM7PlLlCFoN8XagE2Z0s
	mk8OS9vcL+mpE9mo26rUA6cu2RiLX71uooAlY86JbEcrIFGDQSfxqRA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7shwme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 04:44:26 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 10:44:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Thu, 14 Sep 2023 10:44:24 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com
 [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AC7A93563;
	Thu, 14 Sep 2023 09:44:24 +0000 (UTC)
Date: Thu, 14 Sep 2023 09:44:24 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: John Watts <contact@jookia.org>
CC: <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
        "Mark
 Brown" <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai
	<tiwai@suse.com>, <patches@opensource.cirrus.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] ASoC: wm8782: Handle maximum audio rate at runtime
Message-ID: <20230914094424.GT103419@ediswmail.ad.cirrus.com>
References: <20230913171552.92252-1-contact@jookia.org>
 <20230913171552.92252-2-contact@jookia.org>
 <20230914092107.GR103419@ediswmail.ad.cirrus.com>
 <ZQLR50CAzr0VDpeh@titan>
 <20230914093731.GS103419@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914093731.GS103419@ediswmail.ad.cirrus.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: UHigTcmN-D1fbaxpxvzaZ8DMT4-fWt-r
X-Proofpoint-ORIG-GUID: UHigTcmN-D1fbaxpxvzaZ8DMT4-fWt-r
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: GCU2NLGXPFOPD42MCEGIZZSY2YNCSYBI
X-Message-ID-Hash: GCU2NLGXPFOPD42MCEGIZZSY2YNCSYBI
X-MailFrom: prvs=4621632084=ckeepax@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCU2NLGXPFOPD42MCEGIZZSY2YNCSYBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, Sep 14, 2023 at 09:37:31AM +0000, Charles Keepax wrote:
> On Thu, Sep 14, 2023 at 07:27:03PM +1000, John Watts wrote:
> > On Thu, Sep 14, 2023 at 09:21:07AM +0000, Charles Keepax wrote:
> > > On Thu, Sep 14, 2023 at 03:15:50AM +1000, John Watts wrote:
> > > > The wm8782 supports up to 192kHz audio when pins are set correctly.
> > > > Instead of hardcoding which rates are supported enable them all
> > > > then refer to a max_rate variable at runtime.
> > > > 
> > > > Signed-off-by: John Watts <contact@jookia.org>
> > > > ---
> > > > +static int wm8782_dai_hw_params(struct snd_pcm_substream *component,
> > > > +			    struct snd_pcm_hw_params *params,
> > > > +			    struct snd_soc_dai *dai)
> > > > +{
> > > > +	struct wm8782_priv *priv =
> > > > +		snd_soc_component_get_drvdata(dai->component);
> > > > +
> > > > +	if (params_rate(params) > priv->max_rate)
> > > > +		return -EINVAL;
> > > > +
> > > > +	return 0;
> > > > +}
> > > 
> > > We should be setting this as a constraint in startup, rather
> > > than returning an error in hw_params. That will let user-space
> > > know the supported rates and allow it to resample if necessary.
> > 
> > How do you do this? The struct with the rate is statically defined.
> > 
> 
> You can programmatically add additional constraints, commonly
> this will be done from the startup callback on the DAI. See
> something like arizona_startup in sound/soc/codecs/arizona.c for
> an example, that enables 44.1/48k rates based on clocks but the
> principle should be similar.
> 

Although I would also imagine snd_pcm_hw_constraint_minmax is
going to be more appropriate in your case.

Thanks,
Charles
