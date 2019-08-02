Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1657FCD9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 16:53:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFB73175E;
	Fri,  2 Aug 2019 16:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFB73175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564757600;
	bh=Vthz6yYVo/BkaI8ZprxZqAWljYJCN4YmsaKgl7lgXm8=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vHK25lxncAhoLE9bLuu1mnlIi5jSpN0ErQGNPCywMyxMW7egTXaeg2/T5Z9kGb2LS
	 Ars832zaCW++j7J5aAZpBTZzKksHQRjsQxU7Jf7r3WeQioegHDIxZjmvd4/1kcyTiC
	 umLg2ahBFFGRISQWaLwuW0TJ7S7FyUywr55P/IK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0482AF8049B;
	Fri,  2 Aug 2019 16:51:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89A56F8048F; Fri,  2 Aug 2019 16:51:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3B8FFF800F3
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 16:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B8FFF800F3
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1htYti-0008AU-Oe; Fri, 02 Aug 2019 15:51:10 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
 <20190801234241.GG5488@sirena.org.uk>
 <472cc4ee-2e80-8b08-d842-79c65df572f3@codethink.co.uk>
 <20190802111036.GB5387@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <ab0a2d14-90c0-6c28-2c80-351fccd85e68@codethink.co.uk>
Date: Fri, 2 Aug 2019 15:51:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802111036.GB5387@sirena.org.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Marco Felsch <m.felsch@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [alsa-devel] [PATCH v2 3/3] ASoC: TDA7802: Add turn-on
 diagnostic routine
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

On 02/08/2019 12:10, Mark Brown wrote:
> On Fri, Aug 02, 2019 at 09:32:17AM +0100, Thomas Preston wrote:
>> On 02/08/2019 00:42, Mark Brown wrote:
> 
>>> Yes, that's definitely doable - we've got some other drivers with
>>> similar things like calibration triggers exposed that way.
> 
>> One problem with using a kcontrol as a trigger for the turn-on diagnostic
>> is that the diagnostic routine has a "return value".
> 
> You can use a read only control for the readback, or just have it be
> triggered by overwriting the readback value.  You can cache the result.
> 

Keeping the trigger and result together like that would be better I think,
although the routine isn't supposed to run mid way through playback. If
we're mid playback the debugfs routine has to turn off AMP_ON, take the
device back to a known state, run diagnostics, then restore. Which causes
a gap in the audible sound.

>> Hm, maybe a better idea is to have the turn on diagnostic only run on
>> device probe (as its name suggests!), and print something to dmesg:
> 
>> 	modprobe tda7802 turn_on_diagnostic=1
> 
>> 	tda7802-codec i2c-TDA7802:00: Turn on diagnostic 04 04 04 04
> 
>> Kirill Marinushkin mentioned this in the first review [0], it just didn't
>> really sink in until now!
> 
> You could do that too, yeah.  Depends on what this is diagnosing and if
> that'd be useful.
> 

The diagnostic status bits describe situations such as:
- open load (no speaker connected)
- short to GND
- short to VCC
- etc

The intention is to test if all the speakers are connected. So, one might 
have a self test which runs the diagnostic and verifies it outputs:

	00 00 00 00

For example, on my test rig there is only one speaker connected. So it
reads:

	04 04 00 04

Where the second bit is "open load". So this would fail the test.

So in the kcontrol case the test would be something like:

	amixer sset "AMP1 turn on diagnostic" on
	amixer sget "AMP1 diagnostic"

And the module parameter case:

	rmmod tda7802
	modprobe tda7802 turn_on_diagnostic=1
	dmesg | grep "Turn on diagnostic 04 04 04 04"
	rmmod tda7802
	modprobe tda7802

I think the module parameter method is more appropriate for a
"Turn-on diagnostic", even though I don't really like grepping dmesg
for the result. I'll go ahead and implement that unless anyone has a
particular preference for the kcontrol-trigger.

Thanks
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
