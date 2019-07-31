Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE097BC6D
	for <lists+alsa-devel@lfdr.de>; Wed, 31 Jul 2019 10:59:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC0B7170F;
	Wed, 31 Jul 2019 10:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC0B7170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564563587;
	bh=7Yb1XH8UTE4w78MPfnOtnAXTioYWR+Mg6mvTgKfdtPk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqCwSQmoFos6gbDIwXIi0DU6nRLEENBMaw0KEs/HNPEaKCQBQVmo+Ysd+H7UH5Tns
	 iOoA/iXxAFGTf44BAfL8dBfuoAxrAPBM30/jFB2R0iX5HqAy8aJpCln6U3aeic/yID
	 Kc5znb3VJP1qCIsOpSPUr8DT7hv/Zzcy4tBA6NMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6279F8048E;
	Wed, 31 Jul 2019 10:58:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13102F80483; Wed, 31 Jul 2019 10:57:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3104BF80214
 for <alsa-devel@alsa-project.org>; Wed, 31 Jul 2019 10:57:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3104BF80214
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hskQ5-0003o4-QJ; Wed, 31 Jul 2019 09:57:13 +0100
To: Marco Felsch <m.felsch@pengutronix.de>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-3-thomas.preston@codethink.co.uk>
 <20190730145844.GI4264@sirena.org.uk>
 <fe11c806-2285-558c-e35c-d8f61de00784@codethink.co.uk>
 <20190731060644.yrewu2kvrlootyyl@pengutronix.de>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <820e2ea9-14a2-795c-9b78-e8f2a30afdb1@codethink.co.uk>
Date: Wed, 31 Jul 2019 09:57:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190731060644.yrewu2kvrlootyyl@pengutronix.de>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Annaliese McDermond <nh6z@nh6z.net>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Nate Case <ncase@tesla.com>, Rob Duncan <rduncan@tesla.com>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Patrick Glaser <pglaser@tesla.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 2/3] ASoC: Add codec driver for ST
	TDA7802
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

On 31/07/2019 07:06, Marco Felsch wrote:
> Hi Thomas,
> 
> again sorry for jumping in..
> 

Np!

> On 19-07-30 18:26, Thomas Preston wrote:
>> On 30/07/2019 15:58, Mark Brown wrote:
>>> On Tue, Jul 30, 2019 at 01:09:36PM +0100, Thomas Preston wrote:
>>>> +	case SND_SOC_BIAS_STANDBY:
>>>> +		err = regulator_enable(tda7802->enable_reg);
>>>> +		if (err < 0) {
>>>> +			dev_err(component->dev, "Could not enable.\n");
>>>> +			return err;
>>>> +		}
>>>> +		dev_dbg(component->dev, "Regulator enabled\n");
>>>> +		msleep(ENABLE_DELAY_MS);
>>>
>>> Is this delay needed by the device or is it for the regulator to ramp?
>>> If it's for the regulator to ramp then the regulator should be doing it.
>>>
>>
>> According to the datasheet the device itself takes 10ms to rise from 0V
>> after PLLen is enabled. There are additional rise times but they are
>> negligible with default capacitor configuration (which we have).
>>
>> Good to know about the regulator rising configuration though. Thanks.
> 
> Isn't it the regulator we mentioned to not use that because it is a
> GPIO?
> 

Yeah it is - I intend to switch PLLen to gpio API.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
