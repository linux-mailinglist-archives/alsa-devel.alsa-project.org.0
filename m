Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEBD7EF5F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 10:34:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D0921712;
	Fri,  2 Aug 2019 10:33:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D0921712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564734869;
	bh=DuHmLYr/gu79zYdTLXSljoAADV9z831PJz9IOR7gK70=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZKtfl+sQ9HeEEAj21038M97dW94J+IN3MEM/qsq+PsM6r3uFzrp5zLLpkx7irzDQa
	 lK5dENfwM+eLJYF+DWXBnAC4gB/CzfcNjP88HO03A+EEn+tINyYrJJE3YIbCMJMfze
	 Gbt603Ul1IYqJR4Uon1qGyzFieEJ6VAD+hPR6SDA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E465F8049B;
	Fri,  2 Aug 2019 10:32:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 424E0F8048F; Fri,  2 Aug 2019 10:32:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB421F80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 10:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB421F80214
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1htSz4-0002ns-CI; Fri, 02 Aug 2019 09:32:18 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730141935.GF4264@sirena.org.uk>
 <45156592-a90f-b4f8-4d30-9631c03f1280@codethink.co.uk>
 <20190730155027.GJ4264@sirena.org.uk>
 <9b47a360-3b62-b968-b8d5-8639dc4b468d@codethink.co.uk>
 <20190801234241.GG5488@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <472cc4ee-2e80-8b08-d842-79c65df572f3@codethink.co.uk>
Date: Fri, 2 Aug 2019 09:32:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190801234241.GG5488@sirena.org.uk>
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

On 02/08/2019 00:42, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 05:28:11PM +0100, Thomas Preston wrote:
>> On 30/07/2019 16:50, Mark Brown wrote:
> 
>>> Like I say it's not just debugfs though, there's the standard driver
>>> interface too.
> 
>> Ah right, I understand. So if we run the turn-on diagnostics routine, there's
>> nothing stopping anyone from interacting with the device in other ways.
> 
>> I guess there's no way to share that mutex with ALSA? In that case, it doesn't
>> matter if this mutex is there or not - this feature is incompatible. How
>> compatible do debugfs interfaces have to be? I was under the impression anything
>> goes. I would argue that the debugfs is better off for having the mutex so
>> that no one re-reads "diagnostic" within the 5s poll timeout.
> 
> It's not really something that's supported; like Charles says the DAPM
> mutex is exposed but if the regular controls would still be able to do
> stuff.  It is kind of a "you broke it, you fix it" thing but on the
> other hand it's better to make things safer if we can since it might not
> be obvious later on why things are broken.
> 
>> Alternatively, this diagnostic feature could be handled with an external-handler
>> kcontrol SOC_SINGLE_EXT? I'm not sure if this is an atomic interface either.
>>
>> What would be acceptable?
> 
> Yes, that's definitely doable - we've got some other drivers with
> similar things like calibration triggers exposed that way.
> 

One problem with using a kcontrol as a trigger for the turn-on diagnostic
is that the diagnostic routine has a "return value".

It goes like this:
- Bring device to low-quiescent state
- Initiate diagnostics
- Poll for diagnostics-complete bit
- Read the four channel status registers

The final read clears the status registers, so this isn't something I
can just do with regmap.

One idea I had was to initiate the turn-on diagnostics using a kcontrol,
whose handler saves the four channel status registers and an epoch in
tda7802_priv. Then this can be read from debugfs. But it seems strange
to have to turn on this control over here, then go over there and read
this value.

Hm, maybe a better idea is to have the turn on diagnostic only run on
device probe (as its name suggests!), and print something to dmesg:

	modprobe tda7802 turn_on_diagnostic=1

	tda7802-codec i2c-TDA7802:00: Turn on diagnostic 04 04 04 04

Kirill Marinushkin mentioned this in the first review [0], it just didn't
really sink in until now!

[0] https://lkml.org/lkml/2019/6/14/1344
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
