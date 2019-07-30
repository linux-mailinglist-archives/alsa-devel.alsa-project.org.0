Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E937AC61
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 17:29:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05F4017C2;
	Tue, 30 Jul 2019 17:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05F4017C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564500538;
	bh=klJivd45Px1QqFdzjm0d53N5jWB6o02uTxywWTCQOZU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=etbBMc5enX0ggN0ntdw35nmQEvDeFiICHJwC+bp4bQGeN3XYvq4YWQzBG0fx7TDtH
	 28BGvdnOXPRIPd+HfFeyusgV7UKlRq9PoVeNvNk7SRZ7n1obiHnzESknKNsee8Xc3X
	 j0CoWOqMnxA/sWF6t/2dUYmzjxwPH8JuSUH3VHwY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4B48F80214;
	Tue, 30 Jul 2019 17:27:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3119F804CC; Tue, 30 Jul 2019 17:27:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.2 required=5.0 tests=PRX_BODYSUB_1,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5466F80482
 for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2019 17:27:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5466F80482
Received: from [167.98.27.226] (helo=[10.35.6.253])
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1hsU2H-0000v2-8c; Tue, 30 Jul 2019 16:27:33 +0100
To: Mark Brown <broonie@kernel.org>
References: <20190730120937.16271-1-thomas.preston@codethink.co.uk>
 <20190730120937.16271-4-thomas.preston@codethink.co.uk>
 <20190730124158.GH54126@ediswmail.ad.cirrus.com>
 <e7a879d3-36c2-2df8-97c0-3c4bbd2e7ea2@codethink.co.uk>
 <20190730142010.GG4264@sirena.org.uk>
From: Thomas Preston <thomas.preston@codethink.co.uk>
Message-ID: <99b80b21-fdb4-085f-3380-7df4700bb0ff@codethink.co.uk>
Date: Tue, 30 Jul 2019 16:27:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730142010.GG4264@sirena.org.uk>
Content-Language: en-US
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kirill Marinushkin <kmarinushkin@birdec.tech>,
 Marco Felsch <m.felsch@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Annaliese McDermond <nh6z@nh6z.net>, Takashi Iwai <tiwai@suse.com>,
 Paul Cercueil <paul@crapouillou.net>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Cheng-Yi Chiang <cychiang@chromium.org>, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
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

On 30/07/2019 15:20, Mark Brown wrote:
> On Tue, Jul 30, 2019 at 03:04:19PM +0100, Thomas Preston wrote:
>> On 30/07/2019 13:41, Charles Keepax wrote:
> 
>>> This could probably be removed using regmap_multi_reg_write.
> 
>> The problem is that I want to retain the state of the other bits in those
>> registers. Maybe I should make a copy of the backed up state, set the bits
>> I want to off-device, then either:
> 
>> 1. Write the changes with regmap_multi_reg_write
>> 2. Write all six regs again (if my device doesn't support the multi_reg)
> 
> Or make this a regmap function, there's nothing device specific about
> it.
> 

I did wonder why regmap didn't have an multi-update function. If appropriate,
I will add this in.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
